unit UDM;

interface

uses
  WINDOWS,SysUtils, Classes, DB, ADODB,INIFILES,Dialogs{ShowMessage����},Controls,
  ComCtrls, Buttons,StdCtrls, ExtCtrls,MENUS,DBGrids,StrUtils, FR_Class,
  FR_DSet, FR_DBSet,Forms{Application����},DBCtrls{DBEdit},Mask{TMaskEdit},Imm{ImmGetIMEFileName};

type
  PDescriptType=^TDescriptType;
  TDescriptType=record
    ID:string;
    UpID:String;
  end;
  
type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  CryptStr='lc';//�ӽ�������
  SYSNAME='TMS';
  sDBALIAS='ALIAS_SHHJ';
  CGYXJB='����';//�������ȼ����ַ���
  SHOW_CHK_CON_HIS='select cch.unid as Ψһ���,cch.lsh as ������,cch.patientname as ����,cch.report_doctor as �����,'+
        ' cch.caseno as ������,cch.sex as �Ա�,'+
        ' cch.age as ����,cch.bedno as ����,cch.deptname as �ͼ����,'+
        ' cch.check_date as Ҫ��������,cch.check_doctor as �ͼ�ҽ��,'+
        ' cch.report_date as ��������,'+
        ' cch.operator as ������,cch.printtimes as ��ӡ����,cch.diagnosetype as ���ȼ���,'+
        ' cch.flagetype as ��������,cch.diagnose as �ٴ����,cch.typeflagcase as �������,'+
        ' cch.issure as ��ע,cch.combin_id as ���뵥������,cch.germname as ϸ��,cch.checkid as ������, '+
        ' cch.His_Unid as HisΨһ���,cch.His_MzOrZy as His�����סԺ, '+
        ' cch.WorkDepartment as ��������,cch.WorkCategory as ����,cch.WorkID as ����,cch.ifMarry as ���,cch.OldAddress as ����,cch.Address as סַ,cch.Telephone as �绰,cch.WorkCompany as ������˾, '+
        ' cch.PushPress as ����ѹ,cch.PullPress as ����ѹ,cch.LeftEyesight as ��������,cch.RightEyesight as ��������,cch.Stature as ����,cch.Weight as ����, '+
        ' cch.TjJiWangShi as ����ʷ,cch.TjJiaZuShi as ����ʷ,cch.TjNeiKe as �ڿ�,cch.TjWaiKe as ���,cch.TjWuGuanKe as ��ٿ�,cch.TjFuKe as ����,cch.TjLengQiangGuang as ��ǿ��,cch.TjXGuang as X��,cch.TjBChao as B��,'+
        ' cch.TjXinDianTu as �ĵ�ͼ,cch.TjJianYan as ����,cch.TjDescription as ����,cch.TJAdvice as ���� '+
        ' from view_Show_chk_Con_His cch ';

var
  DM: TDM;

  powerstr_js_main:string;
  operator_name:string;
  operator_id:string;
  ifGetMemoFromCaseNo:boolean;//�Ƿ����"����/סԺ��"��ȡ��ע
  ifSaveSuccess:boolean;//��¼"������鵥F3"�¼��Ƿ�ɹ�,����¼��ʱҪ�õ�
  ifAutoCheck:boolean;//��¼�Ƿ��ӡʱ�Զ���˼��鵥
  ifEnterGetCode:boolean;//��¼�Ƿ� ��д���˻�����Ϣʱ,ֱ�ӻس�����ȡ���
  deptname_match:string;//��¼�ͼ���ҵ�ȡ��ƥ�䷽ʽ
  check_doctor_match:string;////��¼�ͼ�ҽ����ȡ��ƥ�䷽ʽ
  ifDoctorStation:boolean;//��¼�Ƿ����ʾ����˵ļ��鵥
  ShowSelfDJ:boolean;//����ʾ��¼���������鵥
  ifGetInfoFromHis:boolean;//��¼�Ƿ���ȡHIS�еĲ��˻�����Ϣ��������Ŀ
  ifAutoCompletionJob:boolean;//�Ƿ�رճ���ʱ�Զ��������鹤��
  CXZF:STRING;//�����������ַ�
  bRegister:boolean;
  SCSYDW:STRING;//��Ȩʹ�õ�λ
  MergePrintDays:integer;//��ʷ����ϲ���ӡ��ƫ������
  SmoothNum:integer;//ֱ��ͼ�⻬����
  LisConn:string;//Lis�����ַ���,MakeDBConn�����б���ֵ,Ȼ����QC.DLL��CalcItemPro.dll
  OrderType:string;//������Ϣ����ʽ
  ifBatchOperater:boolean;//�Ƿ���������,��������ʱ��������������Ϣ����.����̫��ʱ,ʹ������
  LoginTime:integer;//������¼���ڵ�ʱ��

  TempFile_Common:string;
  TempFile_Group:string;
  WorkGroup_T1:string;
  TempFile_T1:string;
  WorkGroup_T2:string;
  TempFile_T2:string;
  WorkGroup_T3:string;
  TempFile_T3:string;

  ifSearchHistValue:boolean;//�Ƿ������ʷ���

  ifHeightForItemNum:boolean;
  ItemRecNum:integer;
  PageHeigth:integer;  

//**********************Dll�ӿں�������***************************************//
//�ú�������pSourStr���ж��ٸ�pSS
function ManyStr(const pSS, pSourStr: Pchar): integer;stdcall;external 'LYFunction.dll';
//��Χ�ַ���pRangeStr����5,7-9,11 ת��Ϊ('0005','0007','0008','0009','0011')
function RangeStrToSql(const pRangeStr:Pchar;const ifLPad:boolean;const LPad:Char;const sWidth:integer;var pSqlStr:Pchar):boolean;stdcall;external 'LYFunction.dll';
//��ǿ�͵�Pos����,ȡ��psubStr��pAllstr�е�Times�γ��ֵ�λ��
function PosExt(const psubStr,pAllstr:Pchar;const Times:Byte):integer;stdcall;external 'LYFunction.dll';
//�ҵ�����ʽ��С����λ�������ֵ.��56.5*100+23.01��ֵΪ2
function MaxDotLen(const ACalaExp:PChar):integer;stdcall;external 'LYFunction.dll';
function GetHDSn(const RootPath:pchar):pchar;stdcall;external 'LYFunction.dll';
function GetSysCurImeName: pchar;stdcall;external 'LYFunction.dll';//ȡ��ϵͳ��ǰ���������뷨����
function GetVersionLY(const AFileName:pchar):pchar;stdcall;external 'LYFunction.dll';
function CassonEquation(const X1,Y1,X2,Y2:Real;var A,B:Real):boolean;stdcall;external 'LYFunction.dll';//���ɷ���ʽ
function DeCryptStr(aStr: Pchar; aKey: Pchar): Pchar;stdcall;external 'DESCrypt.dll';//����
function EnCryptStr(aStr: Pchar; aKey: Pchar): Pchar;stdcall;external 'DESCrypt.dll';//����
function CalParserValue(const CalExpress:Pchar;var ReturnValue:single):boolean;stdcall;external 'CalParser.dll';
function GetBm(InputStr:PChar;sel:integer):PChar;STDCALL;external 'autowbpy.dll';
function ShowOptionForm(const pCaption,pTabSheetCaption,pItemInfo,pInifile:Pchar):boolean;stdcall;external 'OptionSetForm.dll';
Function IdleTrackerInit:boolean;stdcall;external 'IdleTrac.dll';//start the monitoring process
Procedure IdleTrackerTerm;stdcall;external 'IdleTrac.dll';//stop the monitoring process
Function IdleTrackerGetLastTickCount:Longint;stdcall;external 'IdleTrac.dll';//get the tick count of last user input
//��������Ŀ���ӻ�༭������������
procedure addOrEditCalcItem(const Aadoconnstr:Pchar;const ComboItemID:Pchar;const checkunid: integer);stdcall;external 'CalcItemPro.dll';
//�������������ӻ�༭������������
procedure addOrEditCalcValu(const Aadoconnstr:Pchar;const checkunid: integer;const AifInterface:boolean;const ATransItemidString:pchar);stdcall;external 'CalcItemPro.dll';
//****************************************************************************//

procedure SendKeyToControl(const VK:byte;control:Twincontrol);
function ageConvertChinese(agestr: string): string;
function GetServerDate(adoConn:TADOConnection):TDate;
procedure AddPickList(dbgrid: tdbgrid; const FieldIndex: integer;const JoinStr: string);//JoinStr����������ʽ��aa,bb,cc,dd
//����ָ���е���ʾ���
procedure VisibleColumn(dbgrid:tdbgrid;const DisplayName:string;const ifVisible:boolean);
function ifhaspower(sender: tobject;const powerstr_js:string): boolean;
function GetMaxId(const combin_id:string;CurDate:tdate;Diagnosetype:string): string;//ȡ�������ˮ��,����:�����������
function HasSubInDbf(Node:TTreeNode):Boolean;
function ifRegister:boolean;
Procedure ChangeYouFormAllControlIme(YFormName:TWinControl);//��Ҫ�������뷨�Ĵ�������
function SmoothLine(const strHistogram:string;const SmoothNum:byte;var Strings:TStrings;var AMin:single;var AMax:single):integer;
function GetNextValue(CurValue: string): string;
function GetFirstValue(CurValue: string): string;
function MakeDBConn:boolean;
procedure LoadGroupName(const comboBox:TcomboBox;const ASel:string);
procedure MakeDBGridColumnsAutoFixItsWidth(objDBGrid:TDBGrid);
function GetMaxCheckId(const ACombin_ID:string;const AServerDate:tdate):string;//��ȡָ�������顢���ڵ���һ��������

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  MakeDBConn;
end;

procedure VisibleColumn(dbgrid:tdbgrid;const DisplayName:string;const ifVisible:boolean);
var
  i:integer;
begin
  if not dbgrid.DataSource.DataSet.Active then exit;
  for i :=0  to dbgrid.Columns.Count-1 do
    if uppercase(dbgrid.Fields[i].DisplayName)=uppercase(DisplayName) then
      dbgrid.Columns[i].Visible:=ifVisible;
end;

procedure AddPickList(dbgrid: tdbgrid; const FieldIndex: integer;
  const JoinStr: string);//JoinStr����������ʽ��aa,bb,cc,dd ע����Ӣ�Ļ�����״̬�Ķ��ŷָ�����
var
  CommaPos:integer;
  s1,s2:string;
begin
  s1:=JoinStr;
  if not dbgrid.DataSource.DataSet.Active then exit;
  if dbgrid.DataSource.DataSet.RecordCount=0 then exit;
  dbgrid.Columns[FieldIndex].PickList.Clear;
  if trim(JoinStr)='' then exit;
  CommaPos:=pos(',',s1);
  while CommaPos<>0 do
  begin
    s2:=trim(copy(s1,1,CommaPos-1));
    if trim(s2)<>'' then dbgrid.Columns[FieldIndex].PickList.add(s2);
    delete(s1,1,CommaPos);
    CommaPos:=pos(',',s1);
  end;
  if trim(s1)<>'' then dbgrid.Columns[FieldIndex].PickList.add(s1);
end;

function GetServerDate(adoConn:TADOConnection):TDate;
//����ֵ�а��������ڲ��ּ�ʱ�䲿��
//datetimetostr(����ֵ)-->2005-8-28 10:05:36
//datetostr(����ֵ)-->2005-8-28
//timetostr(����ֵ)-->10:05:36
var
  adotempDate:tadoquery;
begin
  adotempDate:=tadoquery.Create(NIL);
  ADOTEMPDATE.Connection:=adoConn;
  ADOTEMPDATE.Close;
  ADOTEMPDATE.SQL.Clear;
  ADOTEMPDATE.SQL.Text:='SELECT GETDATE() as ServerDate ';
  ADOTEMPDATE.Open;
  result:=ADOTEMPDATE.fieldbyname('ServerDate').AsDateTime;
  ADOTEMPDATE.Free;  //}
end;

procedure SendKeyToControl(const VK:byte;control:Twincontrol);
BEGIN
  control.SetFocus;
  keybd_event(VK,MapVirtualKey(VK,0),0,0); //ָ����������
END;

function ageConvertChinese(agestr: string): string;
var
  fagestr:single;
begin
    agestr:=uppercase(agestr);
    result:='';
    if (agestr='') then begin result:=''; exit;end;
    if UpperCase(agestr)='C' then begin result:='��'; exit;end;
    if trystrtofloat(agestr,fagestr) then begin result:=agestr+'��';exit;end;
    result:=StringReplace(agestr,'N','����',[rfReplaceAll,rfIgnoreCase]);
    result:=StringReplace(result,'Y','��',[rfReplaceAll,rfIgnoreCase]);
    result:=StringReplace(result,'M','��',[rfReplaceAll,rfIgnoreCase]);
    result:=StringReplace(result,'D','��',[rfReplaceAll,rfIgnoreCase]);
    result:=StringReplace(result,'H','Сʱ',[rfReplaceAll,rfIgnoreCase]);
end;

function haspower(powerstr_cur, menuname,sDatabaseName: string): boolean;
var
  jsmc:string;
  plusPos:integer;
  aa,bb:string;
  menuname_js:string;
  ADOquery_ryjs,ADOquery_menuitem:tADOquery;
  user_powerstr:string;
  ado_super:tadoquery;
begin
  result:=false;
  //===============�����û�����=================//
  ado_super:=tadoquery.Create(nil);
  ado_super.Connection:=DM.ADOConnection1;
  ado_super.SQL.Clear;
  ado_super.SQL.Text:='select * from worker where ifSuperUser=''1'' ';
  ado_super.Open;
  ado_super.First;
  if ado_super.Locate('id',operator_id,[loCaseInsensitive]) then
  begin
    result:=true;
    ado_super.Free;
    exit;
  end;
  //=======================================================//
  aa:='';bb:='';
  user_powerstr:=powerstr_cur;

  ADOquery_ryjs:=tADOquery.Create(nil);
  ADOquery_ryjs.Connection:=DM.ADOConnection1;
  ADOquery_ryjs.SQL.Clear;
  ADOquery_ryjs.SQL.Text:='select * from ryjs';
  ADOquery_ryjs.Open;

  ADOquery_menuitem:=tADOquery.Create(nil);
  ADOquery_menuitem.Connection:=DM.ADOConnection1;
  ADOquery_menuitem.SQL.Clear;
  ADOquery_menuitem.SQL.Text:='select * from menuitem WHERE SYSNAME='''+SYSNAME+''' ';
  ADOquery_menuitem.Open;

  while length(user_powerstr)>=3 do
  begin
    plusPos:=posExt('+',Pchar(user_powerstr),2);
    jsmc:=copy(user_powerstr,2,pluspos-2);
    try
      aa:=aa+ADOquery_ryjs.Lookup('jsmc',jsmc,'jsqx');
    except
      aa:=aa+'';
    end;
    delete(user_powerstr,1,pluspos);
  end;

  while length(aa)>=3 do
  begin
    bb:=copy(aa,1,3);
    if ADOquery_menuitem.Locate('bm',bb,[loCaseInsensitive]) then
        menuname_js:=trim(ADOquery_menuitem.fieldbyname('menuname').AsString)
    else  menuname_js:='';

    if  UpperCase(menuname_js)= UpperCase(Trim(menuname)) then
    begin
      result:=true;
      ADOquery_ryjs.Free;
      ADOquery_menuitem.Free;
      exit;
    end;
    delete(aa,1,3);
  end;

  if ADOquery_ryjs<>nil then ADOquery_ryjs.Free;
  if ADOquery_menuitem<>nil then ADOquery_menuitem.Free;
  if ado_super<>nil then ado_super.Free;
end;

function ifhaspower(sender: tobject;const powerstr_js:string): boolean;
begin
  result:=true;

  if sender is tmenuitem then
  begin
    if not haspower(powerstr_js,tmenuitem(sender).Caption,sDBALIAS) then result:=false;
  end;

  if sender is ttoolbutton then
  begin
    if not haspower(powerstr_js,ttoolbutton(sender).Caption,sDBALIAS) then result:=false;
  end;

  if sender is tbutton then
  begin
    if not haspower(powerstr_js,tbutton(sender).Caption,sDBALIAS) then result:=false;
  end;

  if sender is tpanel then
  begin
    if not haspower(powerstr_js,tpanel(sender).Caption,sDBALIAS) then result:=false;
  end;

  if sender is tspeedbutton then
  begin
    if not haspower(powerstr_js,tspeedbutton(sender).Caption,sDBALIAS) then result:=false;
  end;//}

  if sender is tcombobox then  
  begin
    if not haspower(powerstr_js,inttostr(tcombobox(sender).tag),sDBALIAS) then result:=false;
  end;

  if sender is tedit then
  begin
    if not haspower(powerstr_js,inttostr(tedit(sender).tag),sDBALIAS) then result:=false;
  end;

  if sender is tLabeledEdit then
  begin
    if not haspower(powerstr_js,tLabeledEdit(sender).EditLabel.Caption,sDBALIAS) then result:=false;
  end;

  if not result then
      messagedlg('�Բ�����û�и�Ȩ�ޣ�',mtinformation,[mbok],0);
end;

function GetMaxId(const combin_id:string;CurDate:tdate;Diagnosetype:string): string;  //ȡ�������ˮ��
var
  maxid: string;
  adotemp11:tadoquery;
  iMaxId:integer;
begin
  if(Diagnosetype<>CGYXJB)and(Diagnosetype<>'����')and(Diagnosetype<>'�Ӽ�')then Diagnosetype:=CGYXJB;

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
          ADOtemp11.Close;
          ADOtemp11.SQL.Clear;
          //ADOtemp11.SQL.Text:='select max(LSH)+1 as maxid from chk_con '+
          //                  ' WHERE (CONVERT(CHAR(10),check_date,121)=:p_CHECK_DATE1 ) '+
          //                  ' and (chk_con.LSH like ''[0-9][0-9][0-9][0-9]'') '+
          //                  ' AND (chk_con.combin_id='''+combin_id+''')'+
          //                  ' and (chk_con.Diagnosetype='''+Diagnosetype+''')'+
          //                  ' order by maxid desc';     //����������
          ADOtemp11.SQL.Text:='select LSH from chk_con '+
                            ' WHERE (CONVERT(CHAR(10),check_date,121)=:p_CHECK_DATE1 ) '+
                            ' AND (chk_con.combin_id='''+combin_id+''')'+
                            ' and (chk_con.Diagnosetype='''+Diagnosetype+''')'+
                            ' order by right(''0000''+lsh,4) desc';     //����������

          ADOtemp11.Parameters.ParamByName('p_CHECK_DATE1').Value:=FormatDateTime('YYYY-MM-DD',CurDate);
          ADOtemp11.open;
          //ADOtemp11.First;
      maxid := trim(ADOtemp11.FieldByName('LSH').AsString);
      ADOtemp11.Free;
      
       if not trystrtoint(maxid,iMaxId) then begin result:='0001';exit;end;

      //if Length(maxid) = 0 then
      //  maxid := '0001';
      //if Length(maxid) = 1 then
      //  maxid := '000' + maxid;
      //if Length(maxid) = 2 then
      //  maxid := '00' + maxid;
      //if Length(maxid) = 3 then
      //  maxid := '0' + maxid; 
      result := rightstr('0000'+inttostr(iMaxId+1),4);
end;//}

function HasSubInDbf(Node:TTreeNode):Boolean;
//���ڵ�Node�����ӽڵ�,���򷵻�True,��֮����False
var
  adotemp22:tadoquery;
begin
  result:=false;
  adotemp22:=tadoquery.Create(nil);
  adotemp22.Connection:=dm.ADOConnection1;
  adotemp22.Close;
  adotemp22.SQL.Clear;
  adotemp22.SQL.Text:='select * from RisDescriptType where UpID='''+PDescriptType(Node.Data)^.ID+'''';
  adotemp22.Open;
  if adotemp22.RecordCount<>0 then result:= True;
  adotemp22.Free;
end;

function ifRegister:boolean;
var
  HDSn,RegisterNum,EnHDSn:string;
  configini:tinifile;
  pEnHDSn:Pchar;
begin
  result:=false;
  
  HDSn:=GetHDSn('C:\')+'-'+GetHDSn('D:\');//�������ص�Pchar���ͻ�����ֱ�Ӹ�ֵ��string!!!

  CONFIGINI:=TINIFILE.Create(ChangeFileExt(Application.ExeName,'.ini'));
  RegisterNum:=CONFIGINI.ReadString('Register','RegisterNum','');
  CONFIGINI.Free;
  pEnHDSn:=EnCryptStr(Pchar(HDSn),CryptStr);
  EnHDSn:=StrPas(pEnHDSn);

  if Uppercase(EnHDSn)=Uppercase(RegisterNum) then result:=true;

  if not result then messagedlg('�Բ���,��û��ע���ע�������,��ע��!',mtinformation,[mbok],0);
end;

Procedure ChangeYouFormAllControlIme(YFormName:TWinControl);//��Ҫ�������뷨�Ĵ�������
//���뷨�Զ��л�����
//20051104 by ��ӥ
//���˼·:
//����Աֻ��Ҫ�������и��������ĵĿؼ���imemode=imOpen,Ȼ����ÿ��������
//create(��active)�¼�����ñ��˱�д�ķ���ChangeYouFormAllControlIme(Self)����.
//�ڳ������ṩһ���û����뷨ѡ��û�ѡ���Լ�ϲ�������뷨,
//������ʾFrmImeNameList���弴��!
//ע�⣺��"ѡ�����뷨��"Ҫ�ٴε���ChangeYouFormAllControlIme(Self)����Ŷ:)
var
  StrImeName:string;
  procedure JugeClassType(PClass:Tcontrol);
  //��Ȼ�鷳,����������ж�,���潫 dephi�ɸ��ĵĿؼ�������������,û�а�������ʹ�ü�ֵ����.
  begin
    if pclass is TEdit then//����Tedit��ؼ�,����ͬ��
    begin
      if TEdit(pclass).ImeMode=imOpen then
        TEdit(pclass).ImeName:=StrImeName
      else
        TEdit(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TLabeledEdit then
    begin
      if TLabeledEdit(pclass).ImeMode=imOpen then
        TLabeledEdit(pclass).ImeName:=StrImeName
      else
        TLabeledEdit(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TMemo then
    begin
      if TMemo(pclass).ImeMode=imOpen then
       TMemo(pclass).ImeName:=StrImeName
      else
       TMemo(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TComboBox then
    begin
      if TComboBox(pclass).ImeMode=imOpen then
       TComboBox(pclass).ImeName:=StrImeName
      else
       TComboBox(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TRichEdit then
    begin
      if TRichEdit(pclass).ImeMode=imOpen then
       TRichEdit(pclass).ImeName:=StrImeName
      else
       TRichEdit(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TDBGrid then
    begin
      if TDBGrid(pclass).ImeMode=imOpen then
       TDBGrid(pclass).ImeName:=StrImeName
      else
       TDBGrid(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TDBEdit then
    begin
      if TDBEdit(pclass).ImeMode=imOpen then
       TDBEdit(pclass).ImeName:=StrImeName
      else
       TDBEdit(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TDbMemo then
    begin
      if TDbMemo(pclass).ImeMode=imOpen then
       TDbMemo(pclass).ImeName:=StrImeName
      else
       TDbMemo(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TDbcombobox then
    begin
      if TDbcombobox(pclass).ImeMode=imOpen then
       TDbcombobox(pclass).ImeName:=StrImeName
      else
       TDbcombobox(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is Tdblookupcombobox then
    begin
      if Tdblookupcombobox(pclass).ImeMode=imOpen then
       Tdblookupcombobox(pclass).ImeName:=StrImeName
      else
       Tdblookupcombobox(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is Tdbrichedit then
    begin
      if Tdbrichedit(pclass).ImeMode=imOpen then
       Tdbrichedit(pclass).ImeName:=StrImeName
      else
       Tdbrichedit(pclass).ImeMode:=imClose;
      exit;
    end;

    if pclass is TMaskEdit then
    begin
      if TMaskEdit(pclass).ImeMode=imOpen then
        TMaskEdit(pclass).ImeName:=StrImeName
      else
        TMaskEdit(pclass).ImeMode:=imClose;
      exit;
    end;
  end;
const
  DefaultImeName='���� (����) - ���� ABC';
var
  i:integer;
  ChildControl:TControl;
  ConfigIni:tinifile;
  YouFormOrOTher:Twincontrol;
begin
  YouFormOrOTher:=YFormName;

  //��ȡ������û�ѡ������뷨,�õ�Ԫȫ�ֱ��� StrImeName ����
  //������Createʱ���øù���,��ʱUDMû������,����"ExtractFilePath(application.ExeName)"����AppPath����
  ConfigIni:=tinifile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    StrImeName:=ConfigIni.ReadString('���뷨ѡ��','Ĭ���������뷨',DefaultImeName);
  finally
    ConfigIni.Free;
  end;

  //���÷��� JugeClassType(ChildControl) ���Ĵ����пؼ��� ImeMode
  for i:=0 to YouFormOrOTher.ControlCount-1 do
  begin
   ChildControl:=YouFormOrOTher.Controls[i];
   JugeClassType(ChildControl);

   //����ؼ������ؼ�,���ı������Ŀؼ�
   if ChildControl is TWinControl then ChangeYouFormAllControlIme(ChildControl as TWinControl);
  end;
end;

function SmoothLine(const strHistogram:string;const SmoothNum:byte;var Strings:TStrings;var AMin:single;var AMax:single):integer;
//strHistogram��ʽ:'2 3 5.5 2.3'
//����ֵ:Strings��Ԫ�ظ���.����ʱ���жϷ���ֵ,���������Ч
//SmoothNum:ƽ�������Ĵ���.����Խ������Խ�⻬,������ƫ��Խ��
//Strings:���صĵ�
var
  ls:TStrings;
  t,i,j:integer;
  cc:array of single;
  fdotData:single;
begin
  result:=0;
  AMin:=0;AMax:=0;

  if Strings = nil then Exit;
  ls:=TStringList.Create;
  t:=ExtractStrings([' '],[],Pchar(trim(strHistogram)),ls);
  if t=0 then begin ls.Free;exit;end;

  for i :=0  to t-1 do//������Ч�㣬�򷵻�false
    if not trystrtofloat(ls[i],fdotData) then begin ls.Free;exit;end;

  setlength(cc,t);

  for i :=1  to SmoothNum do//ƽ�������Ĵ���
  begin
    for j:=2 to t-1 do
    begin
      cc[j-1]:=(strtofloat(ls[j-2])+strtofloat(ls[j-1])+strtofloat(ls[j]))/3;
    end;
    cc[0]:=strtofloat(ls[0]);
    cc[t-1]:=strtofloat(ls[t-1]);
    
    for j:=0 to t-1 do ls[j]:=floattostr(cc[j]);
  end;

  for j:=0 to t-1 do
  begin
    Strings.Add(ls[j]);
    if j=0 then begin AMin:=strtofloat(ls[j]);AMax:=strtofloat(ls[j]);end;
    if strtofloat(ls[j])<AMin then AMin:=strtofloat(ls[j]);
    if strtofloat(ls[j])>AMax then AMax:=strtofloat(ls[j]);
  end;
  ls.Free;

  result:=t;
end;

function GetNextValue(CurValue: string): string;
VAR
  iCurValue,i:INTEGER;
  rCurValue,sCurValue:STRING;
begin
    RESULT:='';
    for i :=length(CurValue) downto 1 do
    begin
      if not(CurValue[i] in ['0'..'9']) then
      begin
        if i=length(CurValue) then //���һ���ַ�Ϊ������
        begin
          exit;
        end;
        iCurValue:=strtoint(copy(CurValue,i+1,length(CurValue)-i));
        inc(iCurValue);
        rCurValue:=Format('%.'+inttostr(length(CurValue)-i)+'d', [iCurValue]);//iMaxFieldValue
        sCurValue:=copy(CurValue,1,i);
        result:=sCurValue + rCurValue;
        exit;
      end else
      begin
        if i=1 then //ȫ��Ϊ���ֵ����
        begin
          iCurValue:=strtoint(CurValue);
          inc(iCurValue);
          rCurValue:=Format('%.'+inttostr(length(CurValue))+'d', [iCurValue]);//iMaxFieldValue
          result:= rCurValue;
          exit;
        end;
      end;
    end;
end;

function GetFirstValue(CurValue: string): string;
VAR
  rCurValue,sCurValue:STRING;
  i:integer;
begin
    RESULT:='';
    for i :=length(CurValue) downto 1 do
    begin
      if not(CurValue[i] in ['0'..'9']) then
      begin
        if i=length(CurValue) then //���һ���ַ�Ϊ������
        begin
          exit;
        end;
        rCurValue:=Format('%.'+inttostr(length(CurValue)-i)+'d', [1]);//iMaxFieldValue
        sCurValue:=copy(CurValue,1,i);
        result:=sCurValue + rCurValue;
        exit;
      end else
      begin
        if i=1 then //ȫ��Ϊ���ֵ����
        begin
          rCurValue:=Format('%.'+inttostr(length(CurValue))+'d', [1]);//iMaxFieldValue
          result:= rCurValue;
          exit;
        end;
      end;
    end;
end;

function MakeDBConn:boolean;
var
  newconnstr,ss: string;
  Ini: tinifile;
  userid, password, datasource, initialcatalog: string;{, provider}
  ifIntegrated:boolean;//�Ƿ񼯳ɵ�¼ģʽ

  pInStr,pDeStr:Pchar;
  i:integer;
  Label labReadIni;
begin
  result:=false;

  labReadIni:
  Ini := tinifile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  datasource := Ini.ReadString('�������ݿ�', '������', '');
  initialcatalog := Ini.ReadString('�������ݿ�', '���ݿ�', '');
  ifIntegrated:=ini.ReadBool('�������ݿ�','���ɵ�¼ģʽ',false);
  userid := Ini.ReadString('�������ݿ�', '�û�', '');
  password := Ini.ReadString('�������ݿ�', '����', '107DFC967CDCFAAF');
  Ini.Free;
  //======����password
  pInStr:=pchar(password);
  pDeStr:=DeCryptStr(pInStr,CryptStr);
  setlength(password,length(pDeStr));
  for i :=1  to length(pDeStr) do password[i]:=pDeStr[i-1];
  //==========

  newconnstr :='';
  newconnstr := newconnstr + 'user id=' + UserID + ';';
  newconnstr := newconnstr + 'password=' + Password + ';';
  newconnstr := newconnstr + 'data source=' + datasource + ';';
  newconnstr := newconnstr + 'Initial Catalog=' + initialcatalog + ';';
  newconnstr := newconnstr + 'provider=' + 'SQLOLEDB.1' + ';';
  if ifIntegrated then
    newconnstr := newconnstr + 'Integrated Security=SSPI;';
  try
    dm.ADOConnection1.Connected := false;
    dm.ADOConnection1.ConnectionString := newconnstr;
    dm.ADOConnection1.Connected := true;
    result:=true;
    LisConn:=newconnstr;
  except
  end;
  if not result then
  begin
    ss:='������'+#2+'Edit'+#2+#2+'0'+#2+#2+#3+
        '���ݿ�'+#2+'Edit'+#2+#2+'0'+#2+#2+#3+
        '���ɵ�¼ģʽ'+#2+'CheckListBox'+#2+#2+'0'+#2+'���ø�ģʽ,���û�������������д'+#2+#3+
        '�û�'+#2+'Edit'+#2+#2+'0'+#2+#2+#3+
        '����'+#2+'Edit'+#2+#2+'0'+#2+#2+'1'+CryptStr;
    if ShowOptionForm('�������ݿ�','�������ݿ�',Pchar(ss),Pchar(ChangeFileExt(Application.ExeName,'.ini'))) then
      goto labReadIni else application.Terminate;
  end;
end;

procedure LoadGroupName(const comboBox:TcomboBox;const ASel:string);
var
  adotemp3:tadoquery;
  tempstr:string;
begin
     adotemp3:=tadoquery.Create(nil);
     adotemp3.Connection:=DM.ADOConnection1;
     adotemp3.Close;
     adotemp3.SQL.Clear;
     adotemp3.SQL.Text:=ASel;
     adotemp3.Open;
     
     comboBox.Items.Clear;//����ǰ�����comboBox��

     while not adotemp3.Eof do
     begin
      tempstr:=trim(adotemp3.Fields[0].AsString);

      comboBox.Items.Add(tempstr); //���ص�comboBox

      adotemp3.Next;
     end;
     adotemp3.Free;
end;

procedure MakeDBGridColumnsAutoFixItsWidth(objDBGrid:TDBGrid);
//ʹdbGrid�������Զ���Ӧ���Ŀ���{��ΪDBGridEh�򽫸�Ϊ��(objDBGrid:TDBGridEh);}
var
  cc:integer;
  i,tmpLength:integer;
  objDataSet:TAdoquery;
  aDgCLength:array of integer;
begin
  cc:=objDbGrid.Columns.Count-1;

  objDataSet:=TAdoquery.Create(nil);
  //objDataSet.Clone(objDBGrid.DataSource.DataSet);

  setlength(aDgCLength,cc+1);
  //ȡ�����ֶεĳ���
  for i:=0 to  cc do
  begin
    aDgCLength[i]:= length(objDbGrid.Columns[i].Title.Caption);
  end; 

  objDataSet.First;
  while not objDataSet.Eof do
  begin
    //ȡ����ÿ���ֶεĳ���
    for i:=0 to  cc do
    begin
      tmpLength:=length(objDataSet.Fields.Fields[i].AsString);
      if tmpLength>aDgCLength[i] then aDgCLength[i]:=tmpLength;
    end;
    objDataSet.Next;
  end; 

  for i:=0 to  cc do
  begin
    objDbGrid.Columns[i].Width:=aDgCLength[i]*8;
  end;
end;

function GetMaxCheckId(const ACombin_ID:string;const AServerDate:tdate):string;
var
  ini:tinifile;
  CheckDate,CheckId:string;
  sList:TStrings;
  i:integer;
begin
  result:='';
  
  if trim(ACombin_ID)='' then exit;

  ini:=tinifile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  CheckDate:=ini.ReadString(ACombin_ID,'�������','');
  CheckId:=ini.ReadString(ACombin_ID,'������','');
  ini.Free;
  CheckId:=StringReplace(CheckId,'��',',',[rfReplaceAll,rfIgnoreCase]);
  sList:=TStringList.Create;
  ExtractStrings([','],[],PChar(CheckId),sList);
  CheckId:='';
  if datetostr(AServerDate)=CheckDate then
  begin
    for i :=0  to sList.Count-1 do
    begin
      CheckId:=CheckId+GetNextValue(sList[i])+',';
    end;
  end
  else begin
    for i :=0  to sList.Count-1 do
    begin
      CheckId:=CheckId+GetFirstValue(sList[i])+',';
    end;
  end;
  sList.Free;
  if(CheckId<>'')and(CheckId[length(CheckId)]=',')then CheckId:=copy(CheckId,1,length(CheckId)-1);
    
  result:=CheckId;
end;

end.