object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Blending application'
  ClientHeight = 763
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 449
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 742
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 859
      Height = 19
      Align = alTop
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 153
    end
    object StringGrid1: TStringGrid
      Left = 1
      Top = 20
      Width = 859
      Height = 428
      Align = alClient
      ColCount = 8
      DefaultColWidth = 100
      RowCount = 65
      TabOrder = 0
      ExplicitWidth = 740
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 449
    Width = 861
    Height = 64
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 454
    object Label2: TLabel
      Left = 1
      Top = 24
      Width = 245
      Height = 19
      Caption = #1058#1088#1077#1073#1091#1077#1084#1086#1077' '#1086#1082#1090#1072#1085#1086#1074#1086#1077' '#1095#1080#1089#1083#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 387
      Top = 24
      Width = 10
      Height = 19
      Caption = 'h'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 547
      Top = 24
      Width = 28
      Height = 19
      Caption = 'eps'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 252
      Top = 24
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
    object Button1: TButton
      Left = 752
      Top = 24
      Width = 75
      Height = 25
      Caption = #1056#1072#1089#1095#1077#1090
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 403
      Top = 24
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      Text = '5e-6'
    end
    object Edit3: TEdit
      Left = 593
      Top = 24
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 3
      Text = '5e-2'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 513
    Width = 861
    Height = 250
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 192
    ExplicitTop = 568
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 859
      Height = 19
      Align = alTop
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 170
    end
    object StringGrid2: TStringGrid
      Left = 1
      Top = 20
      Width = 859
      Height = 229
      Align = alClient
      ColCount = 2
      DefaultColWidth = 100
      RowCount = 8
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 26
      ExplicitWidth = 320
      ExplicitHeight = 120
    end
  end
  object MainMenu1: TMainMenu
    Left = 720
    Top = 16
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        OnClick = N2Click
      end
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 608
  end
end
