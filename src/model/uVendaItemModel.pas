unit uVendaItemModel;

interface

uses uServicoModel;

type
  TVendaItem = class
  private
    { private declarations }
    FCodigo: Integer;
    FVendaId: Integer;
    FServico: TServico;
    FValor: Real;
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property VendaId: Integer read FVendaId write FVendaId;
    property Servico: TServico read FServico write FServico;
    property Valor: Real read FValor write FValor;
  end;

implementation

{ TVendaItem }

constructor TVendaItem.Create;
begin
  Servico := TServico.Create;
end;

destructor TVendaItem.Destroy;
begin
  Servico.Free;
  inherited;
end;

end.
