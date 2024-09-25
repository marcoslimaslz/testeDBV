unit uServicoFarmaceuticoController;

interface

uses uServicoFarmaceuticoModel, udmServicoFarmaceutico, SysUtils,  System.Classes;

type TServicoController = class
     private
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       procedure Pesquisar(pNome: String);
       procedure Carregar(pServicoFarmaceutico: TServicoFarmaceutico; pCodigo: Integer);
       function Inserir(pServicoFarmaceutico: TServicoFarmaceutico; var pMsgErro: String): Boolean;
       function Alterar(pServicoFarmaceutico: TServicoFarmaceutico; var pMsgErro: String): Boolean;
       function Excluir(pCodigo: Integer; var pMsgErro: String): Boolean;
     published
       { published declarations }
     end;

implementation

{ TServicoController }

function TServicoController.Alterar(pServico: TServico;
  var pMsgErro: String): Boolean;
begin
  Result := dmServicoFarmaceutico.Alterar(pServico, pMsgErro);
end;

procedure TServicoController.Carregar(pServico: TServico; pCodigo: Integer);
begin
  dmServicoFarmaceutico.Carregar(pServico, pCodigo);
end;

function TServicoController.Excluir(pCodigo: Integer;
  var pMsgErro: String): Boolean;
begin
  Result := dmServicoFarmaceutico.Excluir(pCodigo, pMsgErro);
end;

function TServicoController.Inserir(pServico: TServico;
  var pMsgErro: String): Boolean;
begin
  Result := dmServicoFarmaceutico.Inserir(pServico, pMsgErro);
end;

procedure TServicoController.Pesquisar(pNome: String);
begin
  dmServicoFarmaceutico.Pesquisar(pNome);
end;

end.
