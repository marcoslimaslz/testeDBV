unit uServicoController;

interface

uses uServicoModel, udmServico, SysUtils,  System.Classes;

type TServicoController = class
     private
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       constructor Create;
       destructor Destroy; override;
       procedure Pesquisar(pNome: String);
       procedure Carregar(pServico: TServico; pCodigo: Integer);
       function Inserir(pServico: TServico; var pMsgErro: String): Boolean;
       function Alterar(pServico: TServico; var pMsgErro: String): Boolean;
       function Excluir(pCodigo: Integer; var pMsgErro: String): Boolean;
     published
       { published declarations }
     end;

implementation

{ TServicoController }

function TServicoController.Alterar(pServico: TServico;
  var pMsgErro: String): Boolean;
begin
  Result := dmServico.Alterar(pServico, pMsgErro);
end;

procedure TServicoController.Carregar(pServico: TServico; pCodigo: Integer);
begin
  dmServico.Carregar(pServico, pCodigo);
end;

constructor TServicoController.Create;
begin

end;

destructor TServicoController.Destroy;
begin

  inherited;
end;

function TServicoController.Excluir(pCodigo: Integer;
  var pMsgErro: String): Boolean;
begin
  Result := dmServico.Excluir(pCodigo, pMsgErro);
end;

function TServicoController.Inserir(pServico: TServico;
  var pMsgErro: String): Boolean;
begin
  Result := dmServico.Inserir(pServico, pMsgErro);
end;

procedure TServicoController.Pesquisar(pNome: String);
begin
  dmServico.Pesquisar(pNome);
end;

end.
