object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 664
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Programa para importa'#231#227'o de dados do elo7'
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 738
    Height = 607
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 738
      Height = 607
      ActivePage = tsImport
      Align = alClient
      TabOrder = 0
      object tsImport: TTabSheet
        Caption = 'Import'
        object pnlRodape: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 288
          Width = 724
          Height = 288
          Align = alBottom
          TabOrder = 0
          object dbgPrincipal: TDBGrid
            Left = 1
            Top = 35
            Width = 722
            Height = 252
            Align = alClient
            DataSource = dtmPrincipal.dtsResultadoImport
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'PEDIDO_ELO7'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CAMPO'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ANTIGO'
                Width = 157
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_NOVO'
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_HISTORICO'
                Width = 124
                Visible = True
              end>
          end
          object pnlResultado: TPanel
            Left = 1
            Top = 1
            Width = 722
            Height = 34
            Align = alTop
            Caption = 'Resultado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 730
          Height = 285
          Align = alClient
          TabOrder = 1
          object clbPrincipal: TCheckListBox
            Left = 6
            Top = 52
            Width = 718
            Height = 189
            BevelInner = bvNone
            ItemHeight = 13
            TabOrder = 0
          end
          object pb1: TProgressBar
            AlignWithMargins = True
            Left = 6
            Top = 258
            Width = 718
            Height = 16
            Margins.Left = 5
            Margins.Right = 5
            Margins.Bottom = 10
            Align = alBottom
            TabOrder = 1
          end
          object edtCaminhoArquivo: TEdit
            Left = 6
            Top = 24
            Width = 440
            Height = 19
            TabOrder = 2
          end
          object btnArquivo: TButton
            Left = 452
            Top = 21
            Width = 90
            Height = 25
            Caption = 'Arquivo'
            TabOrder = 3
            OnClick = btnArquivoClick
          end
          object btnReset: TButton
            Left = 548
            Top = 21
            Width = 75
            Height = 25
            Caption = 'Reset'
            TabOrder = 4
            OnClick = btnResetClick
          end
          object btnProcessa: TButton
            Left = 629
            Top = 21
            Width = 95
            Height = 25
            Caption = 'Processa'
            TabOrder = 5
            OnClick = btnProcessaClick
          end
        end
      end
      object tsPedidos: TTabSheet
        Caption = 'Pedidos'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 41
          Width = 730
          Height = 538
          Align = alClient
          DataSource = dtmPrincipal.dtsVwPedidos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'PEDIDO_ELO7'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRADOR'
              Width = 163
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ELO7'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PEDIDO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ITENS'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_FRETE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_FRETE'
              Width = 64
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 730
          Height = 41
          Align = alTop
          TabOrder = 0
          object Button1: TButton
            Left = 616
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Consultar'
            TabOrder = 0
            OnClick = Button1Click
          end
        end
      end
      object tsConfig: TTabSheet
        Caption = 'Configura'#231#227'o'
        ImageIndex = 2
      end
    end
  end
  object odgPrincipal: TOpenDialog
    Filter = 'CSV|*.csv'
    Options = [ofHideReadOnly, ofNoValidate, ofPathMustExist, ofEnableSizing]
    Left = 648
    Top = 16
  end
  object cdsPrincipal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 352
    object cdsPrincipalPEDIDO_ELO7: TStringField
      DisplayLabel = 'Pedido Elo7'
      FieldName = 'PEDIDO_ELO7'
      Size = 15
    end
    object cdsPrincipalCOMPRADOR: TStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Size = 100
    end
    object cdsPrincipalSTATUS_ELO7: TStringField
      DisplayLabel = 'Status Elo7'
      FieldName = 'STATUS_ELO7'
      Size = 50
    end
    object cdsPrincipalDATA_PEDIDO: TDateField
      DisplayLabel = 'Dt. Pedido'
      FieldName = 'DATA_PEDIDO'
    end
    object cdsPrincipalTOTAL_ITENS: TSmallintField
      DisplayLabel = 'Tot. Itens'
      FieldName = 'TOTAL_ITENS'
    end
    object cdsPrincipalVALOR_TOTAL: TFloatField
      DisplayLabel = 'Vl. Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object cdsPrincipalTIPO_FRETE: TStringField
      DisplayLabel = 'Tipo Frete'
      FieldName = 'TIPO_FRETE'
      Size = 50
    end
    object cdsPrincipalVALOR_FRETE: TFloatField
      DisplayLabel = 'Vl. Frete'
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '###,##0.00'
    end
  end
  object dtsPrincipal: TDataSource
    AutoEdit = False
    DataSet = cdsPrincipal
    Left = 656
    Top = 352
  end
  object actPrincipal: TActionList
    Left = 544
    Top = 16
    object actCarregaArquivo: TAction
      Caption = 'Carrega Arquivo'
      OnExecute = actCarregaArquivoExecute
    end
  end
end
