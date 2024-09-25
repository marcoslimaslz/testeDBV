unit uVendaModel;

interface

uses uPessoaModel, uVendaItemModel, System.Generics.Collections;

type
  TVenda = class
  private
    { private declarations }
    FCodigo: Integer;
    FObservacao: String;
    FFarmaceutico: TPessoa;
    FPaciente: TPessoa;
    FValorTotal: Real;
    FData: TDate;
    FVendaItem: TObjectList<TVendaItem>;
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Farmaceutico: TPessoa read FFarmaceutico write FFarmaceutico;
    property Paciente: TPessoa read FPaciente write FPaciente;
    property Observacao: String read FObservacao write FObservacao;
    property ValorTotal: Real read FValorTotal write FValorTotal;
    property Data: TDate read FData write FData;
  end;

implementation

{ TVenda }

constructor TVenda.Create;
begin
  FFarmaceutico := TPessoa.Create;
  FPaciente := TPessoa.Create;
  FVendaItem := TObjectList<TVendaItem>.Create;
end;

destructor TVenda.Destroy;
begin
  FFarmaceutico.Free;
  FPaciente.Free;
  inherited;
end;

end.
