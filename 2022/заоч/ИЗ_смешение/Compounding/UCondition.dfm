object Form20: TForm20
  Left = 890
  Top = 129
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1074#1086#1081#1089#1090#1074' '#1091#1089#1083#1086#1074#1080#1081
  ClientHeight = 354
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 313
    Width = 274
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel31: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 313
    Align = alClient
    TabOrder = 1
    object Label18: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label19: TLabel
      Left = 9
      Top = 36
      Width = 16
      Height = 13
      Caption = #1054#1063
    end
    object Label20: TLabel
      Left = 9
      Top = 60
      Width = 39
      Height = 13
      Caption = 'DNPmin'
    end
    object Label21: TLabel
      Left = 9
      Top = 84
      Width = 42
      Height = 13
      Caption = 'DNPmax'
    end
    object Label22: TLabel
      Left = 9
      Top = 108
      Width = 32
      Height = 13
      Caption = 'Benzol'
    end
    object Label1: TLabel
      Left = 9
      Top = 132
      Width = 27
      Height = 13
      Caption = 'Arom.'
    end
    object Label2: TLabel
      Left = 9
      Top = 156
      Width = 22
      Height = 13
      Caption = 'Olef.'
    end
    object Label3: TLabel
      Left = 9
      Top = 180
      Width = 22
      Height = 13
      Caption = 'Sera'
    end
    object Label4: TLabel
      Left = 9
      Top = 204
      Width = 28
      Height = 13
      Caption = 'KolVo'
    end
    object Label5: TLabel
      Left = 9
      Top = 228
      Width = 30
      Height = 13
      Caption = 'MTBE'
    end
    object Label6: TLabel
      Left = 9
      Top = 252
      Width = 67
      Height = 13
      Caption = #1044#1086#1087'.'#1089#1085#1080#1078'., %'
    end
    object Label7: TLabel
      Left = 9
      Top = 276
      Width = 88
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073'/'#1090
    end
    object Edit1: TEdit
      Left = 64
      Top = 5
      Width = 169
      Height = 21
      TabOrder = 0
      Text = #1041#1077#1085#1079#1080#1085' 92'
    end
    object Edit3: TEdit
      Left = 80
      Top = 56
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '50'
      OnKeyPress = Edit12KeyPress
    end
    object Edit4: TEdit
      Left = 80
      Top = 80
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '100'
      OnKeyPress = Edit12KeyPress
    end
    object Edit5: TEdit
      Left = 80
      Top = 104
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '1'
      OnKeyPress = Edit12KeyPress
    end
    object Edit6: TEdit
      Left = 80
      Top = 128
      Width = 49
      Height = 21
      TabOrder = 4
      Text = '35'
      OnKeyPress = Edit12KeyPress
    end
    object Edit7: TEdit
      Left = 80
      Top = 152
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '18'
      OnKeyPress = Edit12KeyPress
    end
    object Edit9: TEdit
      Left = 80
      Top = 176
      Width = 49
      Height = 21
      TabOrder = 6
      Text = '0,001'
      OnKeyPress = Edit12KeyPress
    end
    object Edit10: TEdit
      Left = 80
      Top = 200
      Width = 49
      Height = 21
      TabOrder = 7
      Text = '1000'
      OnKeyPress = Edit12KeyPress
    end
    object Edit11: TEdit
      Left = 80
      Top = 224
      Width = 49
      Height = 21
      TabOrder = 8
      Text = '15'
      OnKeyPress = Edit12KeyPress
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 32
      Width = 49
      Height = 22
      Style = csOwnerDrawVariable
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 9
      Text = '92'
      Items.Strings = (
        '92'
        '95'
        '98'
        '80')
    end
    object Edit12: TEdit
      Left = 80
      Top = 248
      Width = 49
      Height = 21
      TabOrder = 10
      Text = '80'
      OnKeyPress = Edit12KeyPress
    end
    object Edit13: TEdit
      Left = 112
      Top = 272
      Width = 49
      Height = 21
      TabOrder = 11
      Text = '80'
      OnKeyPress = Edit12KeyPress
    end
  end
end
