object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 654
  Width = 659
  object conPrincipal: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=dipapeldb'
      'User_Name=dipapeldb'
      'Password=metal001'
      'Server=127.0.0.1'
      'ApplicationName=teste')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object qryVwPedidos: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from vwpedidos')
    Left = 32
    Top = 96
    object qryVwPedidosPEDIDO_ELO7: TStringField
      DisplayLabel = 'Pedido ELO7'
      FieldName = 'PEDIDO_ELO7'
      Origin = 'PEDIDO_ELO7'
      Size = 15
    end
    object qryVwPedidosCOMPRADOR: TStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Origin = 'COMPRADOR'
      ReadOnly = True
      Size = 100
    end
    object qryVwPedidosSTATUS_ELO7: TStringField
      DisplayLabel = 'Status ELO7'
      FieldName = 'STATUS_ELO7'
      Origin = 'STATUS_ELO7'
      Size = 50
    end
    object qryVwPedidosDATA_PEDIDO: TDateField
      DisplayLabel = 'Dt. Pedido'
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object qryVwPedidosTOTAL_ITENS: TSmallintField
      DisplayLabel = 'Total Itens'
      FieldName = 'TOTAL_ITENS'
      Origin = 'TOTAL_ITENS'
      Required = True
    end
    object qryVwPedidosVALOR_TOTAL: TBCDField
      DisplayLabel = 'Vl. Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryVwPedidosTIPO_FRETE: TStringField
      DisplayLabel = 'Tipo Frete'
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
      Size = 50
    end
    object qryVwPedidosVALOR_FRETE: TBCDField
      DisplayLabel = 'Vl. Frete'
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dtsVwPedidos: TDataSource
    AutoEdit = False
    DataSet = qryVwPedidos
    Left = 128
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
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
  object qryVwPedidosHis: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from vwpedidoshis'
      'order by data_historico desc')
    Left = 32
    Top = 152
    object qryVwPedidosHisPEDIDO_ELO7: TStringField
      DisplayLabel = 'Pedido ELO7'
      FieldName = 'PEDIDO_ELO7'
      Origin = 'PEDIDO_ELO7'
      Size = 15
    end
    object qryVwPedidosHisTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object qryVwPedidosHisCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Origin = 'CAMPO'
      Size = 50
    end
    object qryVwPedidosHisVALOR_ANTIGO: TStringField
      DisplayLabel = 'Valor Antigo'
      FieldName = 'VALOR_ANTIGO'
      Origin = 'VALOR_ANTIGO'
      Size = 50
    end
    object qryVwPedidosHisVALOR_NOVO: TStringField
      DisplayLabel = 'Valor Novo'
      FieldName = 'VALOR_NOVO'
      Origin = 'VALOR_NOVO'
      Size = 50
    end
    object qryVwPedidosHisDATA_HISTORICO: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Dt. Hist'#243'rico'
      FieldName = 'DATA_HISTORICO'
      ProviderFlags = []
    end
  end
  object dtsVwPedidosHis: TDataSource
    AutoEdit = False
    DataSet = qryVwPedidosHis
    Left = 128
    Top = 152
  end
  object qryResultadoImport: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from vwpedidoshis'
      'where cast(data_historico as date) = cast(now() as date)'
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
    object qryResultadoImportDATA_HISTORICO: TDateTimeField
      AutoGenerateValue = arDefault
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
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\dipapel_integra\trunk\src\libmysql.dll'
    Left = 136
    Top = 16
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidos'
    AfterPost = cdsPedidosAfterPost
    Left = 48
    Top = 312
    object cdsPedidosIDPEDIDO: TAutoIncField
      FieldName = 'IDPEDIDO'
      ReadOnly = True
    end
    object cdsPedidosPEDIDO_ELO7: TStringField
      FieldName = 'PEDIDO_ELO7'
      Size = 15
    end
    object cdsPedidosSTATUS_ELO7: TStringField
      FieldName = 'STATUS_ELO7'
      Size = 50
    end
    object cdsPedidosDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsPedidosTOTAL_ITENS: TSmallintField
      FieldName = 'TOTAL_ITENS'
      Required = True
    end
    object cdsPedidosVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsPedidosTIPO_FRETE: TStringField
      FieldName = 'TIPO_FRETE'
      Size = 50
    end
    object cdsPedidosVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsPedidosCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Size = 100
    end
  end
  object qryPedidos: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from tblpedidos')
    Left = 152
    Top = 312
    object qryPedidosIDPEDIDO: TFDAutoIncField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPedidosPEDIDO_ELO7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PEDIDO_ELO7'
      Origin = 'PEDIDO_ELO7'
      Size = 15
    end
    object qryPedidosSTATUS_ELO7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS_ELO7'
      Origin = 'STATUS_ELO7'
      Size = 50
    end
    object qryPedidosDATA_PEDIDO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object qryPedidosTOTAL_ITENS: TSmallintField
      FieldName = 'TOTAL_ITENS'
      Origin = 'TOTAL_ITENS'
      Required = True
    end
    object qryPedidosVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryPedidosTIPO_FRETE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
      Size = 50
    end
    object qryPedidosVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryPedidosCOMPRADOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPRADOR'
      Origin = 'COMPRADOR'
      Size = 100
    end
  end
  object dspPedidos: TDataSetProvider
    DataSet = qryPedidos
    Left = 256
    Top = 312
  end
  object cdsPedidosHis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidosHis'
    AfterPost = cdsPedidosHisAfterPost
    Left = 48
    Top = 368
    object cdsPedidosHisIDPEDIDOHIS: TAutoIncField
      FieldName = 'IDPEDIDOHIS'
      ReadOnly = True
    end
    object cdsPedidosHisIDPEDIDO: TIntegerField
      FieldName = 'IDPEDIDO'
      Required = True
    end
    object cdsPedidosHisVALOR_ANTIGO: TStringField
      FieldName = 'VALOR_ANTIGO'
      Size = 50
    end
    object cdsPedidosHisVALOR_NOVO: TStringField
      FieldName = 'VALOR_NOVO'
      Size = 50
    end
    object cdsPedidosHisDATA_HISTORICO: TDateTimeField
      FieldName = 'DATA_HISTORICO'
    end
    object cdsPedidosHisTIPO_ALTERACAO: TStringField
      FieldName = 'TIPO_ALTERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsPedidosHisCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 50
    end
  end
  object qryPedidosHis: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from tblpedidoshis')
    Left = 152
    Top = 368
    object qryPedidosHisIDPEDIDOHIS: TFDAutoIncField
      FieldName = 'IDPEDIDOHIS'
      Origin = 'IDPEDIDOHIS'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPedidosHisIDPEDIDO: TIntegerField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      Required = True
    end
    object qryPedidosHisVALOR_ANTIGO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ANTIGO'
      Origin = 'VALOR_ANTIGO'
      Size = 50
    end
    object qryPedidosHisVALOR_NOVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_NOVO'
      Origin = 'VALOR_NOVO'
      Size = 50
    end
    object qryPedidosHisDATA_HISTORICO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_HISTORICO'
      Origin = 'DATA_HISTORICO'
    end
    object qryPedidosHisTIPO_ALTERACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_ALTERACAO'
      Origin = 'TIPO_ALTERACAO'
      FixedChar = True
      Size = 1
    end
    object qryPedidosHisCAMPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CAMPO'
      Origin = 'CAMPO'
      Size = 50
    end
  end
  object dspPedidosHis: TDataSetProvider
    DataSet = qryPedidosHis
    Left = 256
    Top = 368
  end
  object cdsLogs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogs'
    AfterPost = cdsLogsAfterPost
    Left = 48
    Top = 424
    object cdsLogsIDLOG: TAutoIncField
      FieldName = 'IDLOG'
      ReadOnly = True
    end
    object cdsLogsDATA_LOG: TDateTimeField
      FieldName = 'DATA_LOG'
    end
    object cdsLogsARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 50
    end
    object cdsLogsREGISTROS_INSERIDOS: TSmallintField
      FieldName = 'REGISTROS_INSERIDOS'
      Required = True
    end
    object cdsLogsREGISTROS_ATUALIZADOS: TSmallintField
      FieldName = 'REGISTROS_ATUALIZADOS'
      Required = True
    end
  end
  object qryLogs: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from tbllogs')
    Left = 152
    Top = 424
    object qryLogsIDLOG: TFDAutoIncField
      FieldName = 'IDLOG'
      Origin = 'IDLOG'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryLogsDATA_LOG: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_LOG'
      Origin = 'DATA_LOG'
    end
    object qryLogsARQUIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ARQUIVO'
      Origin = 'ARQUIVO'
      Size = 50
    end
    object qryLogsREGISTROS_INSERIDOS: TSmallintField
      FieldName = 'REGISTROS_INSERIDOS'
      Origin = 'REGISTROS_INSERIDOS'
      Required = True
    end
    object qryLogsREGISTROS_ATUALIZADOS: TSmallintField
      FieldName = 'REGISTROS_ATUALIZADOS'
      Origin = 'REGISTROS_ATUALIZADOS'
      Required = True
    end
  end
  object dspLogs: TDataSetProvider
    DataSet = qryLogs
    Left = 256
    Top = 424
  end
  object cdsSelect: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelect'
    Left = 48
    Top = 520
  end
  object qrySelect: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'select * from tbllogs')
    Left = 152
    Top = 520
  end
  object dspSelect: TDataSetProvider
    DataSet = qrySelect
    Left = 256
    Top = 520
  end
end
