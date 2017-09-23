unit uDtmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, System.IniFiles,
  FireDAC.Phys.MySQL, Datasnap.Provider, Datasnap.DBClient, Constantes;

type
  TdtmPrincipal = class(TDataModule)
    conPrincipal: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryGeral: TFDQuery;
    qryInsert: TFDQuery;
    stpGeral: TFDStoredProc;
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
    cdsConfig: TClientDataSet;
    qryConfig: TFDQuery;
    dspConfig: TDataSetProvider;
    qryConfigIDCONFIG: TFDAutoIncField;
    qryConfigPASTA_ORIGEM: TStringField;
    qryConfigPASTA_DESTINO: TStringField;
    cdsConfigIDCONFIG: TAutoIncField;
    cdsConfigPASTA_ORIGEM: TStringField;
    cdsConfigPASTA_DESTINO: TStringField;
    dtsConfig: TDataSource;
    cdsPedidosPos: TClientDataSet;
    qryPedidosPos: TFDQuery;
    dspPedidosPos: TDataSetProvider;
    qryPedidosPosIDPEDIDOSPOS: TFDAutoIncField;
    cdsPedidosPosIDPEDIDOSPOS: TAutoIncField;
    qryPedidosPosIDPEDIDO: TIntegerField;
    qryPedidosPosPOSICAO: TSmallintField;
    cdsPedidosPosIDPEDIDO: TIntegerField;
    cdsPedidosPosPOSICAO: TSmallintField;
    stpInsereAtualizaPedidos: TFDStoredProc;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPedidosHisAfterPost(DataSet: TDataSet);
    procedure cdsLogsAfterPost(DataSet: TDataSet);
    procedure cdsConfigAfterPost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsPedidosPosAfterPost(DataSet: TDataSet);
    procedure cdsSelectAfterPost(DataSet: TDataSet);
  private
    FServer: string;
    FPathOrigem: string;
    FAMBIENTE: TAmbiente;
    { Private declarations }
    procedure SetServer(const Value: string);
    procedure SetAMBIENTE(const Value: TAmbiente);
  public
    { Public declarations }
    procedure sbInsereLog(const pNomeArquivo: string; const pNumInseridos, pNumAtualizados: Integer);
    function fcRetornaIDPedido(pPedidoElo7: string): Integer;
    property Server: string read FServer write SetServer;
    property AMBIENTE: TAmbiente read FAMBIENTE write SetAMBIENTE;

    procedure AlteraAmbiente(pAmbiente: TAmbiente);
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Configuracao;

{$R *.dfm}

procedure TdtmPrincipal.AlteraAmbiente(pAmbiente: TAmbiente);
var
  Config: TConfiguracao;
begin
  Config := TConfiguracao.Create(pAmbiente);
  try
    conPrincipal.Connected := False;
    conPrincipal.DriverName := 'MySQL';
    conPrincipal.Params.Clear;
    conPrincipal.Params.Add('DriverID=MySQL');
    conPrincipal.Params.Add('Database=' + Config.DB_DATABASE);
    conPrincipal.Params.Add('User_Name=' + Config.DB_USER);
    conPrincipal.Params.Add('Password=' + Config.DB_PASSWORD);
    conPrincipal.Params.Add('Server=' + Config.DB_SERVER);
    conPrincipal.Params.Add('ApplicationName=Import');
    //
    AMBIENTE := pAmbiente;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TdtmPrincipal.cdsConfigAfterPost(DataSet: TDataSet);
begin
  cdsConfig.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.cdsLogsAfterPost(DataSet: TDataSet);
begin
  cdsLogs.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.cdsPedidosHisAfterPost(DataSet: TDataSet);
begin
  cdsPedidosHis.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.cdsPedidosPosAfterPost(DataSet: TDataSet);
begin
  cdsPedidosPos.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.cdsSelectAfterPost(DataSet: TDataSet);
begin
  cdsSelect.ApplyUpdates(-1);
end;

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sIniPath: string;
  Config: TConfiguracao;
begin
  Config := TConfiguracao.Create(taProducao);
  try
    AlteraAmbiente(taProducao);
  finally
    FreeAndNil(Config);
  end;

  {
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
    conPrincipal.Params.Add('ApplicationName=Import');

    Server := IniFile.ReadString('principal', 'server', '');
    PathOrigem := IniFile.ReadString('principal', 'path_origem', 'D:\');
  finally
    IniFile.Free;
  end;

  FDPhysMySQLDriverLink1.VendorLib := GetCurrentDir +  '.\..\lib\libmysql.dll';
  cdsConfig.Open;  }
end;

procedure TdtmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  cdsConfig.Close;
end;

function TdtmPrincipal.fcRetornaIDPedido(pPedidoElo7: string): Integer;
begin
  cdsSelect.Close;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Text := 'SELECT idpedido FROM tblpedidos WHERE PEDIDO_ELO7 = :pPedidoElo7';
  qrySelect.ParamByName('pPedidoElo7').AsString := pPedidoElo7;
  cdsSelect.Open;

  if not cdsSelect.IsEmpty then
    Result := cdsSelect.FieldByName('IDPEDIDO').AsInteger
  else
    Result := 0;
end;

procedure TdtmPrincipal.sbInsereLog(const pNomeArquivo: string;
  const pNumInseridos, pNumAtualizados: Integer);
begin
  if not cdsLogs.Active then
    cdsLogs.Open
  else
    cdsLogs.Refresh;

  cdsLogs.Append;
  cdsLogsDATA_LOG.Value := Now;
  cdsLogsARQUIVO.AsString := pNomeArquivo;
  cdsLogsREGISTROS_INSERIDOS.Value := pNumInseridos;
  cdsLogsREGISTROS_ATUALIZADOS.Value := pNumAtualizados;
  cdsLogs.Post;
end;

procedure TdtmPrincipal.SetAMBIENTE(const Value: TAmbiente);
begin
  FAMBIENTE := Value;
end;

procedure TdtmPrincipal.SetServer(const Value: string);
begin
  FServer := Value;
end;

end.
