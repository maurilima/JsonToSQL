unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SITE.Utils;

type
  TFrmMain = class(TForm)
    Button1: TButton;
    mjson: TMemo;
    mSql: TMemo;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation



{$R *.dfm}

procedure TFrmMain.Button1Click(Sender: TObject);

begin
    // Para delphi < 10.3 usar a declaracao Var normal
   var tipo := tutils.IIF(combobox1.ItemIndex= 0,tsInsert, tsUpdate);
   mSql.Text := JsonToSql(mjson.Text, 'EMPRESA','EMPID', 1,tipo);
end;

end.
