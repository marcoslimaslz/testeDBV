inherited frmCadastroServico: TfrmCadastroServico
  Caption = 'Cadastro de Servi'#231'o'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnSalvar: TButton
      OnClick = btnSalvarClick
    end
  end
  inherited pgcCadastro: TPageControl
    inherited tabPesquisar: TTabSheet
      inherited btnPesquisar: TButton
        OnClick = btnPesquisarClick
      end
    end
    inherited tabDados: TTabSheet
      object Label3: TLabel [1]
        Left = 10
        Top = 55
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel [2]
        Left = 10
        Top = 149
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label1: TLabel [3]
        Left = 10
        Top = 101
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object edtNome: TEdit
        Left = 10
        Top = 74
        Width = 631
        Height = 21
        TabOrder = 2
      end
      object cbxEstado: TComboBox
        Left = 10
        Top = 168
        Width = 100
        Height = 21
        TabOrder = 3
        Items.Strings = (
          'Inativo'
          'Ativo')
      end
      object edtValor: TEdit
        Left = 10
        Top = 120
        Width = 100
        Height = 21
        TabOrder = 4
        OnKeyPress = edtValorKeyPress
      end
    end
  end
end
