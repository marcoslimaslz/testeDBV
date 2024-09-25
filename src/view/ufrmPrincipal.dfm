object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste'
  ClientHeight = 422
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 614
    Height = 403
    Align = alClient
    Center = True
    ExplicitTop = -6
    ExplicitWidth = 634
    ExplicitHeight = 407
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 403
    Width = 614
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end
      item
        Width = 250
      end>
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 112
    object A1: TMenuItem
      Caption = '&Arquivo'
      object S1: TMenuItem
        Caption = 'Sair'
        ShortCut = 32883
        OnClick = S1Click
      end
    end
    object C2: TMenuItem
      Caption = '&Cadastro'
      object Pessoas1: TMenuItem
        Caption = 'Pessoa'
        OnClick = Pessoas1Click
      end
      object Servios1: TMenuItem
        Caption = 'Servi'#231'o'
        OnClick = Servios1Click
      end
    end
    object M1: TMenuItem
      Caption = '&Movimento'
      object S3: TMenuItem
        Caption = 'Servi'#231'o'
        OnClick = S3Click
      end
    end
    object A2: TMenuItem
      Caption = 'A&juda'
      object S2: TMenuItem
        Caption = 'Sobre'
        ShortCut = 112
      end
    end
  end
end
