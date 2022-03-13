object basadan: Tbasadan
  Left = 206
  Top = 123
  Width = 657
  Height = 398
  BorderIcons = []
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMinimized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Prob: TLabel
    Left = 176
    Top = 8
    Width = 103
    Height = 22
    Caption = #1050#1072#1090#1072#1083#1080#1079#1072#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 296
    Top = 48
    Width = 305
    Height = 65
    AutoSize = False
    Caption = 
      #1060#1088#1072#1082#1094#1080#1086#1085#1085#1099#1081' '#1089#1086#1089#1090#1072#1074' '#1080' '#1087#1083#1086#1090#1085#1086#1089#1090#1100'  '#1076#1083#1103' '#1074#1074#1077#1076#1077#1085#1085#1086#1075#1086' '#1091#1075#1083#1077#1074#1086#1076#1086#1088#1086#1076#1085#1086#1075#1086' '#1089 +
      #1086#1089#1090#1072#1074#1072' '#1089#1099#1088#1100#1103', '#1074' 0'#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 296
    Top = 120
    Width = 22
    Height = 19
    Caption = #1053#1050
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 352
    Top = 120
    Width = 29
    Height = 19
    Caption = '10%'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 408
    Top = 120
    Width = 29
    Height = 19
    Caption = '50%'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 464
    Top = 120
    Width = 29
    Height = 19
    Caption = '90%'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 520
    Top = 120
    Width = 22
    Height = 19
    Caption = #1050#1050
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 480
    Top = 184
    Width = 49
    Height = 19
    Caption = 'p,'#1075'/'#1089#1084'3'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 304
    Top = 184
    Width = 88
    Height = 19
    Caption = #1056#1072#1089#1093#1086#1076' '#1084'3/'#1095'.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 72
    Top = 328
    Width = 64
    Height = 22
    Caption = #1057#1091#1084#1084#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Sum: TLabel
    Left = 208
    Top = 328
    Width = 55
    Height = 22
    Caption = '00,000'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object List: TListBox
    Left = 8
    Top = 88
    Width = 265
    Height = 225
    ExtendedSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 15
    Items.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
    OnDblClick = ListClick
    OnKeyDown = ListKeyDown
  end
  object Subst: TEdit
    Left = 8
    Top = 48
    Width = 185
    Height = 27
    AutoSize = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 43
    ParentFont = False
    TabOrder = 1
    OnChange = SubstChange
    OnClick = SubstEnter
    OnExit = SubstExit
    OnKeyDown = SubstOnKeyDown
  end
  object weight: TEdit
    Left = 208
    Top = 48
    Width = 65
    Height = 27
    AutoSize = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 2
    Text = '00.000'
    OnClick = weightClick
    OnExit = weightexit
    OnKeyDown = OnKeyDown
  end
  object Next: TButton
    Left = 544
    Top = 336
    Width = 75
    Height = 25
    Caption = #1044#1072#1083#1077#1077
    TabOrder = 12
    OnClick = NextClick
  end
  object F1: TEdit
    Left = 296
    Top = 136
    Width = 40
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 3
    Text = ' 86'
  end
  object F2: TEdit
    Left = 352
    Top = 136
    Width = 40
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 4
    Text = ' 96'
  end
  object F3: TEdit
    Left = 408
    Top = 136
    Width = 40
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 5
    Text = '113'
  end
  object F4: TEdit
    Left = 464
    Top = 136
    Width = 40
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 6
    Text = '152'
  end
  object F5: TEdit
    Left = 520
    Top = 136
    Width = 40
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 7
    Text = '175'
  end
  object F6: TEdit
    Left = 536
    Top = 176
    Width = 57
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 8
    Text = '0.7300'
  end
  object F7: TEdit
    Left = 408
    Top = 176
    Width = 57
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 9
    Text = '1500'
  end
  object Animate1: TAnimate
    Left = 304
    Top = 64
    Width = 272
    Height = 60
    CommonAVI = aviCopyFiles
    StopFrame = 34
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 216
    Width = 75
    Height = 41
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 10
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 280
    Top = 272
    Width = 105
    Height = 25
    Hint = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099', '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1082#1086#1090#1086#1088#1099#1093' '#1088#1072#1074#1085#1086' 0'
    Caption = #1059#1073#1088#1072#1090#1100' '#1083#1080#1096#1085#1077#1077
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = Button1Click
  end
  object BitBtn2: TBitBtn
    Left = 384
    Top = 216
    Width = 75
    Height = 41
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 14
    OnClick = SaveClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object cans: TButton
    Left = 424
    Top = 336
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 15
    OnClick = cansClick
  end
  object Cod: TRadioGroup
    Left = 488
    Top = 208
    Width = 129
    Height = 65
    Caption = #1042#1080#1076' '#1082#1086#1076#1080#1088#1086#1074#1082#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Windows'
      'Dos')
    ParentFont = False
    TabOrder = 16
    OnClick = CodClick
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1076#1072#1085#1085#1099#1093
    Left = 320
    Top = 16
  end
  object Sav: TSaveDialog
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 392
    Top = 16
  end
end
