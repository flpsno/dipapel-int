object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 342
  Width = 484
  object conPrincipal: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Database=teste'
      'User_Name=sa'
      'Password=metal001'
      'Server=localhost\SQLExpress'
      'OSAuthent=No'
      'ApplicationName=teste')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 144
    Top = 16
  end
  object qryPedidos: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from vwpedidos')
    Left = 32
    Top = 96
    object qryPedidosPEDIDO_ELO7: TStringField
      DisplayLabel = 'Pedido ELO7'
      FieldName = 'PEDIDO_ELO7'
      Origin = 'PEDIDO_ELO7'
      Size = 15
    end
    object qryPedidosCOMPRADOR: TStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Origin = 'COMPRADOR'
      ReadOnly = True
      Size = 100
    end
    object qryPedidosSTATUS_ELO7: TStringField
      DisplayLabel = 'Status ELO7'
      FieldName = 'STATUS_ELO7'
      Origin = 'STATUS_ELO7'
      Size = 50
    end
    object qryPedidosDATA_PEDIDO: TDateField
      DisplayLabel = 'Dt. Pedido'
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object qryPedidosTOTAL_ITENS: TSmallintField
      DisplayLabel = 'Total Itens'
      FieldName = 'TOTAL_ITENS'
      Origin = 'TOTAL_ITENS'
      Required = True
    end
    object qryPedidosVALOR_TOTAL: TBCDField
      DisplayLabel = 'Vl. Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryPedidosTIPO_FRETE: TStringField
      DisplayLabel = 'Tipo Frete'
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
      Size = 50
    end
    object qryPedidosVALOR_FRETE: TBCDField
      DisplayLabel = 'Vl. Frete'
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dtsPedidos: TDataSource
    AutoEdit = False
    DataSet = qryPedidos
    Left = 128
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 16
  end
  object qryGeral: TFDQuery
    Connection = conPrincipal
    Left = 408
    Top = 184
  end
  object qryInsert: TFDQuery
    Connection = conPrincipal
    Left = 408
    Top = 112
  end
  object stpGeral: TFDStoredProc
    Connection = conPrincipal
    Left = 408
    Top = 40
  end
  object qryPedidosHis: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from vwpedidoshis'
      'order by data_historico desc')
    Left = 32
    Top = 152
    object qryPedidosHisPEDIDO_ELO7: TStringField
      DisplayLabel = 'Pedido ELO7'
      FieldName = 'PEDIDO_ELO7'
      Origin = 'PEDIDO_ELO7'
      Size = 15
    end
    object qryPedidosHisTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object qryPedidosHisCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Origin = 'CAMPO'
      Size = 50
    end
    object qryPedidosHisVALOR_ANTIGO: TStringField
      DisplayLabel = 'Valor Antigo'
      FieldName = 'VALOR_ANTIGO'
      Origin = 'VALOR_ANTIGO'
      Size = 50
    end
    object qryPedidosHisVALOR_NOVO: TStringField
      DisplayLabel = 'Valor Novo'
      FieldName = 'VALOR_NOVO'
      Origin = 'VALOR_NOVO'
      Size = 50
    end
    object qryPedidosHisDATA_HISTORICO: TSQLTimeStampField
      DisplayLabel = 'Dt. Hist'#243'rico'
      FieldName = 'DATA_HISTORICO'
      Origin = 'DATA_HISTORICO'
    end
  end
  object dtsPedidosHis: TDataSource
    AutoEdit = False
    DataSet = qryPedidosHis
    Left = 128
    Top = 152
  end
  object qryResultadoImport: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from vwpedidoshis'
      'where cast(data_historico as date) = cast(getdate() as date)'
      'order by data_historico desc')
    Left = 40
    Top = 216
    object StringField1: TStringField
      DisplayLabel = 'Pedido ELO7'
      FieldName = 'PEDIDO_ELO7'
      Origin = 'PEDIDO_ELO7'
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object StringField3: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Origin = 'CAMPO'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = 'Valor Antigo'
      FieldName = 'VALOR_ANTIGO'
      Origin = 'VALOR_ANTIGO'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'Valor Novo'
      FieldName = 'VALOR_NOVO'
      Origin = 'VALOR_NOVO'
      Size = 50
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayLabel = 'Dt. Hist'#243'rico'
      FieldName = 'DATA_HISTORICO'
      Origin = 'DATA_HISTORICO'
    end
  end
  object dtsResultadoImport: TDataSource
    AutoEdit = False
    DataSet = qryResultadoImport
    Left = 144
    Top = 216
  end
end
