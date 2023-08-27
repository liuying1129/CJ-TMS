object frmMain: TfrmMain
  Left = 192
  Top = 122
  Width = 1020
  Height = 559
  Caption = #36816#36755#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1004
    Height = 37
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 33
        Width = 1000
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 987
      Height = 33
      Caption = 'ToolBar1'
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 2
        Width = 89
        Height = 22
        Caption = #26032#35843#24230#21333'F2'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 89
        Top = 2
        Width = 89
        Height = 22
        Caption = #21024#38500#35843#24230#21333'F4'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 178
        Top = 2
        Width = 89
        Height = 22
        Caption = #21047#26032'F5'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 267
        Top = 2
        Width = 89
        Height = 22
        Caption = #25171#21360#35843#24230#21333'F7'
        OnClick = SpeedButton4Click
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 481
    Width = 1004
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Text = #25805#20316#20154#21592#24037#21495':'
        Width = 90
      end
      item
        Width = 100
      end
      item
        Text = #25805#20316#20154#21592#22995#21517':'
        Width = 100
      end
      item
        Width = 70
      end
      item
        Text = #25480#26435#20351#29992#21333#20301':'
        Width = 100
      end
      item
        Width = 200
      end
      item
        Text = #26381#21153#21517':'
        Width = 47
      end
      item
        Width = 150
      end
      item
        Text = #25968#25454#24211':'
        Width = 47
      end
      item
        Width = 50
      end>
  end
  object dgYd_Z: TDBGrid
    Left = 0
    Top = 37
    Width = 215
    Height = 444
    Align = alLeft
    DataSource = dsYd_Z
    PopupMenu = pmYd_Z
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = dgYd_ZDrawColumnCell
  end
  object GroupBox1: TGroupBox
    Left = 215
    Top = 37
    Width = 150
    Height = 444
    Align = alLeft
    Caption = #36710#36742'/'#20154#21592
    TabOrder = 3
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 146
      Height = 202
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 52
        Height = 13
        Caption = #36873#25321#36710#36742
      end
      object dgBus: TDBGrid
        Left = 1
        Top = 71
        Width = 144
        Height = 130
        Align = alBottom
        DataSource = dsBus
        PopupMenu = pmBus
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object ComboBox1: TComboBox
        Left = 5
        Top = 21
        Width = 90
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnKeyDown = ComboBox1KeyDown
      end
      object BitBtn1: TBitBtn
        Left = 5
        Top = 45
        Width = 60
        Height = 25
        Caption = #36873#25321#36710#36742
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 217
      Width = 146
      Height = 144
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 38
        Width = 78
        Height = 13
        Caption = #36873#25321#20154#21592#31867#22411
      end
      object Label3: TLabel
        Left = 6
        Top = 78
        Width = 52
        Height = 13
        Caption = #36873#25321#20154#21592
      end
      object ComboBox3: TComboBox
        Left = 6
        Top = 93
        Width = 90
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnKeyDown = ComboBox3KeyDown
      end
      object BitBtn3: TBitBtn
        Left = 6
        Top = 116
        Width = 60
        Height = 25
        Caption = #36873#25321#20154#21592
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object ComboBox2: TComboBox
        Left = 6
        Top = 54
        Width = 90
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = #21496#26426
        Items.Strings = (
          #21496#26426
          #37197#36865#21592)
      end
    end
    object dgWorker: TDBGrid
      Left = 2
      Top = 361
      Width = 146
      Height = 81
      Align = alClient
      DataSource = dsWorker
      PopupMenu = pmWorker
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
  end
  object GroupBox2: TGroupBox
    Left = 365
    Top = 37
    Width = 639
    Height = 444
    Align = alClient
    Caption = #24050#35843#24230#20219#21153#20449#24687
    TabOrder = 4
    object GroupBox3: TGroupBox
      Left = 2
      Top = 177
      Width = 635
      Height = 265
      Align = alClient
      Caption = #24453#35843#24230#27744
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 15
        Width = 631
        Height = 170
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 18
          Top = 3
          Width = 52
          Height = 13
          Caption = #21457#36135#20844#21496
        end
        object Label5: TLabel
          Left = 1
          Top = 3
          Width = 13
          Height = 13
          Caption = #26080
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 1
          Top = 19
          Width = 13
          Height = 13
          Caption = #25968
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 1
          Top = 35
          Width = 13
          Height = 13
          Caption = #25454
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 1
          Top = 51
          Width = 13
          Height = 13
          Caption = #35843
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 1
          Top = 67
          Width = 13
          Height = 13
          Caption = #24230
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 18
          Top = 91
          Width = 52
          Height = 13
          Caption = #21457#36135#20844#21496
        end
        object Bevel1: TBevel
          Left = 1
          Top = 78
          Width = 625
          Height = 10
          Shape = bsBottomLine
        end
        object SpeedButton5: TSpeedButton
          Left = 3
          Top = 144
          Width = 35
          Height = 22
          Caption = #20840#36873
          OnClick = SpeedButton5Click
        end
        object SpeedButton6: TSpeedButton
          Left = 39
          Top = 144
          Width = 45
          Height = 22
          Caption = #20840#19981#36873
          OnClick = SpeedButton6Click
        end
        object ComboBox4: TComboBox
          Left = 18
          Top = 20
          Width = 80
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object LabeledEdit1: TLabeledEdit
          Left = 101
          Top = 20
          Width = 90
          Height = 21
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = #21457#36135#20844#21496#36816#21333#21495
          TabOrder = 1
        end
        object LabeledEdit2: TLabeledEdit
          Left = 213
          Top = 20
          Width = 105
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #23458#25143#21517#31216
          TabOrder = 2
        end
        object LabeledEdit3: TLabeledEdit
          Left = 325
          Top = 20
          Width = 105
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #36865#36135#22320#22336
          TabOrder = 3
        end
        object LabeledEdit4: TLabeledEdit
          Left = 435
          Top = 20
          Width = 90
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = #28165#21333#21495
          TabOrder = 4
        end
        object LabeledEdit5: TLabeledEdit
          Left = 529
          Top = 20
          Width = 90
          Height = 21
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #28165#21333#26126#32454#21495
          TabOrder = 5
        end
        object LabeledEdit6: TLabeledEdit
          Left = 18
          Top = 61
          Width = 80
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #21830#21697#20195#30721
          TabOrder = 6
        end
        object LabeledEdit7: TLabeledEdit
          Left = 101
          Top = 61
          Width = 105
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #21697#21517#35268#26684
          TabOrder = 7
        end
        object LabeledEdit8: TLabeledEdit
          Left = 213
          Top = 61
          Width = 105
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = #25968#37327
          TabOrder = 8
        end
        object LabeledEdit9: TLabeledEdit
          Left = 325
          Top = 61
          Width = 105
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = #21333#20301
          TabOrder = 9
        end
        object LabeledEdit10: TLabeledEdit
          Left = 434
          Top = 61
          Width = 90
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = #25209#21495
          TabOrder = 10
        end
        object BitBtn5: TBitBtn
          Left = 529
          Top = 57
          Width = 72
          Height = 25
          Caption = #20219#21153#30830#23450
          TabOrder = 11
          OnClick = BitBtn5Click
        end
        object ComboBox5: TComboBox
          Left = 18
          Top = 108
          Width = 80
          Height = 21
          ItemHeight = 13
          TabOrder = 12
        end
        object LabeledEdit11: TLabeledEdit
          Left = 101
          Top = 108
          Width = 90
          Height = 21
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = #21457#36135#20844#21496#36816#21333#21495
          TabOrder = 13
        end
        object LabeledEdit12: TLabeledEdit
          Left = 213
          Top = 108
          Width = 105
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #23458#25143#21517#31216
          TabOrder = 14
        end
        object LabeledEdit13: TLabeledEdit
          Left = 325
          Top = 108
          Width = 105
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #36865#36135#22320#22336
          TabOrder = 15
        end
        object LabeledEdit14: TLabeledEdit
          Left = 435
          Top = 108
          Width = 90
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = #28165#21333#21495
          TabOrder = 16
        end
        object LabeledEdit15: TLabeledEdit
          Left = 529
          Top = 108
          Width = 90
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #21830#21697#31867#22411
          TabOrder = 17
        end
        object LabeledEdit16: TLabeledEdit
          Left = 101
          Top = 146
          Width = 105
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = #36710#29260#21495
          TabOrder = 18
        end
        object LabeledEdit18: TLabeledEdit
          Left = 213
          Top = 146
          Width = 105
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = #32447#36335
          TabOrder = 19
        end
        object BitBtn2: TBitBtn
          Left = 435
          Top = 142
          Width = 72
          Height = 25
          Caption = #26597#35810
          TabOrder = 20
          OnClick = BitBtn2Click
        end
        object BitBtn4: TBitBtn
          Left = 529
          Top = 142
          Width = 72
          Height = 25
          Caption = #20219#21153#30830#23450
          TabOrder = 21
          OnClick = BitBtn4Click
        end
        object LabeledEdit19: TLabeledEdit
          Left = 325
          Top = 146
          Width = 105
          Height = 21
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = #36865#36135#22320#22336#30340#21306#22495
          TabOrder = 22
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 185
        Width = 631
        Height = 78
        Align = alClient
        TabOrder = 1
        object dgWait_Sched: TDBGrid
          Left = 1
          Top = 1
          Width = 464
          Height = 76
          Align = alLeft
          DataSource = dsWait_Sched
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnCellClick = dgWait_SchedCellClick
          OnDrawColumnCell = dgWait_SchedDrawColumnCell
        end
        object dgWait_Sched_Dtl: TDBGrid
          Left = 465
          Top = 1
          Width = 165
          Height = 76
          Align = alClient
          DataSource = dsWait_Sched_Dtl
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
        end
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 15
      Width = 635
      Height = 162
      Align = alTop
      TabOrder = 1
      object dgYd_C: TDBGrid
        Left = 1
        Top = 1
        Width = 464
        Height = 160
        Align = alLeft
        DataSource = dsYd_C
        PopupMenu = pmYd_C
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object dgYd_C_Dtl: TDBGrid
        Left = 465
        Top = 1
        Width = 169
        Height = 160
        Align = alClient
        DataSource = dsYd_C_Dtl
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
    end
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 736
    Top = 8
    object N1: TMenuItem
      Caption = #25991#20214
      object N15: TMenuItem
        Caption = #37325#26032#30331#24405
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Caption = #22238#21333#31649#29702
        OnClick = N17Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N20: TMenuItem
        Caption = #26597#35810
        OnClick = N20Click
      end
      object N24: TMenuItem
        Caption = #21382#21490#24211#26597#35810
        OnClick = N24Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Caption = #36716#20837#21382#21490#24211
        OnClick = N23Click
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #36864#20986
        OnClick = N2Click
      end
    end
    object N6: TMenuItem
      Caption = #35774#32622
      object N7: TMenuItem
        Caption = #36890#29992#20195#30721
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #20154#21592#35774#32622
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #36873#39033
        OnClick = N10Click
      end
    end
    object N14: TMenuItem
      Caption = #24037#20855
    end
    object N3: TMenuItem
      Caption = #24110#21161
      object N4: TMenuItem
        Caption = #27880#20876
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #20851#20110'...'
      end
    end
  end
  object AdoYd_Z: TADOQuery
    AfterOpen = AdoYd_ZAfterOpen
    AfterScroll = AdoYd_ZAfterScroll
    Parameters = <>
    Left = 24
    Top = 88
  end
  object dsYd_Z: TDataSource
    DataSet = AdoYd_Z
    Left = 56
    Top = 88
  end
  object TimerIdleTracker: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerIdleTrackerTimer
    Left = 689
    Top = 8
  end
  object dsBus: TDataSource
    DataSet = adoBus
    Left = 257
    Top = 173
  end
  object adoBus: TADOQuery
    AfterOpen = adoBusAfterOpen
    AfterScroll = adoBusAfterScroll
    Parameters = <>
    Left = 225
    Top = 173
  end
  object dsWorker: TDataSource
    DataSet = adoWorker
    Left = 265
    Top = 429
  end
  object adoWorker: TADOQuery
    AfterOpen = adoWorkerAfterOpen
    Parameters = <>
    Left = 233
    Top = 429
  end
  object AdoYd_C: TADOQuery
    AfterOpen = AdoYd_CAfterOpen
    AfterScroll = AdoYd_CAfterScroll
    Parameters = <>
    Left = 522
    Top = 93
  end
  object dsYd_C: TDataSource
    DataSet = AdoYd_C
    Left = 550
    Top = 93
  end
  object DosMove1: TDosMove
    Active = True
    Left = 657
    Top = 8
  end
  object pmYd_C: TPopupMenu
    AutoHotkeys = maManual
    Left = 585
    Top = 96
    object N11: TMenuItem
      Caption = #21024#38500#20219#21153
      OnClick = N11Click
    end
  end
  object pmBus: TPopupMenu
    AutoHotkeys = maManual
    Left = 289
    Top = 176
    object N12: TMenuItem
      Caption = #21024#38500#36710#36742
      OnClick = N12Click
    end
  end
  object pmWorker: TPopupMenu
    AutoHotkeys = maManual
    Left = 297
    Top = 424
    object N13: TMenuItem
      Caption = #21024#38500#20154#21592
      OnClick = N13Click
    end
  end
  object adoWait_Sched: TADOQuery
    AfterOpen = adoWait_SchedAfterOpen
    AfterScroll = adoWait_SchedAfterScroll
    Parameters = <>
    Left = 472
    Top = 414
  end
  object dsWait_Sched: TDataSource
    DataSet = adoWait_Sched
    Left = 504
    Top = 414
  end
  object frReport1: TfrReport
    Dataset = frDB_adoPrint
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnPrintReport = frReport1PrintReport
    Left = 873
    Top = 8
    ReportForm = {19000000}
  end
  object adoPrint: TADOQuery
    Parameters = <>
    Left = 801
    Top = 8
  end
  object frDB_adoPrint: TfrDBDataSet
    DataSet = adoPrint
    Left = 830
    Top = 5
  end
  object pmYd_Z: TPopupMenu
    AutoHotkeys = maManual
    Left = 88
    Top = 88
    object N19: TMenuItem
      Caption = #21457#36710
      OnClick = N19Click
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object N26: TMenuItem
      Caption = #21457#36865#33267#25163#25345#35774#22791
      OnClick = N26Click
    end
  end
  object dsWait_Sched_Dtl: TDataSource
    DataSet = adoWait_Sched_Dtl
    Left = 897
    Top = 423
  end
  object adoWait_Sched_Dtl: TADOQuery
    AfterOpen = adoWait_Sched_DtlAfterOpen
    Parameters = <>
    Left = 865
    Top = 423
  end
  object AdoYd_C_Dtl: TADOQuery
    AfterOpen = AdoYd_C_DtlAfterOpen
    Parameters = <>
    Left = 855
    Top = 100
  end
  object dsYd_C_Dtl: TDataSource
    DataSet = AdoYd_C_Dtl
    Left = 887
    Top = 100
  end
end
