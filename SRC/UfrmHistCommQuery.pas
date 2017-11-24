unit UfrmHistCommQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, UADOLYQuery, DB,
  ADODB, Menus;

type
  TfrmHistCommQuery = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    lyquery1: TADOLYQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery2AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmHistCommQuery: TfrmHistCommQuery;

implementation

uses UDM;

var
  ffrmHistCommQuery: TfrmHistCommQuery;

{$R *.dfm}

function frmHistCommQuery: TfrmHistCommQuery;
begin
  if ffrmHistCommQuery=nil then ffrmHistCommQuery:=TfrmHistCommQuery.Create(application.mainform);
  result:=ffrmHistCommQuery;
end;

procedure TfrmHistCommQuery.BitBtn1Click(Sender: TObject);
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
  sqlstr1:='select * from view_Query_Hist_LD';
  
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

procedure TfrmHistCommQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  if ffrmHistCommQuery=self then ffrmHistCommQuery:=nil;
end;

procedure TfrmHistCommQuery.FormCreate(Sender: TObject);
begin
  ADOQuery1.Connection:=DM.ADOConnection1;
  ADOQuery2.Connection:=DM.ADOConnection1;
end;

procedure TfrmHistCommQuery.ADOQuery1AfterOpen(DataSet: TDataSet);
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

procedure TfrmHistCommQuery.ADOQuery1AfterScroll(DataSet: TDataSet);
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

procedure TfrmHistCommQuery.ADOQuery2AfterOpen(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  DBGrid2.Columns[0].Width:=100;
  DBGrid2.Columns[1].Width:=300;
  DBGrid2.Columns[2].Width:=150;
  DBGrid2.Columns[3].Width:=60;
end;

initialization
  ffrmHistCommQuery:=nil;

end.
