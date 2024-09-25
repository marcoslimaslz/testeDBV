unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    A2: TMenuItem;
    S1: TMenuItem;
    StatusBar1: TStatusBar;
    C2: TMenuItem;
    Pessoas1: TMenuItem;
    Servios1: TMenuItem;
    S2: TMenuItem;
    M1: TMenuItem;
    S3: TMenuItem;
    procedure S1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udmConexao, ufrmCadastroPessoa, ufrmCadastroServico, ufrmCadastroVenda;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmConexao);
end;

procedure TfrmPrincipal.Inicializar;
begin
  dmConexao := TdmConexao.Create(nil);
  StatusBar1.Panels[0].Text := 'By: Marcos Lima';
end;

procedure TfrmPrincipal.Pessoas1Click(Sender: TObject);
begin
  try
    frmCadastroPessoa := TfrmCadastroPessoa.Create(Self);
    frmCadastroPessoa.ShowModal;
  finally
    FreeAndNil(frmCadastroPessoa);
  end;
end;

procedure TfrmPrincipal.S1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.S3Click(Sender: TObject);
begin
  try
    frmCadastroVenda := TfrmCadastroVenda.Create(Self);
    frmCadastroVenda.ShowModal;
  finally
    FreeAndNil(frmCadastroVenda);
  end;
end;

procedure TfrmPrincipal.Servios1Click(Sender: TObject);
begin
  try
    frmCadastroServico := TfrmCadastroServico.Create(Self);
    frmCadastroServico.ShowModal;
  finally
    FreeAndNil(frmCadastroServico);
  end;
end;

end.
