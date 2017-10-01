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

    function _ObterLista(pWhere: string; pCampos: array of const; var retListaPedidos: TObjectList<TPedido>): Boolean;
    function _ObterObjeto(pWhere: string; pCampos: array of const; var retPedido: TPedido): Boolean;

  public
    constructor Create(pConexao: TFDConnection);
    destructor Destroy; override;

    function Inserir(pPedido: TPedido): Boolean;
    function Atualizar(pPedido: TPedido): Boolean;
    function ObterTodos(var retListaPedidos: TObjectList<TPedido>): Boolean;
    function ObterPorDataImportacao(pDataDe, pDataAte: TDate; var retListaPedidos: TObjectList<TPedido>): Boolean;
    function ObterPorCodigo(pCodigo: string; var retPedido: TPedido): Boolean;
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
end;

destructor TPedidoDAO.Destroy;
begin

  inherited;
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

function TPedidoDAO.ObterPorCodigo(pCodigo: string; var retPedido: TPedido): Boolean;
begin
  Result := _ObterObjeto('pedido_elo7 = ''%s''', [pCodigo], retPedido);
end;

function TPedidoDAO.ObterPorDataImportacao(pDataDe,
  pDataAte: TDate; var retListaPedidos: TObjectList<TPedido>): Boolean;
begin
  Result := _ObterLista('data_importacao between ''%s'' and ''%s''',
    [FormatDateTime('yyyy-mm-dd', pDataDe), FormatDateTime('yyyy-mm-dd', pDataAte)], retListaPedidos);
end;

function TPedidoDAO.ObterTodos(var retListaPedidos: TObjectList<TPedido>): Boolean;
begin
  Result := _ObterLista('', [], retListaPedidos);
end;

function TPedidoDAO._ObterObjeto(pWhere: string; pCampos: array of const; var retPedido: TPedido): Boolean;
var
  sSQL: string;
  qryAux: TFDQuery;
begin
  Result := False;

  qryAux := TFDQuery.Create(nil);
  try
    sSQL := SQL_SELECT;

    if (pWhere <> '') then
      sSQL := sSQL + ' and ' + Format(pWhere, pCampos);

    sSQL := sSQL + ' order by data_pedido';

    qryAux.Connection := FConexao;
    qryAux.SQL.Text := sSQL;
    qryAux.Open();

    if qryAux.IsEmpty then
      Exit;

    retPedido.IDPEDIDO := qryAux.FieldByName('idpedido').AsInteger;
    retPedido.Codigo := qryAux.FieldByName('pedido_elo7').AsString;
    retPedido.Status := qryAux.FieldByName('status_elo7').AsString;
    retPedido.DataPedido := qryAux.FieldByName('data_pedido').AsDateTime;
    retPedido.TotalItens := qryAux.FieldByName('total_itens').AsInteger;
    retPedido.ValorTotal := qryAux.FieldByName('valor_total').AsFloat;
    retPedido.TipoFrete := qryAux.FieldByName('tipo_frete').AsString;
    retPedido.ValorFrete := qryAux.FieldByName('valor_frete').AsFloat;
    retPedido.COMPRADOR := qryAux.FieldByName('comprador').AsString;
    retPedido.DataImportacao := qryAux.FieldByName('data_importacao').AsDateTime;

    Result := (qryAux.RecordCount > 0);
  finally
    if qryAux.Active then
      qryAux.Close;

    qryAux.Free;
  end;

end;

function TPedidoDAO._ObterLista(pWhere: string;
  pCampos: array of const; var retListaPedidos: TObjectList<TPedido>): Boolean;
var
  sSQL: string;
  pedidoAux: TPedido;
  qryAux: TFDQuery;
begin
  Result := False;

  qryAux := TFDQuery.Create(nil);
  try
    sSQL := SQL_SELECT;

    if (pWhere <> '') then
      sSQL := sSQL + ' and ' + Format(pWhere, pCampos);

    sSQL := sSQL + ' order by data_pedido';

    qryAux.Connection := FConexao;
    qryAux.SQL.Text := sSQL;
    qryAux.Open();

    if qryAux.IsEmpty then
      Exit;

    qryAux.First;
    while not qryAux.Eof do
    begin
      pedidoAux := TPedido.Create;
      pedidoAux.IDPEDIDO := qryAux.FieldByName('idpedido').AsInteger;
      pedidoAux.Codigo := qryAux.FieldByName('pedido_elo7').AsString;
      pedidoAux.Status := qryAux.FieldByName('status_elo7').AsString;
      pedidoAux.DataPedido := qryAux.FieldByName('data_pedido').AsDateTime;
      pedidoAux.TotalItens := qryAux.FieldByName('total_itens').AsInteger;
      pedidoAux.ValorTotal := qryAux.FieldByName('valor_total').AsFloat;
      pedidoAux.TipoFrete := qryAux.FieldByName('tipo_frete').AsString;
      pedidoAux.ValorFrete := qryAux.FieldByName('valor_frete').AsFloat;
      pedidoAux.COMPRADOR := qryAux.FieldByName('comprador').AsString;
      pedidoAux.DataImportacao := qryAux.FieldByName('data_importacao').AsDateTime;
      retListaPedidos.Add(pedidoAux);

      qryAux.Next;
    end;

    Result := (qryAux.RecordCount > 0);
  finally
    if (qryAux.Active) then
      qryAux.Close;

    qryAux.Free;
  end;
end;


end.
