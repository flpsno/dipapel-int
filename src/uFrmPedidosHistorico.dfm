object frmPedidosHistorico: TfrmPedidosHistorico
  Left = 0
  Top = 0
  Caption = 'Pedido Hist'#243'rico'
  ClientHeight = 449
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 411
    Width = 738
    Height = 38
    Align = alBottom
    TabOrder = 0
    object btnOk: TButton
      Left = 648
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object dbg1: TDBGrid
    Left = 0
    Top = 0
    Width = 738
    Height = 411
    Align = alClient
    DataSource = dtmPrincipal.dtsPedidosHis
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PEDIDO_ELO7'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAMPO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ANTIGO'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_NOVO'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_HISTORICO'
        Width = 112
        Visible = True
      end>
  end
end
