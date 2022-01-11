object ToGr: TToGr
  Left = 395
  Top = 278
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Добавить дату'
  ClientHeight = 98
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 337
    Height = 19
    Caption = 'Введите дату, за которую добавить дезактивацию'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Dt: TMaskEdit
    Left = 24
    Top = 32
    Width = 65
    Height = 21
    EditMask = '!90/90/0099;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '01.01.2000'
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
