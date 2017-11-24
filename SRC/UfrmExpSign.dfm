object frmExpSign: TfrmExpSign
  Left = 236
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24322#24120#31614#25910
  ClientHeight = 384
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 72
    Width = 78
    Height = 13
    Caption = #24322#24120#31614#25910#31867#22411
  end
  object Label2: TLabel
    Left = 128
    Top = 112
    Width = 78
    Height = 13
    Caption = #24322#24120#31614#25910#21407#22240
  end
  object Label3: TLabel
    Left = 80
    Top = 216
    Width = 78
    Height = 13
    Caption = #24322#24120#31614#25910#26102#38388
  end
  object Label4: TLabel
    Left = 32
    Top = 256
    Width = 130
    Height = 13
    Caption = #24322#24120#31614#25910#39044#35745#36820#22238#26102#38388
  end
  object Label5: TLabel
    Left = 104
    Top = 352
    Width = 353
    Height = 13
    Caption = #24322#24120#31867#22411#20998#20026#65306' DS--'#20002#22833#12289'JC--'#23492#23384#12289'JS--'#25298#25910#12289'PS--'#30772#25439
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 224
    Top = 72
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'DS'
      'JC'
      'JS'
      'PS')
  end
  object ComboBox2: TComboBox
    Left = 224
    Top = 112
    Width = 145
    Height = 21
    DropDownCount = 20
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      #36135#29289#30772#25439
      #21464#24418
      #27745#26579
      #36864#36135
      #24322#24120
      #21407#36710#36864#36135
      #26410#36865#36798'('#29289#27969#21407#22240')'
      #36135#29289#36951#30690
      #26410#36865#36798'('#38750#29289#27969#21407#22240')'
      #36135#29289#38169#36865
      #31614#21333#24322#24120
      #33322#29677#25289#36135
      #36135#29289#38169#36865)
  end
  object LabeledEdit1: TLabeledEdit
    Left = 224
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = #24322#24120#31614#25910#25968#37327
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    TabOrder = 0
  end
  object LabeledEdit2: TLabeledEdit
    Left = 224
    Top = 160
    Width = 145
    Height = 21
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = #24322#24120#31614#25910#25551#36848
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 232
    Top = 208
    Width = 113
    Height = 21
    Date = 41854.447291574080000000
    Time = 41854.447291574080000000
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    TabOrder = 4
  end
  object DateTimePicker2: TDateTimePicker
    Left = 368
    Top = 208
    Width = 113
    Height = 21
    Date = 41854.447328773150000000
    Time = 41854.447328773150000000
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    Kind = dtkTime
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 312
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object DateTimePicker3: TDateTimePicker
    Left = 232
    Top = 256
    Width = 121
    Height = 21
    Date = 41854.447291574080000000
    Time = 41854.447291574080000000
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    TabOrder = 6
  end
  object DateTimePicker4: TDateTimePicker
    Left = 368
    Top = 256
    Width = 121
    Height = 21
    Date = 41854.447328773150000000
    Time = 41854.447328773150000000
    ImeName = #20013#25991'('#31616#20307') - '#19975#33021#20116#31508#36755#20837#27861
    Kind = dtkTime
    TabOrder = 7
  end
end
