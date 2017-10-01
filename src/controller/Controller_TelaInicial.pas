unit Controller_TelaInicial;

interface

uses
  FireDAC.Comp.Client, System.Generics.Collections, Pedido, PedidoDAO;

type
  TTipoPesquisa = (tpCodigo, tpDataImportacao);

  TController_TelaPrincipal = class

  private
    FConexao: TFDConnection;
    FPedidoDAO: TPedidoDAO;

  public
    constructor Create(pConexao: TFDConnection);
    destructor Destroy; override;

    function ConsultarPedidos(pTipoPesquisa: TTipoPesquisa; pCampo1, pCampo2: Variant; var retListaPedidos: TObjectList<TPedido>): Boolean;
    function InserirOuAtualiarPedido(pPedido: TPedido): Boolean;
  end;

implementation

{ TController_TelaPrincipal }

function TController_TelaPrincipal.ConsultarPedidos(pTipoPesquisa: TTipoPesquisa; pCampo1, pCampo2: Variant; var retListaPedidos: TObjectList<TPedido>): Boolean;
var
  pedidoAux: TPedido;
begin
  case pTipoPesquisa  of

    tpCodigo:
    begin
      pedidoAux := TPedido.Create;
      if not FPedidoDAO.ObterPorCodigo(pCampo1, pedidoAux) then
      begin
        pedidoAux.Free;
        Exit;
      end;

      retListaPedidos.Add(pedidoAux);
    end;

    tpDataImportacao:
    begin
      Result := FPedidoDAO.ObterPorDataImportacao(pCampo1, pCampo2, retListaPedidos);
    end;
  end;
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

function TController_TelaPrincipal.InserirOuAtualiarPedido(pPedido: TPedido): Boolean;
begin


 //
end;

end.
