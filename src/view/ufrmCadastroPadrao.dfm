object frmCadastroPadrao: TfrmCadastroPadrao
  Left = 0
  Top = 0
  ActiveControl = btnNovo
  Caption = 'frmCadastroPadrao'
  ClientHeight = 360
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 708
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    object btnNovo: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Editar'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 150
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Excluir'
      Enabled = False
      TabOrder = 2
    end
    object btnCancelar: TButton
      Left = 225
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 300
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 4
    end
    object ToolButton1: TToolButton
      Left = 375
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object btnFechar: TButton
      Left = 383
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
  end
  object pgcCadastro: TPageControl
    Left = 0
    Top = 29
    Width = 708
    Height = 331
    ActivePage = tabPesquisar
    Align = alClient
    TabOrder = 1
    object tabPesquisar: TTabSheet
      Caption = 'tabPesquisar'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 700
        Height = 65
        Align = alTop
      end
      object lblPesquisar: TLabel
        Left = 10
        Top = 10
        Width = 69
        Height = 13
        Caption = 'Pesquisar por:'
      end
      object edtProcurar: TEdit
        Left = 9
        Top = 30
        Width = 505
        Height = 21
        TabOrder = 0
      end
      object btnPesquisar: TButton
        Left = 520
        Top = 30
        Width = 75
        Height = 22
        Caption = 'Pesquisar'
        TabOrder = 1
      end
      object pnlCadastro: TPanel
        Left = 0
        Top = 65
        Width = 700
        Height = 238
        Align = alClient
        Caption = 'pnlCadastro'
        TabOrder = 2
        object dbgPesquisa: TDBGrid
          Left = 1
          Top = 1
          Width = 698
          Height = 236
          Align = alClient
          Ctl3D = True
          DataSource = ddsCadastro
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgPesquisaDblClick
        end
      end
    end
    object tabDados: TTabSheet
      Caption = 'tabDados'
      ImageIndex = 1
      object lblCodigo: TLabel
        Left = 10
        Top = 6
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 284
        Width = 700
        Height = 19
        Panels = <
          item
            Width = 150
          end>
      end
      object edtCodigo: TEdit
        Left = 10
        Top = 25
        Width = 70
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object ddsCadastro: TDataSource
    AutoEdit = False
    OnDataChange = ddsCadastroDataChange
    Left = 204
    Top = 237
  end
end
