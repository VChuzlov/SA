object FSetUser: TFSetUser
  Left = 192
  Top = 125
  Width = 222
  Height = 154
  Caption = #1047#1072#1076#1072#1090#1100' '#1088#1072#1089#1093#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 36
    Height = 13
    Caption = #1056#1072#1089#1093#1086#1076
  end
  object BtOk: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = BtOkClick
  end
  object BtCan: TButton
    Left = 104
    Top = 72
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
  end
  object EdRash: TEdit
    Left = 16
    Top = 32
    Width = 161
    Height = 21
    TabOrder = 2
    Text = '0'
  end
end
