object FPlan: TFPlan
  Left = 250
  Top = 129
  Width = 928
  Height = 534
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 475
    Align = alLeft
    Caption = #1057#1087#1080#1089#1086#1082' '#1076#1085#1077#1081
    TabOrder = 0
    object Splitter3: TSplitter
      Left = 2
      Top = 272
      Width = 181
      Height = 16
      Cursor = crVSplit
      Align = alBottom
    end
    object LBDay: TListBox
      Left = 2
      Top = 15
      Width = 181
      Height = 257
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = LBDayClick
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 288
      Width = 181
      Height = 185
      Align = alBottom
      Caption = #1059#1089#1083#1086#1074#1080#1103
      TabOrder = 1
      object ListBoxUsl: TListBox
        Left = 2
        Top = 15
        Width = 177
        Height = 168
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = ListBoxUslDblClick
      end
    end
  end
  object Panel1: TPanel
    Left = 185
    Top = 0
    Width = 727
    Height = 475
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 153
      Width = 725
      Height = 20
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter2: TSplitter
      Left = 1
      Top = 334
      Width = 725
      Height = 20
      Cursor = crVSplit
      Align = alBottom
    end
    object SG1: TStringGrid
      Left = 1
      Top = 1
      Width = 725
      Height = 152
      Align = alTop
      TabOrder = 0
      OnDblClick = SG1DblClick
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object SG2: TStringGrid
      Left = 1
      Top = 173
      Width = 725
      Height = 161
      Align = alClient
      TabOrder = 1
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object SGUser: TStringGrid
      Left = 1
      Top = 354
      Width = 725
      Height = 120
      Align = alBottom
      TabOrder = 2
      OnDblClick = SGUserDblClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 185
    Top = 80
    object N1: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090
      object N2: TMenuItem
        Caption = #1055#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1088#1072#1089#1095#1077#1090
        OnClick = N2Click
      end
    end
  end
end
