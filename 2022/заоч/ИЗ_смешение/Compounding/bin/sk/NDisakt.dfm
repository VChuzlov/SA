object NewDisakt: TNewDisakt
  Left = 242
  Top = 211
  Width = 586
  Height = 228
  Caption = 'Расчет скорости дизактивации катализатора'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 73
    Width = 578
    Height = 73
    Align = alTop
    Caption = 'Текущая дата'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object CurrentFile: TEdit
      Left = 16
      Top = 24
      Width = 473
      Height = 27
      TabOrder = 0
    end
    object Button2: TButton
      Left = 492
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Обзор'
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 578
    Height = 73
    Align = alTop
    Caption = 'Начало рабочего цикла'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object BeginFile: TEdit
      Left = 16
      Top = 24
      Width = 473
      Height = 27
      TabOrder = 0
    end
    object Button1: TButton
      Left = 492
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Обзор'
      TabOrder = 1
    end
  end
  object Button4: TButton
    Left = 472
    Top = 164
    Width = 97
    Height = 25
    Caption = 'Далее >>'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Button6: TButton
    Left = 184
    Top = 164
    Width = 205
    Height = 25
    Caption = 'Очистить график дизактивации'
    TabOrder = 3
  end
  object Button5: TButton
    Left = 16
    Top = 164
    Width = 89
    Height = 25
    Caption = 'Закончить'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
end
