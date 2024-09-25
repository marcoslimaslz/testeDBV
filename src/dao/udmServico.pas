unit udmServico;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Data.SqlExpr, uServicoModel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmServico = class(TDataModule)
    sdsPesquisar: TFDQuery;
    sdsInserir: TFDQuery;
    sdsExcluir: TFDQuery;
    sdsAlterar: TFDQuery;
    cdsPesquisar: TClientDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarNOME: TStringField;
    cdsPesquisarVALOR: TFMTBCDField;
    cdsPesquisarESTADO: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID: Integer;
    procedure Pesquisar(pNome: String);
    procedure Carregar(pServico: TServico; pCodigo: Integer);
    function Inserir(pServico: TServico; out pMsgErro: String): Boolean;
    function Alterar(pServico: TServico; out pMsgErro: String): Boolean;
    function Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
  end;

var
  dmServico: TdmServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TdmServico }

function TdmServico.Alterar(pServico: TServico; out pMsgErro: String): Boolean;
begin
  sdsAlterar.ParamByName('codigo').AsInteger := pServico.Codigo;
  sdsAlterar.ParamByName('nome').AsString := pServico.Nome;
  sdsAlterar.ParamByName('valor').AsFloat := pServico.Valor;
  sdsAlterar.ParamByName('estado').AsInteger := pServico.Estado;
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

procedure TdmServico.Carregar(pServico: TServico; pCodigo: Integer);
var
  sqlAux: TFDQuery;
begin
  sqlAux := TFDQuery.Create(nil);
  try
    sqlAux.Connection := dmConexao.fdcConexao;
    sqlAux.Close;
    sqlAux.SQL.Text := 'select codigo, nome, valor, estado from servico where codigo = :codigo';
    sqlAux.ParamByName('codigo').AsInteger := pCodigo;
    sqlAux.Open;

    pServico.Codigo := sqlAux.FieldByName('codigo').AsInteger;
    pServico.Nome := sqlAux.FieldByName('nome').AsString;
    pServico.Valor := sqlAux.FieldByName('valor').AsFloat;
    pServico.Estado := sqlAux.FieldByName('estado').AsInteger;
  finally
    sqlAux.Free;
  end;
end;

function TdmServico.Excluir(pCodigo: Integer; out pMsgErro: String): Boolean;
begin
  sdsExcluir.ParamByName('codigo').AsInteger := pCodigo;
  try
    sdsExcluir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao excluir Serviço.' + #13 + E.Message;
      Result := False;
    end;
  end;
end;

function TdmServico.GerarID: Integer;
var
  sqlAux: TFDQuery;
begin
  sqlAux := TFDQuery.Create(nil);
  try
    sqlAux.Connection := dmConexao.fdcConexao;
    sqlAux.Close;
    sqlAux.SQL.Text := 'select coalesce(max(codigo), 0) + 1 from servico';
    sqlAux.Open;
    Result := sqlAux.Fields[0].AsInteger;
  finally
    sqlAux.Free;
  end;
end;

function TdmServico.Inserir(pServico: TServico; out pMsgErro: String): Boolean;
begin
  sdsInserir.ParamByName('codigo').AsInteger := GerarID;
  sdsInserir.ParamByName('nome').AsString := pServico.Nome;
  sdsInserir.ParamByName('valor').AsFloat := pServico.Valor;
  sdsInserir.ParamByName('estado').AsInteger := pServico.Estado;
  try
    sdsInserir.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      pMsgErro := 'Erro ao inserir Serviço.' + #13 + E.Message;
      Result := False;
    end;
  end;
end;

procedure TdmServico.Pesquisar(pNome: String);
begin
  if cdsPesquisar.Active then
  begin
    cdsPesquisar.Close;
  end;
  cdsPesquisar.Params[0].AsString := pNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
