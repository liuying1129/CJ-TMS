unit UfrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, Buttons, Grids, DBGrids, StdCtrls,StrUtils,
  DB, ADODB, ExtCtrls,Inifiles, ADOLYGetcode, DosMove, FR_Class, FR_DSet,
  FR_DBSet,ShellAPI;

//==为了通过发送消息更新主窗体状态栏而增加==//
const
  WM_UPDATETEXTSTATUS=WM_USER+1;
TYPE
  TWMUpdateTextStatus=TWMSetText;
//=========================================//

type TArCheckBoxValue = array of array [0..1] of string;
 
type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SpeedButton1: TSpeedButton;
    dgYd_Z: TDBGrid;
    GroupBox1: TGroupBox;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    AdoYd_Z: TADOQuery;
    dsYd_Z: TDataSource;
    SpeedButton2: TSpeedButton;
    TimerIdleTracker: TTimer;
    SpeedButton3: TSpeedButton;
    dsBus: TDataSource;
    adoBus: TADOQuery;
    dsWorker: TDataSource;
    adoWorker: TADOQuery;
    Panel1: TPanel;
    Label1: TLabel;
    dgBus: TDBGrid;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    ComboBox3: TComboBox;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    ComboBox2: TComboBox;
    dgWorker: TDBGrid;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    AdoYd_C: TADOQuery;
    dsYd_C: TDataSource;
    DosMove1: TDosMove;
    pmYd_C: TPopupMenu;
    N11: TMenuItem;
    pmBus: TPopupMenu;
    N12: TMenuItem;
    pmWorker: TPopupMenu;
    N13: TMenuItem;
    Panel3: TPanel;
    Label4: TLabel;
    ComboBox4: TComboBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    BitBtn5: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox5: TComboBox;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit18: TLabeledEdit;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    adoWait_Sched: TADOQuery;
    dsWait_Sched: TDataSource;
    BitBtn4: TBitBtn;
    LabeledEdit19: TLabeledEdit;
    SpeedButton4: TSpeedButton;
    frReport1: TfrReport;
    adoPrint: TADOQuery;
    frDB_adoPrint: TfrDBDataSet;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    pmYd_Z: TPopupMenu;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    Panel4: TPanel;
    dgWait_Sched: TDBGrid;
    dgWait_Sched_Dtl: TDBGrid;
    dsWait_Sched_Dtl: TDataSource;
    adoWait_Sched_Dtl: TADOQuery;
    Panel5: TPanel;
    dgYd_C: TDBGrid;
    dgYd_C_Dtl: TDBGrid;
    AdoYd_C_Dtl: TADOQuery;
    dsYd_C_Dtl: TDataSource;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TimerIdleTrackerTimer(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AdoYd_ZAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure adoBusAfterScroll(DataSet: TDataSet);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure adoBusAfterOpen(DataSet: TDataSet);
    procedure AdoYd_ZAfterOpen(DataSet: TDataSet);
    procedure adoWorkerAfterOpen(DataSet: TDataSet);
    procedure AdoYd_CAfterOpen(DataSet: TDataSet);
    procedure adoWait_SchedAfterOpen(DataSet: TDataSet);
    procedure N15Click(Sender: TObject);
    procedure dgYd_ZDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure frReport1PrintReport;
    procedure N17Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure adoWait_SchedAfterScroll(DataSet: TDataSet);
    procedure adoWait_Sched_DtlAfterOpen(DataSet: TDataSet);
    procedure AdoYd_CAfterScroll(DataSet: TDataSet);
    procedure AdoYd_C_DtlAfterOpen(DataSet: TDataSet);
    procedure dgWait_SchedDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dgWait_SchedCellClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
  private
    { Private declarations }
    //==为了通过发送消息更新主窗体状态栏而增加==//
    procedure WMUpdateTextStatus(var message:twmupdatetextstatus);  {WM_UPDATETEXTSTATUS消息处理函数}
                                              message WM_UPDATETEXTSTATUS;
    procedure updatestatusBar(const text:string);//Text为该格式#$2+'0:abc'+#$2+'1:def'表示状态栏第0格显示abc,第1格显示def,依此类推
    //==========================================//
    procedure UpdateAdoYd_Z;
    procedure UpdateAdoYd_C;
    procedure UpdateAdoBus;
    procedure UpdateAdoWorker;
    procedure ReadIni;
    procedure update_dgYd_Z;
    procedure update_dgWorker;
    procedure update_dgYd_C;
    procedure update_dgWait_Sched;
    procedure LoadToolMenu(const ToolMenuItem: TMenuItem;const ASel: string);
    procedure miToolItemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses UDM, UfrmCommCode, UfrmLogin, Ufrmdocset, UfrmBackBill, UfrmCommQuery,
  UfrmHistCommQuery;

var
  ArCheckBoxValue:TArCheckBoxValue;

{$R *.dfm}

procedure TfrmMain.N2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  frmCommCode.ShowModal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if ifRegister then bRegister:=true else bRegister:=false;
  
  frmLogin.ShowModal;
  
  AdoYd_Z.Connection := DM.ADOConnection1;
  AdoYd_C.Connection := DM.ADOConnection1;
  AdoYd_C_Dtl.Connection := DM.ADOConnection1;
  adoBus.Connection := DM.ADOConnection1;
  adoWorker.Connection := DM.ADOConnection1;
  adoWait_Sched.Connection := DM.ADOConnection1;
  adoWait_Sched_Dtl.Connection := DM.ADOConnection1;
  adoPrint.Connection := DM.ADOConnection1;

  ReadIni;

  UpdateAdoYd_Z;
  LoadGroupName(ComboBox4,'select name from commcode where typename=''发货公司'' ');
  LoadGroupName(ComboBox5,'select name from commcode where typename=''发货公司'' ');
  
  TimerIdleTracker.Enabled:=true;//要用到ReadConfig中的LoginTime参数
  
  LoadToolMenu(N14,'select name from CommCode where TypeName=''工具菜单'' order by ID');
end;

procedure TfrmMain.UpdateStatusBar(const text: string);
//Text为该格式#$2+'0:abc'+#$2+'1:def'表示状态栏第0格显示abc,第1格显示def,依此类推
var
  i,J2Pos,J2Len,TextLen,j:integer;
  tmpText:string;
begin
  TextLen:=length(text);
  for i :=0 to StatusBar1.Panels.Count-1 do
  begin
    J2Pos:=pos(#$2+inttostr(i)+':',text);
    J2Len:=length(#$2+inttostr(i)+':');
    if J2Pos<>0 then
    begin
      tmpText:=text;
      tmpText:=copy(tmpText,J2Pos+J2Len,TextLen-J2Pos-J2Len+1);
      j:=pos(#$2,tmpText);
      if j<>0 then tmpText:=leftstr(tmpText,j-1);
      StatusBar1.Panels[i].Text:=tmpText;
    end;
  end;
end;

procedure TfrmMain.WMUpdateTextStatus(var message: twmupdatetextstatus);
begin
  UpdateStatusBar(pchar(message.Text));
  message.Result:=-1;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
var
  adotemp11:TAdoquery;
  Insert_Identity:integer;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Add('insert into yd_z (user_name) values ('''+operator_name+''') ');
  adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
  adotemp11.Open;
  Insert_Identity:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
  adotemp11.Free;
  
  AdoYd_Z.Requery([]);
  AdoYd_Z.Locate('调度号',Insert_Identity,[loCaseInsensitive]) ;
end;

procedure TfrmMain.UpdateAdoYd_Z;
var
  strsql22,strsql,STRSQL45,STRSQL47: string;
begin
  if bRegister then strsql22:='select ' else strsql22:='select top 2 ';//未注册版本只能显示前两条记录
  strsql:=' yd_z.ydh as 调度号,yd_z.create_date_time as 创建日期,yd_z.Print_Time as 打印时间, '+
        ' yd_z.Reserve as 发送标志,yd_z.Reserve9 as 发送时间 '+
        ' from yd_z where ';
  STRSQL47:=' isnull(Stat_Desc,'''')<>''已发车'' ';
  STRSQL45:=' order by yd_z.create_date_time ';
  AdoYd_Z.Close;
  AdoYd_Z.SQL.Clear;
  AdoYd_Z.SQL.Add(strsql22);
  AdoYd_Z.SQL.Add(strsql);
  AdoYd_Z.SQL.Add(strsql47);
  AdoYd_Z.SQL.Add(strsql45);
  AdoYd_Z.Open;
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  if (MessageDlg('是否真要删除当前记录？', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;
  
  dgYd_Z.DataSource.DataSet.Delete;

  if adoWait_Sched.Active then adoWait_Sched.Requery([]);
end;

procedure TfrmMain.N8Click(Sender: TObject);
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  frmdocset.showmodal;
end;

procedure TfrmMain.N4Click(Sender: TObject);
var
  ss:string;
begin
  ss:='RegisterNum'+#2+'Edit'+#2+#2+'0'+#2+'将该窗体标题栏上的字符串发给开发者,以获取注册码'+#2;
  if bRegister then exit;
  //函数返回的Pchar类型还真能直接赋值给string!!!
  if ShowOptionForm(Pchar('注册:'+GetHDSn('C:\')+'-'+GetHDSn('D:\')),'Register',Pchar(ss),Pchar(ChangeFileExt(Application.ExeName,'.ini')))then
    if ifRegister then bRegister:=true else bRegister:=false;
end;

procedure TfrmMain.TimerIdleTrackerTimer(Sender: TObject);
begin
  //自动弹出登录窗口
  if (StopTime>LoginTime) and (FindWindow(PCHAR('TfrmLogin'),PCHAR('登录'))=0) then
    frmLogin.ShowModal;
end;

procedure TfrmMain.N10Click(Sender: TObject);
var                                                                           
  ss:string;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  ss:='弹出登录窗口的时间'+#2+'Edit'+#2+#2+'1'+#2+'注:表示多长时间内无操作,则自动弹出登录窗口(单位:秒)'+#2+#3;
  if ShowOptionForm('选项','报表'+#2+'选项'+#2+'打印模板',Pchar(ss),Pchar(ChangeFileExt(Application.ExeName,'.ini'))) then
	  ReadIni;
end;

procedure TfrmMain.ReadIni;
var
  configini:tinifile;

  pInStr,pDeStr:Pchar;
  i:integer;
  adotemp22:tadoquery;
begin
  //读系统代码
  adotemp22:=tadoquery.Create(nil);
  adotemp22.Connection:=dm.ADOConnection1;
  adotemp22.Close;
  adotemp22.SQL.Clear;
  adotemp22.SQL.Text:='select Name from CommCode where TypeName=''系统代码'' and ReMark=''授权使用单位'' ';
  adotemp22.Open;
  SCSYDW:=adotemp22.fieldbyname('Name').AsString;
  adotemp22.Free;
  if SCSYDW='' then SCSYDW:='2F3A054F64394BBBE3D81033FDE12313';//'未授权单位'加密后的字符串
  //======解密SCSYDW
  pInStr:=pchar(SCSYDW);
  pDeStr:=DeCryptStr(pInStr,CryptStr);
  setlength(SCSYDW,length(pDeStr));
  for i :=1  to length(pDeStr) do SCSYDW[i]:=pDeStr[i-1];
  //==========

  CONFIGINI:=TINIFILE.Create(ChangeFileExt(Application.ExeName,'.ini'));

  LoginTime:=configini.ReadInteger('选项','弹出登录窗口的时间',30);
      
  configini.Free;
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
var
  Insert_Identity:integer;
begin
  Insert_Identity:=AdoYd_Z.fieldbyname('调度号').AsInteger;
  AdoYd_Z.Requery([]);
  AdoYd_Z.Locate('调度号',Insert_Identity,[loCaseInsensitive]) ;
end;

procedure TfrmMain.AdoYd_ZAfterScroll(DataSet: TDataSet);
begin
  UpdateAdoYd_C;
  UpdateAdoBus;
end;

procedure TfrmMain.UpdateAdoBus;
var
  strsql11:string;
begin
  if not AdoYd_Z.Active then exit;

  strsql11:='select '+
            ' bus_name as 车牌号,Unid '+
            ' from YD_Bus where ydh=:ydh ';

  AdoBus.Close;
  AdoBus.SQL.Clear;
  AdoBus.SQL.Text:=strsql11;
  AdoBus.Parameters.ParamByName('ydh').Value :=
      dsYd_Z.DataSet.FieldByName('调度号').AsInteger;
  try
    AdoBus.Open;
  except
  end;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var
  adotemp11:TAdoquery;
  Insert_Identity:integer;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  if not AdoYd_Z.Active then exit;
  if AdoYd_Z.RecordCount<=0 then exit;

  if trim(ComboBox1.Text)='' then exit;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Add('insert into yd_bus (ydh,bus_name,user_name) values ('+AdoYd_Z.fieldbyname('调度号').AsString+','''+ComboBox1.Text+''','''+operator_name+''') ');
  adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
  adotemp11.Open;
  Insert_Identity:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
  adotemp11.Free;
  
  AdoBus.Requery([]);
  AdoBus.Locate('Unid',Insert_Identity,[loCaseInsensitive]) ;

  ComboBox1.Text:='';
  if ComboBox1.CanFocus then ComboBox1.SetFocus;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
var
  adotemp11:TAdoquery;
  Insert_Identity:integer;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  if not AdoYd_Z.Active then exit;
  if AdoYd_Z.RecordCount<=0 then exit;

  if not adoBus.Active then exit;
  if adoBus.RecordCount<=0 then exit;

  if trim(ComboBox3.Text)='' then exit;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Add('insert into yd_worker (pkunid,worker_type,worker_name,user_name) values ('+adoBus.fieldbyname('unid').AsString+','''+ComboBox2.Text+''','''+ComboBox3.Text+''','''+operator_name+''') ');
  adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
  adotemp11.Open;
  Insert_Identity:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
  adotemp11.Free;
  
  adoWorker.Requery([]);
  adoWorker.Locate('Unid',Insert_Identity,[loCaseInsensitive]) ;

  ComboBox3.Text:='';
  if ComboBox3.CanFocus then ComboBox3.SetFocus;
end;

procedure TfrmMain.UpdateAdoWorker;
var
  strsql11:string;
begin
  if not AdoBus.Active then exit;

  strsql11:='select '+
            ' Worker_Type as 人员类型,Worker_Name as 人员名称,Unid '+
            ' from YD_Worker where pkunid=:pkunid ';

  AdoWorker.Close;
  AdoWorker.SQL.Clear;
  AdoWorker.SQL.Text:=strsql11;
  AdoWorker.Parameters.ParamByName('pkunid').Value :=
      dsBus.DataSet.FieldByName('unid').AsInteger;
  try
    AdoWorker.Open;
  except
  end;
end;

procedure TfrmMain.adoBusAfterScroll(DataSet: TDataSet);
begin
  UpdateAdoWorker;
end;

procedure TfrmMain.adoBusAfterOpen(DataSet: TDataSet);
begin
  UpdateAdoWorker;
end;

procedure TfrmMain.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  tmpADOLYGetcode:TADOLYGetcode;
begin
  if key<>13 then exit;
  tmpADOLYGetcode:=TADOLYGetcode.create(nil);
  tmpADOLYGetcode.Connection:=DM.ADOConnection1;
  tmpADOLYGetcode.IfNullGetCode:=true;
  tmpADOLYGetcode.OpenStr:='select name as 车牌号,ID from CommCode where TypeName=''车辆'' ';
  tmpADOLYGetcode.InField:='id,name,pym';
  tmpADOLYGetcode.InValue:=TComboBox(sender).Text;
  tmpADOLYGetcode.ShowX:=left+TComboBox(SENDER).Parent.Left+TComboBox(SENDER).Left+222;
  tmpADOLYGetcode.ShowY:=top+22{当前窗体标题栏高度}+21{当前窗体菜单高度}+TComboBox(SENDER).Parent.Top+TComboBox(SENDER).Top+TComboBox(SENDER).Height+43;

  if tmpADOLYGetcode.Execute then
  begin
    TComboBox(SENDER).Text:=tmpADOLYGetcode.OutValue[0];
  end;
  tmpADOLYGetcode.Free;
end;

procedure TfrmMain.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  tmpADOLYGetcode:TADOLYGetcode;
begin
  if key<>13 then exit;
  tmpADOLYGetcode:=TADOLYGetcode.create(nil);
  tmpADOLYGetcode.Connection:=DM.ADOConnection1;
  tmpADOLYGetcode.IfNullGetCode:=true;
  tmpADOLYGetcode.OpenStr:='select name as 名称,ID from Worker ';
  tmpADOLYGetcode.InField:='id,pinyin';
  tmpADOLYGetcode.InValue:=TComboBox(sender).Text;
  tmpADOLYGetcode.ShowX:=left+TComboBox(SENDER).Parent.Left+TComboBox(SENDER).Left+222;
  tmpADOLYGetcode.ShowY:=top+22{当前窗体标题栏高度}+21{当前窗体菜单高度}+TComboBox(SENDER).Parent.Top+TComboBox(SENDER).Top+TComboBox(SENDER).Height+43;

  if tmpADOLYGetcode.Execute then
  begin
    TComboBox(SENDER).Text:=tmpADOLYGetcode.OutValue[0];
  end;
  tmpADOLYGetcode.Free;
end;

procedure TfrmMain.UpdateAdoYd_C;
var
  strsql11:string;
begin
  if not AdoYd_Z.Active then exit;

  {strsql11:='select '+
	'SC_COMPANY as 发货公司,SC_YDH AS 发货公司运单号 ,SC_CUSTOMER as 发货公司的客户名称,SC_SendAddr as 发货公司的送货地址,	'+
  'SC_BillNo as 发货公司清单号 ,	SC_BillDetNo as 发货公司清单明细号 ,	'+
  'SC_SIZE_DESC as 发货公司商品代码 ,	SC_SKU_DESC as 发货公司品名规格 ,	SEND_QTY as 数量 ,	'+
  'SC_UNITS as 发货公司单位 ,	SC_BATCH_NBR as 发货公司批号,SC_Request_Send_Time as 发货公司要求送达时间,Pick_Date_time as 提货时间,RTE_NBR as 线路,Send_Aear as 送货地址的区域,'+
  'Create_Date_Time as 创建时间 ,	User_Name as 操作人,	YDH  ,	Unid,pkunid,SC_BillNo_Js as 清单号的实际件数 '+
            ' from YD_C where ydh=:ydh ';//}

  strsql11:='select '+
	'SC_COMPANY as 发货公司,SC_YDH AS 发货公司运单号 ,SC_CUSTOMER as 发货公司的客户名称,SC_SendAddr as 发货公司的送货地址,	'+
  'SC_BillNo as 发货公司清单号 ,	'+
  'SC_Request_Send_Time as 发货公司要求送达时间,Pick_Date_time as 提货时间,RTE_NBR as 线路,Send_Aear as 送货地址的区域,'+
  'SC_BillNo_Js as 清单号的实际件数 '+
            ' from YD_C where ydh=:ydh '+
  ' group by '+            
	'SC_COMPANY,SC_YDH,SC_CUSTOMER,SC_SendAddr,	'+
  'SC_BillNo  ,	'+
  'SC_Request_Send_Time ,Pick_Date_time ,RTE_NBR,Send_Aear ,'+
  'SC_BillNo_Js  ';

  AdoYd_C.Close;
  AdoYd_C.SQL.Clear;
  AdoYd_C.SQL.Text:=strsql11;
  AdoYd_C.Parameters.ParamByName('ydh').Value :=
      dsYd_Z.DataSet.FieldByName('调度号').AsInteger;
  try
    AdoYd_C.Open;
  except
  end;
end;

procedure TfrmMain.BitBtn5Click(Sender: TObject);
var
  adotemp11:TAdoquery;
  Insert_Identity,iJS:integer;
  fSEND_QTY:single;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  if not AdoYd_Z.Active then exit;
  if AdoYd_Z.RecordCount<=0 then exit;

  if not trystrtofloat(LabeledEdit8.Text,fSEND_QTY) then
  begin
    messagedlg('数量不符合输入要求！',mtinformation,[mbok],0);
    if LabeledEdit8.CanFocus then LabeledEdit8.SetFocus;
    exit;
  end;

  iJS:=0;
  if trim(LabeledEdit9.Text)='件' then iJS:=trunc(fSEND_QTY);
  
  
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Add('insert into yd_c (YDH,SC_COMPANY,SC_YDH,SC_CUSTOMER,SC_SendAddr,SC_BillNo,SC_BillDetNo,SC_SIZE_DESC,SC_SKU_DESC,SEND_QTY,SC_UNITS,SC_BATCH_NBR,RTE_NBR,User_Name,PkUnid,SC_BillNo_Js) values ('
  +AdoYd_Z.fieldbyname('调度号').AsString+','''+ComboBox4.Text+''','''+LabeledEdit1.Text+''','''+LabeledEdit2.Text+''','''+LabeledEdit3.Text+
  ''','''+LabeledEdit4.Text+''','''+LabeledEdit5.Text+''','''+LabeledEdit6.Text+''','''+LabeledEdit7.Text+''','+LabeledEdit8.Text+
  ','''+LabeledEdit9.Text+''','''+LabeledEdit10.Text+''','''','''+operator_name+''',null,'+inttostr(iJS)+') ');
  adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
  adotemp11.Open;
  Insert_Identity:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
  adotemp11.Free;
  
  AdoYd_C.Requery([]);
  AdoYd_C.Locate('Unid',Insert_Identity,[loCaseInsensitive]) ;

  LabeledEdit1.Clear;
  LabeledEdit2.Clear;
  LabeledEdit3.Clear;
  LabeledEdit4.Clear;
  LabeledEdit5.Clear;
  LabeledEdit6.Clear;
  LabeledEdit7.Clear;
  LabeledEdit8.Clear;
  LabeledEdit9.Clear;
  LabeledEdit10.Clear;
  if LabeledEdit1.CanFocus then LabeledEdit1.SetFocus;
end;

procedure TfrmMain.N11Click(Sender: TObject);
var
  sPkUnid:string;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  sPkUnid:=AdoYd_C_Dtl.FieldByName('pkunid').AsString;

  dgYd_C.DataSource.DataSet.Delete;

  if (sPkUnid<>'') and (adoWait_Sched.Active) then adoWait_Sched.Requery([]);
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  dgBus.DataSource.DataSet.Delete;
end;

procedure TfrmMain.N13Click(Sender: TObject);
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  dgWorker.DataSource.DataSet.Delete;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
var
  strsql11:string;
  adotemp22:tadoquery;
  i,j:integer;
begin
  if not AdoYd_Z.Active then exit;

  strsql11:='select 0 as 选择, V.* from view_Wait_Sched_BILL_HDR V '+//CONVERT(bit,0)
  ' where isnull(发货公司,'''') like ''%'+ComboBox5.Text+
  '%'' and isnull(发货公司运单号,'''') like ''%'+LabeledEdit11.Text+
  '%'' and isnull(发货公司的客户名称,'''') like ''%'+LabeledEdit12.Text+
  '%'' and isnull(发货公司的送货地址,'''') like ''%'+LabeledEdit13.Text+
  '%'' and isnull(发货公司清单号,'''') like ''%'+LabeledEdit14.Text+
  '%'' and isnull(发货公司商品类型,'''') like ''%'+LabeledEdit15.Text+
//  '%'' and isnull(SC_SIZE_DESC,'''') like ''%'+LabeledEdit17.Text+
  '%'' and isnull(发货公司车牌号,'''') like ''%'+LabeledEdit16.Text+
  '%'' and isnull(线路,'''') like ''%'+LabeledEdit18.Text+
  '%'' and isnull(送货地址的区域,'''') like ''%'+LabeledEdit19.Text+'%'' ';            

  adoWait_Sched.Close;
  adoWait_Sched.SQL.Clear;
  adoWait_Sched.SQL.Text:=strsql11;
  try
    adoWait_Sched.Open;
  except
  end;
  
  adotemp22:=tadoquery.Create(nil);
  adotemp22.clone(adoWait_Sched);
  ArCheckBoxValue:=nil;
  setlength(ArCheckBoxValue,adotemp22.RecordCount);
  i:=0;
  while not adotemp22.Eof do
  begin
    for j :=0  to 1 do
    begin
      //该二维数组中一定要有个字段标识唯一性的
      if j=0 then
        ArCheckBoxValue[I,j]:='0'
      else ArCheckBoxValue[I,j]:=adotemp22.FieldByName('发货公司').AsString+adotemp22.FieldByName('发货公司清单号').AsString;
    end;
    adotemp22.Next;
    inc(i);
  end;
  adotemp22.Free;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
var
  adotemp11,adotemp22:TAdoquery;
  Insert_Identity:integer;
  sYDH,sSC_COMPANY,sSC_BillNo:string;
  ifSelect:boolean;
  i:integer;
  m,n:integer;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  if not AdoYd_Z.Active then exit;
  if AdoYd_Z.RecordCount<=0 then exit;

  if not adoWait_Sched.Active then exit;
  if adoWait_Sched.RecordCount<=0 then exit;

  //判断选中单据的数量
  n:=0;
  for m:=0 to length(ArCheckBoxValue)-1 do
  begin
    if ArCheckBoxValue[m,0]='1' then inc(n);
  end;
  if n<=0 then exit;
  if n>50 then
  begin
    MessageBox(Handle, '不能一次批量调度50张以上的单据！', '信息提示', MB_ICONERROR);
    exit;
  end;
  //====================

  sYDH:=AdoYd_Z.fieldbyname('调度号').AsString;

  adotemp22:=tadoquery.Create(nil);
  adotemp22.clone(adoWait_Sched);
  while not adotemp22.Eof do
  begin
    ifSelect:=false;
    for i :=0  to adotemp22.RecordCount-1 do//循环ArCheckBoxValue
    begin
      if (ArCheckBoxValue[i,1]=adotemp22.fieldbyname('发货公司').AsString+adotemp22.fieldbyname('发货公司清单号').AsString)and(ArCheckBoxValue[i,0]='1') then
      begin
        ifSelect:=true;
        break;
      end;
    end;
    if not ifSelect then begin adotemp22.Next;continue;end;//如果未选择，则跳过

    adotemp11:=tadoquery.Create(nil);
    adotemp11.Connection:=DM.ADOConnection1;

    sSC_COMPANY:=adotemp22.fieldbyname('发货公司').AsString;
    sSC_BillNo:=adotemp22.fieldbyname('发货公司清单号').AsString;

    adotemp11.Close;
    adotemp11.SQL.Clear;

    adotemp11.SQL.Add('insert into yd_c (YDH,SC_COMPANY,SC_YDH,SC_CUSTOMER,SC_SendAddr,SC_BillNo,SC_BillDetNo,SC_SIZE_DESC,SC_SKU_DESC,SEND_QTY,SC_UNITS,SC_BATCH_NBR,SC_Request_Send_Time,Pick_Date_time,RTE_NBR,Send_Aear,User_Name,           PkUnid,SC_BillNo_Js,'+
                   'Reserve,Reserve2,Reserve3,Reserve4) '+
                           ' select '+sYDH+',SC_COMPANY,SC_YDH,SC_CUSTOMER,SC_SendAddr,SC_BillNo,SC_BillDetNo,SC_SIZE_DESC,SC_SKU_DESC,KCFSL,   SC_UNITS,SC_BATCH_NBR,SC_Request_Send_Time,Pick_Date_time,RTE_NBR,Send_Aear,'''+operator_name+''',Unid, SC_BillNo_Js,'+
                   'Reserve,Reserve2,Reserve3,Reserve4 from Wait_Sched where SC_COMPANY='''+sSC_COMPANY+''' and SC_BillNo='''+sSC_BillNo+ ''' and KCFSL>0');
    adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
    adotemp11.Open;

    Insert_Identity:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
    adotemp11.Free;

    adotemp22.Next;
  end;
  adotemp22.Free;
  
  AdoYd_C.Requery([]);

  adoWait_Sched.Requery([]);
end;

procedure TfrmMain.SpeedButton4Click(Sender: TObject);
var
  adotemp11:Tadoquery;
  iNum:integer;
begin
//  if not ifhaspower(sender,powerstr_js_main) then exit;

   if not AdoYd_Z.Active then exit;
   if AdoYd_Z.RecordCount=0 then exit;

  if not frReport1.LoadFromFile(ExtractFilePath(application.ExeName)+'Rep_YD.frf') then
  begin
    showmessage('加载默认通用打印模板Rep_YD.frf失败');//，请设置:系统设置->选项->打印模板
    exit;
  end;

  adotemp11:=Tadoquery.Create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='select count(*) as iNum from yd_c where ydh=:ydh';
  adotemp11.Parameters.ParamByName('ydh').Value:=AdoYd_Z.fieldbyname('调度号').AsInteger;
  adotemp11.Open;
  iNum:=adotemp11.fieldbyname('iNum').AsInteger;
  adotemp11.Free;
  if iNum<=0 then exit;

  adoPrint.Close;
  adoPrint.SQL.Clear;
  adoPrint.SQL.Add('select * from view_Print_LD where ydh=:ydh');
  adoPrint.Parameters.ParamByName('ydh').Value:=AdoYd_Z.fieldbyname('调度号').AsInteger;
  adoPrint.Open;
  

    //if n9.Checked then  //预览模式
      frReport1.ShowReport;
    //if n8.Checked then  //直接打印模式
    //begin
    //  if frReport1.PrepareReport then frReport1.PrintPreparedReport('', 1, True, frAll);
    //end;
end;

procedure TfrmMain.update_dgYd_Z;
begin
  if not dgYd_Z.DataSource.DataSet.Active then exit;
  
  dgYd_Z.Columns[0].Width:=45;
  dgYd_Z.Columns[1].Width:=135;
end;

procedure TfrmMain.AdoYd_ZAfterOpen(DataSet: TDataSet);
begin
  update_dgYd_Z;
end;

procedure TfrmMain.update_dgWorker;
begin
  if not dgWorker.DataSource.DataSet.Active then exit;
  
  dgWorker.Columns[0].Width:=55;
  dgWorker.Columns[1].Width:=55;
end;

procedure TfrmMain.adoWorkerAfterOpen(DataSet: TDataSet);
begin
  update_dgWorker;
end;

procedure TfrmMain.update_dgYd_C;
begin
  if not dgYd_C.DataSource.DataSet.Active then exit;

  dgYd_C.Columns[0].Width:=60;
  dgYd_C.Columns[1].Width:=102;
  dgYd_C.Columns[2].Width:=100;
  dgYd_C.Columns[3].Width:=100;
  dgYd_C.Columns[4].Width:=122;
  dgYd_C.Columns[5].Width:=100;
  dgYd_C.Columns[6].Width:=100;
  dgYd_C.Columns[7].Width:=100;
  dgYd_C.Columns[8].Width:=80;//数量
  //dgYd_C.Columns[9].Width:=100;
  //dgYd_C.Columns[10].Width:=100;
  //dgYd_C.Columns[11].Width:=100;
  //dgYd_C.Columns[12].Width:=100;
end;

procedure TfrmMain.update_dgWait_Sched;
begin
  if not dgWait_Sched.DataSource.DataSet.Active then exit;

  dgWait_Sched.Columns[0].Width:=40;
  dgWait_Sched.Columns[1].Width:=60;
  dgWait_Sched.Columns[2].Width:=102;
  dgWait_Sched.Columns[3].Width:=100;
  dgWait_Sched.Columns[4].Width:=100;
  dgWait_Sched.Columns[5].Width:=122;//发货公司清单号
  dgWait_Sched.Columns[6].Width:=100;
  dgWait_Sched.Columns[7].Width:=100;
  dgWait_Sched.Columns[8].Width:=100;
  dgWait_Sched.Columns[9].Width:=80;//数量
  dgWait_Sched.Columns[10].Width:=100;
  //dgWait_Sched.Columns[11].Width:=100;
  //dgWait_Sched.Columns[12].Width:=100;
end;

procedure TfrmMain.AdoYd_CAfterOpen(DataSet: TDataSet);
begin
  update_dgYd_C;
end;

procedure TfrmMain.adoWait_SchedAfterOpen(DataSet: TDataSet);
begin
  update_dgWait_Sched;
end;

procedure TfrmMain.LoadToolMenu(const ToolMenuItem: TMenuItem;
  const ASel: string);
var
  adotemp3:tadoquery;
  delMenuItem,TempMenuItem:TMenuItem;
  tempstr:string;
  i,j:integer;
begin
  adotemp3:=tadoquery.Create(nil);
  adotemp3.Connection:=DM.ADOConnection1;
  adotemp3.Close;
  adotemp3.SQL.Clear;
  adotemp3.SQL.Text:=ASel;
  adotemp3.Open;

  //加载前先清除工具菜单项
  for j := ToolMenuItem.Count-1 downto 0 do
  begin
      if (ToolMenuItem.Items[j] is TMenuItem)then
      begin
        delMenuItem := ToolMenuItem.Items[j];
        if (delMenuItem <> nil) then FreeandNIl(delMenuItem);
      end;
  end;

  i:=0;
  while not adotemp3.Eof do
  begin
    inc(i);
    tempstr:=trim(adotemp3.fieldbyname('name').AsString);

    //加载到工具菜单
    TempMenuItem := TMenuItem.Create(self);
    TempMenuItem.Name := 'TmpTool' + inttostr(i);
    TempMenuItem.Caption := tempstr;
    TempMenuItem.OnClick:=miToolItemClick;
    ToolMenuItem.Add(TempMenuItem);

    adotemp3.Next;
  end;
  adotemp3.Free;
end;

procedure TfrmMain.miToolItemClick(Sender: TObject);
var
  adotemp3:tadoquery;
  Reserve,Reserve2:string;
begin
  adotemp3:=tadoquery.Create(nil);
  adotemp3.Connection:=DM.ADOConnection1;
  adotemp3.Close;
  adotemp3.SQL.Clear;
  adotemp3.SQL.Text:='select Reserve,Reserve2 from CommCode where TypeName=''工具菜单'' and name='''+(Sender as TMenuItem).Caption+''' ';
  adotemp3.Open;
  Reserve:=adotemp3.fieldbyname('Reserve').AsString;
  Reserve2:=adotemp3.fieldbyname('Reserve2').AsString;
  adotemp3.Free;

  if Reserve2='1' then if not ifhaspower(sender,powerstr_js_main) then exit;

  if ShellExecute(Handle, 'Open', Pchar(ExtractFilePath(application.ExeName)+Reserve), '', '', SW_ShowNormal)<=32 then
    MessageDlg((Sender as TMenuItem).Caption+'('+Reserve+')打开失败!',mtError,[mbOK],0);
end;

procedure TfrmMain.N15Click(Sender: TObject);
begin
  frmLogin.ShowModal;
end;

procedure TfrmMain.dgYd_ZDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  iNum,iYdh:integer;
  adotemp11:Tadoquery;
  sPrintTime:string;
begin
    if datacol=1 then
    begin
      iYdh:=(Sender as TDBGrid).DataSource.DataSet.fieldbyname('调度号').AsInteger;

      adotemp11:=Tadoquery.Create(nil);
      adotemp11.Connection:=dm.ADOConnection1;
      adotemp11.Close;
      adotemp11.SQL.Clear;
      adotemp11.SQL.Text:='select count(*) as iNum from yd_c where ydh=:ydh';
      adotemp11.Parameters.ParamByName('ydh').Value:=iYdh;
      adotemp11.Open;
      iNum:=adotemp11.fieldbyname('iNum').AsInteger;
      adotemp11.Free;
      
      IF iNum<=0 then
      begin
        tdbgrid(sender).Canvas.Font.Color:=clred;
        tdbgrid(sender).DefaultDrawColumnCell(rect,datacol,column,state);
      end;
    end;

    if datacol=0 then
    begin
      sPrintTime:=(Sender as TDBGrid).DataSource.DataSet.fieldbyname('打印时间').AsString;

      IF trim(sPrintTime)<>'' then
      begin
        tdbgrid(sender).Canvas.Font.Color:=clred;
        tdbgrid(sender).DefaultDrawColumnCell(rect,datacol,column,state);
      end;
    end;
end;

procedure TfrmMain.frReport1PrintReport;
var
  adotemp11:tadoquery;
  iYdh:integer;
begin
  iYdh:=AdoYd_Z.fieldbyname('调度号').AsInteger;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update YD_Z set Print_Time=getdate() where YDH=:ydh';
  adotemp11.Parameters.ParamByName('ydh').Value:=iYdh;
  adotemp11.ExecSQL;
  adotemp11.Free;

  AdoYd_Z.Refresh;//打印后要显示红色
end;

procedure TfrmMain.N17Click(Sender: TObject);
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  frmBackBill.ShowModal;
end;

procedure TfrmMain.N19Click(Sender: TObject);
var
  adotemp11:tadoquery;
  iYdh:integer;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  if not AdoYd_Z.Active then exit;
  
  iYdh:=AdoYd_Z.fieldbyname('调度号').AsInteger;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='update YD_Z set Stat_Desc=''已发车'' where YDH=:ydh';
  adotemp11.Parameters.ParamByName('ydh').Value:=iYdh;
  adotemp11.ExecSQL;
  adotemp11.Free;

  AdoYd_Z.Requery;//发车后隐藏
end;

procedure TfrmMain.N20Click(Sender: TObject);
begin
  frmCommQuery.ShowModal;
end;

procedure TfrmMain.adoWait_SchedAfterScroll(DataSet: TDataSet);
var
  strsql11:string;
begin
  if DataSet.RecordCount=0 then exit;

  strsql11:='select SC_BillDetNo as 发货公司清单明细号,'+
  'SC_SIZE_DESC as 发货公司商品代码,'+
  'SC_SKU_DESC as 发货公司品名规格,'+
  'SC_ORIG_PKT_QTY as 发货公司数量 ,'+
  'SC_UNITS as 发货公司单位,'+
  'SC_BATCH_NBR as 发货公司批号,'+
  'KCFSL as 可拆分数量,'+
  'Create_Date_Time as 创建时间 ,'+
  'User_Name as 操作人,'+
  'Unid '+
  'from Wait_Sched '+
  ' where SC_COMPANY='''+DataSet.fieldbyname('发货公司').AsString+
  ''' and SC_BillNo='''+DataSet.fieldbyname('发货公司清单号').AsString+
  ''' and kcfsl>0 ';            

  adoWait_Sched_Dtl.Close;
  adoWait_Sched_Dtl.SQL.Clear;
  adoWait_Sched_Dtl.SQL.Text:=strsql11;
  try
    adoWait_Sched_Dtl.Open;
  except
  end;
end;

procedure TfrmMain.adoWait_Sched_DtlAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  dgWait_Sched_Dtl.Columns[0].Width:=100;
  dgWait_Sched_Dtl.Columns[1].Width:=100;
  dgWait_Sched_Dtl.Columns[2].Width:=100;
  dgWait_Sched_Dtl.Columns[3].Width:=82;
  dgWait_Sched_Dtl.Columns[4].Width:=82;
  dgWait_Sched_Dtl.Columns[5].Width:=100;
  dgWait_Sched_Dtl.Columns[6].Width:=100;
end;

procedure TfrmMain.AdoYd_CAfterScroll(DataSet: TDataSet);
var
  strsql11:string;
begin
  if DataSet.RecordCount=0 then exit;

  strsql11:='select SC_BillDetNo as 发货公司清单明细号,'+
  'SC_SIZE_DESC as 发货公司商品代码,'+
  'SC_SKU_DESC as 发货公司品名规格,'+
  'SEND_QTY as 发货公司数量 ,'+
  'SC_UNITS as 发货公司单位,'+
  'SC_BATCH_NBR as 发货公司批号,'+
  'Create_Date_Time as 创建时间 ,'+
  'User_Name as 操作人,'+
  'Unid, '+
  'PkUnid '+
  'from YD_C '+
  ' where SC_COMPANY='''+DataSet.fieldbyname('发货公司').AsString+
  ''' and SC_BillNo='''+DataSet.fieldbyname('发货公司清单号').AsString+''' ';

  AdoYd_C_Dtl.Close;
  AdoYd_C_Dtl.SQL.Clear;
  AdoYd_C_Dtl.SQL.Text:=strsql11;
  try
    AdoYd_C_Dtl.Open;
  except
  end;
end;

procedure TfrmMain.AdoYd_C_DtlAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  dgYd_C_Dtl.Columns[0].Width:=100;
  dgYd_C_Dtl.Columns[1].Width:=100;
  dgYd_C_Dtl.Columns[2].Width:=100;
  dgYd_C_Dtl.Columns[3].Width:=82;
  dgYd_C_Dtl.Columns[4].Width:=82;
  dgYd_C_Dtl.Columns[5].Width:=100;
  dgYd_C_Dtl.Columns[6].Width:=100;
end;

procedure TfrmMain.dgWait_SchedDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  CtrlState: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  checkBox_check:boolean;
  i:INTEGER;
  iUNID:string;
begin
  if Column.Field.FieldName='选择' then
  begin
    (sender as TDBGrid).Canvas.FillRect(Rect);
    checkBox_check:=false;
    iUNID:=(Sender AS TDBGRID).DataSource.DataSet.FieldByName('发货公司').AsString+(Sender AS TDBGRID).DataSource.DataSet.FieldByName('发货公司清单号').AsString;
    for i :=0  to (Sender AS TDBGRID).DataSource.DataSet.RecordCount-1 do
    begin
      if ArCheckBoxValue[i,1]=iUNID then
      begin
        checkBox_check:=ArCheckBoxValue[i,0]='1';
        break;
      end;
    end;
    DrawFrameControl((sender as TDBGrid).Canvas.Handle,Rect, DFC_BUTTON, CtrlState[checkBox_check]);
  end else (sender as TDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmMain.dgWait_SchedCellClick(Column: TColumn);
var
  iUNID:string;
  i:INTEGER;
begin
  if Column.Field.FieldName <>'选择' then exit;

  iUNID:=dgWait_Sched.DataSource.DataSet.FieldByName('发货公司').AsString+dgWait_Sched.DataSource.DataSet.FieldByName('发货公司清单号').AsString;
  for i :=0  to dgWait_Sched.DataSource.DataSet.RecordCount-1 do
  begin
    if ArCheckBoxValue[i,1]=iUNID then
    begin
      ArCheckBoxValue[i,0]:=ifThen(ArCheckBoxValue[i,0]='1','0','1');
      dgWait_Sched.Refresh;//调用DBGrid1DrawColumnCell事件
      break;
    end;
  end;
end;

procedure TfrmMain.SpeedButton5Click(Sender: TObject);
var
  i,j:integer;
begin
  for i:=0 to length(ArCheckBoxValue)-1 do
  begin
    for j :=0  to 1 do
    begin
      if j=0 then ArCheckBoxValue[I,j]:='1';
    end;
  end;
  dgWait_Sched.Refresh;//调用DBGrid1DrawColumnCell事件
end;

procedure TfrmMain.SpeedButton6Click(Sender: TObject);
var
  i,j:integer;
begin
  for i:=0 to length(ArCheckBoxValue)-1 do
  begin
    for j :=0  to 1 do
    begin
      if j=0 then ArCheckBoxValue[I,j]:='0';
    end;
  end;
  dgWait_Sched.Refresh;//调用DBGrid1DrawColumnCell事件
end;

procedure TfrmMain.N23Click(Sender: TObject);
var
  adotemp11:tadoquery;
  s1,s2,s3:string;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;

  s1:=' select   *  from YD_Z where (select count(*) from yd_c where yd_c.ydh=YD_Z.ydh and isnull(yd_c.BackBillBindNo,'''')='''')=0 ';
  s2:=' select ydh  from YD_Z where (select count(*) from yd_c where yd_c.ydh=YD_Z.ydh and isnull(yd_c.BackBillBindNo,'''')='''')=0 ';
  s3:='             from YD_Z where (select count(*) from yd_c where yd_c.ydh=YD_Z.ydh and isnull(yd_c.BackBillBindNo,'''')='''')=0 ';
  DM.ADOConnection1.BeginTrans;
  try//经测试(设置断点并中止执行或断电)，BeginTrans与CommitTrans之间的语句中止执行，数据不会提交
    adotemp11:=tadoquery.Create(nil);
    adotemp11.Connection:=DM.ADOConnection1;
    ADOtemp11.Close;
    ADOtemp11.SQL.Clear;
    ADOtemp11.SQL.Add('insert into YD_Z_BAK '+s1);
    ADOtemp11.ExecSQL;

    ADOtemp11.Close;
    ADOtemp11.SQL.Clear;
    ADOtemp11.SQL.Add('insert into YD_C_BAK select * from YD_C where YDH in ('+s2+')');
    ADOtemp11.ExecSQL;

    ADOtemp11.Close;
    ADOtemp11.SQL.Clear;
    ADOtemp11.SQL.Add('insert into YD_Bus_BAK select * from YD_Bus where YDH in ('+s2+')');
    ADOtemp11.ExecSQL;

    ADOtemp11.Close;
    ADOtemp11.SQL.Clear;
    ADOtemp11.SQL.Add('insert into YD_Worker_BAK select * from YD_Worker where PKUNID in (select UNID from YD_Bus where YDH in ('+s2+'))');
    ADOtemp11.ExecSQL;

    ADOtemp11.Close;
    ADOtemp11.SQL.Clear;
    ADOtemp11.SQL.Add('delete '+s3);
    ADOtemp11.ExecSQL;

    ADOtemp11.Close;
    ADOtemp11.SQL.Clear;
    ADOtemp11.SQL.Add('delete from Wait_Sched where not exists (select 1 from YD_C where isnull(YD_C.SC_COMPANY,'''')=isnull(Wait_Sched.SC_COMPANY,'''') and isnull(YD_C.SC_BillNo,'''')=isnull(Wait_Sched.SC_BillNo,'''')) and KCFSL=0');
    ADOtemp11.ExecSQL;

    adotemp11.Free;

    DM.ADOConnection1.CommitTrans;
    MESSAGEDLG('成功!',MTINFORMATION,[MBOK],0);
  except
    Application.MessageBox('发生异常!', '信息提示', MB_OK + MB_ICONHAND + MB_DEFBUTTON1 + MB_APPLMODAL);
    DM.ADOConnection1.RollbackTrans;
  end;
end;

procedure TfrmMain.N24Click(Sender: TObject);
begin
  frmHistCommQuery.ShowModal;
end;

procedure TfrmMain.N26Click(Sender: TObject);
var
  adotemp11:tadoquery;
  sYdh:string;
  sSend2PDA:string;
begin
  if not ifhaspower(sender,powerstr_js_main) then exit;
  
  sYdh:=AdoYd_Z.fieldbyname('调度号').AsString;

  sSend2PDA:=AdoYd_Z.fieldbyname('发送标志').AsString;

  if sSend2PDA='可下载' then exit;
  
  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  ADOtemp11.Close;
  ADOtemp11.SQL.Clear;
  ADOtemp11.SQL.Add('update yd_z set Reserve=''可下载'',Reserve9=getdate() where YDH='+sYdh);
  ADOtemp11.ExecSQL;
  ADOtemp11.Free;
    
  AdoYd_Z.Requery;
end;

end.
