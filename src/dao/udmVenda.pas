unit udmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.SqlExpr, uVendaModel;

type
  TdmVenda = class(TDataModule)
    sdsPesquisar: TSQLDataSet;
    sdsInserir: TSQLDataSet;
    sdsExcluir: TSQLDataSet;
    sdsAlterar: TSQLDataSet;
    cdsPesquisar: TClientDataSet;
    dspPesquisar: TDataSetProvider;
    sdsInserir_Item: TSQLDataSet;
    sdsExcluir_Item: TSQLDataSet;
    sdsAlterar_Item: TSQLDataSet;
    sdsPesquisar_Item: TSQLDataSet;
    cdsPesquisar_Item: TClientDataSet;
    dspPesquisar_Item: TDataSetProvider;
    cdsPesquisar_ItemCODIGO: TIntegerField;
    cdsPesquisar_ItemVENDA_ID: TIntegerField;
    cdsPesquisar_ItemSERVICO_ID: TIntegerField;
    cdsPesquisar_ItemVALOR: TFMTBCDField;
    sdsCarregar: TSQLDataSet;
    cdsCarregar: TClientDataSet;
    dspCarregar: TDataSetProvider;
    cdsCarregarCODIGO: TIntegerField;
    cdsCarregarFARMACEUTICO_ID: TIntegerField;
    cdsCarregarPACIENTE_ID: TIntegerField;
    cdsCarregarOBSERVACAO: TStringField;
    cdsCarregarVALOR_TOTAL: TFMTBCDField;
    cdsCarregarDATA: TDateField;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarFARMACEUTICO_ID: TIntegerField;
    cdsPesquisarFARMACEUTICO: TStringField;
    cdsPesquisarPACIENTE_ID: TIntegerField;
    cdsPesquisarPACIENTE: TStringField;
    cdsPesquisarOBSERVACAO: TStringField;
    cdsPesquisarVALOR_TOTAL: TFMTBCDField;
    cdsPesquisarDATA: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID: Integer;
    procedure Pesquisar(pCodigo: Integer);
    procedure Carregar(pVenda: TVenda; pCodigo: Integer);
    function Inserir(pVenda: TVenda; out pMsgErro: String): Boolean;
    function Alterar(pVenda: TVenda; out pMsgErro: String): Boolean;
    function Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
  end;

var
  dmVenda: TdmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TdmVenda }

function TdmVenda.Alterar(pVenda: TVenda; out pMsgErro: String): Boolean;
begin
  sdsAlterar.ParamByName('codigo').AsInteger := pVenda.Codigo;
  sdsAlterar.ParamByName('farmaceutico_id').AsInteger := pVenda.Farmaceutico.Codigo;
  sdsAlterar.ParamByName('paciente_id').AsInteger := pVenda.Paciente.Codigo;
  sdsAlterar.ParamByName('observacao').AsString := pVenda.Observacao;
  sdsAlterar.ParamByName('valor_total').AsFloat := pVenda.ValorTotal;
  sdsAlterar.ParamByName('data').AsDateTime := Now;
  try
    sdsAlterar.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao alterar Serviço.'  + #13 + E.Message;
      Result := False;
    end;
  end;
end;

procedure TdmVenda.Carregar(pVenda: TVenda; pCodigo: Integer);
begin
  try
    cdsPesquisar.Close;
    cdsPesquisar.ParamByName('codigo').AsInteger := pCodigo;
    cdsPesquisar.Open;

    //Carregando
    pVenda.Codigo := cdsPesquisarCODIGO.AsInteger;
    pVenda.Observacao := cdsPesquisarOBSERVACAO.AsString;
    pVenda.ValorTotal := cdsPesquisarVALOR_TOTAL.AsFloat;
  finally
    cdsCarregar.Close;
  end;
end;

function TdmVenda.Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
begin
  sdsExcluir.ParamByName('codigo').AsInteger := pCodigo;
  try
    sdsExcluir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao excluir venda.' + #13 + E.Message;
      Result := False;
    end;
  end;
end;

function TdmVenda.GerarID: Integer;
var
  sqlAux: TSQLDataSet;
begin
  sqlAux := TSQLDataSet.Create(nil);
  try
    sqlAux.SQLConnection := dmConexao.sqlConexao;
    sqlAux.Close;
    sqlAux.CommandText := 'select coalesce(max(codigo), 0) + 1 from venda';
    sqlAux.Open;
    Result := sqlAux.Fields[0].AsInteger;
  finally
    sqlAux.Free;
  end;
end;

function TdmVenda.Inserir(pVenda: TVenda; out pMsgErro: String): Boolean;
begin
  sdsInserir.ParamByName('codigo').AsInteger := GerarID;
  sdsInserir.ParamByName('farmaceutico_id').AsInteger := pVenda.Farmaceutico.Codigo;
  sdsInserir.ParamByName('paciente_id').AsInteger := pVenda.Paciente.Codigo;
  sdsInserir.ParamByName('observacao').AsString := pVenda.Observacao;
  sdsInserir.ParamByName('valor_total').AsFloat := pVenda.ValorTotal;
  sdsInserir.ParamByName('data').AsDateTime := Now;
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

procedure TdmVenda.Pesquisar(pCodigo: Integer);
begin
  if cdsPesquisar.Active then
  begin
    cdsPesquisar.Close;
  end;
  cdsPesquisar.ParamByName('codigo').AsInteger := pCodigo;
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
