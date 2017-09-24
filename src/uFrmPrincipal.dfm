object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 589
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 51
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
    Top = 51
    Width = 738
    Height = 519
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object pgcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 738
      Height = 519
      ActivePage = tsPedidos
      Align = alClient
      TabOrder = 0
      OnChange = pgcPrincipalChange
      object tsImport: TTabSheet
        Caption = 'Import'
        object pnlRodape: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 240
          Width = 724
          Height = 248
          Align = alBottom
          ParentColor = True
          TabOrder = 0
          object dbgPrincipal: TDBGrid
            Left = 1
            Top = 35
            Width = 722
            Height = 212
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
          Height = 237
          Align = alClient
          ParentColor = True
          TabOrder = 1
          object pb1: TProgressBar
            AlignWithMargins = True
            Left = 6
            Top = 210
            Width = 718
            Height = 16
            Margins.Left = 5
            Margins.Top = 10
            Margins.Right = 5
            Margins.Bottom = 10
            Align = alBottom
            TabOrder = 0
          end
          object edtCaminhoArquivo: TEdit
            Left = 6
            Top = 48
            Width = 440
            Height = 19
            TabOrder = 1
          end
          object btnArquivo: TButton
            Left = 452
            Top = 45
            Width = 90
            Height = 25
            Caption = 'Arquivo'
            TabOrder = 2
            OnClick = btnArquivoClick
          end
          object btnReset: TButton
            Left = 548
            Top = 45
            Width = 75
            Height = 25
            Action = act1
            TabOrder = 3
          end
          object btnProcessa: TButton
            Left = 629
            Top = 45
            Width = 95
            Height = 25
            Action = actProcessaArquivo
            TabOrder = 4
          end
          object dbg1: TDBGrid
            Left = 1
            Top = 88
            Width = 728
            Height = 112
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dtsPrincipal
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object rgAmbiente: TRadioGroup
            Left = 1
            Top = 0
            Width = 208
            Height = 42
            Caption = 'Ambiente'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Produ'#231#227'o'
              'Homologa'#231#227'o')
            TabOrder = 6
            OnClick = rgAmbienteClick
          end
        end
      end
      object tsPedidos: TTabSheet
        Caption = 'Pedidos'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 57
          Width = 730
          Height = 434
          Align = alClient
          DataSource = dtsPedidos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDPEDIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO_ELO7'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ELO7'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PEDIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ITENS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
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
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 730
          Height = 57
          Align = alTop
          TabOrder = 0
          object Button1: TButton
            AlignWithMargins = True
            Left = 279
            Top = 6
            Width = 123
            Height = 47
            Margins.Top = 5
            Align = alLeft
            Caption = 'Consultar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button1Click
          end
          object grp1: TGroupBox
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 269
            Height = 49
            Align = alLeft
            Caption = 'Data de Importa'#231#227'o '
            TabOrder = 1
            object lbl4: TLabel
              Left = 3
              Top = 22
              Width = 17
              Height = 13
              Caption = 'De:'
            end
            object lbl5: TLabel
              Left = 132
              Top = 22
              Width = 21
              Height = 13
              Caption = 'At'#233':'
            end
            object dtpDtImportacaoAte: TDateTimePicker
              Left = 159
              Top = 19
              Width = 97
              Height = 21
              Date = 42805.000000000000000000
              Time = 42805.000000000000000000
              TabOrder = 0
            end
            object dtpDtImportacaoDe: TDateTimePicker
              Left = 26
              Top = 19
              Width = 97
              Height = 21
              Date = 42805.000000000000000000
              Time = 42805.000000000000000000
              TabOrder = 1
            end
          end
        end
      end
      object tsConfig: TTabSheet
        Caption = 'Configura'#231#227'o'
        ImageIndex = 2
        object lbl1: TLabel
          Left = 3
          Top = 56
          Width = 139
          Height = 13
          Caption = 'Pasta Arquivos Processados:'
        end
        object lbl2: TLabel
          Left = 3
          Top = 10
          Width = 109
          Height = 13
          Caption = 'Pasta Arquivos Novos:'
        end
        object btnDiretorio: TBitBtn
          Left = 323
          Top = 73
          Width = 30
          Height = 25
          Action = actCarregaDiretorioDest
          Caption = '...'
          TabOrder = 0
        end
        object btnSalvar: TBitBtn
          Left = 247
          Top = 102
          Width = 70
          Height = 25
          Hint = 'Post'
          Caption = 'Salvar'
          TabOrder = 1
          OnClick = btnSalvarClick
        end
        object btnCarregaDiretorio: TBitBtn
          Left = 323
          Top = 27
          Width = 30
          Height = 25
          Action = actCarregaDiretorioOrig
          Caption = '...'
          TabOrder = 2
        end
        object edtArquivosProcessados: TEdit
          Left = 3
          Top = 75
          Width = 314
          Height = 19
          TabOrder = 3
        end
        object edtArquivosNovos: TEdit
          Left = 3
          Top = 27
          Width = 314
          Height = 19
          TabOrder = 4
        end
      end
    end
  end
  object stbPrincipal: TStatusBar
    Left = 0
    Top = 570
    Width = 738
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 300
      end>
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
    Left = 592
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
  object actReset: TActionList
    Left = 544
    Top = 16
    object actCarregaArquivo: TAction
      Caption = 'Carrega Arquivo'
      OnExecute = actCarregaArquivoExecute
    end
    object actCancelConfig: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dtmPrincipal.dtsConfig
    end
    object actPostConfig: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dtmPrincipal.dtsConfig
    end
    object actCarregaDiretorioDest: TAction
      Caption = '...'
      OnExecute = actCarregaDiretorioDestExecute
    end
    object actCarregaDiretorioOrig: TAction
      Caption = '...'
      OnExecute = actCarregaDiretorioOrigExecute
    end
    object act1: TAction
      Caption = 'Reset'
      OnExecute = act1Execute
      OnUpdate = act1Update
    end
    object actProcessaArquivo: TAction
      Caption = 'Processa'
      OnExecute = actProcessaArquivoExecute
      OnUpdate = actProcessaArquivoUpdate
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 112
    Top = 16
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 232
    object cdsPedidosPEDIDO_ELO7: TStringField
      FieldName = 'PEDIDO_ELO7'
      Size = 15
    end
    object cdsPedidosCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Size = 100
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
    end
    object cdsPedidosVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsPedidosTIPO_FRETE: TStringField
      FieldName = 'TIPO_FRETE'
      Size = 50
    end
    object cdsPedidosVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object cdsPedidosIDPEDIDO: TIntegerField
      FieldName = 'IDPEDIDO'
    end
  end
  object dtsPedidos: TDataSource
    AutoEdit = False
    DataSet = cdsPedidos
    Left = 344
    Top = 232
  end
end
