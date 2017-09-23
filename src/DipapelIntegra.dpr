program DipapelIntegra;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDtmPrincipal in 'uDtmPrincipal.pas' {dtmPrincipal: TDataModule},
  uFrmPedidosHistorico in 'uFrmPedidosHistorico.pas' {frmPedidosHistorico},
  Pedido in 'model\Pedido.pas',
  Configuracao in 'Configuracao.pas',
  Constantes in 'Constantes.pas',
  PedidoDAO in 'dao\PedidoDAO.pas',
  uIPedidoDAO in 'interfaces\uIPedidoDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPedidosHistorico, frmPedidosHistorico);
  Application.Run;
end.
