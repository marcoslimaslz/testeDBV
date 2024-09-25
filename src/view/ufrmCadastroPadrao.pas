unit ufrmCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Datasnap.Provider,
  Datasnap.DBClient, System.UITypes;

type
  TEstado = (stNovo, stEditar, stNormal);
  TfrmCadastroPadrao = class(TForm)
    ToolBar1: TToolBar;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    ToolButton1: TToolButton;
    btnFechar: TButton;
    pgcCadastro: TPageControl;
    tabPesquisar: TTabSheet;
    tabDados: TTabSheet;
    StatusBar1: TStatusBar;
    lblPesquisar: TLabel;
    edtProcurar: TEdit;
    btnPesquisar: TButton;
    ddsCadastro: TDataSource;
    pnlCadastro: TPanel;
    dbgPesquisa: TDBGrid;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    btnEditar: TButton;
    Bevel1: TBevel;
    btnCancelar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ddsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dbgPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEstado: TEstado;
    procedure Inicializar;
    { Botoes }
    procedure Novo;
    procedure Editar;
    procedure Cancelar;
    procedure Habilita;
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCadastroPadrao.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TfrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPadrao.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TfrmCadastroPadrao.Cancelar;
begin
  FEstado := stNormal;
  Habilita;
end;

procedure TfrmCadastroPadrao.dbgPesquisaDblClick(Sender: TObject);
begin
  Editar;
end;

procedure TfrmCadastroPadrao.ddsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  Habilita;
end;

procedure TfrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmCadastroPadrao.Habilita;
begin
  case FEstado of
    stNovo,
    stEditar: begin
                pgcCadastro.ActivePage := tabDados;
              end;
    stNormal: pgcCadastro.ActivePage := tabPesquisar;
  end;
  btnNovo.Enabled := (pgcCadastro.ActivePage = tabPesquisar);
  if Assigned(ddsCadastro.DataSet) then
  begin
    btnEditar.Enabled := (pgcCadastro.ActivePage = tabPesquisar) and (not ddsCadastro.DataSet.IsEmpty);
    btnExcluir.Enabled := (pgcCadastro.ActivePage = tabPesquisar) and (not ddsCadastro.DataSet.IsEmpty);
  end
  else
  begin
    btnEditar.Enabled := (pgcCadastro.ActivePage = tabPesquisar);
    btnExcluir.Enabled := (pgcCadastro.ActivePage = tabPesquisar);
  end;
  btnCancelar.Enabled := (pgcCadastro.ActivePage = tabDados);
  btnSalvar.Enabled := (pgcCadastro.ActivePage = tabDados);
end;

procedure TfrmCadastroPadrao.Inicializar;
begin
  tabDados.TabVisible := False;
  tabPesquisar.TabVisible := False;
  FEstado := stNormal;
  Habilita;
end;

procedure TfrmCadastroPadrao.Novo;
begin
  FEstado := stNovo;
  Habilita;
end;

procedure TfrmCadastroPadrao.Editar;
begin
  FEstado := stEditar;
  Habilita;
end;

end.
