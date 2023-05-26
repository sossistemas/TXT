object frmTXT: TfrmTXT
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Ajusta Arquivo'
  ClientHeight = 274
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 274
    Align = alClient
    TabOrder = 0
    object Button3: TButton
      Left = 5
      Top = 241
      Width = 133
      Height = 25
      Caption = 'Testa Combina'#231#245'es'
      TabOrder = 0
      Visible = False
      OnClick = Button3Click
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 158
      Width = 434
      Height = 77
      Align = alTop
      Caption = 'SPED Contribui'#231#245'es'
      TabOrder = 1
      object Label5: TLabel
        Left = 121
        Top = 29
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label4: TLabel
        Left = 7
        Top = 30
        Width = 27
        Height = 13
        Caption = 'Data:'
      end
      object edtValorDesejado: TEdit
        Left = 118
        Top = 44
        Width = 87
        Height = 21
        TabOrder = 0
      end
      object Button4: TButton
        Left = 218
        Top = 40
        Width = 120
        Height = 25
        Caption = 'Gerar Contribui'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button4Click
      end
      object edtData: TEdit
        Left = 5
        Top = 44
        Width = 90
        Height = 21
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 90
      Width = 434
      Height = 68
      Align = alTop
      Caption = 'SPED Comum'
      TabOrder = 2
      object Label2: TLabel
        Left = 7
        Top = 18
        Width = 82
        Height = 13
        Caption = 'Bloco Cabe'#231'alho:'
      end
      object Label3: TLabel
        Left = 122
        Top = 18
        Width = 57
        Height = 13
        Caption = 'Bloco Itens:'
      end
      object edtBloco: TEdit
        Left = 6
        Top = 34
        Width = 80
        Height = 21
        TabOrder = 0
      end
      object edtBlocoItens: TEdit
        Left = 121
        Top = 34
        Width = 80
        Height = 21
        TabOrder = 1
      end
      object btGerar: TButton
        Left = 218
        Top = 32
        Width = 120
        Height = 25
        Caption = 'Gerar Sped Comum'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btGerarClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 434
      Height = 89
      Align = alTop
      TabOrder = 3
      object Label1: TLabel
        Left = 5
        Top = 7
        Width = 100
        Height = 13
        Caption = 'Caminho do Arquivo:'
      end
      object edtCaminho: TEdit
        Left = 4
        Top = 22
        Width = 408
        Height = 21
        TabOrder = 0
      end
      object btnCarregar: TButton
        Left = 5
        Top = 50
        Width = 95
        Height = 25
        Caption = 'Carregar Arquivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCarregarClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 360
    Top = 8
  end
end
