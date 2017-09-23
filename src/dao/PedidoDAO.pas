unit PedidoDAO;

interface

uses
  uIPedidoDAO, Pedido;

type

  TPedidoDAO = class(TInterfacedObject, IPedidoDAO)

  private

  public
    function Inserir(pPedido: TPedido): Boolean;
    function Atualizar(pPedido: TPedido): Boolean;
  end;

implementation

{ TPedidoDAO }

function TPedidoDAO.Atualizar(pPedido: TPedido): Boolean;
begin
  Result := False;
end;

function TPedidoDAO.Inserir(pPedido: TPedido): Boolean;
begin
  Result := False;
end;

end.
