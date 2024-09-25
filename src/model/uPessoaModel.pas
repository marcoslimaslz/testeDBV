unit uPessoaModel;

interface

type
  TPessoa = class
  private
    { private declarations }
    FCodigo: Integer;
    FTipo: Integer;
    FNome: String;
    FEstado: Integer;
  public
    { public declarations }
    property Codigo: Integer read FCodigo write FCodigo;
    property Tipo: Integer read FTipo write FTipo;
    property Nome: String read FNome write FNome;
    property Estado: Integer read FEstado write FEstado;
  end;

implementation

end.
