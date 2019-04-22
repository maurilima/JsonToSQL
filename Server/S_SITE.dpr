program S_SITE;

uses
  Vcl.Forms,
  SITE.ViewMain in 'SITE.ViewMain.pas' {Form1},
  SITE.Model in 'Model\SITE.Model.pas' {DmServer: TDataModule},
  SITE.Utils in 'Model\Utils\SITE.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDmServer, DmServer);
  Application.Run;
end.
