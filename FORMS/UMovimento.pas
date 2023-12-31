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
    Label5: TLabel;
    DBEditValor: TDBEdit;
    CBTipo: TDBComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure TRATABOTAO;
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampos;
  end;

var
  FrmMovimento: TFrmMovimento;

implementation

{$R *.dfm}

uses UDM, UPesquisa;

procedure TFrmMovimento.BtnAtualizarClick(Sender: TObject);
begin
    TRATABOTAO;
    DM.QueryMovimento.Refresh;  // colca a QUERY em modo Post
    Messagedlg('Registro atualizado com sucesso!',
    mtInformation, [mbOK],0);

    LimparCampos;

end;

procedure TFrmMovimento.BtnCancelarClick(Sender: TObject);
begin
   TRATABOTAO;
   DM.QueryMovimento.Cancel;
   Messagedlg('A��o cancelada',
   mtInformation, [mbOK],0);

   LimparCampos;
end;

procedure TFrmMovimento.BtnDeletarClick(Sender: TObject);
begin
  TRATABOTAO;
  if MessageDlg('Deseja deletar este registro?', MtConfirmation, [mbOK, MbNo],0)=mrOk then
  begin
    DM.QueryMovimento.Delete;  // colca a QUERY em modo edit
    TRATABOTAO;
  end
  else
  TRATABOTAO;
    // caso o usuario clicar em N�O
  abort;

    LimparCampos;

end;

procedure TFrmMovimento.BtnEditarClick(Sender: TObject);
begin
  TRATABOTAO;
if MessageDlg('Deseja alterar este registro?', MtConfirmation, [mbOK, MbNo],0)=mrOk then
  begin
    DM.QueryMovimento.Edit;  // colca a QUERY em modo edit
  end
  else
  TRATABOTAO;
    // caso o usuario clicar em N�O
  abort;

    TRATABOTAO;

end;

procedure TFrmMovimento.BtnGravarClick(Sender: TObject);
begin
    TRATABOTAO;
    DM.QueryMovimento.Post;  // colca a QUERY em modo Post
    Messagedlg('Registro salvo com sucesso!',
    mtInformation, [mbOK],0);
    LimparCampos;

end;

procedure TFrmMovimento.BtnNovoClick(Sender: TObject);
   var prox:Integer;
begin
    TRATABOTAO;
    DM.QueryMovimento.Open;     //Abre
    DM.QueryMovimento.Last;     //Move para o Ultimo
    prox:=DM.QueryMovimentoIDMOVIMENTO.AsInteger + 1;   //  Recebe o ultimo ID e Add +1
    DM.QueryMovimento.Append; //  Insere uma linha nova no final da tabela.
    DM.QueryMovimentoIDMOVIMENTO.AsInteger:=prox;  //Faz o AutoIncremento na tabela
    DBEditUsuario.SetFocus;   // Coloca o Foco ( Cursor ) no Edit Usuario
    DM.QueryMovimentoCADASTRO.AsDateTime := DATE;  // insere a data no campo edit data cadastro
end;

procedure TFrmMovimento.BtnPesquisarClick(Sender: TObject);
begin
  FrmPesquisa := TFrmPesquisa.Create(self);
  FrmPesquisa.ShowModal;
  try

  finally
   FrmPesquisa := nil;
   FrmPesquisa.free;
  end;
end;

procedure TFrmMovimento.BtnSairClick(Sender: TObject);
  begin
    if Application.MessageBox('Deseja sair do sistema?','Confirma��o',
    mb_YesNo + MB_ICONQUESTION)=Id_Yes then
    begin
      Application.Terminate;
    end
  else
  Abort;
  end;

procedure TFrmMovimento.LimparCampos;
  begin
    DBEditIDMovimento.Text := '';
    DBEditUsuario.Text := '';
    DBEditCadastro.Text := '';
    CBTipo.Text := '';
    DBEditValor.Text := '';
  end;

procedure TFrmMovimento.TRATABOTAO;
  begin
   //Ativa e desativa botoes
   BtnNovo.Enabled := Not BtnNovo.Enabled;
   BtnEditar.Enabled := not BtnEditar.Enabled;
   BtnDeletar.Enabled := not BtnDeletar.Enabled;
   BtnGravar.Enabled := Not  BtnGravar.Enabled;
   BtnAtualizar.Enabled := Not BtnAtualizar.Enabled;
  end;

end.
