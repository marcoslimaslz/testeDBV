unit udmVendaItem;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Data.SqlExpr, uVendaItemModel;

type
  TdmVendaItem = class(TDataModule)
    sdsPesquisar: TSQLDataSet;
    sdsInserir: TSQLDataSet;
    sdsExcluir: TSQLDataSet;
    sdsAlterar: TSQLDataSet;
    cdsPesquisar: TClientDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarVENDA_ID: TIntegerField;
    cdsPesquisarSERVICO_ID: TIntegerField;
    cdsPesquisarVALOR: TFMTBCDField;
    sdsCarregar: TSQLDataSet;
    cdsCarregar: TClientDataSet;
    dspCarregar: TDataSetProvider;
    cdsCarregarCODIGO: TIntegerField;
    cdsCarregarVENDA_ID: TIntegerField;
    cdsCarregarSERVICO_ID: TIntegerField;
    cdsCarregarVALOR: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID: Integer;
    procedure Pesquisar(pCodigo: Integer);
    procedure Carregar(pVendaItem: TVendaItem; pCodigo: Integer);
    function Inserir(pVendaItem: TVendaItem; pVendaID: Integer; out pMsgErro: String): Boolean;
    function Alterar(pVendaItem: TVendaItem; pVendaID: Integer; out pMsgErro: String): Boolean;
    function Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
  end;

var
  dmVendaItem: TdmVendaItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TdmVendaItem }

function TdmVendaItem.Alterar(pVendaItem: TVendaItem; pVendaID: Integer; out pMsgErro: String): Boolean;
begin
  sdsAlterar.ParamByName('codigo').AsInteger := pVendaItem.Codigo;
  sdsAlterar.ParamByName('venda_id').AsInteger := pVendaID;
  sdsAlterar.ParamByName('servico_id').AsInteger := pVendaItem.Servico.Codigo;
  sdsAlterar.ParamByName('valor').AsFloat := pVendaItem.Servico.Valor;
  try
    sdsAlterar.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao inserir Serviço.'  + #13 + E.Message;
      Result := False;
    end;
  end;
end;

procedure TdmVendaItem.Carregar(pVendaItem: TVendaItem; pCodigo: Integer);
begin
  try
    cdsCarregar.Close;
    cdsCarregar.ParamByName('venda_id').AsInteger := pCodigo;
    cdsCarregar.Open;
    cdsCarregar.First;

    //Carregando
    while not cdsCarregar.Eof do
    begin
      pVendaItem.Codigo := cdsCarregarCODIGO.AsInteger;
      pVendaItem.VendaId := cdsCarregarVENDA_ID.AsInteger;
//      pVendaItem.Servico := TServico.Create;
      pVendaItem.Valor := cdsCarregarVALOR.AsFloat;

      cdsCarregar.Next;
    end;
  finally
    cdsCarregar.Close;
  end;
end;

function TdmVendaItem.Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
begin
  sdsExcluir.ParamByName('codigo').AsInteger := pCodigo;
  try
    sdsExcluir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao excluir Item da venda.' + #13 + E.Message;
      Result := False;
    end;
  end;
end;

function TdmVendaItem.GerarID: Integer;
var
  sqlAux: TSQLDataSet;
begin
  sqlAux := TSQLDataSet.Create(nil);
  try
    sqlAux.SQLConnection := dmConexao.sqlConexao;
    sqlAux.Close;
    sqlAux.CommandText := 'select coalesce(max(codigo), 0) + 1 from venda_item';
    sqlAux.Open;
    Result := sqlAux.Fields[0].AsInteger;
  finally
    sqlAux.Free;
  end;
end;

function TdmVendaItem.Inserir(pVendaItem: TVendaItem; pVendaID: Integer; out pMsgErro: String): Boolean;
begin
  sdsInserir.ParamByName('codigo').AsInteger := pVendaItem.Codigo;
  sdsInserir.ParamByName('venda_id').AsInteger := pVendaID;
  sdsInserir.ParamByName('servico_id').AsInteger := pVendaItem.Servico.Codigo;
  sdsInserir.ParamByName('valor').AsFloat := pVendaItem.Servico.Valor;
  try
    sdsInserir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao inserir Serviço.'  + #13 + E.Message;
      Result := False;
    end;
  end;
end;

procedure TdmVendaItem.Pesquisar(pCodigo: Integer);
begin
  if cdsPesquisar.Active then
  begin
    cdsPesquisar.Close;
  end;
  cdsPesquisar.Params[0].AsInteger := pCodigo;
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
