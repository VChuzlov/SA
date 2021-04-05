object ResultDBForm: TResultDBForm
  Left = 238
  Top = 88
  BorderStyle = bsSingle
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
  ClientHeight = 572
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 161
    Height = 121
    Caption = #1043#1088#1072#1092#1080#1082#1080
    TabOrder = 0
    object CheckBox1: TCheckBox
      Tag = 1
      Left = 8
      Top = 16
      Width = 140
      Height = 17
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100
      Checked = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Tag = 2
      Left = 8
      Top = 32
      Width = 140
      Height = 17
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100#1085#1072#1103' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100'.'
      Checked = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Tag = 3
      Left = 8
      Top = 48
      Width = 140
      Height = 17
      Caption = #1050#1086#1082#1089' '#1085#1072' '#1082#1072#1090#1072#1083#1080#1079#1072#1090#1086#1088#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Tag = 4
      Left = 8
      Top = 64
      Width = 140
      Height = 17
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1076#1077#1079#1072#1082#1090#1080#1074#1072#1094#1080#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = CheckBox4Click
    end
    object CheckBox5: TCheckBox
      Tag = 5
      Left = 8
      Top = 80
      Width = 140
      Height = 17
      Caption = #1042#1099#1093#1086#1076' '#1088#1080#1092#1086#1088#1084#1072#1090#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = CheckBox5Click
    end
    object CheckBox6: TCheckBox
      Tag = 6
      Left = 8
      Top = 96
      Width = 140
      Height = 17
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1082#1090#1072#1085#1086#1090#1086#1085#1085
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = CheckBox6Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 136
    Width = 161
    Height = 89
    Caption = #1044#1072#1090#1099':'
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 18
      Width = 16
      Height = 19
      Caption = #1086#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 49
      Width = 16
      Height = 19
      Caption = #1076#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object from: TDateTimePicker
      Left = 28
      Top = 18
      Width = 93
      Height = 21
      Date = 36675.553592939800000000
      Time = 36675.553592939800000000
      TabOrder = 0
      OnChange = fromChange
    end
    object till: TDateTimePicker
      Left = 28
      Top = 49
      Width = 93
      Height = 21
      Date = 36675.553671180600000000
      Time = 36675.553671180600000000
      TabOrder = 1
      OnChange = tillChange
    end
  end
  object PageControl1: TPageControl
    Left = 188
    Top = 0
    Width = 603
    Height = 572
    ActivePage = TabSheet2
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1086#1076#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
      DesignSize = (
        595
        544)
      object Button4: TButton
        Left = 10
        Top = 502
        Width = 153
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
        TabOrder = 0
        OnClick = Button4Click
      end
      object BitBtn1: TBitBtn
        Left = 505
        Top = 502
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object ResTab: TStringGrid
        Left = 0
        Top = 0
        Width = 595
        Height = 485
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 7
        DefaultColWidth = 115
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        ParentFont = False
        TabOrder = 2
        RowHeights = (
          20
          20)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1088#1072#1092#1080#1082#1080
      ImageIndex = 1
      DesignSize = (
        595
        544)
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 595
        Height = 485
        AnimatedZoomSteps = 20
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Color = clWhite
        Gradient.Direction = gdRightLeft
        Gradient.EndColor = clWhite
        Gradient.Visible = True
        PrintProportional = False
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Title.Text.Strings = (
          ''
          ''
          '')
        BackColor = clWhite
        BottomAxis.DateTimeFormat = 'dd.MM.yy'
        BottomAxis.Increment = 30.000000000000000000
        BottomAxis.LabelsAngle = 335
        BottomAxis.LabelsFont.Charset = RUSSIAN_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'MS Serif'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsSeparation = 0
        BottomAxis.LabelStyle = talText
        BottomAxis.MinorTickLength = 3
        BottomAxis.TickLength = 3
        BottomAxis.Title.Caption = #1044#1072#1090#1072' '#1086#1090#1073#1086#1088#1072':'
        BottomAxis.Title.Font.Charset = RUSSIAN_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -19
        BottomAxis.Title.Font.Name = 'Times New Roman'
        BottomAxis.Title.Font.Style = []
        BottomAxis.TitleSize = 10
        LeftAxis.AxisValuesFormat = '#0.###'
        LeftAxis.DateTimeFormat = 'dd.MM.yy'
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsFont.Charset = RUSSIAN_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'MS Serif'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.RoundFirstLabel = False
        LeftAxis.Title.Font.Charset = RUSSIAN_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'MS Sans Serif'
        LeftAxis.Title.Font.Style = [fsBold, fsItalic]
        LeftAxis.TitleSize = 10
        Legend.Alignment = laBottom
        Legend.LegendStyle = lsSeries
        Legend.TextStyle = ltsPlain
        RightAxis.TitleSize = 10
        TopAxis.DateTimeFormat = 'dd.MM.yy'
        TopAxis.ExactDateTime = False
        TopAxis.TitleSize = 10
        View3D = False
        Align = alTop
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clBlack
          Title = #1058#1077#1082#1091#1097#1072#1103' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100', '#1091'.'#1077'.'
          ValueFormat = '#0.###'
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 65408
          Pointer.Pen.Visible = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          object TeeFunction1: TAddTeeFunction
          end
        end
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          Title = #1054#1087#1090#1080#1084#1072#1083#1100#1085#1072#1103' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100', '#1091'.'#1077'.'
          ValueFormat = '#0.###'
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 65408
          Pointer.Pen.Visible = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          object TeeFunction2: TAddTeeFunction
          end
        end
        object Series5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clBlue
          Title = #1050#1086#1082#1089' '#1085#1072' '#1082#1072#1090#1072#1083#1080#1079#1072#1090#1086#1088#1077', % '#1084#1072#1089#1089'.'
          ValueFormat = '#0.###'
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 65408
          Pointer.Pen.Visible = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          object TeeFunction3: TAddTeeFunction
          end
        end
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clGreen
          Title = #1057#1082#1086#1088#1086#1089#1090#1100' '#1076#1077#1079#1072#1082#1090#1080#1074#1072#1094#1080#1080', '#1075#1088#1072#1076'./'#1090'.'#1089#1099#1088#1100#1103'/'#1090'.'#1082#1072#1090'.'
          ValueFormat = '#0.###'
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 65408
          Pointer.Pen.Visible = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          object TeeFunction4: TAddTeeFunction
          end
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clPurple
          Title = #1042#1099#1093#1086#1076' '#1088#1080#1092#1086#1088#1084#1072#1090#1072', %.'
          ValueFormat = '#0.###'
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 65408
          Pointer.Pen.Visible = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          object TeeFunction5: TAddTeeFunction
          end
        end
        object Series6: TLineSeries
          Marks.ArrowLength = 8
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = 33023
          Title = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1082#1090#1072#1085#1086#1090#1086#1085#1085
          ValueFormat = '#0.###'
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 65408
          Pointer.Pen.Visible = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          object TeeFunction6: TAddTeeFunction
          end
        end
      end
      object Finita: TButton
        Left = 505
        Top = 502
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = FinitaClick
      end
      object Button5: TButton
        Left = 112
        Top = 502
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1055#1077#1095#1072#1090#1100
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button9: TButton
        Left = 16
        Top = 502
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 3
        OnClick = Button9Click
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 192
    Top = 32
  end
end
