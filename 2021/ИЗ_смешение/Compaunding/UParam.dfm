object FormParam: TFormParam
  Left = 207
  Top = 159
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 247
  ClientWidth = 395
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 395
    Height = 247
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      object RGSourse: TRadioGroup
        Left = 0
        Top = 0
        Width = 153
        Height = 81
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1076#1072#1085#1085#1099#1093
        Items.Strings = (
          #1060#1072#1081#1083
          #1042#1085#1091#1090#1088#1077#1085#1103#1103' '#1073#1072#1079#1072' Ini'
          #1042#1085#1091#1090#1088#1077#1085#1103#1103' '#1073#1072#1079#1072' Access')
        TabOrder = 0
        OnClick = RGSourseClick
      end
    end
  end
end
