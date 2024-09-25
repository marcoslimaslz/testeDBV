unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXMySQL,
  Data.DBXFirebird;

type
  TdmConexao = class(TDataModule)
    sqlConexao: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  try
    sqlConexao.Open;
  except
    on E: Exception do
    begin
      raise E.Create('Erro ao conectar no banco de dados.');
    end;
  end;
end;

end.
