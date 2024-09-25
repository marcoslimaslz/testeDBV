unit udmServicoFarmaceutico;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.SqlExpr;

type
  TdmServicoFarmaceutico = class(TDataModule)
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
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarFARMACEUTICO_ID: TIntegerField;
    cdsPesquisarPACIENTE_ID: TIntegerField;
    cdsPesquisarOBSERVACAO: TStringField;
    cdsPesquisarVALOR_TOTAL: TFMTBCDField;
    cdsPesquisarDATA: TDateField;
    cdsPesquisar_ItemCODIGO: TIntegerField;
    cdsPesquisar_ItemSERVICO_FARMACEUTICO_ID: TIntegerField;
    cdsPesquisar_ItemSERVICO_ID: TIntegerField;
    cdsPesquisar_ItemVALOR: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmServicoFarmaceutico: TdmServicoFarmaceutico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
