object FGrupp: TFGrupp
  Left = 469
  Top = 381
  Width = 462
  Height = 310
  Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1090#1086#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 231
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 357
      Top = 1
      Width = 88
      Height = 183
      Align = alRight
      TabOrder = 0
      object Button1: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'...'
        TabOrder = 0
        OnClick = Button1Click
      end
      object ListBox1: TListBox
        Left = 0
        Top = 192
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
    end
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 356
      Height = 183
      Align = alClient
      ColCount = 2
      DefaultColWidth = 120
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 1
      OnDrawCell = StringGrid1DrawCell
      OnKeyPress = StringGrid1KeyPress
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 184
      Width = 444
      Height = 46
      Align = alBottom
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1090#1086#1082#1072
      TabOrder = 2
      object Edit1: TEdit
        Left = 8
        Top = 16
        Width = 425
        Height = 21
        TabOrder = 0
        Text = #1053#1086#1074#1099#1081' '#1087#1086#1090#1086#1082
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 231
    Width = 446
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 360
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object OD1: TOpenDialog
    Filter = 
      #1057#1086#1089#1090#1072#1074' '#1089#1099#1088#1100#1103' '#1082#1086#1084#1087#1072#1091#1085#1076#1080#1088#1086#1074#1072#1085#1080#1103'|*.sfc|'#1057#1086#1089#1090#1072#1074' '#1089#1099#1088#1100#1103' '#1088#1080#1092#1086#1088#1084#1080#1085#1075'|*.sk|' +
      #1057#1086#1089#1090#1072#1074' '#1082#1072#1090#1072#1083#1080#1079#1072#1090#1072' '#1088#1080#1092#1086#1088#1084#1080#1085#1075'|*.sk'
    Left = 80
    Top = 239
  end
  object SD1: TSaveDialog
    Left = 112
    Top = 239
  end
end
