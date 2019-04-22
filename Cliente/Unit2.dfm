object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Json para SQL'
  ClientHeight = 446
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 135
    Top = 25
    Width = 154
    Height = 25
    Caption = 'Json para SQL'
    TabOrder = 0
    OnClick = Button1Click
  end
  object mjson: TMemo
    Left = 24
    Top = 72
    Width = 537
    Height = 113
    Lines.Strings = (
      
        '[{"EMPNOME": "Empresa de Teste 2", "EMPCNPJ": "560322323232323",' +
        ' "EMPCEP": "null", "EMPENDERECO": '
      
        '"null", "EMPNUMERO": "null", "EMPCIDADE": "null", "EMPBAIRRO": "' +
        'null", "EMPUF": "null", "EMPFONES": "null", '
      
        '"EMPCONTATO": "null", "EMPEMAIL": "null", "EMPINSCRICAOESTADUAL"' +
        ': "null", "EMPSITE": "null", '
      '"EMPDATACADASTRO": "18/04/2019", "EMPDATAALTERA": "18/04/2019"}]')
    TabOrder = 1
  end
  object mSql: TMemo
    Left = 24
    Top = 216
    Width = 537
    Height = 161
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 26
    Width = 105
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'INSERT'
    Items.Strings = (
      'INSERT'
      'UPDATE')
  end
end
