unit uDtmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, System.IniFiles;

type
  TdtmPrincipal = class(TDataModule)
    conPrincipal: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    qryPedidos: TFDQuery;
    dtsPedidos: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryGeral: TFDQuery;
    qryInsert: TFDQuery;
    stpGeral: TFDStoredProc;
    qryPedidosPEDIDO_ELO7: TStringField;
    qryPedidosCOMPRADOR: TStringField;
    qryPedidosSTATUS_ELO7: TStringField;
    qryPedidosDATA_PEDIDO: TDateField;
    qryPedidosTOTAL_ITENS: TSmallintField;
    qryPedidosVALOR_TOTAL: TBCDField;
    qryPedidosTIPO_FRETE: TStringField;
    qryPedidosVALOR_FRETE: TBCDField;
    qryPedidosHis: TFDQuery;
    dtsPedidosHis: TDataSource;
    qryPedidosHisPEDIDO_ELO7: TStringField;
    qryPedidosHisTIPO: TStringField;
    qryPedidosHisCAMPO: TStringField;
    qryPedidosHisVALOR_ANTIGO: TStringField;
    qryPedidosHisVALOR_NOVO: TStringField;
    qryPedidosHisDATA_HISTORICO: TSQLTimeStampField;
    qryResultadoImport: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    dtsResultadoImport: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure sbInsereLog(const pNomeArquivo: string; const pNumInseridos, pNumAtualizados: Integer);
    procedure sbInserePedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
      pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
      pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string);
    procedure sbAtualizaPedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
      pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
      pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string);
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sIniPath, sTeste: string;
begin
  sIniPath := GetCurrentDir +  '.\..\cfg\config.ini';

  IniFile := TIniFile.Create(sIniPath);
  try
    conPrincipal.DriverName := 'MSSQL';
    conPrincipal.Params.Clear;
    conPrincipal.Params.Add('DriverID=MSSQL');
    conPrincipal.Params.Add('Database=' + IniFile.ReadString('principal', 'database', ''));
    conPrincipal.Params.Add('User_Name=' + IniFile.ReadString('principal', 'user', ''));
    conPrincipal.Params.Add('Password=' + IniFile.ReadString('principal', 'password', ''));
    conPrincipal.Params.Add('Server=' + IniFile.ReadString('principal', 'server', ''));
    conPrincipal.Params.Add('OSAuthent=No');
  //  conPrincipal.Params.Add('Workstation=' + gtrGetComputerNameFromWindows);
    conPrincipal.Params.Add('ApplicationName=Import');
  finally
    IniFile.Free;
  end;
end;

procedure TdtmPrincipal.sbAtualizaPedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
  pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
  pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string);
begin
  stpGeral.ExecProc('spAtualizaPedido', [pPEDIDO_ELO7, pSTATUS_ELO7, pDATA_PEDIDO,
    pTOTAL_ITENS, pVALOR_TOTAL, pTIPO_FRETE, pVALOR_FRETE, pCOMPRADOR]);
end;

procedure TdtmPrincipal.sbInsereLog(const pNomeArquivo: string;
  const pNumInseridos, pNumAtualizados: Integer);
begin
  stpGeral.ExecProc('spInsereLog', [pNomeArquivo, pNumInseridos, pNumAtualizados]);
end;

procedure TdtmPrincipal.sbInserePedido(pPEDIDO_ELO7, pSTATUS_ELO7: string;
  pDATA_PEDIDO: TDate; pTOTAL_ITENS: Integer; pVALOR_TOTAL: Double;
  pTIPO_FRETE: string; pVALOR_FRETE: Double; pCOMPRADOR: string);
begin
  stpGeral.ExecProc('spInserePedido', [pPEDIDO_ELO7, pSTATUS_ELO7, pDATA_PEDIDO,
    pTOTAL_ITENS, pVALOR_TOTAL, pTIPO_FRETE, pVALOR_FRETE, pCOMPRADOR]);
end;

end.
