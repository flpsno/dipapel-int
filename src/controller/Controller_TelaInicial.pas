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

    function ConsultarPedidos(pTipoPesquisa: TTipoPesquisa; pCampo1, pCampo2: Variant): TObjectList<TPedido>;



  end;

implementation

{ TController_TelaPrincipal }

function TController_TelaPrincipal.ConsultarPedidos(pTipoPesquisa: TTipoPesquisa; pCampo1, pCampo2: Variant): TObjectList<TPedido>;
begin
  case pTipoPesquisa  of

    tpCodigo: Result := FPedidoDAO.ObterPorCodigo(pCampo1);

    tpDataImportacao: Result := FPedidoDAO.ObterPorDataImportacao(pCampo1, pCampo2);
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

end.
