unit SITE.Model;

interface

uses
  System.Classes, uDWDatamodule, uDWAbout, uRESTDWServerEvents,
  uDWConsts, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, uDWJSONObject, System.JSON.Readers;

 type
  TDmServer = class(TServerMethodDataModule)
    conSite: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FQSite: TFDQuery;
    DWServerEvents1: TDWServerEvents;
    procedure DWServerEvents1EventsempresaReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType; var StatusCode: Integer;
      RequestHeader: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GETEmpresa (Value : Integer;   var Result: string);
    procedure POSTEmpresa(Value : string;   var Result: string);
    procedure PUTEmpresa(IdValue: Integer; Value : string;   var Result: string);
    procedure DELEmpresa(IdValue: Integer; var Result: string);
  end;
var
  DmServer: TDmServer;

implementation

uses
  uDWJSON, SITE.Utils, System.SysUtils, System.JSON.Types;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmServer.DWServerEvents1EventsempresaReplyEventByType(var Params: TDWParams;
var Result: string; const RequestType: TRequestType; var StatusCode: Integer;
  RequestHeader: TStringList);
begin
  case RequestType of
    rtGet   : GETEmpresa( Params.ItemsString['empid'].AsInteger ,Result );
    rtPost  : POSTEmpresa( Params.ItemsString['empjson'].AsString ,Result ) ;
    rtPut   : PUTEmpresa( Params.ItemsString['empid'].AsInteger,  Params.ItemsString['empjson'].AsString ,Result ) ;
    rtDelete: DELEmpresa(Params.ItemsString['empid'].AsInteger ,Result) ;
    rtPatch : ;
  end;
end;


procedure TDmServer.DELEmpresa(IdValue: Integer; var Result: string);
begin
  FQSite.Close;
  FQSite.SQL.Clear;
  FQSite.SQL.Add('DELETE from EMPRESA');
  FQSite.SQL.Add(' WHERE EMPID = '+IdValue.ToString);
  Try
   FQSite.ExecSQL;
   Result := '{"Dados Gravado com Sucesso !"}';
  Except
   On E : Exception Do
    Begin
     Result := Format('{"Error":"%s"}', [E.Message]);
    End;
  End;
end;

procedure TDmServer.GetEmpresa(Value : Integer;var Result: string);
Var
 JSONValue :  TJSONValue;
begin
 JSONValue := TJSONValue.Create;
 Try
  FQSite.Close;
  FQSite.SQL.Clear;
  FQSite.SQL.Add('select * from EMPRESA');
  if Value > 0  then
     FQSite.SQL.Add(' WHERE EMPID = '+Value.ToString);
  Try
   FQSite.Open;
   JSONValue.LoadFromDataset('', FQSite, False,  jmPureJSON, 'dd/mm/yyyy', '.');
   Result := JSONValue.ToJson;
  Except
   On E : Exception Do
    Begin
     Result := Format('{"Error":"%s"}', [E.Message]);
    End;
  End;
 Finally
  JSONValue.Free;
 End;
end;

procedure TDmServer.POSTEmpresa(Value : string;   var Result: string);
var
vSql : string;
begin
  if ( Value = EmptyStr ) then
  begin
   Result := '[{"Error":"Dados Para Atualizacao Imcompletos ou Invalidos"}]';
   Exit
  end;
  vSql := JsonToSql(Value, 'EMPRESA','', 0, tsInsert  );
  try
    FQSite.Close;
    FQSite.SQL.Clear;
    FQSite.SQL.Add(vSql);
    FQSite.ExecSQL;
    Result := '[{"result":"OK"}]';
  except on E: Exception do
    Begin
     Result := Format('{"Error":"%s"}', [E.Message]);
    End;
  end;
end;

procedure TDmServer.PUTEmpresa( IdValue: Integer; Value: string; var Result: string);
var
    vSql   : string;
begin
  if Value = EmptyStr  then
  begin
   Result := '[{"Error":"Dados para Insercao Invalidos"}]';
   Exit
  end;
  vSql := JsonToSql(Value, 'EMPRESA','EMPID', IdValue, tsUpdate  );
  Insert(', EMPDATAALTERA = current_timestamp ', vsql, Pos('WHERE', vSql)-1);
  try
    FQSite.Close;
    FQSite.SQL.Clear;
    FQSite.SQL.Add(vSql);
    FQSite.ExecSQL;
    Result := '[{"result":"OK"}]';
  except on E: Exception do
    Begin
     Result := Format('[{"Error":"%s"}]', [E.Message]);
    End;
  end;
end;
end.

