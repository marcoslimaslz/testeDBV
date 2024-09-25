unit udmPessoa;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr, uPessoaModel;

type
  TdmPessoa = class(TDataModule)
    sdsPesquisar: TSQLDataSet;
    sdsInserir: TSQLDataSet;
    sdsExcluir: TSQLDataSet;
    sdsAlterar: TSQLDataSet;
    cdsPesquisar: TClientDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarNOME: TStringField;
    cdsPesquisarESTADO: TSmallintField;
    cdsPesquisarTIPO: TIntegerField;
    sdsPesquisaPessoa: TSQLDataSet;
    dspPesquisaPessoa: TDataSetProvider;
    cdsPesquisarPessoa: TClientDataSet;
    cdsPesquisarPessoaCODIGO: TIntegerField;
    cdsPesquisarPessoaTIPO: TIntegerField;
    cdsPesquisarPessoaNOME: TStringField;
    cdsPesquisarPessoaESTADO: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID: Integer;
    procedure Pesquisar(pNome: String);
    function PesquisarFarmaceutico(pCodigo: Integer): String;
    function PesquisarPaciente(pCodigo: Integer): String;
    procedure Carregar(pPessoa: TPessoa; pCodigo: Integer);
    function Inserir(pPessoa: TPessoa; out pMsgErro: String): Boolean;
    function Alterar(pPessoa: TPessoa; out pMsgErro: String): Boolean;
    function Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
  end;

var
  dmPessoa: TdmPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TdmPessoa }

function TdmPessoa.Alterar(pPessoa: TPessoa; out pMsgErro: String): Boolean;
begin
  sdsAlterar.ParamByName('codigo').AsInteger := pPessoa.Codigo;
  sdsAlterar.ParamByName('tipo').AsInteger := pPessoa.Tipo;
  sdsAlterar.ParamByName('nome').AsString := pPessoa.Nome;
  sdsAlterar.ParamByName('estado').AsInteger := pPessoa.Estado;
  try
    sdsAlterar.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao alterar Pessoa.'  + #13 + E.Message;
      Result := False;
    end;
  end;
end;

procedure TdmPessoa.Carregar(pPessoa: TPessoa; pCodigo: Integer);
var
  sqlAux: TSQLDataSet;
begin
  sqlAux := TSQLDataSet.Create(nil);
  try
    sqlAux.SQLConnection := dmConexao.sqlConexao;
    sqlAux.Close;
    sqlAux.CommandText := 'select codigo, tipo, nome, estado from pessoa where codigo = :codigo';
    sqlAux.ParamByName('codigo').AsInteger := pCodigo;
    sqlAux.Open;

    //Carregando
    pPessoa.Codigo := sqlAux.FieldByName('codigo').AsInteger;
    pPessoa.Tipo := sqlAux.FieldByName('tipo').AsInteger;
    pPessoa.Nome := sqlAux.FieldByName('nome').AsString;
    pPessoa.Estado := sqlAux.FieldByName('estado').AsInteger;
  finally
    sqlAux.Free;
  end;
end;

function TdmPessoa.Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
begin
  sdsExcluir.ParamByName('codigo').AsInteger := pCodigo;
  try
    sdsExcluir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao excluir Pessoa.' + #13 + E.Message;
      Result := False;
    end;
  end;
end;

function TdmPessoa.GerarID: Integer;
var
  sqlAux: TSQLDataSet;
begin
  sqlAux := TSQLDataSet.Create(nil);
  try
    sqlAux.SQLConnection := dmConexao.sqlConexao;
    sqlAux.Close;
    sqlAux.CommandText := 'select coalesce(max(codigo), 0) + 1 from pessoa';
    sqlAux.Open;
    Result := sqlAux.Fields[0].AsInteger;
  finally
    sqlAux.Free;
  end;
end;

function TdmPessoa.Inserir(pPessoa: TPessoa; out pMsgErro: String): Boolean;
begin
  sdsInserir.ParamByName('codigo').AsInteger := GerarID;
  sdsInserir.ParamByName('tipo').AsInteger := pPessoa.Tipo;
  sdsInserir.ParamByName('nome').AsString := pPessoa.Nome;
  sdsInserir.ParamByName('estado').AsInteger := pPessoa.Estado;
  try
    sdsInserir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao inserir Pessoa.' + #13 + E.Message;
      Result := False;
    end;
  end;
end;

procedure TdmPessoa.Pesquisar(pNome: String);
begin
  if cdsPesquisar.Active then
  begin
    cdsPesquisar.Close;
  end;
  cdsPesquisar.Params[0].AsString := pNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

function TdmPessoa.PesquisarFarmaceutico(pCodigo: Integer): String;
begin
  if cdsPesquisarPessoa.Active then
  begin
    cdsPesquisarPessoa.Close;
  end;
  cdsPesquisarPessoa.ParamByName('codigo').AsInteger := pCodigo;
  cdsPesquisarPessoa.ParamByName('tipo').AsInteger := 2;
  cdsPesquisarPessoa.Open;

  if cdsPesquisarPessoa.IsEmpty then
    Result := EmptyStr
  else
    Result := cdsPesquisarPessoaNOME.AsString;
end;

function TdmPessoa.PesquisarPaciente(pCodigo: Integer): String;
begin
  if cdsPesquisarPessoa.Active then
  begin
    cdsPesquisarPessoa.Close;
  end;
  cdsPesquisarPessoa.ParamByName('codigo').AsInteger := pCodigo;
  cdsPesquisarPessoa.ParamByName('tipo').AsInteger := 3;
  cdsPesquisarPessoa.Open;
  cdsPesquisarPessoa.First;

  if cdsPesquisarPessoa.IsEmpty then
    Result := EmptyStr
  else
    Result := cdsPesquisarPessoaNOME.AsString;
end;

end.

