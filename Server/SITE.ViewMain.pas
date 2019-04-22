unit SITE.ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWPoolerDB, Vcl.StdCtrls, uRESTDWBase;

type
  TForm1 = class(TForm)
    btnAtivar: TButton;
    DWRestServer: TRESTServicePooler;
    procedure btnAtivarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SITE.Model;

{$R *.dfm}

procedure TForm1.btnAtivarClick(Sender: TObject);
begin
   DWRestServer.ServerMethodClass := TDmServer;
   DWRestServer.Active := not DWRestServer.Active;
   if DWRestServer.Active then
   begin
      btnAtivar.Caption := 'Desativar Server';
      Self.Caption := 'Servidor Rodando....';
   end
   else
   begin
      btnAtivar.Caption := 'Ativar Server';
      Self.Caption := 'Servidor Parado';
   end;


end;

end.
