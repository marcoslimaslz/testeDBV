unit uPessoaController;

interface

uses uPessoaModel, udmPessoa, SysUtils,  System.Classes;

type TPessoaController = class
     private
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       procedure Pesquisar(pNome: String);
       function PesquisarFarmaceutico(pCodigo: Integer): String;
       function PesquisarPaciente(pCodigo: Integer): String;
       procedure Carregar(pPessoa: TPessoa; pCodigo: Integer);
       function Inserir(pPessoa: TPessoa; var pMsgErro: String): Boolean;
       function Alterar(pPessoa: TPessoa; var pMsgErro: String): Boolean;
       function Excluir(pCodigo: Integer; var pMsgErro: String): Boolean;
     published
       { published declarations }
     end;

implementation

{ TPessoaController }

function TPessoaController.Alterar(pPessoa: TPessoa;
  var pMsgErro: String): Boolean;
begin
  Result := dmPessoa.Alterar(pPessoa, pMsgErro);
end;

procedure TPessoaController.Carregar(pPessoa: TPessoa; pCodigo: Integer);
begin
  dmPessoa.Carregar(pPessoa, pCodigo);
end;

function TPessoaController.Excluir(pCodigo: Integer;
  var pMsgErro: String): Boolean;
begin
  Result := dmPessoa.Excluir(pCodigo, pMsgErro);
end;

function TPessoaController.Inserir(pPessoa: TPessoa;
  var pMsgErro: String): Boolean;
begin
  Result := dmPessoa.Inserir(pPessoa, pMsgErro);
end;

procedure TPessoaController.Pesquisar(pNome: String);
begin
  dmPessoa.Pesquisar(pNome);
end;

function TPessoaController.PesquisarFarmaceutico(pCodigo: Integer): String;
begin
  Result := dmPessoa.PesquisarFarmaceutico(pCodigo);
end;

function TPessoaController.PesquisarPaciente(pCodigo: Integer): String;
begin
  Result := dmPessoa.PesquisarPaciente(pCodigo);
end;

end.
