program DipapelIntegra;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDtmPrincipal in 'uDtmPrincipal.pas' {dtmPrincipal: TDataModule},
  uFrmPedidosHistorico in 'uFrmPedidosHistorico.pas' {frmPedidosHistorico},
  Pedido in 'Pedido.pas',
  Configuracao in 'Configuracao.pas',
  Constantes in 'Constantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmPedidosHistorico, frmPedidosHistorico);
  Application.Run;
end.
