object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Server Site'
  ClientHeight = 392
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnAtivar: TButton
    Left = 24
    Top = 56
    Width = 129
    Height = 33
    Caption = 'Iniciar Server'
    TabOrder = 0
    OnClick = btnAtivarClick
  end
  object DWRestServer: TRESTServicePooler
    Active = False
    CORS = False
    ServicePort = 8082
    ProxyOptions.Port = 8888
    ServerParams.HasAuthentication = False
    ServerParams.UserName = 'testserver'
    ServerParams.Password = 'testserver'
    SSLMethod = sslvSSLv2
    SSLVersions = []
    Encoding = esUtf8
    ServerContext = 'restdataware'
    RootPath = '/services/api'
    SSLVerifyMode = []
    SSLVerifyDepth = 0
    ForceWelcomeAccess = False
    Left = 96
    Top = 192
  end
end
