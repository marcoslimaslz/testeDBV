unit ufrmCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroPadrao, Data.DB,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ToolWin;

type
  TfrmCadastroVenda = class(TfrmCadastroPadrao)
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    edtFarmaceuticoCodigo: TEdit;
    lblFarmaceutico: TLabel;
    edtFarmaceuticoDesc: TEdit;
    lblPaciente: TLabel;
    edtPacienteCodigo: TEdit;
    edtPacienteDesc: TEdit;
    ddsVendaItem: TDataSource;
    lblValor: TLabel;
    edtValorTotal: TEdit;
    edtObservacao: TEdit;
    Label1: TLabel;
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtFarmaceuticoCodigoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPacienteCodigoExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtProcurarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Salvar;
    procedure Pesquisar;
    procedure Carregar;
    procedure PesquisarFarmaceutico;
    procedure PesquisarPaciente;
  public
    { Public declarations }
  end;

var
  frmCadastroVenda: TfrmCadastroVenda;

implementation

{$R *.dfm}

uses uVendaController, uVendaModel, udmVenda, uPessoaController, udmPessoa,
  udmVendaItem;

{ TfrmCadastroVenda }

procedure TfrmCadastroVenda.Alterar;
var
  fVenda: TVenda;
  fVendaController: TVendaController;
  sMsgErro: String;
begin
  fVenda := TVenda.Create;
  fVendaController := TVendaController.Create;
  try
    fVenda.Codigo := StrToInt(edtCodigo.Text);

    if not fVendaController.Alterar(fVenda, sMsgErro) then
    begin
      MessageDlg(sMsgErro, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(fVenda);
    FreeAndNil(fVendaController);
  end;
end;

procedure TfrmCadastroVenda.btnEditarClick(Sender: TObject);
begin
  Carregar;
  inherited;
end;

procedure TfrmCadastroVenda.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TfrmCadastroVenda.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmCadastroVenda.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TfrmCadastroVenda.Carregar;
var
  fVenda: TVenda;
  fVendaController: TVendaController;
begin
  fVenda := TVenda.Create;
  fVendaController := TVendaController.Create;
  try
    fVendaController.Carregar(fVenda, ddsCadastro.DataSet.FieldByName('codigo').AsInteger);

    edtCodigo.Text := IntToStr(fVenda.Codigo);
  
  finally
    FreeAndNil(fVenda);
    FreeAndNil(fVendaController);
  end;
end;

procedure TfrmCadastroVenda.edtFarmaceuticoCodigoExit(Sender: TObject);
begin
  inherited;
  PesquisarFarmaceutico;
end;

procedure TfrmCadastroVenda.edtPacienteCodigoExit(Sender: TObject);
begin
  inherited;
  PesquisarPaciente;
end;

procedure TfrmCadastroVenda.edtProcurarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TfrmCadastroVenda.Excluir;
var
  fVendaController: TVendaController;
  sMsgErro: String;
begin
  fVendaController := TVendaController.Create;
  try
    if (dmVenda.cdsPesquisar.Active) and (not dmVenda.cdsPesquisar.IsEmpty) then
    begin
      if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
      begin
        if not fVendaController.Excluir(dmVenda.cdsPesquisarCODIGO.AsInteger, sMsgErro) then
        begin
          MessageDlg(sMsgErro, mtWarning, [mbOk], 0);
        end
        else
        begin
          fVendaController.Pesquisar(StrToInt(edtProcurar.Text));
        end;
      end;
    end
    else
    begin
      MessageDlg('Não existe registro para exclusão.', mtWarning, [mbOk], 0);
    end;
  finally
    FreeAndNil(fVendaController);
  end;
end;

procedure TfrmCadastroVenda.FormCreate(Sender: TObject);
begin
  dmVenda := TdmVenda.Create(Self);
  dmVendaItem := TdmVendaItem.Create(Self);
  dmPessoa := TdmPessoa.Create(Self);
  ddsCadastro.DataSet := dmVenda.cdsPesquisar;
  //ddsVendaItem.DataSet := dmVenda.cdsPesquisar;
  inherited;
end;

procedure TfrmCadastroVenda.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmVenda);
  FreeAndNil(dmVendaItem);
  FreeAndNil(dmPessoa);
  inherited;
end;

procedure TfrmCadastroVenda.Inserir;
var
  fVenda: TVenda;
  fVendaController: TVendaController;
  sMsgErro: String;
begin
  fVenda := TVenda.Create;
  fVendaController := TVendaController.Create;
  try
    fVenda.Codigo := -1;

    if not fVendaController.Inserir(fVenda, sMsgErro) then
    begin
      MessageDlg(sMsgErro, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(fVenda);
    FreeAndNil(fVendaController);
  end;
end;

procedure TfrmCadastroVenda.Pesquisar;
var
  fVendaController: TVendaController;
begin
  fVendaController := TVendaController.Create;
  try
    if edtProcurar.Text = EmptyStr then
    begin
      fVendaController.Pesquisar(0);
    end
    else
    begin
      fVendaController.Pesquisar(StrToInt(edtProcurar.Text));
    end;
  finally
    FreeAndNil(fVendaController);
  end;
end;

procedure TfrmCadastroVenda.PesquisarFarmaceutico;
var
  fPessoaController: TPessoaController;
begin
  fPessoaController := TPessoaController.Create;
  try
    edtFarmaceuticoDesc.Text := fPessoaController.PesquisarFarmaceutico(StrToInt(edtFarmaceuticoCodigo.Text));
    if Trim(edtFarmaceuticoDesc.Text) = EmptyStr then
    begin
      edtFarmaceuticoCodigo.Clear;
      edtFarmaceuticoDesc.Clear;
      edtFarmaceuticoCodigo.SetFocus;
    end;
  finally
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroVenda.PesquisarPaciente;
var
  fPessoaController: TPessoaController;
begin
  fPessoaController := TPessoaController.Create;
  try
    edtPacienteDesc.Text := fPessoaController.PesquisarPaciente(StrToInt(edtPacienteCodigo.Text));
    if Trim(edtPacienteDesc.Text) = EmptyStr then
    begin
      edtPacienteCodigo.Clear;
      edtPacienteDesc.Clear;
      edtPacienteCodigo.SetFocus;
    end;
  finally
    FreeAndNil(fPessoaController);
  end;
end;

procedure TfrmCadastroVenda.Salvar;
var
  fVendaController: TVendaController;
begin
  fVendaController := TVendaController.Create;
  try
    case FEstado of
      stNovo: Inserir;
      stEditar: Alterar;
    end;
    Cancelar;
    fVendaController.Pesquisar(StrToInt(edtProcurar.Text));
  finally
    FreeAndNil(fVendaController);
  end;
end;

end.
