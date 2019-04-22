program Testes;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {FrmMain},
  SITE.Utils in '..\Server\Model\Utils\SITE.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
