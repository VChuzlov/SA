object Grnum: TGrnum
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Численное представление графиков'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 501
    Height = 19
    Caption = 
      'Дата/ активность/ кокса на катализаторе/ число крекинга/ выход в' +
      'одорода'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object LB1: TListBox
    Left = 48
    Top = 32
    Width = 361
    Height = 209
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ItemHeight = 19
    Items.Strings = (
      'Проба')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 440
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Удалить'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Возврат'
    TabOrder = 2
    OnClick = Button2Click
  end
end
