unit uVendaController;

interface

uses uVendaModel, udmVenda, SysUtils,  System.Classes;

type TVendaController = class
     private
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       procedure Pesquisar(pCodigo: Integer);
       procedure Carregar(pVenda: TVenda; pCodigo: Integer);
       function Inserir(pVenda: TVenda; var pMsgErro: String): Boolean;
       function Alterar(pVenda: TVenda; var pMsgErro: String): Boolean;
       function Excluir(pCodigo: Integer; var pMsgErro: String): Boolean;
     published
       { published declarations }
     end;

implementation

{ TVendaController }

function TVendaController.Alterar(pVenda: TVenda;
  var pMsgErro: String): Boolean;
begin
  Result := dmVenda.Alterar(pVenda, pMsgErro);
end;

procedure TVendaController.Carregar(pVenda: TVenda; pCodigo: Integer);
begin
  dmVenda.Carregar(pVenda, pCodigo);
end;

function TVendaController.Excluir(pCodigo: Integer;
  var pMsgErro: String): Boolean;
begin
  Result := dmVenda.Excluir(pCodigo, pMsgErro);
end;

function TVendaController.Inserir(pVenda: TVenda;
  var pMsgErro: String): Boolean;
begin
  Result := dmVenda.Inserir(pVenda, pMsgErro);
end;

procedure TVendaController.Pesquisar(pCodigo: Integer);
begin
  dmVenda.Pesquisar(pCodigo);
end;

end.
