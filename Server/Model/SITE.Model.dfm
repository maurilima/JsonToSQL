object DmServer: TDmServer
  OldCreateOrder = False
  Encoding = esASCII
  Height = 293
  Width = 358
  object conSite: TFDConnection
    Params.Strings = (
      'ConnectionDef=Site')
    LoginPrompt = False
    Left = 129
    Top = 21
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 200
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 48
  end
  object FQSite: TFDQuery
    Connection = conSite
    Left = 112
    Top = 152
  end
  object DWServerEvents1: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovInteger
            ParamName = 'empid'
            Encoded = False
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'empjson'
            Encoded = True
          end>
        JsonMode = jmPureJSON
        Name = 'empresa'
        OnReplyEventByType = DWServerEvents1EventsempresaReplyEventByType
      end>
    ContextName = 'v1'
    Left = 104
    Top = 216
  end
end
