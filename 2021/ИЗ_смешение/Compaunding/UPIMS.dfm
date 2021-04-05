object FPIMS: TFPIMS
  Left = 367
  Top = 206
  Width = 231
  Height = 141
  Caption = #1047#1072#1087#1088#1086#1089' '#1076#1072#1085#1085#1099#1093' PIMS'
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
  end
  object BtOK: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 0
    OnClick = BtOKClick
  end
  object BtCancel: TButton
    Left = 104
    Top = 64
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = BtCancelClick
  end
  object CBPeriod: TComboBox
    Left = 8
    Top = 24
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object EA1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 176
    Top = 48
  end
  object OD1: TOpenDialog
    Filter = 'Excel|*.xls;*.xlsx'
    Left = 176
    Top = 80
  end
end
