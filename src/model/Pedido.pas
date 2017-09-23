unit Pedido;

interface

uses System.Variants, System.Classes, FireDAC.Stan.Param;

type
  TPedido = class

  private
    FPEDIDO_ELO7: string;
    FSTATUS_ELO7: string;
    FDATA_PEDIDO: TDate;
    FTOTAL_ITENS: SmallInt;
    FVALOR_TOTAL: Double;
    FTIPO_FRETE: string;
    FVALOR_FRETE: Double;
    FCOMPRADOR: string;
    FDATA_IMPORTACAO: TDate;
    procedure SetPEDIDO_ELO7(const Value: string);
    procedure SetSTATUS_ELO7(const Value: string);
    procedure SetDATA_PEDIDO(const Value: TDate);
    procedure SetTOTAL_ITENS(const Value: SmallInt);
    procedure SetVALOR_TOTAL(const Value: Double);
    procedure SetTIPO_FRETE(const Value: string);
    procedure SetVALOR_FRETE(const Value: Double);
    procedure SetCOMPRADOR(const Value: string);
    procedure SetDATA_IMPORTACAO(const Value: TDate);

  public
    property PEDIDO_ELO7: string read FPEDIDO_ELO7 write SetPEDIDO_ELO7;
    property STATUS_ELO7: string read FSTATUS_ELO7 write SetSTATUS_ELO7;
    property DATA_PEDIDO: TDate read FDATA_PEDIDO write SetDATA_PEDIDO;
    property TOTAL_ITENS: SmallInt read FTOTAL_ITENS write SetTOTAL_ITENS;
    property VALOR_TOTAL: Double read FVALOR_TOTAL write SetVALOR_TOTAL;
    property TIPO_FRETE: string read FTIPO_FRETE write SetTIPO_FRETE;
    property VALOR_FRETE: Double read FVALOR_FRETE write SetVALOR_FRETE;
    property COMPRADOR: string read FCOMPRADOR write SetCOMPRADOR;
    property DATA_IMPORTACAO: TDate read FDATA_IMPORTACAO write SetDATA_IMPORTACAO;

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
  dtmPrincipal.stpInsereAtualizaPedidos.Params[0].AsString := PEDIDO_ELO7;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[1].AsString := STATUS_ELO7;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[2].AsDate := DATA_PEDIDO;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[3].AsSmallInt := TOTAL_ITENS;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[4].AsFloat := VALOR_TOTAL;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[5].AsString := TIPO_FRETE;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[6].AsFloat := VALOR_FRETE;
  dtmPrincipal.stpInsereAtualizaPedidos.Params[7].AsString := COMPRADOR;
  dtmPrincipal.stpInsereAtualizaPedidos.ExecProc;

  iResultado := dtmPrincipal.stpInsereAtualizaPedidos.Params[8].AsInteger;
  sResultado_str := dtmPrincipal.stpInsereAtualizaPedidos.Params[9].AsString;
  Result := iResultado;
end;

procedure TPedido.SetCOMPRADOR(const Value: string);
begin
  FCOMPRADOR := Value;
end;

procedure TPedido.SetDATA_IMPORTACAO(const Value: TDate);
begin
  FDATA_IMPORTACAO := Value;
end;

procedure TPedido.SetDATA_PEDIDO(const Value: TDate);
begin
  FDATA_PEDIDO := Value;
end;

procedure TPedido.SetPEDIDO_ELO7(const Value: string);
begin
  FPEDIDO_ELO7 := Value;
end;

procedure TPedido.SetSTATUS_ELO7(const Value: string);
begin
  FSTATUS_ELO7 := Value;
end;

procedure TPedido.SetTIPO_FRETE(const Value: string);
begin
  FTIPO_FRETE := Value;
end;

procedure TPedido.SetTOTAL_ITENS(const Value: SmallInt);
begin
  FTOTAL_ITENS := Value;
end;

procedure TPedido.SetVALOR_FRETE(const Value: Double);
begin
  FVALOR_FRETE := Value;
end;

procedure TPedido.SetVALOR_TOTAL(const Value: Double);
begin
  FVALOR_TOTAL := Value;
end;

end.
