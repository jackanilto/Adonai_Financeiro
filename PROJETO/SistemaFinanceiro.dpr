program SistemaFinanceiro;

uses
  Vcl.Forms,
  UMovimento in '..\FORMS\UMovimento.pas' {FrmMovimento},
  UDM in '..\FORMS\UDM.pas' {DM: TDataModule},
  UPesquisa in '..\FORMS\UPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMovimento, FrmMovimento);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
