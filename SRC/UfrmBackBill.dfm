object frmBackBill: TfrmBackBill
  Left = 192
  Top = 122
  Width = 928
  Height = 480
  Caption = #22238#21333#31649#29702
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 284
      Top = 4
      Width = 52
      Height = 13
      Caption = #21457#36135#20844#21496
    end
    object Label1: TLabel
      Left = 154
      Top = 51
      Width = 332
      Height = 13
      Caption = #27880':'#35843#24230#21495#12289#21457#36135#20844#21496#36816#21333#21495#12289#21457#36135#20844#21496#28165#21333#21495#65292#22238#36710#26597#35810
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edtYDH: TLabeledEdit
      Left = 154
      Top = 20
      Width = 121
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #35843#24230#21495
      TabOrder = 0
      OnKeyDown = edtYDHKeyDown
    end
    object edtSC_BillNo: TLabeledEdit
      Left = 554
      Top = 20
      Width = 121
      Height = 21
      EditLabel.Width = 91
      EditLabel.Height = 13
      EditLabel.Caption = #21457#36135#20844#21496#28165#21333#21495
      TabOrder = 1
      OnKeyDown = edtSC_BillNoKeyDown
    end
    object BitBtn3: TBitBtn
      Left = 809
      Top = 16
      Width = 75
      Height = 25
      Caption = #28165#21333#22238'F3'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 20
      Width = 121
      Height = 21
      EditLabel.Width = 91
      EditLabel.Height = 13
      EditLabel.Caption = #24403#21069#22238#21333#35013#35746#21495
      Enabled = False
      TabOrder = 3
    end
    object edtSC_COMPANY: TComboBox
      Left = 282
      Top = 20
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
    object edtSC_YDH: TLabeledEdit
      Left = 434
      Top = 20
      Width = 113
      Height = 21
      EditLabel.Width = 91
      EditLabel.Height = 13
      EditLabel.Caption = #21457#36135#20844#21496#36816#21333#21495
      TabOrder = 5
      OnKeyDown = edtSC_YDHKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 720
      Top = 16
      Width = 75
      Height = 25
      Caption = #36816#21333#22238'F2'
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 51
      Width = 97
      Height = 17
      Caption = #34394#25311#22238#21333
      TabOrder = 7
      OnClick = CheckBox1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 912
    Height = 369
    Align = alClient
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 104
  end
  object ADOQuery1: TADOQuery
    AfterOpen = ADOQuery1AfterOpen
    Parameters = <>
    Left = 104
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 272
    Top = 104
    object N2: TMenuItem
      Caption = #21462#28040#36816#21333#22238
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #21462#28040#28165#21333#22238
      OnClick = N1Click
    end
  end
  object ActionList1: TActionList
    Left = 360
    Top = 104
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 114
      OnExecute = BitBtn3Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 113
      OnExecute = BitBtn1Click
    end
  end
end
