unit PedidoDAO;

interface

uses
  uIPedidoDAO, Pedido, System.Generics.Collections, System.SysUtils,
  System.Variants, System.Classes, FireDAC.Comp.Client;

type

  TPedidoDAO = class(TInterfacedObject, IPedidoDAO)

  private
    FConexao: TFDConnection;
    FQueryAux: TFDQuery;

    function _Obter(pWhere: string; pCampos: array of const): TObjectList<TPedido>;

  public
    constructor Create(pConexao: TFDConnection);
    destructor Destroy;

    function Inserir(pPedido: TPedido): Boolean;
    function Atualizar(pPedido: TPedido): Boolean;
    function ObterTodos: TObjectList<TPedido>;
    function ObterPorDataImportacao(pDataDe, pDataAte: TDate): TObjectList<TPedido>;
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
begin
  Result := False;
end;

function TPedidoDAO.ObterPorDataImportacao(pDataDe,
  pDataAte: TDate): TObjectList<TPedido>;
begin
  Result := _Obter('data_importacao between ''%s'' and ''%s''',
    [FormatDateTime('yyyy-mm-dd', pDataDe), FormatDateTime('yyyy-mm-dd', pDataAte)]);
end;

function TPedidoDAO.ObterTodos: TObjectList<TPedido>;
begin
  Result := _Obter('', []);
end;

function TPedidoDAO._Obter(pWhere: string;
  pCampos: array of const): TObjectList<TPedido>;
const
  SQL_SELECT = 'select * from tblpedidos where (0 = 0)';
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
    pedidoAux.PEDIDO_ELO7 := FQueryAux.FieldByName('pedido_elo7').AsString;
    pedidoAux.STATUS_ELO7 := FQueryAux.FieldByName('status_elo7').AsString;
    pedidoAux.DATA_PEDIDO := FQueryAux.FieldByName('data_pedido').AsDateTime;
    pedidoAux.TOTAL_ITENS := FQueryAux.FieldByName('total_itens').AsInteger;
    pedidoAux.VALOR_TOTAL := FQueryAux.FieldByName('valor_total').AsFloat;
    pedidoAux.TIPO_FRETE := FQueryAux.FieldByName('tipo_frete').AsString;
    pedidoAux.VALOR_FRETE := FQueryAux.FieldByName('valor_frete').AsFloat;
    pedidoAux.COMPRADOR := FQueryAux.FieldByName('comprador').AsString;
    pedidoAux.DATA_IMPORTACAO := FQueryAux.FieldByName('data_importacao').AsDateTime;
    Result.Add(pedidoAux);

    FQueryAux.Next;
  end;

  FQueryAux.Close;
end;


end.
