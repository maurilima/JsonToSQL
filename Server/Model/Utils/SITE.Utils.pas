unit SITE.Utils;

interface
 uses System.Classes, System.SysUtils, System.DateUtils,
  System.JSON.Readers, System.JSON.Types;


type
      TTypeSql = (tsInsert, tsUpdate );
      TUtils = class
         class function IIF<T>( Condition: Boolean; T1, T2 : T ): T;
      end;
      function JsonToSql(Value, Tabela, CampoChave :string;  Id : integer; TipoSql : TTypeSql) : string;




implementation

uses
  System.JSON;
class function TUtils.IIF<T>(Condition: Boolean; T1, T2: T): T;
begin
  if Condition  then
     Result := T1
  else
     Result := T2;
end;
// ------------------------------------------------------------------------------//
// Funcao Devolve um strinq sql Update ou Insert
// Autor : Mauri Lima
// 19-04-2019
// -----------------------------------------------------------------------------//
//

function JsonToSql(Value, Tabela, CampoChave :string; Id : integer; TipoSql : TTypeSql) : string;
var
    sr      : TStringReader;
    jtr     : TJsonTextReader;
    Campos   : array of string;
    Valores  : array of string;
    cCampos  : Integer;
    cValores : Integer;
    lCampos  : string;
    lValores : string;
    i        : Integer;
begin
  sr := TStringReader.Create(Value);
  cCampos :=0;
  cValores:=0;

  try
      try
          jtr := TJsonTextReader.Create(sr);
          while jtr.Read do
            begin
              case jtr.TokenType of
                TJsonToken.StartConstructor: ;
                TJsonToken.PropertyName:
                   begin
                     SetLength(Campos, cCampos+1);
                     Campos[cCampos] := jtr.Value.ToString;
                     Inc(cCampos);
                   end;
                TJsonToken.Integer:
                   begin
                     SetLength(Valores, cValores+1);
                     Valores[cValores] := jtr.Value.ToString;
                     Inc(cValores);
                   end;
                TJsonToken.Float:
                   begin
                     SetLength(Valores, cValores+1);
                     Valores[cValores] := jtr.Value.ToString;
                     Inc(cValores);
                   end;
                TJsonToken.String:
                   begin
                     SetLength(Valores, cValores+1);
                     Valores[cValores] := jtr.Value.ToString;
                     Inc(cValores);
                   end;

                TJsonToken.Null:
                   begin
                     SetLength(Valores, cValores+1);
                     Valores[cValores] := jtr.Value.ToString;
                     Inc(cValores);
                   end;
                TJsonToken.Date:
                   begin
                     SetLength(Valores, cValores+1);
                     Valores[cValores] := jtr.Value.ToString;
                     Inc(cValores);
                   end;
              end;
            end;
       finally
         FreeandNil(jtr);
       end;
   finally
      FreeAndNil(sr);
  end;

  // Verifica se numaros de campos e igual ao numero de Valores
  if Length(Campos) <> Length(Valores) then
  begin
    Result := 'ERROR: Numero de Parametros são Diferentes ';
    exit
  end;

  case TipoSql of
    tsInsert:
      begin
        lCampos := '';
        lValores:= '';
        for I := 0 to Pred(Length(Campos)) do
          begin
            lCampos := lCampos + Campos[i]+', ';
            if Pos('/',(Valores[i])) > 0 then
              lValores := lValores + 'Cast('+
                          QuotedStr(StringReplace( Valores[i], '/','.',[rfReplaceAll]))+
                          ' as TimeStamp )'+ ', '
            else
              lValores := lValores + QuotedStr(Valores[i])+', ';
          end;
        delete(lCampos, length(lcampos)-1,1);
        delete(lValores, length(lvalores)-1,1);
        Result :=  'INSERT INTO '+Tabela +'( '+lCampos+' )  VALUES ('+lValores+')';
      end;
    tsUpdate:
      begin
        begin
          lCampos := '';
          for I := 0 to Pred(Length(Campos)) do
            begin
              lCampos := lCampos + Campos[i]+' = ';
              if Pos('/',(Valores[i])) > 0 then
                begin
                 Valores[i] := StringReplace( Valores[i], '/','.',[rfReplaceAll]);
                 lCampos := lCampos+' Cast('+ QuotedStr(Valores[i])+ ' as TimeStamp ), ';
                end
              else
              lCampos := lCampos+QuotedStr(Valores[i])+', ' ;
            end;
          delete(lCampos, length(lcampos)-1,1);
          Result :=  'UPDATE '+Tabela +' SET ' + lCampos + ' WHERE '+CampoChave +' = '+Id.ToString;

        end;
      end;
  end;

end;

end.

