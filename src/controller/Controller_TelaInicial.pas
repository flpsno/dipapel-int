unit Controller_TelaInicial;

interface

uses
  FireDAC.Comp.Client, System.Generics.Collections, Pedido, PedidoDAO;

type
  TController_TelaPrincipal = class

  private
    FConexao: TFDConnection;
    FPedidoDAO: TPedidoDAO;

  public
    constructor Create(pConexao: TFDConnection);
    destructor Destroy; override;

    function ConsultarPedidos(pDateImpDe, pDateImpAte: TDate; pCodigoPedido: string): TObjectList<TPedido>;


  end;

implementation

{ TController_TelaPrincipal }

function TController_TelaPrincipal.ConsultarPedidos(pDateImpDe,
  pDateImpAte: TDate; pCodigoPedido: string): TObjectList<TPedido>;
begin
  if (pCodigoPedido <> '') then
    Result := FPedidoDAO.ObterPorCodigo(pCodigoPedido)
  else
    Result := FPedidoDAO.ObterPorDataImportacao(pDateImpDe, pDateImpAte);
end;

constructor TController_TelaPrincipal.Create(pConexao: TFDConnection);
begin
  FConexao := pConexao;

  FPedidoDAO := TPedidoDAO.Create(FConexao);
end;

destructor TController_TelaPrincipal.Destroy;
begin
  if (FPedidoDAO <> nil) then
    FPedidoDAO.Free;

  inherited;
end;

end.
