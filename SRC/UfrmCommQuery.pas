unit UfrmCommQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, UADOLYQuery, DB,
  ADODB, Menus,Jpeg, ExtDlgs,StrUtils;

type
  TfrmCommQuery = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    lyquery1: TADOLYQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    chkSign: TCheckBox;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery2AfterOpen(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ADOQuery2AfterScroll(DataSet: TDataSet);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure chkSignClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCommQuery: TfrmCommQuery;

implementation

uses UDM, UfrmExpSign, UfrmFeeInfo;

var
  ffrmCommQuery: TfrmCommQuery;
  ifnewadd:boolean;

{$R *.dfm}

function frmCommQuery: TfrmCommQuery;
begin
  if ffrmCommQuery=nil then ffrmCommQuery:=TfrmCommQuery.Create(application.mainform);
  result:=ffrmCommQuery;
end;

procedure TfrmCommQuery.BitBtn1Click(Sender: TObject);
var
  sqlstr1:string;
  Save_Cursor:TCursor;
begin
{  sqlstr1:='select yd_z.ydh as 调度号1z2y3xTABLENAME1T2S3Ryd_z,yd_z.create_date_time as 调度时间1z2y3xTABLENAME1T2S3Ryd_z,yd_z.user_name as 调度人1z2y3xTABLENAME1T2S3Ryd_z,yd_z.print_time as 打印时间,Stat_Desc as 状态,'+
  'dbo.uf_Concat_Bus(yd_z.ydh) as 车辆,dbo.uf_Concat_Driver(yd_z.ydh) as 司机,dbo.uf_Concat_Psy(yd_z.ydh) as 配送员,'+
	'SC_COMPANY as 发货公司,SC_YDH AS 发货公司运单号 ,SC_CUSTOMER as 发货公司的客户名称,SC_SendAddr as 发货公司的送货地址,	'+
  'SC_BillNo as 发货公司清单号 ,	SC_BillDetNo as 发货公司清单明细号 ,	'+
  'SC_SIZE_DESC as 发货公司商品代码 ,	SC_SKU_DESC as 发货公司品名规格 ,	SEND_QTY as 数量 ,	'+
  'SC_UNITS as 发货公司单位 ,	SC_BATCH_NBR as 发货公司批号,SC_Request_Send_Time as 发货公司要求送达时间,Pick_Date_time as 提货时间,RTE_NBR as 线路,Send_Aear as 送货地址的区域,'+
  'yd_c.Create_Date_Time as 创建时间1z2y3xFIELDNAME1T2S3Rcreate_date_time1w2v3uTABLENAME1T2S3Ryd_c , yd_c.User_Name as 操作人1z2y3xFIELDNAME1T2S3RUser_Name1w2v3uTABLENAME1T2S3Ryd_c,'+
  'Unid,pkunid,yd_c.BackBillBindNo as 回单装订号,yd_c.BackBill_Time as 回单操作时间,yd_c.BackBill_User_Name as 回单操作人 '+
  ' from yd_z,yd_c where yd_z.ydh=yd_c.ydh ';
  //1z2y3xFIELDNAME1T2S3Ruf_Concat_Bus(yd_z.ydh)}
  sqlstr1:='select * from view_Query_LD';
  
  lyquery1.Connection:=DM.ADOConnection1;
  lyquery1.SelectString:=sqlstr1;
  if lyquery1.Execute then
  begin
    ADOQuery1.SQL.Text:=lyquery1.ResultSelect;
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;    { Show hourglass cursor }
    try
      ADOQuery1.Open;
    finally
      Screen.Cursor := Save_Cursor;  { Always restore to normal }
    end;
  end;
end;

procedure TfrmCommQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  if ffrmCommQuery=self then ffrmCommQuery:=nil;
end;

procedure TfrmCommQuery.FormCreate(Sender: TObject);
begin
  ADOQuery1.Connection:=DM.ADOConnection1;
  ADOQuery2.Connection:=DM.ADOConnection1;

  ifnewadd:=false;
end;

procedure TfrmCommQuery.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  DBGrid1.Columns[0].Width:=50;
  DBGrid1.Columns[1].Width:=135;
  DBGrid1.Columns[2].Width:=50;
  DBGrid1.Columns[3].Width:=50;
  DBGrid1.Columns[4].Width:=105;
  DBGrid1.Columns[5].Width:=100;
  DBGrid1.Columns[6].Width:=100;
  DBGrid1.Columns[7].Width:=100;
  DBGrid1.Columns[8].Width:=80;
  DBGrid1.Columns[9].Width:=100;
  DBGrid1.Columns[10].Width:=100;
  DBGrid1.Columns[11].Width:=100;
  DBGrid1.Columns[12].Width:=100;
  DBGrid1.Columns[13].Width:=100;
  DBGrid1.Columns[14].Width:=100;
  DBGrid1.Columns[15].Width:=100;
  DBGrid1.Columns[16].Width:=100;
  DBGrid1.Columns[17].Width:=100;
  DBGrid1.Columns[18].Width:=100;
  DBGrid1.Columns[19].Width:=100;
  DBGrid1.Columns[20].Width:=100;
  DBGrid1.Columns[21].Width:=100;
  DBGrid1.Columns[22].Width:=100;
end;

procedure TfrmCommQuery.N1Click(Sender: TObject);
var
  adotemp11:tadoquery;
  iYdh:integer;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  if not ADOQuery1.Active then exit;
  
  if (MessageDlg('确定要召回吗？', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;
  
  iYdh:=ADOQuery1.fieldbyname('调度号').AsInteger;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update YD_Z set Stat_Desc=null where YDH=:ydh';
  adotemp11.Parameters.ParamByName('ydh').Value:=iYdh;
  adotemp11.ExecSQL;
  adotemp11.Free;

  ADOQuery1.Refresh;
end;

procedure TfrmCommQuery.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if not ADOQuery1.Active then exit;
  if ADOQuery1.RecordCount<=0 then exit;
  
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Text:='select Node_Name as 节点名称,Node_Desc as 节点描述,Create_Date_Time as 创建时间,User_Name as 操作人,Unid from Goods_Track where SC_COMPANY=:SC_COMPANY and SC_BillNo=:SC_BillNo order by Unid';
  ADOQuery2.Parameters.ParamByName('SC_COMPANY').Value:=ADOQuery1.fieldbyname('发货公司').AsString;
  ADOQuery2.Parameters.ParamByName('SC_BillNo').Value:=ADOQuery1.fieldbyname('发货公司清单号').AsString;
  ADOQuery2.Open;
end;

procedure TfrmCommQuery.ADOQuery2AfterOpen(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  DBGrid2.Columns[0].Width:=100;
  DBGrid2.Columns[1].Width:=300;
  DBGrid2.Columns[2].Width:=150;
  DBGrid2.Columns[3].Width:=60;
end;

procedure TfrmCommQuery.BitBtn4Click(Sender: TObject);
begin
  DBGrid2.DataSource.DataSet.Delete;
end;

procedure TfrmCommQuery.BitBtn2Click(Sender: TObject);
begin
  if ifnewadd then exit;

  LabeledEdit1.Clear;
  LabeledEdit2.Clear;
  chkSign.Checked:=false;

  if LabeledEdit1.CanFocus then LabeledEdit1.SetFocus;

  ifnewadd:=true;
end;

procedure TfrmCommQuery.BitBtn3Click(Sender: TObject);
var
  adotemp11,adotemp22:tadoquery;
  iInsert_Identity:integer;
  sNode_Name:string;
begin
  if not ADOQuery1.Active then exit;
  if ADOQuery1.RecordCount<=0 then exit;

  sNode_Name:=ifThen(chkSign.Checked,'签收',LabeledEdit1.Text);
  
  iInsert_Identity:=ADOQuery2.fieldbyname('Unid').AsInteger;
  
  if ifnewadd then
  begin
    adotemp11:=tadoquery.Create(nil);
    adotemp11.Connection:=DM.ADOConnection1;
    adotemp11.Close;
    adotemp11.SQL.Clear;
    adotemp11.SQL.Add('insert into Goods_Track (SC_COMPANY,SC_BillNo,Node_Name,Node_Desc,User_Name) values (:SC_COMPANY,:SC_BillNo,'''+sNode_Name+''','''+LabeledEdit2.Text+''','''+operator_name+''')');
    adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
    adotemp11.Parameters.ParamByName('SC_COMPANY').Value:=ADOQuery1.fieldbyname('发货公司').AsString;
    adotemp11.Parameters.ParamByName('SC_BillNo').Value:=ADOQuery1.fieldbyname('发货公司清单号').AsString;
    adotemp11.Open;
    iInsert_Identity:=adotemp11.FieldByName('Insert_Identity').AsInteger;
    adotemp11.Free;
  end else
  begin
    adotemp22:=tadoquery.Create(nil);
    adotemp22.Connection:=DM.ADOConnection1;
    adotemp22.Close;
    adotemp22.SQL.Clear;
    adotemp22.SQL.Text:='update Goods_Track set Node_Name='''+sNode_Name+''',Node_Desc='''+LabeledEdit2.Text+''' where unid=:unid';
    adotemp22.Parameters.ParamByName('unid').Value:=ADOQuery2.fieldbyname('Unid').AsInteger;
    adotemp22.ExecSQL;
    adotemp22.Free;
  end;

  ifnewadd:=false;

  ADOQuery2.Requery();
  ADOQuery2.Locate('Unid',iInsert_Identity,[loCaseInsensitive]) ;
end;

procedure TfrmCommQuery.ADOQuery2AfterScroll(DataSet: TDataSet);
begin
  ifnewadd:=false;

  if not ADOQuery2.Active then exit;
  
  LabeledEdit1.Text:=ADOQuery2.fieldbyname('节点名称').AsString;
  LabeledEdit2.Text:=ADOQuery2.fieldbyname('节点描述').AsString;

  chkSign.Checked:=ADOQuery2.fieldbyname('节点名称').AsString='签收';
end;

procedure TfrmCommQuery.N3Click(Sender: TObject);
begin
  frmExpSign.ShowModal;
end;

procedure TfrmCommQuery.N5Click(Sender: TObject);
begin
  frmFeeInfo.ShowModal;;
end;

procedure TfrmCommQuery.N7Click(Sender: TObject);
Var
  MS:TMemoryStream;
  J1:TJPEGImage;
  ti:TImage;
  adotemp11,adotemp22:tadoquery;//修改图片用
  FilePath:string;
  Unid,SC_COMPANY,SC_YDH,SC_BILLNO,RESERVE4:STRING;
begin
  IF NOT ADOQuery1.Active THEN EXIT;
  IF ADOQuery1.RecordCount<=0 THEN EXIT;

  Unid:=ADOQuery1.fieldbyname('Unid').AsString;
  SC_COMPANY:=ADOQuery1.fieldbyname('发货公司').AsString;
  SC_YDH:=ADOQuery1.fieldbyname('发货公司运单号').AsString;
  SC_BILLNO:=ADOQuery1.fieldbyname('发货公司清单号').AsString;
  RESERVE4:=ADOQuery1.fieldbyname('SP运单号').AsString;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.sql.clear;
  adotemp11.sql.Text:='select Unid from YD_C where isnull(SC_COMPANY,'''')=:SC_COMPANY AND isnull(SC_YDH,'''')=:SC_YDH AND isnull(SC_BILLNO,'''')=:SC_BILLNO AND isnull(RESERVE4,'''')=:RESERVE4 and BackBill_Photo is not null ';
  adotemp11.Parameters.ParamByName('SC_COMPANY').Value:=SC_COMPANY;
  adotemp11.Parameters.ParamByName('SC_YDH').Value:=SC_YDH;
  adotemp11.Parameters.ParamByName('SC_BILLNO').Value:=SC_BILLNO;
  adotemp11.Parameters.ParamByName('RESERVE4').Value:=RESERVE4;
  adotemp11.Open;
  if adotemp11.RecordCount>0 then
  begin
    Unid:=adotemp11.FIELDBYNAME('Unid').AsString;
    if (MessageDlg('确实要覆盖已存在的图片?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    begin
      adotemp11.Free;
      exit;
    end;
  end;
  adotemp11.Free;

  openpicturedialog1.Filter := '图片文件(*.bmp,*.jpg,*jpeg)|*.bmp;*.jpg;*.jpeg';
  if not openpicturedialog1.Execute then exit;
  FilePath:=openpicturedialog1.FileName;

  MS:=TMemoryStream.Create;
  J1:=TJPEGImage.Create;

  ti:=TImage.Create(nil);
  ti.Picture.LoadFromFile(FilePath);
  J1.Assign(ti.Picture.Graphic);
  ti.Free;

  J1.SaveToStream(MS);
  J1.Free;

  adotemp22:=tadoquery.Create(nil);
  adotemp22.Connection:=dm.ADOConnection1;
  adotemp22.Close;
  adotemp22.sql.clear;
  adotemp22.sql.Text:='update YD_C set BackBill_Photo=:BackBill_Photo,Send_Photo_Flag=NULL where Unid=:Unid';
  adotemp22.Parameters.ParamByName('Unid').Value:=Unid;
  adotemp22.Parameters.ParamByName('BackBill_Photo').LoadFromStream(MS,ftGraphic);
  adotemp22.ExecSQL;
  adotemp22.Free;
  MS.Free;

  //update_Ado_dtl;
  //Ado_dtl.Locate('唯一编号',iValueId,[loCaseInsensitive]);
  //ShowPictureValue(ADObasic.fieldbyname('唯一编号').AsInteger);
end;

procedure TfrmCommQuery.chkSignClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
  begin
    if LabeledEdit2.CanFocus then LabeledEdit2.SetFocus;
  end else
  begin
    if LabeledEdit1.CanFocus then LabeledEdit1.SetFocus;
  end;
end;

initialization
  ffrmCommQuery:=nil;

end.
