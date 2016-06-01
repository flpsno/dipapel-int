unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TfrmPedidosHistorico = class(TForm)
    pnl1: TPanel;
    dbg1: TDBGrid;
    btnOk: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosHistorico: TfrmPedidosHistorico;

implementation

{$R *.dfm}

uses Unit1;

end.
