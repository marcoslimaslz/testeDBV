program testeMVC;

uses
  Vcl.Forms,
  ufrmPrincipal in 'view\ufrmPrincipal.pas' {frmPrincipal},
  ufrmCadastroPadrao in 'view\ufrmCadastroPadrao.pas' {frmCadastroPadrao},
  uPessoaModel in 'model\uPessoaModel.pas',
  uPessoaController in 'controller\uPessoaController.pas',
  udmConexao in 'dao\udmConexao.pas' {dmConexao: TDataModule},
  udmPessoa in 'dao\udmPessoa.pas' {dmPessoa: TDataModule},
  ufrmCadastroPessoa in 'view\ufrmCadastroPessoa.pas' {frmCadastroPessoa},
  ufrmCadastroServico in 'view\ufrmCadastroServico.pas' {frmCadastroServico},
  uServicoModel in 'model\uServicoModel.pas',
  uServicoController in 'controller\uServicoController.pas',
  udmServico in 'dao\udmServico.pas' {dmServico: TDataModule},
  udmVenda in 'dao\udmVenda.pas' {dmVenda: TDataModule},
  ufrmCadastroVenda in 'view\ufrmCadastroVenda.pas' {frmCadastroVenda},
  uVendaItemModel in 'model\uVendaItemModel.pas',
  uVendaItemController in 'controller\uVendaItemController.pas',
  uVendaModel in 'model\uVendaModel.pas',
  uVendaController in 'controller\uVendaController.pas',
  udmVendaItem in 'dao\udmVendaItem.pas' {dmVendaItem: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
