unit ufrmCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroPadrao, Data.DB,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ToolWin;

type
  TfrmCadastroPessoa = class(TfrmCadastroPadrao)
    Label1: TLabel;
    cbxTipo: TComboBox;
    Label3: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    cbxEstado: TComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Salvar;
    procedure Pesquisar;
    procedure Carregar;
  public
    { Public declarations }
  end;

var
  frmCadastroPessoa: TfrmCadastroPessoa;

implementation

{$R *.dfm}

uses uPessoaController, uPessoaModel, udmPessoa;

procedure TfrmCadastroPessoa.btnEditarClick(Sender: TObject);
begin
  Carregar;
  inherited;
end;

procedure TfrmCadastroPessoa.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TfrmCadastroPessoa.btnNovoClick(Sender: TObject);
begin
  inherited;
  if FEstado = stNovo then
  begin
    cbxEstado.ItemIndex := 1;
  end;
end;

procedure TfrmCadastroPessoa.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmCadastroPessoa.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TfrmCadastroPessoa.Alterar;
var
  fPessoa: TPessoa;
  fPessoaController: TPessoaController;
  sMsgErro: String;
begin
  fPessoa := TPessoa.Create;
  fPessoaController := TPessoaController.Create;
  try
    fPessoa.Codigo := StrToInt(edtCodigo.Text);
    fPessoa.Tipo := cbxTipo.ItemIndex;
    fPessoa.Nome := edtNome.Text;
    fPessoa.Estado := cbxEstado.ItemIndex;

    if not fPessoaController.Alterar(fPessoa, sMsgErro) then
    begin
      MessageDlg(sMsgErro, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(fPessoa);
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroPessoa.Carregar;
var
  fPessoa: TPessoa;
  fPessoaController: TPessoaController;
begin
  fPessoa := TPessoa.Create;
  fPessoaController := TPessoaController.Create;
  try
    fPessoaController.Carregar(fPessoa, ddsCadastro.DataSet.FieldByName('codigo').AsInteger);

    edtCodigo.Text := IntToStr(fPessoa.Codigo);
    cbxTipo.ItemIndex := fPessoa.Tipo;
    edtNome.Text := fPessoa.Nome;
    cbxEstado.ItemIndex := fPessoa.Estado;
  finally
    FreeAndNil(fPessoa);
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroPessoa.dbgPesquisaDblClick(Sender: TObject);
begin
  Carregar;
  inherited;
end;

procedure TfrmCadastroPessoa.FormCreate(Sender: TObject);
begin
  dmPessoa := TdmPessoa.Create(Self);
  ddsCadastro.DataSet := dmPessoa.cdsPesquisar;
  inherited;
end;

procedure TfrmCadastroPessoa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmPessoa);
  inherited;
end;

procedure TfrmCadastroPessoa.Excluir;
var
  fPessoaController: TPessoaController;
  sMsgErro: String;
begin
  fPessoaController := TPessoaController.Create;
  try
    if (dmPessoa.cdsPesquisar.Active) and (not dmPessoa.cdsPesquisar.IsEmpty) then
    begin
      if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
      begin
        if not fPessoaController.Excluir(dmPessoa.cdsPesquisarCODIGO.AsInteger, sMsgErro) then
        begin
          MessageDlg(sMsgErro, mtWarning, [mbOk], 0);
        end
        else
        begin
          fPessoaController.Pesquisar(edtProcurar.Text);
        end;
      end;
    end
    else
    begin
      MessageDlg('Não existe registro para exclusão.', mtWarning, [mbOk], 0);
    end;
  finally
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroPessoa.Salvar;
var
  fPessoaController: TPessoaController;
begin
  fPessoaController := TPessoaController.Create;
  try
    case FEstado of
      stNovo: Inserir;
      stEditar: Alterar;
    end;
    Cancelar;
    fPessoaController.Pesquisar(edtProcurar.Text);
  finally
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroPessoa.Pesquisar;
var
  fPessoaController: TPessoaController;
begin
  fPessoaController := TPessoaController.Create;
  try
    fPessoaController.Pesquisar(edtProcurar.Text);
  finally
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroPessoa.Inserir;
var
  fPessoa: TPessoa;
  fPessoaController: TPessoaController;
  sMsgErro: String;
begin
  fPessoa := TPessoa.Create;
  fPessoaController := TPessoaController.Create;
  try
    fPessoa.Codigo := -1;
    fPessoa.Tipo := cbxTipo.ItemIndex;
    fPessoa.Nome := edtNome.Text;
    fPessoa.Estado := cbxEstado.ItemIndex;

    if not fPessoaController.Inserir(fPessoa, sMsgErro) then
    begin
      MessageDlg(sMsgErro, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(fPessoa);
    FreeAndNil(fPessoaController);
  end;
end;

end.
