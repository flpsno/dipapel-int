unit uDtmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, System.IniFiles,
  FireDAC.Phys.MySQL, Datasnap.Provider, Datasnap.DBClient;

type
  TdtmPrincipal = class(TDataModule)
    conPrincipal: TFDConnection;
    qryVwPedidos: TFDQuery;
    dtsVwPedidos: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryGeral: TFDQuery;
    qryInsert: TFDQuery;
    stpGeral: TFDStoredProc;
    qryVwPedidosPEDIDO_ELO7: TStringField;
    qryVwPedidosCOMPRADOR: TStringField;
    qryVwPedidosSTATUS_ELO7: TStringField;
    qryVwPedidosDATA_PEDIDO: TDateField;
    qryVwPedidosTOTAL_ITENS: TSmallintField;
    qryVwPedidosVALOR_TOTAL: TBCDField;
    qryVwPedidosTIPO_FRETE: TStringField;
    qryVwPedidosVALOR_FRETE: TBCDField;
    qryVwPedidosHis: TFDQuery;
    dtsVwPedidosHis: TDataSource;
    qryVwPedidosHisPEDIDO_ELO7: TStringField;
    qryVwPedidosHisTIPO: TStringField;
    qryVwPedidosHisCAMPO: TStringField;
    qryVwPedidosHisVALOR_ANTIGO: TStringField;
    qryVwPedidosHisVALOR_NOVO: TStringField;
    qryResultadoImport: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    dtsResultadoImport: TDataSource;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryVwPedidosHisDATA_HISTORICO: TDateTimeField;
    qryResultadoImportDATA_HISTORICO: TDateTimeField;
    cdsPedidos: TClientDataSet;
    qryPedidos: TFDQuery;
    dspPedidos: TDataSetProvider;
    qryPedidosIDPEDIDO: TFDAutoIncField;
    qryPedidosPEDIDO_ELO7: TStringField;
    qryPedidosSTATUS_ELO7: TStringField;
    qryPedidosDATA_PEDIDO: TDateField;
    qryPedidosTOTAL_ITENS: TSmallintField;
    qryPedidosVALOR_TOTAL: TBCDField;
    qryPedidosTIPO_FRETE: TStringField;
    qryPedidosVALOR_FRETE: TBCDField;
    qryPedidosCOMPRADOR: TStringField;
    cdsPedidosIDPEDIDO: TAutoIncField;
    cdsPedidosPEDIDO_ELO7: TStringField;
    cdsPedidosSTATUS_ELO7: TStringField;
    cdsPedidosDATA_PEDIDO: TDateField;
    cdsPedidosTOTAL_ITENS: TSmallintField;
    cdsPedidosVALOR_TOTAL: TBCDField;
    cdsPedidosTIPO_FRETE: TStringField;
    cdsPedidosVALOR_FRETE: TBCDField;
    cdsPedidosCOMPRADOR: TStringField;
    cdsPedidosHis: TClientDataSet;
    qryPedidosHis: TFDQuery;
    dspPedidosHis: TDataSetProvider;
    qryPedidosHisIDPEDIDOHIS: TFDAutoIncField;
    qryPedidosHisIDPEDIDO: TIntegerField;
    qryPedidosHisVALOR_ANTIGO: TStringField;
    qryPedidosHisVALOR_NOVO: TStringField;
    qryPedidosHisDATA_HISTORICO: TDateTimeField;
    qryPedidosHisTIPO_ALTERACAO: TStringField;
    qryPedidosHisCAMPO: TStringField;
    cdsPedidosHisIDPEDIDOHIS: TAutoIncField;
    cdsPedidosHisIDPEDIDO: TIntegerField;
    cdsPedidosHisVALOR_ANTIGO: TStringField;
    cdsPedidosHisVALOR_NOVO: TStringField;
    cdsPedidosHisDATA_HISTORICO: TDateTimeField;
    cdsPedidosHisTIPO_ALTERACAO: TStringField;
    cdsPedidosHisCAMPO: TStringField;
    cdsLogs: TClientDataSet;
    qryLogs: TFDQuery;
    dspLogs: TDataSetProvider;
    qryLogsIDLOG: TFDAutoIncField;
    qryLogsDATA_LOG: TDateTimeField;
    qryLogsARQUIVO: TStringField;
    qryLogsREGISTROS_INSERIDOS: TSmallintField;
    qryLogsREGISTROS_ATUALIZADOS: TSmallintField;
    cdsLogsIDLOG: TAutoIncField;
    cdsLogsDATA_LOG: TDateTimeField;
    cdsLogsARQUIVO: TStringField;
    cdsLogsREGISTROS_INSERIDOS: TSmallintField;
    cdsLogsREGISTROS_ATUALIZADOS: TSmallintField;
    cdsSelect: TClientDataSet;
    qrySelect: TFDQuery;
    dspSelect: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPedidosAfterPost(DataSet: TDataSet);
    procedure cdsPedidosHisAfterPost(DataSet: TDataSet);
    procedure cdsLogsAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure sbInserePedidoHis(pIdPedido: Integer; pValor_antigo, pValor_novo, pTipo_alteracao, pCampo: string);
  public
    { Public declarations }
    procedure sbInsereLog(const pNomeArquivo: string; const pNumInseridos, pNumAtualizados: Integer);
    procedure sbInserePedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
      pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
      pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string);
    function fcAtualizaPedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
      pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
      pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string): Boolean;
    function fcPedidoExiste(pPedidosElo7: string): Boolean;
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmPrincipal.cdsLogsAfterPost(DataSet: TDataSet);
begin
  cdsLogs.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.cdsPedidosAfterPost(DataSet: TDataSet);
begin
  cdsPedidos.ApplyUpdates(-1);

//  cdsSelect.Close;
//  qrySelect.SQL.Clear;
//  qrySelect.SQL.Text := 'select idpedido from tblpedidos where codigo = :pCodigo';
//  qrySelect

end;

procedure TdtmPrincipal.cdsPedidosHisAfterPost(DataSet: TDataSet);
begin
  cdsPedidosHis.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sIniPath: string;
begin
  sIniPath := GetCurrentDir +  '.\..\cfg\config.ini';

  IniFile := TIniFile.Create(sIniPath);
  try
    conPrincipal.DriverName := 'MySQL';
    conPrincipal.Params.Clear;
    conPrincipal.Params.Add('DriverID=MySQL');
    conPrincipal.Params.Add('Database=' + IniFile.ReadString('principal', 'database', ''));
    conPrincipal.Params.Add('User_Name=' + IniFile.ReadString('principal', 'user', ''));
    conPrincipal.Params.Add('Password=' + IniFile.ReadString('principal', 'password', ''));
    conPrincipal.Params.Add('Server=' + IniFile.ReadString('principal', 'server', ''));
//    conPrincipal.Params.Add('OSAuthent=No');
  //  conPrincipal.Params.Add('Workstation=' + gtrGetComputerNameFromWindows);
    conPrincipal.Params.Add('ApplicationName=Import');
  finally
    IniFile.Free;
  end;
end;

function TdtmPrincipal.fcAtualizaPedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
  pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
  pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string): Boolean;
var
  bAlterou: Boolean;
begin
  bAlterou := False;

  if not cdsPedidos.Active then
    cdsPedidos.Open;

  if cdsPedidos.Locate('PEDIDO_ELO7', pPEDIDO_ELO7, [loCaseInsensitive]) then
  begin
    if cdsPedidosSTATUS_ELO7.AsString <> pSTATUS_ELO7 then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosSTATUS_ELO7.AsString,
        pSTATUS_ELO7, 'U', 'STATUS_ELO7');
    end;

    if cdsPedidosDATA_PEDIDO.AsDateTime <> pDATA_PEDIDO then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosDATA_PEDIDO.AsString,
        DateToStr(pDATA_PEDIDO), 'U', 'DATA_PEDIDO');
    end;

    if cdsPedidosTOTAL_ITENS.AsInteger <> pTOTAL_ITENS then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosTOTAL_ITENS.AsString,
        IntToStr(pTOTAL_ITENS), 'U', 'TOTAL_ITENS');
    end;

    if cdsPedidosVALOR_TOTAL.AsFloat <> pVALOR_TOTAL then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosVALOR_TOTAL.AsString,
        CurrToStr(pVALOR_TOTAL), 'U', 'VALOR_TOTAL');
    end;

    if cdsPedidosTIPO_FRETE.AsString <> pTIPO_FRETE then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosTIPO_FRETE.AsString,
        pTIPO_FRETE, 'U', 'TIPO_FRETE');
    end;

    if cdsPedidosVALOR_FRETE.AsFloat <> pVALOR_FRETE then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosVALOR_FRETE.AsString,
        CurrToStr(pVALOR_FRETE), 'U', 'VALOR_FRETE');
    end;

    if cdsPedidosCOMPRADOR.AsString <> pCOMPRADOR then
    begin
      bAlterou := True;
      sbInserePedidoHis(cdsPedidosIDPEDIDO.Value, cdsPedidosCOMPRADOR.AsString,
        pCOMPRADOR, 'U', 'COMPRADOR');
    end;
  end;

  if bAlterou then
  begin
    cdsPedidos.Edit;
    cdsPedidosSTATUS_ELO7.AsString := pSTATUS_ELO7;
    cdsPedidosDATA_PEDIDO.Value := pDATA_PEDIDO;
    cdsPedidosTOTAL_ITENS.Value := pTOTAL_ITENS;
    cdsPedidosVALOR_TOTAL.Value := pVALOR_TOTAL;
    cdsPedidosTIPO_FRETE.AsString := pTIPO_FRETE;
    cdsPedidosVALOR_FRETE.Value := pVALOR_FRETE;
    cdsPedidosCOMPRADOR.AsString := pCOMPRADOR;
    cdsPedidos.Post;
  end;

  Result := bAlterou;
end;

function TdtmPrincipal.fcPedidoExiste(pPedidosElo7: string): Boolean;
begin
  cdsSelect.Close;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Text := 'SELECT idpedido FROM tblpedidos WHERE PEDIDO_ELO7 = :pPedidoElo7';
  qrySelect.ParamByName('pPedidoElo7').AsString := pPedidosElo7;
  cdsSelect.Open;

  Result := not cdsSelect.IsEmpty;
end;

procedure TdtmPrincipal.sbInsereLog(const pNomeArquivo: string;
  const pNumInseridos, pNumAtualizados: Integer);
begin
  if not cdsLogs.Active then
    cdsLogs.Open;

  cdsLogs.Append;
  cdsLogsDATA_LOG.Value := Now;
  cdsLogsARQUIVO.AsString := pNomeArquivo;
  cdsLogsREGISTROS_INSERIDOS.Value := pNumInseridos;
  cdsLogsREGISTROS_ATUALIZADOS.Value := pNumAtualizados;
  cdsLogs.Post;
end;

procedure TdtmPrincipal.sbInserePedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
  pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
  pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string);
begin
  if not cdsPedidos.Active then
    cdsPedidos.Open();

   cdsPedidos.Append;
   cdsPedidosPEDIDO_ELO7.AsString := pPEDIDO_ELO7;
   cdsPedidosSTATUS_ELO7.AsString := pSTATUS_ELO7;
   cdsPedidosDATA_PEDIDO.Value := pDATA_PEDIDO;
   cdsPedidosTOTAL_ITENS.Value := pTOTAL_ITENS;
   cdsPedidosVALOR_TOTAL.Value := pVALOR_TOTAL;
   cdsPedidosTIPO_FRETE.AsString := pTIPO_FRETE;
   cdsPedidosVALOR_FRETE.Value := pVALOR_FRETE;
   cdsPedidosCOMPRADOR.AsString := pCOMPRADOR;
   cdsPedidos.Post;
end;

procedure TdtmPrincipal.sbInserePedidoHis(pIdPedido: Integer; pValor_antigo,
  pValor_novo, pTipo_alteracao, pCampo: string);
begin
  if not cdsPedidosHis.Active then
    cdsPedidosHis.Open;

  cdsPedidosHis.Append;
  cdsPedidosHisIDPEDIDO.Value := pIdPedido;
  cdsPedidosHisVALOR_ANTIGO.AsString := pValor_antigo;
  cdsPedidosHisVALOR_NOVO.AsString := pValor_novo;
  cdsPedidosHisDATA_HISTORICO.Value := Now;
  cdsPedidosHisTIPO_ALTERACAO.AsString := pTipo_alteracao;
  cdsPedidosHisCAMPO.AsString := pCampo;
  cdsPedidosHis.Post;
end;

end.
