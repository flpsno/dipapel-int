unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.CheckLst,
  System.Actions, Vcl.ActnList, MIDASLIB, Vcl.Mask, Vcl.DBCtrls, Vcl.DBActns,
  Vcl.Buttons, Vcl.FileCtrl, Pedido, Constantes, System.Generics.Collections, Controller_TelaInicial;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pgcPrincipal: TPageControl;
    tsImport: TTabSheet;
    tsPedidos: TTabSheet;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnPesquisar: TButton;
    odgPrincipal: TOpenDialog;
    cdsPrincipal: TClientDataSet;
    dtsPrincipal: TDataSource;
    cdsPrincipalPEDIDO_ELO7: TStringField;
    cdsPrincipalCOMPRADOR: TStringField;
    cdsPrincipalSTATUS_ELO7: TStringField;
    cdsPrincipalDATA_PEDIDO: TDateField;
    cdsPrincipalTOTAL_ITENS: TSmallintField;
    cdsPrincipalVALOR_TOTAL: TFloatField;
    cdsPrincipalTIPO_FRETE: TStringField;
    cdsPrincipalVALOR_FRETE: TFloatField;
    tsConfig: TTabSheet;
    pnlRodape: TPanel;
    dbgPrincipal: TDBGrid;
    pnlResultado: TPanel;
    pnl1: TPanel;
    pb1: TProgressBar;
    edtCaminhoArquivo: TEdit;
    btnArquivo: TButton;
    btnReset: TButton;
    btnProcessa: TButton;
    actReset: TActionList;
    actCarregaArquivo: TAction;
    stbPrincipal: TStatusBar;
    lbl1: TLabel;
    btnDiretorio: TBitBtn;
    btnSalvar: TBitBtn;
    actCancelConfig: TDataSetCancel;
    actPostConfig: TDataSetPost;
    actCarregaDiretorioDest: TAction;
    lbl2: TLabel;
    btnCarregaDiretorio: TBitBtn;
    actCarregaDiretorioOrig: TAction;
    dbg1: TDBGrid;
    act1: TAction;
    actProcessaArquivo: TAction;
    rgAmbiente: TRadioGroup;
    edtArquivosProcessados: TEdit;
    edtArquivosNovos: TEdit;
    tmr1: TTimer;
    cdsPedidos: TClientDataSet;
    dtsPedidos: TDataSource;
    cdsPedidosPEDIDO_ELO7: TStringField;
    cdsPedidosCOMPRADOR: TStringField;
    cdsPedidosSTATUS_ELO7: TStringField;
    cdsPedidosDATA_PEDIDO: TDateField;
    cdsPedidosTOTAL_ITENS: TSmallintField;
    cdsPedidosVALOR_TOTAL: TFloatField;
    cdsPedidosTIPO_FRETE: TStringField;
    cdsPedidosVALOR_FRETE: TFloatField;
    cdsPedidosIDPEDIDO: TIntegerField;
    cdsPedidosDATA_IMPORTACAO: TDateField;
    pnl2: TPanel;
    lbl6: TLabel;
    cbbOpcoesPesquisa: TComboBox;
    pnlConteudo: TPanel;
    lbl3: TLabel;
    edtCodigoPedido: TEdit;
    pnlDataDeAte: TPanel;
    grp1: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    dtpDtImportacaoAte: TDateTimePicker;
    dtpDtImportacaoDe: TDateTimePicker;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCarregaArquivoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCarregaDiretorioDestExecute(Sender: TObject);
    procedure actCarregaDiretorioOrigExecute(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure act1Update(Sender: TObject);
    procedure actProcessaArquivoExecute(Sender: TObject);
    procedure actProcessaArquivoUpdate(Sender: TObject);
    procedure rgAmbienteClick(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbbOpcoesPesquisaChange(Sender: TObject);
  private
    { Private declarations }
    FController: TController_TelaPrincipal;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uDtmPrincipal, uFrmPedidosHistorico, Configuracao;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
var
  listaPedidos: TObjectList<TPedido>;
  pedidoAux: TPedido;
begin
  cdsPedidos.EmptyDataSet;

  listaPedidos := TObjectList<TPedido>.Create;
  try
    case cbbOpcoesPesquisa.ItemIndex of
      0: FController.ConsultarPedidos(tpCodigo, edtCodigoPedido.Text, Null, listaPedidos);
      1: FController.ConsultarPedidos(tpDataImportacao, dtpDtImportacaoDe.Date, dtpDtImportacaoAte.Date, listaPedidos);
    end;


    for pedidoAux in listaPedidos do
    begin
      cdsPedidos.Append;
      cdsPedidosIDPEDIDO.AsInteger := pedidoAux.IDPEDIDO;
      cdsPedidosPEDIDO_ELO7.AsString := pedidoAux.Codigo;
      cdsPedidosCOMPRADOR.AsString := pedidoAux.COMPRADOR;
      cdsPedidosSTATUS_ELO7.AsString := pedidoAux.Status;
      cdsPedidosDATA_PEDIDO.AsDateTime := pedidoAux.DataPedido;
      cdsPedidosTOTAL_ITENS.AsInteger := pedidoAux.TotalItens;
      cdsPedidosVALOR_TOTAL.AsFloat := pedidoAux.ValorTotal;
      cdsPedidosTIPO_FRETE.AsString := pedidoAux.TipoFrete;
      cdsPedidosVALOR_FRETE.AsFloat := pedidoAux.ValorFrete;
      cdsPedidosDATA_IMPORTACAO.AsDateTime := pedidoAux.DataImportacao;
      cdsPedidos.Post;
    end;
  finally
    listaPedidos.Free;
  end;
end;

procedure TfrmPrincipal.act1Execute(Sender: TObject);
begin
  edtCaminhoArquivo.Text := '';
  cdsPrincipal.EmptyDataSet;
  pb1.Position := 0;
end;

procedure TfrmPrincipal.act1Update(Sender: TObject);
begin
  (Sender as TAction).Enabled := edtCaminhoArquivo.Text <> '';
end;

procedure TfrmPrincipal.actCarregaArquivoExecute(Sender: TObject);
var
  i, j, iTotalItens: Integer;
  sArquivo, sCampo, sLinha, sPedidoElo7, sComprador, sStatusElo7, sTipoFrete: string;
  slLinha,  slCSV: TStringList;
  dDataPedido: TDate;
  dValorTotal, dValorFrete: Double;
begin
  if FileExists(edtCaminhoArquivo.Text) then
  begin
    sArquivo := ExtractFileName(edtCaminhoArquivo.Text);

    slLinha := TStringList.Create;
    slCSV := TStringList.Create;
    try
      slCSV.LoadFromFile(edtCaminhoArquivo.Text);

      for i := 1 to  slCSV.Count -1 do
      begin
        sLinha := slCSV[i] + ';';
        slLinha.Clear;

        for j := 1 to Length(sLinha) do
        begin
          if sLinha[j] = ';' then
          begin
            slLinha.Add(sCampo);
            sCampo := '';
            Continue;
          end;
          sCampo := sCampo + sLinha[j]
        end;

        sPedidoElo7 := slLinha[0];
        sComprador := slLinha[1];
        sStatusElo7 := slLinha[2];
        dDataPedido := StrToDate(slLinha[3]);
        iTotalItens := StrToInt(slLinha[4]);
        dValorTotal := StrToFloat(StringReplace(slLinha[5], '.', ',', [rfReplaceAll]));
        sTipoFrete := slLinha [6];

        if (slLinha[7] <> '') then
          dValorFrete := StrToFloat(StringReplace(slLinha[7], '.', ',', [rfReplaceAll]))
        else
          dValorFrete := 0;

        cdsPrincipal.Append;
        cdsPrincipalPEDIDO_ELO7.AsString := sPedidoElo7;
        cdsPrincipalCOMPRADOR.AsString := sComprador;
        cdsPrincipalSTATUS_ELO7.AsString := sStatusElo7;
        cdsPrincipalDATA_PEDIDO.Value := dDataPedido;
        cdsPrincipalTOTAL_ITENS.Value := iTotalItens;
        cdsPrincipalVALOR_TOTAL.Value := dValorTotal;
        cdsPrincipalTIPO_FRETE.AsString := sTipoFrete;
        cdsPrincipalVALOR_FRETE.Value := dValorFrete;
        cdsPrincipal.Post;
      end;
      cdsPrincipal.First;
    finally
      slCSV.Free;
    end;
  end;

end;

procedure TfrmPrincipal.actCarregaDiretorioDestExecute(Sender: TObject);
var
  chosenDirectory: string;
begin
  if selectdirectory('Selecione o diret�rio dos importados', 'C:\', chosenDirectory) then
    edtArquivosProcessados.Text := chosenDirectory;
end;

procedure TfrmPrincipal.actCarregaDiretorioOrigExecute(Sender: TObject);
var
  chosenDirectory: string;
begin
  if selectdirectory('Selecione o diret�rio dos importados', 'C:\', chosenDirectory) then
    edtArquivosNovos.Text := chosenDirectory;
end;

procedure TfrmPrincipal.actProcessaArquivoExecute(Sender: TObject);
var
  iRegistrosNovos, iRegistrosAtualizados: Integer;
  sArquivo, sArquivoFinal: string;
  objPedido: TPedido;
  Config: TConfiguracao;
begin
  if not cdsPrincipal.IsEmpty then
  begin
    Config := TConfiguracao.Create(dtmPrincipal.AMBIENTE);
    try
      if (Config.PATH_ARQUIVO_PROCESSADO = '') then
      begin
        ShowMessage('N�o h� path para arquivos processados!!!');
        Exit;
      end;

      iRegistrosNovos := 0;
      iRegistrosAtualizados := 0;

      sArquivo := ExtractFileName(edtCaminhoArquivo.Text);

      pb1.Max := cdsPrincipal.RecordCount;
      pb1.Step := Round(cdsPrincipal.RecordCount / 100);

      cdsPrincipal.First;
      while not cdsPrincipal.Eof do
      begin
        objPedido := TPedido.Create;
        try
          objPedido.Codigo := cdsPrincipalPEDIDO_ELO7.AsString;
          objPedido.Status := cdsPrincipalSTATUS_ELO7.AsString;
          objPedido.DataPedido := cdsPrincipalDATA_PEDIDO.AsDateTime;
          objPedido.TotalItens := cdsPrincipalTOTAL_ITENS.AsInteger;
          objPedido.ValorTotal := cdsPrincipalVALOR_TOTAL.AsFloat;
          objPedido.TipoFrete := cdsPrincipalTIPO_FRETE.AsString;
          objPedido.ValorFrete := cdsPrincipalVALOR_FRETE.AsFloat;
          objPedido.COMPRADOR := cdsPrincipalCOMPRADOR.AsString;

          case objPedido.InserePedido of
            1: Inc(iRegistrosNovos);
            2: Inc(iRegistrosAtualizados);
          end;
        finally
          objPedido.Free;
        end;

        pb1.Position := cdsPrincipal.RecNo +1;
        cdsPrincipal.Next;
      end;

      cdsPrincipal.First;

      dtmPrincipal.qryResultadoImport.Close;
  //    dtmPrincipal.qryResultadoImport.ParamByName('pData').AsDate := Now;
      dtmPrincipal.qryResultadoImport.Open();

      sArquivoFinal := Copy(sArquivo, 1,Length(sArquivo) -4)
        + '_' + FormatDateTime('yyyymmdd', Now)
        + '_' + IntToStr(iRegistrosNovos + iRegistrosAtualizados) + '_alteracoes'
        + ExtractFileExt(sArquivo);

      // registra log com o nome do arquivo e teve registros novos ou atualizados
      if ((iRegistrosNovos + iRegistrosAtualizados) > 0) then
        dtmPrincipal.sbInsereLog(sArquivoFinal, iRegistrosNovos, iRegistrosAtualizados);

      if System.SysUtils.DirectoryExists(Config.PATH_ARQUIVO_PROCESSADO) then
        MoveFile(PChar(edtCaminhoArquivo.Text), PChar(Config.PATH_ARQUIVO_PROCESSADO + '\' + sArquivoFinal));

      ShowMessage('Conclu�do!!!' + #13
        + 'Registros Inseridos: ' + IntToStr(iRegistrosNovos) + #13
        + 'Registros Atualizados: ' + IntToStr(iRegistrosAtualizados));
    finally
      FreeAndNil(Config);
    end;
  end;
end;

procedure TfrmPrincipal.actProcessaArquivoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FileExists(edtCaminhoArquivo.Text)
    and not cdsPrincipal.IsEmpty;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  Config: TConfiguracao;
begin
  Config := TConfiguracao.Create(dtmPrincipal.AMBIENTE);
  try
    Config.SalvarPaths(edtArquivosNovos.Text, edtArquivosProcessados.Text);
  finally
    FreeAndNil(Config);
  end;
end;

procedure TfrmPrincipal.cbbOpcoesPesquisaChange(Sender: TObject);
begin
  pnlConteudo.Visible := cbbOpcoesPesquisa.ItemIndex in [0];
  pnlDataDeAte.Visible := cbbOpcoesPesquisa.ItemIndex in [1];
end;

procedure TfrmPrincipal.btnArquivoClick(Sender: TObject);
var
  Config: TConfiguracao;
begin
  Config := TConfiguracao.Create(dtmPrincipal.AMBIENTE);
  try
    if System.SysUtils.DirectoryExists(Config.PATH_ARQUIVO_NOVO) then
      odgPrincipal.InitialDir := Config.PATH_ARQUIVO_NOVO;

    if odgPrincipal.Execute then
    begin
      edtCaminhoArquivo.Text := odgPrincipal.FileName;
      actCarregaArquivo.Execute;
    end;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  cdsPrincipal.CreateDataSet;
  cdsPrincipal.Open;

  cdsPedidos.CreateDataSet;
  cdsPedidos.Open;

  FController := TController_TelaPrincipal.Create(dtmPrincipal.conPrincipal);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  if (FController <> nil) then
    FController.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  pgcPrincipal.ActivePageIndex := 0;
  stbPrincipal.Panels[0].Text := 'Server DB: ' + dtmPrincipal.Server;
  stbPrincipal.Panels[1].Text := 'vers�o: ' + dtmPrincipal.Server;
  //
  dtpDtImportacaoDe.Date := Now;
  dtpDtImportacaoAte.Date := Now;

  cbbOpcoesPesquisaChange(cbbOpcoesPesquisa);

end;

procedure TfrmPrincipal.pgcPrincipalChange(Sender: TObject);
var
  Config: TConfiguracao;
begin
  if (pgcPrincipal.ActivePage = tsConfig) then
  begin
    Config := TConfiguracao.Create(dtmPrincipal.AMBIENTE);
    try
      edtArquivosNovos.Text := Config.PATH_ARQUIVO_NOVO;
      edtArquivosProcessados.Text := Config.PATH_ARQUIVO_PROCESSADO;
    finally
      FreeAndNil(Config);
    end;
  end;
end;

procedure TfrmPrincipal.rgAmbienteClick(Sender: TObject);
begin
  case rgAmbiente.ItemIndex of
    0: dtmPrincipal.AlteraAmbiente(taProducao);
    1: dtmPrincipal.AlteraAmbiente(taHomologacao);
  end;
end;

procedure TfrmPrincipal.tmr1Timer(Sender: TObject);
begin
  case dtmPrincipal.AMBIENTE of
    taProducao:
    begin
      Self.Color := clBlue;
      stbPrincipal.Panels[2].Text := 'PRODU��O';
    end;
    taHomologacao:
    begin
      Self.Color := clYellow;
      stbPrincipal.Panels[2].Text := 'HOMOLOGA��O';
    end;
  end;
end;

end.
