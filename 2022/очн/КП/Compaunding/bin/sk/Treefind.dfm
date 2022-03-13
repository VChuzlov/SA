object TreeF: TTreeF
  Left = 416
  Top = 260
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Выбор директории с результатами расчета'
  ClientHeight = 354
  ClientWidth = 357
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
  object DirectoryListBox1: TDirectoryListBox
    Left = 16
    Top = 8
    Width = 329
    Height = 233
    ItemHeight = 16
    TabOrder = 0
  end
  object Button1: TButton
    Left = 40
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Далее'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DriveComboBox1: TDriveComboBox
    Left = 16
    Top = 256
    Width = 161
    Height = 19
    TabOrder = 3
    OnChange = DriveComboBox1Change
  end
end
