unit Pedido;

interface

uses System.Variants, System.Classes, FireDAC.Stan.Param;

type
  TPedido = class

  private
    FIDPedido: Integer;
    FCodigo: string;
    FStatus: string;
    FDataPedido: TDate;
    FTotalItens: SmallInt;
    FValorTotal: Double;
    FValorFrete: Double;
    FTipoFrete: string;
    FDataImportacao: TDate;
    FComprador: string;
    procedure SetIDPedido(const Value: Integer);
    procedure SetCodigo(const Value: string);
    procedure SetStatus(const Value: string);
    procedure SetDataPedido(const Value: TDate);
    procedure SetTotalItens(const Value: SmallInt);
    procedure SetValorTotal(const Value: Double);
    procedure SetValorFrete(const Value: Double);
    procedure SetTipoFrete(const Value: string);
    procedure SetDataImportacao(const Value: TDate);
    procedure SetComprador(const Value: string);

  public
    property IDPedido: Integer read FIDPedido write SetIDPedido;
    property Codigo: string read FCodigo write SetCodigo;
    property Status: string read FStatus write SetStatus;
    property DataPedido: TDate read FDataPedido write SetDataPedido;
    property TotalItens: SmallInt read FTotalItens write SetTotalItens;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property TipoFrete: string read FTipoFrete write SetTipoFrete;
    property ValorFrete: Double read FValorFrete write SetValorFrete;
    property Comprador: string read FComprador write SetComprador;
    property DataImportacao: TDate read FDataImportacao write SetDataImportacao;

    function InserePedido: Integer;
  end;

implementation

{ TPedido }

uses uDtmPrincipal;

function TPedido.InserePedido: Integer;
var
  iResultado: Integer;
  sResultado_str: string;
begin
  dtmPrincipal.stpInsereAtualizaPedidos.Prepare;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[0].AsString := FCodigo;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[1].AsString := FStatus;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[2].AsDate := FDataPedido;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[3].AsSmallInt := FTotalItens;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[4].AsFloat := FValorTotal;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[5].AsString := FTipoFrete;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[6].AsFloat := FValorFrete;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[7].AsString := FComprador;
  dtmPrincipal.stpInsereAtualizaPedidos.ExecProc;

  iResultado := dtmPrincipal.stpInsereAtualizaPedidos.Params[8].AsInteger;
  sResultado_str := dtmPrincipal.stpInsereAtualizaPedidos.Params[9].AsString;
  Result := iResultado;
end;

procedure TPedido.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TPedido.SetComprador(const Value: string);
begin
  FComprador := Value;
end;

procedure TPedido.SetDataImportacao(const Value: TDate);
begin
  FDataImportacao := Value;
end;

procedure TPedido.SetDataPedido(const Value: TDate);
begin
  FDataPedido := Value;
end;

procedure TPedido.SetIDPedido(const Value: Integer);
begin
  FIDPedido := Value;
end;

procedure TPedido.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TPedido.SetTipoFrete(const Value: string);
begin
  FTipoFrete := Value;
end;

procedure TPedido.SetTotalItens(const Value: SmallInt);
begin
  FTotalItens := Value;
end;

procedure TPedido.SetValorFrete(const Value: Double);
begin
  FValorFrete := Value;
end;

procedure TPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
