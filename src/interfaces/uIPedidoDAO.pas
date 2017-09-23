unit uIPedidoDAO;

interface

uses
  Pedido;

type
  IPedidoDAO = interface
  ['{4D591142-2A3D-4C66-A5A5-67D25F53E6F2}']

    function Inserir(pPedido: TPedido): Boolean;
    function Atualizar(pPedido: TPedido): Boolean;

  end;

implementation

end.
