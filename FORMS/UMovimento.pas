unit UMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Mask;

type
  TFrmMovimento = class(TForm)
    PanelTop: TPanel;
    PanelBotm: TPanel;
    BtnNovo: TBitBtn;
    BtnEditar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnAtualizar: TBitBtn;
    BtnPesquisar: TBitBtn;
    BtnSair: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    DBEditIDMovimento: TDBEdit;
    Label2: TLabel;
    DBEditCadastro: TDBEdit;
    Label3: TLabel;
    DBEditUsuario: TDBEdit;
    Label4: TLabel;
    DBEditTipo: TDBEdit;
    Label5: TLabel;
    DBEditValor: TDBEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimento: TFrmMovimento;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmMovimento.BtnNovoClick(Sender: TObject);
   var prox:Integer;
begin
    DM.QueryMovimento.Open;     //Abre
    DM.QueryMovimento.Last;     //Move para o Ultimo
    prox:=DM.QueryMovimentoIDMOVIMENTO.AsInteger + 1;   //  Recebe o ultimo ID e Add +1
    DM.QueryMovimento.Append;
    DM.QueryMovimentoIDMOVIMENTO.AsInteger:=prox;  //Faz o AutoIncremento na tabela
    DBEditUsuario.SetFocus;
end;

procedure TFrmMovimento.BtnSairClick(Sender: TObject);
  begin
    Application.Terminate;
  end;

end.
