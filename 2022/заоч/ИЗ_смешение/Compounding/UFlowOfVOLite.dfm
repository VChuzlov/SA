object FormFlowofOVLite: TFormFlowofOVLite
  Left = 378
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1086#1086#1090#1085#1086#1096#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1086#1074' '#1086#1090' '#1082#1086#1085#1077#1095#1085#1086#1075#1086' '#1054#1063
  ClientHeight = 313
  ClientWidth = 624
  Color = 10400143
  Constraints.MaxHeight = 352
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 335
  Constraints.MinWidth = 624
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NB: TNotebook
    Left = 0
    Top = 0
    Width = 624
    Height = 253
    Align = alClient
    Color = clBtnFace
    PageIndex = 5
    ParentColor = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = #1042#1099#1073#1086#1088' '#1087#1086#1090#1086#1082#1086#1074
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 253
        Align = alClient
        TabOrder = 0
        object ListBoxAllFlow: TListBox
          Left = 1
          Top = 33
          Width = 232
          Height = 219
          Align = alLeft
          ItemHeight = 13
          PopupMenu = PMFlow
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 233
          Top = 33
          Width = 143
          Height = 219
          Align = alClient
          TabOrder = 1
          DesignSize = (
            143
            219)
          object SpeedButtonInSelectFlow: TSpeedButton
            Left = 47
            Top = 36
            Width = 57
            Height = 49
            Anchors = []
            Caption = '>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButtonInSelectFlowClick
          end
          object SpeedButtonInAllFlow: TSpeedButton
            Left = 47
            Top = 90
            Width = 57
            Height = 49
            Anchors = []
            Caption = '<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButtonInAllFlowClick
          end
        end
        object ListBoxSelectFlow: TListBox
          Left = 376
          Top = 33
          Width = 247
          Height = 219
          Align = alRight
          ItemHeight = 13
          TabOrder = 2
        end
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 622
          Height = 32
          Align = alTop
          TabOrder = 3
          object Panel12: TPanel
            Left = 376
            Top = 1
            Width = 245
            Height = 30
            Align = alRight
            TabOrder = 0
            object Label3: TLabel
              Left = 86
              Top = 6
              Width = 97
              Height = 13
              Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1090#1086#1082#1080
            end
          end
          object Panel13: TPanel
            Left = 1
            Top = 1
            Width = 232
            Height = 30
            Align = alLeft
            TabOrder = 1
            object Label2: TLabel
              Left = 54
              Top = -1
              Width = 114
              Height = 13
              Caption = #1042#1089#1077' '#1076#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1090#1086#1082#1080
            end
            object BitBtn1: TBitBtn
              Left = 34
              Top = 12
              Width = 62
              Height = 17
              Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'...'
              TabOrder = 0
              OnClick = BitBtn1Click
            end
            object btCreate: TButton
              Left = 156
              Top = -3
              Width = 57
              Height = 17
              Caption = #1057#1086#1079#1076#1072#1090#1100'...'
              TabOrder = 1
              Visible = False
              OnClick = btCreateClick
            end
            object btSave: TButton
              Left = 188
              Top = -4
              Width = 94
              Height = 17
              Caption = #1055#1077#1088#1077#1089#1086#1093#1088#1072#1085#1080#1090#1100'...'
              TabOrder = 2
              Visible = False
              OnClick = btSaveClick
            end
            object Button4: TButton
              Left = 118
              Top = 13
              Width = 67
              Height = 17
              Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = Button4Click
            end
          end
          object Panel14: TPanel
            Left = 233
            Top = 1
            Width = 143
            Height = 30
            Align = alClient
            TabOrder = 2
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #1047#1072#1076#1072#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1087#1086#1090#1086#1082#1086#1074
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 253
        Align = alClient
        TabOrder = 0
        object ListBoxEndSelectFlow: TListBox
          Left = 1
          Top = 33
          Width = 176
          Height = 219
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
          OnClick = ListBoxEndSelectFlowClick
        end
        object Panel5: TPanel
          Left = 177
          Top = 33
          Width = 159
          Height = 219
          Align = alClient
          TabOrder = 1
          object Label5: TLabel
            Left = 8
            Top = 8
            Width = 103
            Height = 13
            Caption = #1052#1072#1089#1089#1072' '#1087#1086#1090#1086#1082#1072', '#1090#1086#1085#1085'.'
          end
          object Label15: TLabel
            Left = 8
            Top = 88
            Width = 67
            Height = 13
            Caption = #1050#1086#1085#1077#1095#1085#1086#1077' '#1054#1063
            Visible = False
          end
          object Label16: TLabel
            Left = 80
            Top = 88
            Width = 80
            Height = 13
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', C'
            Visible = False
          end
          object Label29: TLabel
            Left = 8
            Top = 48
            Width = 88
            Height = 13
            Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073'/'#1090
          end
          object EditExpendFlow: TEdit
            Left = 8
            Top = 24
            Width = 65
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = EditExpendFlowChange
            OnKeyPress = EditExpendFlowKeyPress
          end
          object EditNeedOV: TEdit
            Left = 8
            Top = 104
            Width = 65
            Height = 21
            TabOrder = 1
            Text = '80'
            Visible = False
            OnKeyPress = EditExpendFlowKeyPress
          end
          object RG_ON: TRadioGroup
            Left = 4
            Top = 136
            Width = 141
            Height = 65
            Caption = #1052#1077#1090#1086#1076' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103' '#1054#1063
            ItemIndex = 1
            Items.Strings = (
              #1052#1086#1090#1086#1088#1085#1099#1081
              #1048#1089#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1081)
            TabOrder = 2
          end
          object EditTempFlow: TEdit
            Left = 80
            Top = 104
            Width = 81
            Height = 21
            TabOrder = 3
            Text = '38'
            Visible = False
            OnChange = EditTempFlowChange
            OnKeyPress = EditExpendFlowKeyPress
          end
          object EdPrice: TEdit
            Left = 8
            Top = 64
            Width = 121
            Height = 21
            TabOrder = 4
            Text = '0'
            OnChange = EdPriceChange
            OnKeyPress = EdPriceKeyPress
          end
        end
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 622
          Height = 32
          Align = alTop
          TabOrder = 2
          object Panel16: TPanel
            Left = 336
            Top = 1
            Width = 285
            Height = 30
            Align = alRight
            Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1086#1090#1086#1082#1072
            TabOrder = 0
            object BtSaveAs: TBitBtn
              Left = 2
              Top = 1
              Width = 25
              Height = 25
              Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
              ParentShowHint = False
              PopupMenu = PMSave
              ShowHint = True
              TabOrder = 0
              OnClick = BtSaveAsClick
              Glyph.Data = {
                2E060000424D2E06000000000000360400002800000015000000150000000100
                080000000000F801000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                0707070707070707070707070707070000000707070707070707070707070707
                0707070707070700000007070707070707070707070707070707070707070700
                0000070707070707A4A4A4A4A4A4A4A4A4A4A4A4A40707000000070707070700
                000000000000000000000000A407070000000707070700030300000000000007
                07000300A40707000000070707070003030000000000000707000300A4070700
                0000070707070003030000000000000707000300A40707000000070707070003
                030000000000000000000300A407070000000707070700030303030303030303
                03030300A40707000000070707070003030000000000000000030300A4070700
                0000070707070003000707070707070707000300A40707000000070707070003
                000707070707070707000300A407070000000707070700030007070707070707
                07000300A40707000000070707070003000707070707070707000300A4070700
                0000070707070003000707070707070707000000A40707000000070707070003
                000707070707070707000700A407070000000707070700000000000000000000
                0000000007070700000007070707070707070707070707070707070707070700
                0000070707070707070707070707070707070707070707000000070707070707
                070707070707070707070707070707000000}
            end
            object ButtonStructure: TBitBtn
              Left = 33
              Top = 1
              Width = 25
              Height = 25
              Hint = #1054#1090#1082#1088#1099#1090#1100'...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = ButtonStructureClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000008080000080000000800080000080800080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888000000000008888800333333333088880B033333333308880FB033333333
                30880BFB0333333333080FBFB000000000000BFBFBFBFB0888880FBFBFBFBF08
                88880BFB00000008888880008888888800088888888888888008888888880888
                0808888888888000888888888888888888888888888888888888}
            end
            object BtPravilo: TBitBtn
              Left = 64
              Top = 1
              Width = 25
              Height = 25
              Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1072#1074#1080#1083#1086'...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = BtPraviloClick
              Glyph.Data = {
                66010000424D6601000000000000760000002800000015000000140000000100
                040000000000F000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333339003333333333333333003334003333333333333330F00334003333
                33333333330F0003300033333333333330F00033300033333333333300000333
                3C00333333333330F0003333380033333333330F0003333330003333333330F0
                003333333700333333330F0003333333370033333330F000333333333F003333
                330F0003333333333700333330F00033333333333F0033330F00033333333333
                37003330F0003333333333333700333000033333333333333000330F00333333
                3333333337003300333333333333333337003033333333333333333337003333
                33333333333333333700}
            end
          end
          object Panel17: TPanel
            Left = 1
            Top = 1
            Width = 176
            Height = 30
            Align = alLeft
            Caption = #1055#1086#1090#1086#1082
            TabOrder = 1
            object BtNull: TButton
              Left = 112
              Top = 8
              Width = 51
              Height = 17
              Caption = #1054#1073#1085#1091#1083#1080#1090#1100
              TabOrder = 0
              OnClick = BtNullClick
            end
          end
          object Panel18: TPanel
            Left = 177
            Top = 1
            Width = 159
            Height = 30
            Align = alClient
            TabOrder = 2
            object BitBtnRVS: TBitBtn
              Left = 8
              Top = 0
              Width = 75
              Height = 25
              Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099'...'
              TabOrder = 0
              OnClick = BitBtnRVSClick
            end
            object BtPIMS: TButton
              Left = 90
              Top = 14
              Width = 67
              Height = 15
              Caption = #1048#1079' PIMS'
              TabOrder = 1
              OnClick = BtPIMSClick
            end
            object BtSOAP: TButton
              Left = 91
              Top = -2
              Width = 65
              Height = 17
              Caption = #1055#1086' SOAP'
              TabOrder = 2
              OnClick = BtSOAPClick
            end
          end
        end
        object PCStrFlow: TPageControl
          Left = 336
          Top = 33
          Width = 287
          Height = 219
          ActivePage = TabSheet1
          Align = alRight
          MultiLine = True
          ScrollOpposite = True
          Style = tsFlatButtons
          TabOrder = 3
          object TabSheet1: TTabSheet
            Caption = #1057#1086#1089#1090#1072#1074
            object StringGridStructureOfFlow: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              PopupMenu = PMStrFlow
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              TabOrder = 2
              object Label31: TLabel
                Left = 16
                Top = 16
                Width = 56
                Height = 13
                Caption = #1040#1088#1086#1084#1072#1090#1080#1082#1072
              end
              object Label32: TLabel
                Left = 120
                Top = 16
                Width = 40
                Height = 13
                Caption = '% '#1084#1072#1089#1089'.'
              end
              object Label33: TLabel
                Left = 16
                Top = 64
                Width = 48
                Height = 13
                Caption = #1054#1083#1077#1092#1080#1085#1099
              end
              object Label34: TLabel
                Left = 120
                Top = 64
                Width = 40
                Height = 13
                Caption = '% '#1084#1072#1089#1089'.'
              end
              object Label35: TLabel
                Left = 16
                Top = 88
                Width = 25
                Height = 13
                Caption = #1057#1077#1088#1072
              end
              object Label36: TLabel
                Left = 120
                Top = 88
                Width = 40
                Height = 13
                Caption = '% '#1084#1072#1089#1089'.'
              end
              object Label37: TLabel
                Left = 16
                Top = 40
                Width = 37
                Height = 13
                Caption = #1041#1077#1085#1079#1086#1083
              end
              object Label38: TLabel
                Left = 120
                Top = 40
                Width = 40
                Height = 13
                Caption = '% '#1084#1072#1089#1089'.'
              end
              object Label39: TLabel
                Left = 16
                Top = 112
                Width = 16
                Height = 13
                Caption = #1054#1063
              end
              object Label40: TLabel
                Left = 128
                Top = 112
                Width = 64
                Height = 13
                Caption = #1053#1077#1072#1076#1076'. Bsum'
              end
              object EdArom: TEdit
                Left = 80
                Top = 13
                Width = 33
                Height = 21
                TabOrder = 0
                Text = '35'
                OnChange = EdAromChange
                OnKeyPress = EditExpendFlowKeyPress
              end
              object EdOlef: TEdit
                Left = 80
                Top = 61
                Width = 33
                Height = 21
                TabOrder = 1
                Text = '10'
                OnChange = EdOlefChange
                OnKeyPress = EditExpendFlowKeyPress
              end
              object EdSera: TEdit
                Left = 80
                Top = 85
                Width = 33
                Height = 21
                TabOrder = 2
                Text = '0,001'
                OnChange = EdSeraChange
                OnKeyPress = EditExpendFlowKeyPress
              end
              object EdBenz: TEdit
                Left = 80
                Top = 37
                Width = 33
                Height = 21
                TabOrder = 3
                Text = '1'
                OnChange = EdBenzChange
                OnKeyPress = EditExpendFlowKeyPress
              end
              object EdOV: TEdit
                Left = 80
                Top = 109
                Width = 33
                Height = 21
                TabOrder = 4
                Text = '90'
                OnChange = EdOVChange
                OnKeyPress = EditExpendFlowKeyPress
              end
              object EdBsum: TEdit
                Left = 200
                Top = 109
                Width = 33
                Height = 21
                TabOrder = 5
                Text = '-1'
                OnChange = EdBsumChange
                OnKeyPress = EditExpendFlowKeyPress
              end
            end
            object RGVidDolej: TRadioGroup
              Left = 0
              Top = 136
              Width = 279
              Height = 19
              Caption = #1042#1080#1076' '#1076#1086#1083#1077#1081
              ItemIndex = 0
              Items.Strings = (
                #1052#1072#1089#1089#1086#1074#1099#1077' '#1076#1086#1083#1080
                #1054#1073#1098#1077#1084#1085#1099#1077' '#1076#1086#1083#1080)
              TabOrder = 1
              Visible = False
              OnClick = RGVidDolejClick
            end
          end
          object TabSheet2: TTabSheet
            Caption = #1054#1063#1052
            ImageIndex = 1
            object StringGridMotON: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet3: TTabSheet
            Caption = #1054#1063#1048
            ImageIndex = 2
            object StringGridResON: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet6: TTabSheet
            Hint = #1054#1090#1085#1086#1089#1103#1090#1089#1103' '#1082' '#1086#1073#1097#1077#1084#1091' '#1087#1086#1090#1086#1082#1091
            Caption = #1054#1075#1088#1072#1085'-'#1103
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            TabVisible = False
            object StringGridGOST: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 168
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet7: TTabSheet
            Caption = #1050#1086#1101#1092'. B'
            ImageIndex = 4
            object StringGridCoefB: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'Ro20'
            ImageIndex = 5
            object StringGridRo20: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet9: TTabSheet
            Caption = 'TemKip'
            ImageIndex = 6
            object StringGridTemKip: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet10: TTabSheet
            Caption = 'DNP_A'
            ImageIndex = 7
            object StringGridDNP_A: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet11: TTabSheet
            Caption = 'DNP_B'
            ImageIndex = 8
            object StringGridDNP_B: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet12: TTabSheet
            Caption = 'DNP_C'
            ImageIndex = 9
            object StringGridDNP_C: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 150
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet13: TTabSheet
            Caption = #1052#1086#1083'.'#1084#1072#1089'.'
            ImageIndex = 10
            object StringGridMolarMass: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet14: TTabSheet
            Caption = 'MuA'
            ImageIndex = 11
            object StringGridMuA: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 150
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
          object TabSheet15: TTabSheet
            Caption = 'MuB'
            ImageIndex = 12
            object StringGridMuB: TStringGrid
              Left = 0
              Top = 0
              Width = 279
              Height = 155
              Align = alClient
              ColCount = 2
              DefaultColWidth = 140
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnKeyPress = EditExpendFlowKeyPress
              OnSetEditText = StringGridStructureOfFlowSetEditText
              RowHeights = (
                24
                24)
            end
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #1047#1072#1076#1072#1085#1080#1077' '#1087#1088#1080#1089#1072#1076#1086#1082
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 253
        Align = alClient
        TabOrder = 0
        object ListBoxAllAdditive: TListBox
          Left = 1
          Top = 42
          Width = 240
          Height = 210
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
        end
        object Panel7: TPanel
          Left = 241
          Top = 42
          Width = 135
          Height = 210
          Align = alClient
          TabOrder = 1
          DesignSize = (
            135
            210)
          object SpeedButtonInSelectAdditive: TSpeedButton
            Left = 33
            Top = 34
            Width = 57
            Height = 49
            Anchors = []
            Caption = '>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButtonInSelectAdditiveClick
          end
          object SpeedButtonInAllAdditive: TSpeedButton
            Left = 33
            Top = 114
            Width = 57
            Height = 49
            Anchors = []
            Caption = '<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButtonInAllAdditiveClick
          end
        end
        object ListBoxSelectAdditive: TListBox
          Left = 376
          Top = 42
          Width = 247
          Height = 210
          Align = alRight
          ItemHeight = 13
          TabOrder = 2
        end
        object Panel21: TPanel
          Left = 1
          Top = 1
          Width = 622
          Height = 41
          Align = alTop
          TabOrder = 3
          object Panel20: TPanel
            Left = 1
            Top = 1
            Width = 240
            Height = 39
            Align = alLeft
            TabOrder = 0
            object Label4: TLabel
              Left = 56
              Top = 2
              Width = 127
              Height = 13
              Caption = #1042#1089#1077' '#1076#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1088#1080#1089#1072#1076#1082#1080
            end
            object BitBtn2: TBitBtn
              Left = 83
              Top = 20
              Width = 75
              Height = 17
              Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'...'
              TabOrder = 0
              OnClick = BitBtn2Click
            end
            object BitBtn4: TBitBtn
              Left = 5
              Top = 20
              Width = 75
              Height = 17
              Caption = #1057#1086#1079#1076#1072#1090#1100'...'
              TabOrder = 1
              OnClick = BitBtn4Click
            end
            object BitBtn3: TBitBtn
              Left = 161
              Top = 20
              Width = 75
              Height = 17
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
              TabOrder = 2
              OnClick = BitBtn3Click
            end
          end
          object Panel19: TPanel
            Left = 376
            Top = 1
            Width = 245
            Height = 39
            Align = alRight
            Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1088#1080#1089#1072#1076#1082#1080
            TabOrder = 1
          end
          object Panel22: TPanel
            Left = 241
            Top = 1
            Width = 135
            Height = 39
            Align = alClient
            TabOrder = 2
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1080#1089#1072#1076#1086#1082
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 253
        Align = alClient
        TabOrder = 0
        object Label10: TLabel
          Left = 8
          Top = 8
          Width = 50
          Height = 13
          Caption = #1055#1088#1080#1089#1072#1076#1082#1072
        end
        object ListBoxEndSelectAdditive: TListBox
          Left = 1
          Top = 33
          Width = 168
          Height = 219
          Align = alLeft
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 0
          OnClick = ListBoxEndSelectAdditiveClick
        end
        object Panel9: TPanel
          Left = 169
          Top = 33
          Width = 454
          Height = 219
          Align = alClient
          TabOrder = 1
          object Panel26: TPanel
            Left = 1
            Top = 1
            Width = 452
            Height = 200
            Align = alTop
            TabOrder = 0
            object Label14: TLabel
              Left = 82
              Top = 92
              Width = 12
              Height = 13
              Caption = #1076#1086
              Visible = False
            end
            object Label13: TLabel
              Left = 18
              Top = 92
              Width = 11
              Height = 13
              Caption = #1086#1090
              Visible = False
            end
            object Label12: TLabel
              Left = 18
              Top = 76
              Width = 81
              Height = 13
              Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1094#1080#1103' ='
              Visible = False
            end
            object Label11: TLabel
              Left = 17
              Top = 28
              Width = 81
              Height = 13
              Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1094#1080#1103' ='
            end
            object Label1: TLabel
              Left = 200
              Top = 8
              Width = 74
              Height = 13
              Caption = #1055#1088#1080#1077#1084#1080#1089#1090#1086#1089#1090#1100
            end
            object Label6: TLabel
              Left = 304
              Top = 8
              Width = 110
              Height = 13
              Caption = #1052#1072#1082#1089'. '#1091#1074#1077#1083#1080#1095#1077#1085#1080#1077' '#1054#1063
            end
            object Label7: TLabel
              Left = 200
              Top = 56
              Width = 136
              Height = 13
              Caption = #1050#1086#1085#1089#1090#1072#1085#1090#1072' '#1101#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1080
            end
            object Label8: TLabel
              Left = 200
              Top = 96
              Width = 104
              Height = 13
              Caption = #1052#1072#1082#1089'. '#1082#1086#1085#1094#1077#1085#1090#1088#1072#1094#1080#1103
            end
            object Label9: TLabel
              Left = 16
              Top = 120
              Width = 42
              Height = 13
              Caption = #1089' '#1096#1072#1075#1086#1084
              Visible = False
            end
            object RadioButton1: TRadioButton
              Left = 8
              Top = 8
              Width = 113
              Height = 17
              Caption = #1063#1080#1089#1083#1086
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton1Click
            end
            object EditLastValueAdditive: TEdit
              Left = 96
              Top = 92
              Width = 49
              Height = 21
              Enabled = False
              TabOrder = 1
              Text = '0,0'
              Visible = False
              OnKeyPress = EditExpendFlowKeyPress
            end
            object EditFirstValueAdditive: TEdit
              Left = 32
              Top = 92
              Width = 49
              Height = 21
              Enabled = False
              TabOrder = 2
              Text = '0,0'
              Visible = False
              OnKeyPress = EditExpendFlowKeyPress
            end
            object RadioButton2: TRadioButton
              Left = 8
              Top = 56
              Width = 161
              Height = 17
              Caption = #1055#1088#1086#1074#1072#1088#1100#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1090#1077#1088#1074#1072#1083
              TabOrder = 3
              Visible = False
              OnClick = RadioButton2Click
            end
            object EditValueAdditive: TEdit
              Left = 104
              Top = 28
              Width = 49
              Height = 21
              TabOrder = 4
              Text = '0,0'
              OnKeyPress = EditExpendFlowKeyPress
            end
            object Button1: TButton
              Left = 112
              Top = 175
              Width = 233
              Height = 17
              Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
              TabOrder = 5
              OnClick = Button1Click
            end
            object EditP: TEdit
              Left = 200
              Top = 24
              Width = 81
              Height = 21
              TabOrder = 6
              Text = '0'
              OnKeyPress = EditExpendFlowKeyPress
            end
            object EditdeltaOVmax: TEdit
              Left = 304
              Top = 24
              Width = 113
              Height = 21
              TabOrder = 7
              Text = '0'
              OnKeyPress = EditExpendFlowKeyPress
            end
            object EditKeff: TEdit
              Left = 200
              Top = 72
              Width = 121
              Height = 21
              TabOrder = 8
              Text = '0'
              OnKeyPress = EditExpendFlowKeyPress
            end
            object EditCmaxAdditive: TEdit
              Left = 200
              Top = 112
              Width = 121
              Height = 21
              TabOrder = 9
              Text = '0'
              OnKeyPress = EditExpendFlowKeyPress
            end
            object EditStep: TEdit
              Left = 64
              Top = 120
              Width = 81
              Height = 21
              Enabled = False
              TabOrder = 10
              Text = '0,01'
              Visible = False
            end
          end
        end
        object Panel23: TPanel
          Left = 1
          Top = 1
          Width = 622
          Height = 32
          Align = alTop
          TabOrder = 2
          object Panel24: TPanel
            Left = 1
            Top = 1
            Width = 168
            Height = 30
            Align = alLeft
            Caption = #1055#1088#1080#1089#1072#1076#1082#1072
            TabOrder = 0
          end
          object Panel25: TPanel
            Left = 169
            Top = 1
            Width = 452
            Height = 30
            Align = alClient
            Caption = #1055#1086#1089#1090#1072#1074#1100#1090#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1084#1077#1078#1076#1091' '#1087#1088#1080#1089#1072#1076#1082#1072#1084#1080' '#1080' '#1087#1086#1090#1086#1082#1072#1084#1080
            TabOrder = 1
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #1059#1089#1083#1086#1074#1080#1103
      object Panel27: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 253
        Align = alClient
        TabOrder = 0
        object Panel28: TPanel
          Left = 1
          Top = 1
          Width = 622
          Height = 41
          Align = alTop
          TabOrder = 0
          object Panel29: TPanel
            Left = 1
            Top = 1
            Width = 182
            Height = 39
            Align = alLeft
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            TabOrder = 0
            object Label17: TLabel
              Left = 56
              Top = 4
              Width = 76
              Height = 13
              Caption = #1053#1072#1073#1086#1088' '#1091#1089#1083#1086#1074#1080#1081
            end
            object BtSetCondition: TButton
              Left = 3
              Top = 20
              Width = 53
              Height = 17
              Caption = #1057#1086#1079#1076#1072#1090#1100'...'
              TabOrder = 0
              OnClick = BtSetConditionClick
            end
            object Button2: TButton
              Left = 59
              Top = 20
              Width = 54
              Height = 17
              Caption = #1059#1076#1072#1083#1080#1090#1100'...'
              TabOrder = 1
              OnClick = Button2Click
            end
            object Button3: TButton
              Left = 115
              Top = 20
              Width = 63
              Height = 17
              Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
              TabOrder = 2
              OnClick = Button3Click
            end
          end
          object Panel30: TPanel
            Left = 183
            Top = 1
            Width = 438
            Height = 39
            Align = alClient
            Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1081
            TabOrder = 1
          end
        end
        object ListBoxUslov: TListBox
          Left = 1
          Top = 42
          Width = 184
          Height = 210
          Align = alLeft
          ItemHeight = 13
          TabOrder = 1
          OnClick = ListBoxUslovClick
          OnDblClick = ListBoxUslovDblClick
        end
        object Panel31: TPanel
          Left = 185
          Top = 42
          Width = 438
          Height = 210
          Align = alClient
          TabOrder = 2
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
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 1'
          end
          object Label21: TLabel
            Left = 9
            Top = 84
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 2'
          end
          object Label22: TLabel
            Left = 9
            Top = 108
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 3'
          end
          object Label23: TLabel
            Left = 9
            Top = 132
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 4'
          end
          object Label24: TLabel
            Left = 9
            Top = 156
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 5'
          end
          object Label25: TLabel
            Left = 121
            Top = 36
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 6'
          end
          object Label26: TLabel
            Left = 121
            Top = 60
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 7'
          end
          object Label27: TLabel
            Left = 121
            Top = 84
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 8'
          end
          object Label28: TLabel
            Left = 121
            Top = 108
            Width = 32
            Height = 13
            Caption = #1059#1089#1083'. 9'
          end
          object Label30: TLabel
            Left = 123
            Top = 132
            Width = 38
            Height = 13
            Caption = #1059#1089#1083'. 10'
          end
          object Edit1: TEdit
            Left = 64
            Top = 5
            Width = 121
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 0
          end
          object Edit2: TEdit
            Left = 64
            Top = 32
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 1
            Text = '0'
          end
          object Edit3: TEdit
            Left = 64
            Top = 56
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 2
            Text = '0'
          end
          object Edit4: TEdit
            Left = 64
            Top = 80
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 3
            Text = '0'
          end
          object Edit5: TEdit
            Left = 64
            Top = 104
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 4
            Text = '0'
          end
          object Edit6: TEdit
            Left = 64
            Top = 128
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 5
            Text = '0'
          end
          object Edit7: TEdit
            Left = 64
            Top = 152
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 6
            Text = '0'
          end
          object RadioGroup1: TRadioGroup
            Left = 232
            Top = 136
            Width = 273
            Height = 65
            Caption = #1042#1099#1074#1086#1076' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
            ItemIndex = 0
            Items.Strings = (
              #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1077#1085#1079#1080#1085#1072
              #1047#1072#1076#1072#1085#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1077#1085#1079#1080#1085#1072)
            TabOrder = 7
            Visible = False
            OnClick = RadioGroup1Click
          end
          object Edit8: TEdit
            Left = 323
            Top = 141
            Width = 65
            Height = 21
            Enabled = False
            TabOrder = 8
            Text = '0'
            Visible = False
          end
          object Edit9: TEdit
            Left = 176
            Top = 32
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 9
            Text = '0'
          end
          object Edit10: TEdit
            Left = 176
            Top = 56
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 10
            Text = '0'
          end
          object Edit11: TEdit
            Left = 176
            Top = 80
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 11
            Text = '0'
          end
          object Edit12: TEdit
            Left = 176
            Top = 104
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 12
            Text = '0'
          end
          object Button6: TButton
            Left = 296
            Top = 32
            Width = 75
            Height = 25
            Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
            TabOrder = 13
            OnClick = Button6Click
          end
          object Edit13: TEdit
            Left = 176
            Top = 128
            Width = 49
            Height = 21
            Color = clBtnFace
            Enabled = False
            TabOrder = 14
            Text = '0'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 253
        Align = alClient
        TabOrder = 0
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 576
          Height = 251
          ActivePage = TabSheet4
          Align = alClient
          TabOrder = 0
          object TabSheet4: TTabSheet
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
            object Splitter1: TSplitter
              Left = 276
              Top = 0
              Height = 223
              Align = alRight
            end
            object StringGridResult: TStringGrid
              Left = 0
              Top = 0
              Width = 276
              Height = 223
              Align = alClient
              ColCount = 2
              DefaultColWidth = 120
              RowCount = 2
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = PM5
              TabOrder = 0
            end
            object SG1Itog: TStringGrid
              Left = 279
              Top = 0
              Width = 289
              Height = 223
              HelpType = htKeyword
              Align = alRight
              ColCount = 2
              DefaultColWidth = 120
              RowCount = 15
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
              ParentFont = False
              PopupMenu = PM5
              TabOrder = 1
              RowHeights = (
                24
                24
                24
                24
                24
                24
                24
                24
                24
                24
                24
                24
                24
                24
                24)
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1048#1090#1086#1075#1086#1074#1099#1081' '#1089#1086#1089#1090#1072#1074
            ImageIndex = 1
            TabVisible = False
            object StringGridItogSostav: TStringGrid
              Left = 0
              Top = 0
              Width = 281
              Height = 223
              Align = alClient
              DefaultColWidth = 120
              RowCount = 2
              TabOrder = 0
            end
          end
        end
        object ChartResult: TChart
          Left = 577
          Top = 1
          Width = 46
          Height = 251
          BackWall.Brush.Color = clWhite
          BackWall.Color = clLime
          BackWall.Pen.Width = 4
          BottomWall.Color = clLime
          Gradient.Visible = True
          LeftWall.Color = clLime
          Title.Text.Strings = (
            #1043#1088#1072#1092#1080#1082#1080' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1086#1082#1090#1072#1085#1086#1074#1086#1075#1086' '#1095#1080#1089#1083#1072' '
            #1086#1090' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1080#1089#1072#1076#1082#1080)
          BackColor = clLime
          Frame.Width = 4
          Align = alRight
          BorderStyle = bsSingle
          Color = clWhite
          PopupMenu = PM1
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 253
    Width = 624
    Height = 60
    Align = alBottom
    Anchors = [akTop]
    TabOrder = 1
    DesignSize = (
      624
      60)
    object BitBtnBack: TBitBtn
      Left = 349
      Top = 2
      Width = 75
      Height = 25
      Anchors = []
      Caption = '<< '#1053#1072#1079#1072#1076
      Enabled = False
      TabOrder = 0
      OnClick = BitBtnBackClick
    end
    object BitBtnForward: TBitBtn
      Left = 430
      Top = 2
      Width = 75
      Height = 25
      Anchors = []
      Caption = #1044#1072#1083#1077#1077' >>'
      TabOrder = 1
      OnClick = BitBtnForwardClick
    end
    object BitBtnCancelOrReady: TBitBtn
      Left = 543
      Top = 2
      Width = 75
      Height = 25
      Anchors = []
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = BitBtnCancelOrReadyClick
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 40
      Width = 622
      Height = 19
      Panels = <
        item
          Width = 120
        end
        item
          Text = #1056#1077#1078#1080#1084': '#1085#1086#1088#1084'.'
          Width = 100
        end
        item
          Width = 30
        end
        item
          Width = 100
        end>
    end
    object PrBar: TProgressBar
      Left = 1
      Top = 28
      Width = 622
      Height = 12
      Align = alBottom
      TabOrder = 4
    end
    object Button5: TButton
      Left = 264
      Top = 0
      Width = 75
      Height = 25
      Caption = #1041#1091#1092#1077#1088
      TabOrder = 5
      OnClick = Button5Click
    end
  end
  object OD1: TOpenDialog
    Filter = 
      #1057#1086#1089#1090#1072#1074' '#1089#1099#1088#1100#1103' '#1082#1086#1084#1087#1072#1091#1085#1076#1080#1088#1086#1074#1072#1085#1080#1103'|*.sfc|'#1057#1086#1089#1090#1072#1074' '#1089#1099#1088#1100#1103' '#1088#1080#1092#1086#1088#1084#1080#1085#1075'|*.sk|' +
      #1057#1086#1089#1090#1072#1074' '#1082#1072#1090#1072#1083#1080#1079#1072#1090#1072' '#1088#1080#1092#1086#1088#1084#1080#1085#1075'|*.sk'
    Left = 8
    Top = 194
  end
  object SD1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 195
  end
  object PM1: TPopupMenu
    Left = 76
    Top = 195
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
  end
  object PMStrFlow: TPopupMenu
    Left = 112
    Top = 195
    object MenuItem1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090'...'
      OnClick = N1Click
    end
    object MenuItem2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090'...'
      OnClick = N2Click
    end
    object MenuItem3: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1101#1083#1077#1084#1077#1085#1090'...'
      OnClick = N3Click
    end
  end
  object PMFlow: TPopupMenu
    Left = 152
    Top = 195
    object MenuItem4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090'...'
      OnClick = MenuItem4Click
    end
  end
  object XPManifest1: TXPManifest
    Left = 43
    Top = 226
  end
  object PMSave: TPopupMenu
    Left = 81
    Top = 225
    object InFile1: TMenuItem
      Caption = #1042' '#1092#1072#1081#1083
      OnClick = BtInfileClick
    end
    object InBase1: TMenuItem
      Caption = #1042' '#1073#1072#1079#1091
      OnClick = InBase1Click
    end
  end
  object PM5: TPopupMenu
    Left = 8
    Top = 221
    object InBufer: TMenuItem
      Caption = #1042' '#1073#1091#1092#1077#1088
      OnClick = InBuferClick
    end
  end
  object EA1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 117
    Top = 225
  end
end
