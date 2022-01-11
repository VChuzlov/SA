object OmskDialog: TOmskDialog
  Left = 282
  Top = 193
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1091#1075#1083#1077#1074#1086#1076#1086#1088#1086#1076#1085#1086#1075#1086' '#1089#1086#1089#1090#1072#1074#1072
  ClientHeight = 134
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 192
    Top = 100
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 100
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 173
    Height = 117
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079'...'
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 12
      Top = 28
      Width = 113
      Height = 13
      Caption = #1073#1091#1092#1077#1088#1072' Excell'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 12
      Top = 56
      Width = 145
      Height = 17
      Caption = #1092#1072#1081#1083#1072' '#1093#1088#1086#1084#1072#1090#1086#1075#1088#1072#1084#1084#1099
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object Edit1: TEdit
      Left = 32
      Top = 80
      Width = 101
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object Button3: TButton
      Left = 136
      Top = 80
      Width = 25
      Height = 21
      Caption = '...'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 192
    Top = 8
    Width = 165
    Height = 85
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1076#1083#1103'...'
    TabOrder = 3
    object RadioButton3: TRadioButton
      Left = 12
      Top = 28
      Width = 113
      Height = 17
      Caption = #1089#1099#1088#1100#1103
      TabOrder = 0
    end
    object RadioButton4: TRadioButton
      Left = 12
      Top = 56
      Width = 113
      Height = 17
      Caption = #1082#1072#1090#1072#1083#1080#1079#1072#1090#1072
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1093#1088#1086#1084#1072#1090#1086#1075#1088#1072#1084#1084'|*.are|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 144
    Top = 20
  end
end
