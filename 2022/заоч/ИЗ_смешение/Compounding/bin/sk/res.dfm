object ResF: TResF
  Left = 277
  Top = 172
  Width = 590
  Height = 379
  Caption = 'Исследование'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 32
    Width = 529
    Height = 73
    Caption = 'Файл с технологическими данными'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DanF: TEdit
      Left = 16
      Top = 24
      Width = 337
      Height = 27
      TabOrder = 0
      OnExit = DanFExit
    end
    object Button1: TButton
      Left = 408
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Обзор'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 112
    Width = 529
    Height = 73
    Caption = 'Файл с данными по сырью и катализату'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object SkF: TEdit
      Left = 16
      Top = 24
      Width = 337
      Height = 27
      TabOrder = 0
      OnExit = SkFExit
    end
    object Button2: TButton
      Left = 408
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Обзор'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 200
    Width = 529
    Height = 73
    Caption = 'Результаты расчета сохранить в файл'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object RezF: TEdit
      Left = 16
      Top = 24
      Width = 337
      Height = 27
      TabOrder = 0
      OnExit = RezFExit
    end
    object Button3: TButton
      Left = 408
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Обзор'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Button4: TButton
    Left = 192
    Top = 312
    Width = 97
    Height = 25
    Caption = 'Далее'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 440
    Top = 312
    Width = 89
    Height = 25
    Caption = 'Отмена'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 16
    Top = 280
    Width = 249
    Height = 25
    Caption = 'Очистить директорию от результатов расчета'
    TabOrder = 5
    OnClick = Button6Click
  end
  object OpenD: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 24
    Top = 8
  end
  object SaveR: TSaveDialog
    Filter = 'Файл результатов|*.rez'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 64
    Top = 8
  end
end
