unit uVendaItemController;

interface

uses uVendaItemModel, udmVenda, SysUtils,  System.Classes;

type TVendaController = class
     private
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       procedure Pesquisar(pCodigo: Integer);
       procedure Carregar(pVendaItem: TVendaItem; pCodigo: Integer);
       function Inserir(pVendaItem: TVendaItem; var pMsgErro: String): Boolean;
       function Alterar(pVendaItem: TVendaItem; var pMsgErro: String): Boolean;
       function Excluir(pCodigo: Integer; var pMsgErro: String): Boolean;
     published
       { published declarations }
     end;

implementation

{ TVendaController }

function TVendaController.Alterar(pVendaItem: TVendaItem;
  var pMsgErro: String): Boolean;
begin
//  Result := dmVenda.Alterar(pVendaItem, pMsgErro);
end;

procedure TVendaController.Carregar(pVendaItem: TVendaItem; pCodigo: Integer);
begin
//  dmVenda.Carregar(pVendaItem, pCodigo);
end;

function TVendaController.Excluir(pCodigo: Integer;
  var pMsgErro: String): Boolean;
begin
  Result := dmVenda.Excluir(pCodigo, pMsgErro);
end;

function TVendaController.Inserir(pVendaItem: TVendaItem;
  var pMsgErro: String): Boolean;
begin
//  Result := dmVenda.Inserir(pVendaItem, pMsgErro);
end;

procedure TVendaController.Pesquisar(pCodigo: Integer);
begin
  dmVenda.Pesquisar(pCodigo);
end;

end.
