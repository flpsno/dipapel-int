unit PedidoDAO;

interface

uses
  uIPedidoDAO, Pedido, System.Generics.Collections, System.SysUtils,
  System.Variants, System.Classes, FireDAC.Comp.Client;


const
  SQL_SELECT = 'select * from tblpedidos where (0 = 0)';

type
  TPedidoDAO = class(TInterfacedObject, IPedidoDAO)

  private
    FConexao: TFDConnection;
    FQueryAux: TFDQuery;

    function _ObterLista(pWhere: string; pCampos: array of const): TObjectList<TPedido>; overload;
    function _ObterObjeto(pWhere: string; pCampos: array of const): TPedido; overload;

  public
    constructor Create(pConexao: TFDConnection);
    destructor Destroy;

    function Inserir(pPedido: TPedido): Boolean;
    function Atualizar(pPedido: TPedido): Boolean;
    function ObterTodos: TObjectList<TPedido>;
    function ObterPorDataImportacao(pDataDe, pDataAte: TDate): TObjectList<TPedido>;
    function ObterPorCodigo(pCodigo: string): TObjectList<TPedido>;
  end;

implementation

{ TPedidoDAO }

function TPedidoDAO.Atualizar(pPedido: TPedido): Boolean;
begin
  Result := False;
end;

constructor TPedidoDAO.Create(pConexao: TFDConnection);
begin
  FConexao := pConexao;

  FQueryAux := TFDQuery.Create(nil);
  FQueryAux.Connection := FConexao;
end;

destructor TPedidoDAO.Destroy;
begin
  if (FQueryAux <> nil) then
    FreeAndNil(FQueryAux);
end;

function TPedidoDAO.Inserir(pPedido: TPedido): Boolean;
const
  INSERT_PEDIDO = '';
var
  qryAux: TFDQuery;
begin
  Result := False;

  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := FConexao;

    Result := True;
  finally
    if qryAux.Active then
      qryAux.Close;

    qryAux.Free;
  end;
end;

function TPedidoDAO.ObterPorCodigo(pCodigo: string): TObjectList<TPedido>;
begin
  Result := _ObterLista('pedido_elo7 = ''%s''', [pCodigo]);
end;

function TPedidoDAO.ObterPorDataImportacao(pDataDe,
  pDataAte: TDate): TObjectList<TPedido>;
begin
  Result := _ObterLista('data_importacao between ''%s'' and ''%s''',
    [FormatDateTime('yyyy-mm-dd', pDataDe), FormatDateTime('yyyy-mm-dd', pDataAte)]);
end;

function TPedidoDAO.ObterTodos: TObjectList<TPedido>;
begin
  Result := _ObterLista('', []);
end;

function TPedidoDAO._ObterObjeto(pWhere: string; pCampos: array of const): TPedido;
var
  sSQL: string;
  pedidoAux: TPedido;
begin
  Result := TPedido.Create;

  sSQL := SQL_SELECT;

  if (pWhere <> '') then
    sSQL := sSQL + ' and ' + Format(pWhere, pCampos);

  sSQL := sSQL + ' order by data_pedido';

  FQueryAux.Close;
  FQueryAux.SQL.Clear;
  FQueryAux.SQL.Text := sSQL;
  FQueryAux.Open();

  if FQueryAux.IsEmpty then
    Exit;

  FQueryAux.First;
  pedidoAux := TPedido.Create;
  pedidoAux.IDPEDIDO := FQueryAux.FieldByName('idpedido').AsInteger;
  pedidoAux.Codigo := FQueryAux.FieldByName('pedido_elo7').AsString;
  pedidoAux.Status := FQueryAux.FieldByName('status_elo7').AsString;
  pedidoAux.DataPedido := FQueryAux.FieldByName('data_pedido').AsDateTime;
  pedidoAux.TotalItens := FQueryAux.FieldByName('total_itens').AsInteger;
  pedidoAux.ValorTotal := FQueryAux.FieldByName('valor_total').AsFloat;
  pedidoAux.TipoFrete := FQueryAux.FieldByName('tipo_frete').AsString;
  pedidoAux.ValorFrete := FQueryAux.FieldByName('valor_frete').AsFloat;
  pedidoAux.COMPRADOR := FQueryAux.FieldByName('comprador').AsString;
  pedidoAux.DataImportacao := FQueryAux.FieldByName('data_importacao').AsDateTime;


  FQueryAux.Close;

end;

function TPedidoDAO._ObterLista(pWhere: string;
  pCampos: array of const): TObjectList<TPedido>;
var
  sSQL: string;
  pedidoAux: TPedido;
begin
  Result := TObjectList<TPedidO>.Create;

  sSQL := SQL_SELECT;

  if (pWhere <> '') then
    sSQL := sSQL + ' and ' + Format(pWhere, pCampos);

  sSQL := sSQL + ' order by data_pedido';

  FQueryAux.Close;
  FQueryAux.SQL.Clear;
  FQueryAux.SQL.Text := sSQL;
  FQueryAux.Open();

  FQueryAux.First;
  while not FQueryAux.Eof do
  begin
    pedidoAux := TPedido.Create;
    pedidoAux.IDPEDIDO := FQueryAux.FieldByName('idpedido').AsInteger;
    pedidoAux.Codigo := FQueryAux.FieldByName('pedido_elo7').AsString;
    pedidoAux.Status := FQueryAux.FieldByName('status_elo7').AsString;
    pedidoAux.DataPedido := FQueryAux.FieldByName('data_pedido').AsDateTime;
    pedidoAux.TotalItens := FQueryAux.FieldByName('total_itens').AsInteger;
    pedidoAux.ValorTotal := FQueryAux.FieldByName('valor_total').AsFloat;
    pedidoAux.TipoFrete := FQueryAux.FieldByName('tipo_frete').AsString;
    pedidoAux.ValorFrete := FQueryAux.FieldByName('valor_frete').AsFloat;
    pedidoAux.COMPRADOR := FQueryAux.FieldByName('comprador').AsString;
    pedidoAux.DataImportacao := FQueryAux.FieldByName('data_importacao').AsDateTime;
    Result.Add(pedidoAux);

    FQueryAux.Next;
  end;

  FQueryAux.Close;
end;


end.
