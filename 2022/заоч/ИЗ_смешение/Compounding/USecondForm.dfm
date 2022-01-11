object SecondForm: TSecondForm
  Left = 333
  Top = 314
  BorderStyle = bsDialog
  Caption = 'SecondForm'
  ClientHeight = 85
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 56
    Top = 56
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 168
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
  object EditResult: TEdit
    Left = 24
    Top = 29
    Width = 265
    Height = 21
    TabOrder = 0
    OnKeyPress = EditResultKeyPress
  end
end
