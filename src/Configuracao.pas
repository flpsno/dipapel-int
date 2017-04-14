unit Configuracao;

interface

uses System.Variants, System.Classes, Constantes, System.IniFiles, System.SysUtils;

type
  TConfiguracao = class

  private
    FPATH_ARQUIVO_PROCESSADO: string;
    FPATH_ARQUIVO_NOVO: string;
    FAMBIENTE: TAmbiente;
    FDB_USER: string;
    FDB_SERVER: string;
    FDB_DATABASE: string;
    FDB_PASSWORD: string;
    procedure SetPATH_ARQUIVO_PROCESSADO(const Value: string);
    procedure SetPATH_ARQUIVO_NOVO(const Value: string);
    procedure SetAMBIENTE(const Value: TAmbiente);
    procedure SetDB_DATABASE(const Value: string);
    procedure SetDB_PASSWORD(const Value: string);
    procedure SetDB_SERVER(const Value: string);
    procedure SetDB_USER(const Value: string);
    //
    procedure SalvarIni;

  public
    constructor Create(pAmbiente:TAmbiente); overload; virtual;

    property PATH_ARQUIVO_PROCESSADO: string read FPATH_ARQUIVO_PROCESSADO write SetPATH_ARQUIVO_PROCESSADO;
    property PATH_ARQUIVO_NOVO: string read FPATH_ARQUIVO_NOVO write SetPATH_ARQUIVO_NOVO;
    property AMBIENTE: TAmbiente read FAMBIENTE write SetAMBIENTE;
    //
    property DB_DATABASE: string read FDB_DATABASE write SetDB_DATABASE;
    property DB_USER: string read FDB_USER write SetDB_USER;
    property DB_PASSWORD: string read FDB_PASSWORD write SetDB_PASSWORD;
    property DB_SERVER: string read FDB_SERVER write SetDB_SERVER;
    //
    procedure SalvarPaths(pPathArquivoNovo, pPathArquivoProcessado: string);
  end;

implementation

{ TConfiguracao }

constructor TConfiguracao.Create(pAmbiente:TAmbiente);
var
  IniFile: TIniFile;
  sIniPath, sAmbiente: string;
begin
  sIniPath := GetCurrentDir +  '.\..\cfg\config.ini';

  IniFile := TIniFile.Create(sIniPath);
  try
    AMBIENTE := pAmbiente;
    //
    case pAmbiente of
      taProducao: sAmbiente := 'PRODUCAO';
      taHomologacao: sAmbiente := 'HOMOLOGACAO';
    end;
    // se nao achar as configurações no arquivo ini, cria com valor vazio
    if not IniFile.ValueExists(sAmbiente, 'path_arquivo_novo') then
      IniFile.WriteString(sAmbiente, 'path_arquivo_novo', '');
    if not IniFile.ValueExists(sAmbiente, 'path_arquivo_processado') then
      IniFile.WriteString(sAmbiente, 'path_arquivo_processado', '');
    if not IniFile.ValueExists(sAmbiente, 'database') then
      IniFile.WriteString(sAmbiente, 'database', '');
    if not IniFile.ValueExists(sAmbiente, 'user') then
      IniFile.WriteString(sAmbiente, 'user', '');
    if not IniFile.ValueExists(sAmbiente, 'password') then
      IniFile.WriteString(sAmbiente, 'password', '');
    if not IniFile.ValueExists(sAmbiente, 'server') then
      IniFile.WriteString(sAmbiente, 'server', '');
    //
    PATH_ARQUIVO_NOVO := IniFile.ReadString(sAmbiente, 'path_arquivo_novo', '');
    PATH_ARQUIVO_PROCESSADO := IniFile.ReadString(sAmbiente, 'path_arquivo_processado', '');
    //
    DB_DATABASE := IniFile.ReadString(sAmbiente, 'database', '');
    DB_USER := IniFile.ReadString(sAmbiente, 'user', '');
    DB_PASSWORD := IniFile.ReadString(sAmbiente, 'password', '');
    DB_SERVER := IniFile.ReadString(sAmbiente, 'server', '');
  finally
    IniFile.Free;
  end;
end;

procedure TConfiguracao.SalvarIni;
var
  IniFile: TIniFile;
  sIniPath, sAmbiente: string;
begin
  sIniPath := GetCurrentDir +  '.\..\cfg\config.ini';

  IniFile := TIniFile.Create(sIniPath);
  try
    case AMBIENTE of
      taProducao: sAmbiente := 'PRODUCAO';
      taHomologacao: sAmbiente := 'HOMOLOGACAO';
    end;
    //
    IniFile.WriteString(sAmbiente, 'path_arquivo_novo', PATH_ARQUIVO_NOVO);
    IniFile.WriteString(sAmbiente, 'path_arquivo_processado', PATH_ARQUIVO_PROCESSADO);
    //
    IniFile.ReadString(sAmbiente, 'database', DB_DATABASE);
    IniFile.ReadString(sAmbiente, 'user', DB_USER);
    IniFile.ReadString(sAmbiente, 'password', DB_PASSWORD);
    IniFile.ReadString(sAmbiente, 'server', DB_SERVER);
  finally
    IniFile.Free;
  end;
end;

procedure TConfiguracao.SalvarPaths(pPathArquivoNovo,
  pPathArquivoProcessado: string);
begin
  PATH_ARQUIVO_NOVO := pPathArquivoNovo;
  PATH_ARQUIVO_PROCESSADO := pPathArquivoProcessado;
  //
  SalvarIni;
end;

procedure TConfiguracao.SetAMBIENTE(const Value: TAmbiente);
begin
  FAMBIENTE := Value;
end;

procedure TConfiguracao.SetDB_DATABASE(const Value: string);
begin
  FDB_DATABASE := Value;
end;

procedure TConfiguracao.SetDB_PASSWORD(const Value: string);
begin
  FDB_PASSWORD := Value;
end;

procedure TConfiguracao.SetDB_SERVER(const Value: string);
begin
  FDB_SERVER := Value;
end;

procedure TConfiguracao.SetDB_USER(const Value: string);
begin
  FDB_USER := Value;
end;

procedure TConfiguracao.SetPATH_ARQUIVO_NOVO(const Value: string);
begin
  FPATH_ARQUIVO_NOVO := Value;
end;

procedure TConfiguracao.SetPATH_ARQUIVO_PROCESSADO(const Value: string);
begin
  FPATH_ARQUIVO_PROCESSADO := Value;
end;

end.
