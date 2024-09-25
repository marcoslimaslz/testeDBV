unit ufrmCadastroServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroPadrao, Data.DB,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ToolWin;

type
  TfrmCadastroServico = class(TfrmCadastroPadrao)
    Label3: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    cbxEstado: TComboBox;
    Label1: TLabel;
    edtValor: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
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
  frmCadastroServico: TfrmCadastroServico;

implementation

{$R *.dfm}

uses uServicoController, uServicoModel, udmServico;

{ TfrmCadastroServico }

procedure TfrmCadastroServico.Alterar;
var
  fServico: TServico;
  fServicoController: TServicoController;
  sMsgErro: String;
begin
  fServico := TServico.Create;
  fServicoController := TServicoController.Create;
  try
    fServico.Codigo := StrToInt(edtCodigo.Text);
    fServico.Nome := edtNome.Text;
    fServico.Valor := StrToFloat(edtValor.Text);
    fServico.Estado := cbxEstado.ItemIndex;

    if not fServicoController.Alterar(fServico, sMsgErro) then
    begin
      MessageDlg(sMsgErro, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(fServico);
    FreeAndNil(fServicoController);
  end;
end;

procedure TfrmCadastroServico.btnEditarClick(Sender: TObject);
begin
  Carregar;
  inherited;
end;

procedure TfrmCadastroServico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TfrmCadastroServico.btnNovoClick(Sender: TObject);
begin
  inherited;
  if FEstado = stNovo then
  begin
    cbxEstado.ItemIndex := 1;
  end;
end;

procedure TfrmCadastroServico.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmCadastroServico.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TfrmCadastroServico.Carregar;
var
  fServico: TServico;
  fServicoController: TServicoController;
begin
  fServico := TServico.Create;
  fServicoController := TServicoController.Create;
  try
    fServicoController.Carregar(fServico, ddsCadastro.DataSet.FieldByName('codigo').AsInteger);

    edtCodigo.Text := IntToStr(fServico.Codigo);
    edtNome.Text := fServico.Nome;
    edtValor.Text := FloatToStr(fServico.Valor);
    cbxEstado.ItemIndex := fServico.Estado;
  finally
    FreeAndNil(fServico);
    FreeAndNil(fServicoController);
  end;
end;

procedure TfrmCadastroServico.dbgPesquisaDblClick(Sender: TObject);
begin
  Carregar;
  inherited;
end;

procedure TfrmCadastroServico.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in['0'..'9',',',Chr(8)]) then
  begin
    Key := #0
  end;
end;

procedure TfrmCadastroServico.Excluir;
var
  fServicoController: TServicoController;
  sMsgErro: String;
begin
  fServicoController := TServicoController.Create;
  try
    if (dmServico.cdsPesquisar.Active) and (not dmServico.cdsPesquisar.IsEmpty) then
    begin
      if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
      begin
        if not fServicoController.Excluir(dmServico.cdsPesquisarCODIGO.AsInteger, sMsgErro) then
        begin
          MessageDlg(sMsgErro, mtWarning, [mbOk], 0);
        end
        else
        begin
          fServicoController.Pesquisar(edtProcurar.Text);
        end;
      end;
    end
    else
    begin
      MessageDlg('Não existe registro para exclusão.', mtWarning, [mbOk], 0);
    end;
  finally
    FreeAndNil(fServicoController);
  end;
end;

procedure TfrmCadastroServico.FormCreate(Sender: TObject);
begin
  dmServico := TdmServico.Create(Self);
  ddsCadastro.DataSet := dmServico.cdsPesquisar;
  inherited;
end;

procedure TfrmCadastroServico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmServico);
  inherited;
end;

procedure TfrmCadastroServico.Inserir;
var
  fServico: TServico;
  fServicoController: TServicoController;
  sMsgErro: String;
begin
  fServico := TServico.Create;
  fServicoController := TServicoController.Create;
  try
    fServico.Codigo := -1;
    fServico.Nome := edtNome.Text;
    fServico.Valor := StrToFloat(edtValor.Text);
    fServico.Estado := cbxEstado.ItemIndex;

    if not fServicoController.Inserir(fServico, sMsgErro) then
    begin
      MessageDlg(sMsgErro, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(fServico);
    FreeAndNil(fServicoController);
  end;
end;

procedure TfrmCadastroServico.Pesquisar;
var
  fServicoController: TServicoController;
begin
  fServicoController := TServicoController.Create;
  try
    fServicoController.Pesquisar(edtProcurar.Text);
  finally
    FreeAndNil(fServicoController);
  end;
end;

procedure TfrmCadastroServico.Salvar;
var
  fServicoController: TServicoController;
begin
  fServicoController := TServicoController.Create;
  try
    case FEstado of
      stNovo: Inserir;
      stEditar: Alterar;
    end;
    Cancelar;
    fServicoController.Pesquisar(edtProcurar.Text);
  finally
    FreeAndNil(fServicoController);
  end;
end;

end.
