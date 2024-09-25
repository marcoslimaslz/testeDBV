inherited frmCadastroPessoa: TfrmCadastroPessoa
  Caption = 'Cadastro de Pessoa'
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
        Left = 521
        OnClick = btnPesquisarClick
        ExplicitLeft = 521
      end
    end
    inherited tabDados: TTabSheet
      object Label1: TLabel [1]
        Left = 10
        Top = 55
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object Label3: TLabel [2]
        Left = 10
        Top = 101
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel [3]
        Left = 10
        Top = 149
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object cbxTipo: TComboBox
        Left = 10
        Top = 74
        Width = 145
        Height = 21
        TabOrder = 2
        Items.Strings = (
          'Atendente'
          'Farmac'#233'utico'
          'Paciente')
      end
      object edtNome: TEdit
        Left = 10
        Top = 120
        Width = 444
        Height = 21
        TabOrder = 3
      end
      object cbxEstado: TComboBox
        Left = 10
        Top = 168
        Width = 100
        Height = 21
        TabOrder = 4
        Items.Strings = (
          'Inativo'
          'Ativo')
      end
    end
  end
  inherited ddsCadastro: TDataSource
    DataSet = dmPessoa.cdsPesquisar
  end
end
