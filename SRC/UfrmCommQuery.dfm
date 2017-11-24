object frmCommQuery: TfrmCommQuery
  Left = 192
  Top = 122
  Width = 928
  Height = 480
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 105
      Height = 25
      Caption = #36873#21462#26597#35810#26465#20214
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 912
    Height = 239
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 280
    Width = 912
    Height = 162
    Align = alBottom
    Caption = #21830#21697#36319#36394#20449#24687
    TabOrder = 2
    object Panel2: TPanel
      Left = 448
      Top = 15
      Width = 462
      Height = 145
      Align = alRight
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 124
        Width = 449
        Height = 13
        Caption = #27880':'#24403#21246#36873#8220#31614#25910#20449#24687#8221#26102#65292#33410#28857#21517#31216#19981#38656#22635#20889#65292#33410#28857#25551#36848#20013#22635#31614#25910#20154#21517#31216#21363#21487
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BitBtn2: TBitBtn
        Left = 74
        Top = 93
        Width = 100
        Height = 25
        Caption = #26032#22686#36319#36394#33410#28857
        TabOrder = 0
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 186
        Top = 93
        Width = 100
        Height = 25
        Caption = #20445#23384#36319#36394#33410#28857
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 298
        Top = 93
        Width = 100
        Height = 25
        Caption = #21024#38500#36319#36394#33410#28857
        TabOrder = 2
        OnClick = BitBtn4Click
      end
      object LabeledEdit1: TLabeledEdit
        Left = 58
        Top = 29
        Width = 319
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = #33410#28857#21517#31216
        ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object LabeledEdit2: TLabeledEdit
        Left = 58
        Top = 61
        Width = 400
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = #33410#28857#25551#36848
        ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
        LabelPosition = lpLeft
        TabOrder = 4
      end
      object chkSign: TCheckBox
        Left = 382
        Top = 31
        Width = 73
        Height = 17
        Caption = #31614#25910#20449#24687
        TabOrder = 5
        OnClick = chkSignClick
      end
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 446
      Height = 145
      Align = alClient
      DataSource = DataSource2
      ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
  end
  object lyquery1: TADOLYQuery
    DataBaseType = dbtMSSQL
    Left = 312
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 112
    Top = 104
  end
  object ADOQuery1: TADOQuery
    AfterOpen = ADOQuery1AfterOpen
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    Left = 144
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 168
    Top = 176
    object N1: TMenuItem
      Caption = #21484#22238
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #24322#24120#31614#25910
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #36153#29992#20449#24687
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #22238#21333#24433#20687
      OnClick = N7Click
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 144
    Top = 344
  end
  object ADOQuery2: TADOQuery
    AfterOpen = ADOQuery2AfterOpen
    AfterScroll = ADOQuery2AfterScroll
    Parameters = <>
    Left = 176
    Top = 344
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 424
    Top = 88
  end
end
