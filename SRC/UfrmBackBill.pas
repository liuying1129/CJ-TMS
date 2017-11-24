unit UfrmBackBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons,Math,
  Menus, ActnList,StrUtils;

type
  TfrmBackBill = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    edtYDH: TLabeledEdit;
    edtSC_BillNo: TLabeledEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn3: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    edtSC_COMPANY: TComboBox;
    Label4: TLabel;
    edtSC_YDH: TLabeledEdit;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    BitBtn1: TBitBtn;
    N2: TMenuItem;
    Action2: TAction;
    N3: TMenuItem;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtYDHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSC_YDHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSC_BillNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateAdoquery1;
  public
    { Public declarations }
  end;

function frmBackBill: TfrmBackBill;

implementation

uses UDM;

var
  ffrmBackBill: TfrmBackBill;

{$R *.dfm}

function frmBackBill: TfrmBackBill;
begin
  if ffrmBackBill=nil then ffrmBackBill:=TfrmBackBill.Create(application.mainform);
  result:=ffrmBackBill;
end;

procedure TfrmBackBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  if ffrmBackBill=self then ffrmBackBill:=nil;
end;

procedure TfrmBackBill.FormCreate(Sender: TObject);
begin
  ADOQuery1.Connection:=DM.ADOConnection1;
end;

procedure TfrmBackBill.ADOQuery1AfterOpen(DataSet: TDataSet);
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

procedure TfrmBackBill.BitBtn3Click(Sender: TObject);
var
  adotemp11:tadoquery;
  sYDH,sSC_COMPANY,sSC_BillNo:string;
  sTemp:string;
begin
  if not ADOQuery1.Active then exit;
  if ADOQuery1.RecordCount=0 then exit;

  if ADOQuery1.fieldbyname('回单装订号').AsString<>'' then
  begin
    MessageDlg('已装订状态。如需重新装订，请先取消以前的装订!', mtConfirmation, [mbYes], 0);
    exit;
  end;

  if trim(LabeledEdit1.Text)='' then
  begin
    sTemp:=formatdatetime('yyyymmddhhnnss',now);
    if (MessageDlg('将生成新的装订号'+sTemp, mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;
    LabeledEdit1.Text:=sTemp;
  end;

  sYDH:=ADOQuery1.fieldbyname('调度号').AsString;
  sSC_COMPANY:=ADOQuery1.fieldbyname('发货公司').AsString;
  sSC_BillNo:=ADOQuery1.fieldbyname('发货公司清单号').AsString;
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update yd_c set BackBillBindNo='''+LabeledEdit1.Text+''',BackBill_Time=getdate(),BackBill_User_Name='''+operator_name+''' where YDH='+sYDH+' and SC_COMPANY='''+sSC_COMPANY+''' and SC_BillNo='''+sSC_BillNo+''' ';
  adotemp11.ExecSQL;
  adotemp11.Free;

  ADOQuery1.Refresh;
end;

procedure TfrmBackBill.DBGrid1DblClick(Sender: TObject);
begin
  if not ADOQuery1.Active then exit;
  
  LabeledEdit1.Text:=ADOQuery1.fieldbyname('回单装订号').AsString;
end;

procedure TfrmBackBill.N1Click(Sender: TObject);
var
  adotemp11:tadoquery;
  sYDH,sSC_COMPANY,sSC_BillNo:string;
begin
  if not ADOQuery1.Active then exit;
  if ADOQuery1.RecordCount=0 then exit;

  if (MessageDlg('确实要取消该清单的回单', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;
  
  sYDH:=ADOQuery1.fieldbyname('调度号').AsString;
  sSC_COMPANY:=ADOQuery1.fieldbyname('发货公司').AsString;
  sSC_BillNo:=ADOQuery1.fieldbyname('发货公司清单号').AsString;
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update yd_c set BackBillBindNo=null,BackBill_Time=null,BackBill_User_Name=null where YDH='+sYDH+' and SC_COMPANY='''+sSC_COMPANY+''' and SC_BillNo='''+sSC_BillNo+''' ';
  adotemp11.ExecSQL;
  adotemp11.Free;

  ADOQuery1.Refresh;
end;

procedure TfrmBackBill.FormShow(Sender: TObject);
begin
  LoadGroupName(edtSC_COMPANY,'select name from commcode where typename=''发货公司'' ');
end;

procedure TfrmBackBill.UpdateAdoquery1;
var
  sYDH,sSC_COMPANY,sSC_YDH,sSC_BillNo:string;
begin
  if trim(edtYDH.Text)<>'' then sYDH:=' and yd_c.ydh='+edtYDH.Text;
  if trim(edtSC_COMPANY.Text)<>'' then sSC_COMPANY:=' and yd_c.SC_COMPANY='''+edtSC_COMPANY.Text+''' ';
  if trim(edtSC_YDH.Text)<>'' then sSC_YDH:=' and yd_c.SC_YDH like ''%'+edtSC_YDH.Text+''' ';
  if trim(edtSC_BillNo.Text)<>'' then sSC_BillNo:=' and yd_c.SC_BillNo like ''%'+edtSC_BillNo.Text+''' ';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text:='select yd_z.ydh as 调度号,yd_z.create_date_time as 调度时间,yd_z.user_name as 调度人,yd_z.print_time as 打印人,'+
  'yd_c.BackBillBindNo as 回单装订号,'+
  'dbo.uf_Concat_Bus(yd_z.ydh) as 车辆,dbo.uf_Concat_Driver(yd_z.ydh) as 司机,dbo.uf_Concat_Psy(yd_z.ydh) as 配送员,'+
	'SC_COMPANY as 发货公司,SC_YDH AS 发货公司运单号 ,SC_CUSTOMER as 发货公司的客户名称,SC_SendAddr as 发货公司的送货地址,yd_c.Reserve as ERP清单号,	'+
  'SC_BillNo as 发货公司清单号 ,	SC_BillDetNo as 发货公司清单明细号 ,	'+
  'SC_SIZE_DESC as 发货公司商品代码 ,	SC_SKU_DESC as 发货公司品名规格 ,	SEND_QTY as 数量 ,	'+
  'SC_UNITS as 发货公司单位 ,	SC_BATCH_NBR as 发货公司批号,SC_Request_Send_Time as 发货公司要求送达时间,Pick_Date_time as 提货时间,RTE_NBR as 线路,Send_Aear as 送货地址的区域,'+
  'yd_c.Create_Date_Time as 创建时间 , yd_c.User_Name as 操作人,Unid,pkunid,yd_c.BackBill_Time as 回单操作时间,yd_c.BackBill_User_Name as 回单操作人 '+
  ' from yd_z,yd_c where yd_z.ydh=yd_c.ydh and yd_z.Stat_Desc=''已发车'' '+
  sYDH+sSC_COMPANY+sSC_YDH+sSC_BillNo;
  ADOQuery1.Open;
end;

procedure TfrmBackBill.edtYDHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key<>13 then EXIT;

  UpdateAdoquery1;
end;

procedure TfrmBackBill.edtSC_YDHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key<>13 then EXIT;

  UpdateAdoquery1;
end;

procedure TfrmBackBill.edtSC_BillNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key<>13 then EXIT;

  UpdateAdoquery1;
end;

procedure TfrmBackBill.BitBtn1Click(Sender: TObject);
var
  adotemp11:tadoquery;
  sYDH,sSC_COMPANY,sSC_YDH:string;
  sTemp:string;
begin
  if not ADOQuery1.Active then exit;
  if ADOQuery1.RecordCount=0 then exit;

  if ADOQuery1.fieldbyname('回单装订号').AsString<>'' then
  begin
    MessageDlg('已装订状态。如需重新装订，请先取消以前的装订!', mtConfirmation, [mbYes], 0);
    exit;
  end;

  if trim(LabeledEdit1.Text)='' then
  begin
    sTemp:=formatdatetime('yyyymmddhhnnss',now);
    if (MessageDlg('将生成新的装订号'+sTemp, mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;
    LabeledEdit1.Text:=sTemp;
  end;

  sYDH:=ADOQuery1.fieldbyname('调度号').AsString;
  sSC_COMPANY:=ADOQuery1.fieldbyname('发货公司').AsString;
  sSC_YDH:=ADOQuery1.fieldbyname('发货公司运单号').AsString;
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update yd_c set BackBillBindNo='''+LabeledEdit1.Text+''',BackBill_Time=getdate(),BackBill_User_Name='''+operator_name+''' where YDH='+sYDH+' and SC_COMPANY='''+sSC_COMPANY+''' and SC_YDH='''+sSC_YDH+''' ';
  adotemp11.ExecSQL;
  adotemp11.Free;

  ADOQuery1.Refresh;
end;

procedure TfrmBackBill.N2Click(Sender: TObject);
var
  adotemp11:tadoquery;
  sYDH,sSC_COMPANY,sSC_YDH:string;
begin
  if not ADOQuery1.Active then exit;
  if ADOQuery1.RecordCount=0 then exit;

  if (MessageDlg('确实要取消该运单的回单', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;
  
  sYDH:=ADOQuery1.fieldbyname('调度号').AsString;
  sSC_COMPANY:=ADOQuery1.fieldbyname('发货公司').AsString;
  sSC_YDH:=ADOQuery1.fieldbyname('发货公司运单号').AsString;
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update yd_c set BackBillBindNo=null,BackBill_Time=null,BackBill_User_Name=null where YDH='+sYDH+' and SC_COMPANY='''+sSC_COMPANY+''' and SC_YDH='''+sSC_YDH+''' ';
  adotemp11.ExecSQL;
  adotemp11.Free;

  ADOQuery1.Refresh;
end;

procedure TfrmBackBill.CheckBox1Click(Sender: TObject);
begin
  LabeledEdit1.Text:=ifThen(CheckBox1.Checked,'虚拟回单');
end;

initialization
  ffrmBackBill:=nil;

end.
