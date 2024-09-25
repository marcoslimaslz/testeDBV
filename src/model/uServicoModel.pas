unit uServicoModel;

interface

type
  TServico = class
  private
    { private declarations }
    FCodigo: Integer;
    FNome: String;
    FValor: Real;
    FEstado: Integer;
  public
    { public declarations }
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Valor: Real read FValor write FValor;
    property Estado: Integer read FEstado write FEstado;
  end;

implementation

end.
