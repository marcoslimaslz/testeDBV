inherited frmCadastroServicoFarmaceutico: TfrmCadastroServicoFarmaceutico
  Caption = 'Movimento de Servi'#231'o'
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 700
      ExplicitHeight = 303
      inherited pnlCadastro: TPanel
        ExplicitTop = 65
        ExplicitHeight = 238
      end
    end
    inherited tabDados: TTabSheet
      ExplicitTop = 24
      ExplicitWidth = 700
      ExplicitHeight = 303
    end
  end
end
