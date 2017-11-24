object frmHistCommQuery: TfrmHistCommQuery
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
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 908
      Height = 145
      Align = alClient
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 0
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
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 144
    Top = 344
  end
  object ADOQuery2: TADOQuery
    AfterOpen = ADOQuery2AfterOpen
    Parameters = <>
    Left = 176
    Top = 344
  end
end
