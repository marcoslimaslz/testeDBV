inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Movimento de Servi'#231'o'
  ClientWidth = 856
  OnDestroy = FormDestroy
  ExplicitWidth = 872
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 856
    ExplicitWidth = 894
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnSalvar: TButton
      OnClick = btnSalvarClick
    end
  end
  inherited pgcCadastro: TPageControl
    Width = 856
    ExplicitWidth = 894
    inherited tabPesquisar: TTabSheet
      ExplicitWidth = 886
      inherited Bevel1: TBevel
        Width = 848
        ExplicitWidth = 886
      end
      inherited edtProcurar: TEdit
        OnKeyPress = edtProcurarKeyPress
      end
      inherited btnPesquisar: TButton
        OnClick = btnPesquisarClick
      end
      inherited pnlCadastro: TPanel
        Width = 848
        ExplicitWidth = 886
        inherited dbgPesquisa: TDBGrid
          Width = 846
        end
      end
    end
    inherited tabDados: TTabSheet
      ExplicitWidth = 886
      object Bevel2: TBevel [0]
        Left = 0
        Top = 0
        Width = 848
        Height = 60
        Align = alTop
        ExplicitWidth = 886
      end
      object lblFarmaceutico: TLabel [2]
        Left = 90
        Top = 10
        Width = 64
        Height = 13
        Caption = 'Farmac'#233'utico'
      end
      object lblPaciente: TLabel [3]
        Left = 310
        Top = 10
        Width = 41
        Height = 13
        Caption = 'Paciente'
      end
      object lblValor: TLabel [4]
        Left = 755
        Top = 10
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label1: TLabel [5]
        Left = 530
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      inherited StatusBar1: TStatusBar
        Width = 848
        ExplicitWidth = 886
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 60
        Width = 848
        Height = 224
        Align = alClient
        Ctl3D = True
        DataSource = ddsVendaItem
        ParentCtl3D = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgPesquisaDblClick
      end
      object edtFarmaceuticoCodigo: TEdit
        Left = 90
        Top = 25
        Width = 50
        Height = 21
        TabOrder = 3
        OnExit = edtFarmaceuticoCodigoExit
      end
      object edtFarmaceuticoDesc: TEdit
        Left = 140
        Top = 25
        Width = 160
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 4
      end
      object edtPacienteCodigo: TEdit
        Left = 310
        Top = 25
        Width = 50
        Height = 21
        TabOrder = 5
        OnExit = edtPacienteCodigoExit
      end
      object edtPacienteDesc: TEdit
        Left = 360
        Top = 25
        Width = 160
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 6
      end
      object edtValorTotal: TEdit
        Left = 755
        Top = 25
        Width = 80
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 8
        OnExit = edtPacienteCodigoExit
      end
      object edtObservacao: TEdit
        Left = 530
        Top = 25
        Width = 215
        Height = 21
        TabOrder = 7
        OnExit = edtPacienteCodigoExit
      end
    end
  end
  inherited ddsCadastro: TDataSource
    DataSet = dmVenda.cdsPesquisar
    Left = 52
    Top = 229
  end
  object ddsVendaItem: TDataSource
    AutoEdit = False
    DataSet = dmVendaItem.cdsPesquisar
    OnDataChange = ddsCadastroDataChange
    Left = 172
    Top = 245
  end
end
