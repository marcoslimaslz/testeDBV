unit ufrmCadastroServicoFarmaceutico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroPadrao, Data.DB,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ToolWin;

type
  TfrmCadastroServicoFarmaceutico = class(TfrmCadastroPadrao)
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
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
  frmCadastroServicoFarmaceutico: TfrmCadastroServicoFarmaceutico;

implementation

{$R *.dfm}

{ TfrmCadastroServicoFarmaceutico }

procedure TfrmCadastroServicoFarmaceutico.Alterar;
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

procedure TfrmCadastroServicoFarmaceutico.btnEditarClick(Sender: TObject);
begin
  Carregar;
  inherited;
end;

procedure TfrmCadastroServicoFarmaceutico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TfrmCadastroServicoFarmaceutico.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TfrmCadastroServicoFarmaceutico.Carregar;
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

procedure TfrmCadastroServicoFarmaceutico.Excluir;
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

procedure TfrmCadastroServicoFarmaceutico.Inserir;
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

procedure TfrmCadastroServicoFarmaceutico.Pesquisar;
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

procedure TfrmCadastroServicoFarmaceutico.Salvar;
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
