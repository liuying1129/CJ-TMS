unit UfrmFeeInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, ADODB,StrUtils;

type
  TfrmFeeInfo = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    Label2: TLabel;
    LabeledEdit13: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit13DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmFeeInfo: TfrmFeeInfo;

var
  ffrmFeeInfo: TfrmFeeInfo;

implementation

uses UfrmCommQuery, UDM;

{$R *.dfm}

function frmFeeInfo: TfrmFeeInfo;
begin
  if ffrmFeeInfo=nil then ffrmFeeInfo:=TfrmFeeInfo.Create(application.mainform);
  result:=ffrmFeeInfo;
end;

procedure TfrmFeeInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  if ffrmFeeInfo=self then ffrmFeeInfo:=nil;
end;

procedure TfrmFeeInfo.FormShow(Sender: TObject);
var
  adotemp11,adotemp22:Tadoquery;
begin
  adotemp11:=Tadoquery.create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='select * from FeeInfo where SC_COMPANY=:SC_COMPANY AND SC_YDH=:SC_YDH';
  adotemp11.Parameters.ParamByName('SC_COMPANY').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司').AsString;
  adotemp11.Parameters.ParamByName('SC_YDH').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司运单号').AsString;
  adotemp11.OPEN;

  LabeledEdit1.Text:=ifThen(adotemp11.fieldbyname('YDH_JS').AsString='','0',adotemp11.fieldbyname('YDH_JS').AsString);
  LabeledEdit2.Text:=ifThen(adotemp11.fieldbyname('PACKAGING').AsString='','0',adotemp11.fieldbyname('PACKAGING').AsString);
  LabeledEdit3.Text:=ifThen(adotemp11.fieldbyname('YDH_WEIGHT').AsString='','0',adotemp11.fieldbyname('YDH_WEIGHT').AsString);
  LabeledEdit4.Text:=ifThen(adotemp11.fieldbyname('YDH_VOLUME').AsString='','0',adotemp11.fieldbyname('YDH_VOLUME').AsString);
  LabeledEdit5.Text:=ifThen(adotemp11.fieldbyname('RATE').AsString='','1',adotemp11.fieldbyname('RATE').AsString);
  LabeledEdit6.Text:=ifThen(adotemp11.fieldbyname('DISTANCEFEE').AsString='','0',adotemp11.fieldbyname('DISTANCEFEE').AsString);
  LabeledEdit7.Text:=ifThen(adotemp11.fieldbyname('ADDSPORTFEE').AsString='','0',adotemp11.fieldbyname('ADDSPORTFEE').AsString);
  LabeledEdit8.Text:=ifThen(adotemp11.fieldbyname('URGENTFEE').AsString='','0',adotemp11.fieldbyname('URGENTFEE').AsString);
  LabeledEdit9.Text:=ifThen(adotemp11.fieldbyname('INSURANCEFEE').AsString='','0',adotemp11.fieldbyname('INSURANCEFEE').AsString);
  LabeledEdit10.Text:=ifThen(adotemp11.fieldbyname('OTHERFEE').AsString='','0',adotemp11.fieldbyname('OTHERFEE').AsString);
  LabeledEdit11.Text:=adotemp11.fieldbyname('OTHERFEEMARK').AsString;
  LabeledEdit12.Text:=ifThen(adotemp11.fieldbyname('CARRIAGEFEE').AsString='','0',adotemp11.fieldbyname('CARRIAGEFEE').AsString);

  adotemp11.Free;

  //给label1赋值
  adotemp22:=Tadoquery.Create(nil);
  adotemp22.Connection:=dm.ADOConnection1;
  adotemp22.Close;
  adotemp22.SQL.Clear;
  adotemp22.SQL.Text:='select isnull(sum(TempA.SC_BillNo_Js),0) as z_js from '+
                      '( '+
                      'select SC_BillNo,SC_BillNo_Js from yd_c '+
                      'where SC_COMPANY='''+frmCommQuery.ADOQuery1.fieldbyname('发货公司').AsString+
                      ''' AND SC_YDH='''+frmCommQuery.ADOQuery1.fieldbyname('发货公司运单号').AsString+
                      ''' group by SC_BillNo,SC_BillNo_Js '+
                      ') TempA ';
  try
    adotemp22.OPEN;
  except
    adotemp22.Free;
    LabeledEdit13.Text:='0';
    exit;
  end;
  LabeledEdit13.Text:=adotemp22.fieldbyname('z_js').AsString;
  adotemp22.Free;
end;

procedure TfrmFeeInfo.BitBtn1Click(Sender: TObject);
var
  adotemp11,adotemp22:Tadoquery;
  RecNum:integer;
  YDH_JS:integer;
  YDH_WEIGHT,YDH_VOLUME,RATE,PACKAGING,DISTANCEFEE,ADDSPORTFEE,URGENTFEE,INSURANCEFEE,OTHERFEE,CARRIAGEFEE:single;
begin
  if not trystrtoint(LabeledEdit1.Text,YDH_JS) then
  begin
    MessageDlg('件数输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if YDH_JS<=0 then
  begin
    MessageDlg('件数必填', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit2.Text,PACKAGING) then
  begin
    MessageDlg('特殊包装费输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit3.Text,YDH_WEIGHT) then
  begin
    MessageDlg('计费重量输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if YDH_WEIGHT<=0 then
  begin
    MessageDlg('计费重量必填', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit4.Text,YDH_VOLUME) then
  begin
    MessageDlg('体积输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if YDH_VOLUME<=0 then
  begin
    MessageDlg('体积必填', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit5.Text,RATE) then
  begin
    MessageDlg('费率输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit6.Text,DISTANCEFEE) then
  begin
    MessageDlg('超远配送费输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit7.Text,ADDSPORTFEE) then
  begin
    MessageDlg('加点费输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit8.Text,URGENTFEE) then
  begin
    MessageDlg('加急费输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit9.Text,INSURANCEFEE) then
  begin
    MessageDlg('保险费输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit10.Text,OTHERFEE) then
  begin
    MessageDlg('其它费用输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;
  if not trystrtofloat(LabeledEdit12.Text,CARRIAGEFEE) then
  begin
    MessageDlg('运费输入不正确', mtConfirmation, [mbYes], 0);
    exit;
  end;

  adotemp22:=Tadoquery.create(nil);
  adotemp22.Connection:=dm.ADOConnection1;
  adotemp22.Close;
  adotemp22.SQL.Clear;
  adotemp22.SQL.Text:='select COUNT(*) AS RecNum from FeeInfo where SC_COMPANY=:SC_COMPANY AND SC_YDH=:SC_YDH';
  adotemp22.Parameters.ParamByName('SC_COMPANY').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司').AsString;
  adotemp22.Parameters.ParamByName('SC_YDH').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司运单号').AsString;
  adotemp22.OPEN;
  RecNum:=adotemp22.fieldbyname('RecNum').AsInteger;
  adotemp22.Free;

  if RecNum>0 then
  begin
    adotemp11:=Tadoquery.create(nil);
    adotemp11.Connection:=dm.ADOConnection1;
    adotemp11.Close;
    adotemp11.SQL.Clear;
    adotemp11.SQL.Text:='Update FeeInfo set YDH_JS=:YDH_JS,YDH_WEIGHT=:YDH_WEIGHT,YDH_VOLUME=:YDH_VOLUME,RATE=:RATE,PACKAGING=:PACKAGING,DISTANCEFEE=:DISTANCEFEE,'+
                        ' ADDSPORTFEE=:ADDSPORTFEE,URGENTFEE=:URGENTFEE,INSURANCEFEE=:INSURANCEFEE,OTHERFEE=:OTHERFEE,OTHERFEEMARK=:OTHERFEEMARK,CARRIAGEFEE=:CARRIAGEFEE,Send_Flag=NULL '+
                        ' where SC_COMPANY=:SC_COMPANY AND SC_YDH=:SC_YDH';
    adotemp11.Parameters.ParamByName('YDH_JS').Value:=YDH_JS;
    adotemp11.Parameters.ParamByName('YDH_WEIGHT').Value:=LabeledEdit3.Text;
    adotemp11.Parameters.ParamByName('YDH_VOLUME').Value:=LabeledEdit4.Text;
    adotemp11.Parameters.ParamByName('RATE').Value:=LabeledEdit5.Text;
    adotemp11.Parameters.ParamByName('PACKAGING').Value:=PACKAGING;
    adotemp11.Parameters.ParamByName('DISTANCEFEE').Value:=DISTANCEFEE;
    adotemp11.Parameters.ParamByName('ADDSPORTFEE').Value:=ADDSPORTFEE;
    adotemp11.Parameters.ParamByName('URGENTFEE').Value:=URGENTFEE;
    adotemp11.Parameters.ParamByName('INSURANCEFEE').Value:=INSURANCEFEE;
    adotemp11.Parameters.ParamByName('OTHERFEE').Value:=OTHERFEE;
    adotemp11.Parameters.ParamByName('CARRIAGEFEE').Value:=CARRIAGEFEE;
    adotemp11.Parameters.ParamByName('OTHERFEEMARK').Value:=LabeledEdit11.Text;
    adotemp11.Parameters.ParamByName('SC_COMPANY').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司').AsString;
    adotemp11.Parameters.ParamByName('SC_YDH').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司运单号').AsString;
    adotemp11.ExecSQL;
    adotemp11.Free;
  end else
  begin
    adotemp11:=Tadoquery.create(nil);
    adotemp11.Connection:=dm.ADOConnection1;
    adotemp11.Close;
    adotemp11.SQL.Clear;
    adotemp11.SQL.Text:='Insert into FeeInfo (SC_COMPANY, SC_YDH, YDH_JS, YDH_WEIGHT, YDH_VOLUME, RATE, PACKAGING, DISTANCEFEE, ADDSPORTFEE, URGENTFEE, INSURANCEFEE, OTHERFEE, OTHERFEEMARK, CARRIAGEFEE) values ('+
                                            ':SC_COMPANY,:SC_YDH,:YDH_JS,:YDH_WEIGHT,:YDH_VOLUME,:RATE,:PACKAGING,:DISTANCEFEE,:ADDSPORTFEE,:URGENTFEE,:INSURANCEFEE,:OTHERFEE,:OTHERFEEMARK,:CARRIAGEFEE)';
    adotemp11.Parameters.ParamByName('YDH_JS').Value:=YDH_JS;
    adotemp11.Parameters.ParamByName('YDH_WEIGHT').Value:=LabeledEdit3.Text;
    adotemp11.Parameters.ParamByName('YDH_VOLUME').Value:=LabeledEdit4.Text;
    adotemp11.Parameters.ParamByName('RATE').Value:=LabeledEdit5.Text;
    adotemp11.Parameters.ParamByName('PACKAGING').Value:=PACKAGING;
    adotemp11.Parameters.ParamByName('DISTANCEFEE').Value:=DISTANCEFEE;
    adotemp11.Parameters.ParamByName('ADDSPORTFEE').Value:=ADDSPORTFEE;
    adotemp11.Parameters.ParamByName('URGENTFEE').Value:=URGENTFEE;
    adotemp11.Parameters.ParamByName('INSURANCEFEE').Value:=INSURANCEFEE;
    adotemp11.Parameters.ParamByName('OTHERFEE').Value:=OTHERFEE;
    adotemp11.Parameters.ParamByName('CARRIAGEFEE').Value:=CARRIAGEFEE;
    adotemp11.Parameters.ParamByName('OTHERFEEMARK').Value:=LabeledEdit11.Text;
    adotemp11.Parameters.ParamByName('SC_COMPANY').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司').AsString;
    adotemp11.Parameters.ParamByName('SC_YDH').Value:=frmCommQuery.ADOQuery1.fieldbyname('发货公司运单号').AsString;
    adotemp11.ExecSQL;
    adotemp11.Free;
  end;

  Close;
end;

procedure TfrmFeeInfo.FormCreate(Sender: TObject);
begin
  SetWindowLong(LabeledEdit1.Handle, GWL_STYLE, GetWindowLong(LabeledEdit1.Handle, GWL_STYLE) or ES_NUMBER);//只能输入数字
end;

procedure TfrmFeeInfo.LabeledEdit13DblClick(Sender: TObject);
begin
  LabeledEdit1.Text:=(Sender as TLabeledEdit).Text;
end;

initialization
  ffrmFeeInfo:=nil;

end.
