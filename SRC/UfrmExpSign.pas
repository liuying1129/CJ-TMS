unit UfrmExpSign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  TfrmExpSign = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmExpSign: TfrmExpSign;

var
  ffrmExpSign: TfrmExpSign;

implementation

uses UfrmCommQuery, UDM;

{$R *.dfm}

function frmExpSign: TfrmExpSign;
begin
  if ffrmExpSign=nil then ffrmExpSign:=TfrmExpSign.Create(application.mainform);
  result:=ffrmExpSign;
end;

procedure TfrmExpSign.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  if ffrmExpSign=self then ffrmExpSign:=nil;
end;

procedure TfrmExpSign.FormShow(Sender: TObject);
begin
  LabeledEdit1.Text:=frmCommQuery.ADOQuery1.fieldbyname('异常签收数量').AsString;
  ComboBox1.Text:=frmCommQuery.ADOQuery1.fieldbyname('异常签收类型').AsString;
  ComboBox2.Text:=frmCommQuery.ADOQuery1.fieldbyname('异常签收原因').AsString;
  LabeledEdit2.Text:=frmCommQuery.ADOQuery1.fieldbyname('异常签收描述').AsString;
  if frmCommQuery.ADOQuery1.fieldbyname('异常签收时间').AsString='' then
  begin
    DateTimePicker1.DateTime:=now;
    DateTimePicker2.DateTime:=now;
  end else
  begin
    DateTimePicker1.DateTime:=frmCommQuery.ADOQuery1.fieldbyname('异常签收时间').AsDateTime;
    DateTimePicker2.DateTime:=frmCommQuery.ADOQuery1.fieldbyname('异常签收时间').AsDateTime;
  end;
  if frmCommQuery.ADOQuery1.fieldbyname('异常签收预计返回时间').AsString='' then
  begin
    DateTimePicker3.DateTime:=now;
    DateTimePicker4.DateTime:=now;
  end else
  begin
    DateTimePicker3.DateTime:=frmCommQuery.ADOQuery1.fieldbyname('异常签收预计返回时间').AsDateTime;
    DateTimePicker4.DateTime:=frmCommQuery.ADOQuery1.fieldbyname('异常签收预计返回时间').AsDateTime;
  end;
end;

procedure TfrmExpSign.BitBtn1Click(Sender: TObject);
var
  adotemp11:Tadoquery;
begin
  adotemp11:=Tadoquery.create(nil);
  adotemp11.Connection:=dm.ADOConnection1;
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Text:='Update YD_C set ExpSignQty=:ExpSignQty,ExpSignCode=:ExpSignCode,ExpSignCauseCode=:ExpSignCauseCode,ExpSignDesc=:ExpSignDesc,ExpSignTime=:ExpSignTime,ExpSignEstimateBackTime=:ExpSignEstimateBackTime,Send_ExpSign_Flag=NULL where Unid=:Unid';
  adotemp11.Parameters.ParamByName('ExpSignQty').Value:=LabeledEdit1.Text;
  adotemp11.Parameters.ParamByName('ExpSignCode').Value:=ComboBox1.Text;
  adotemp11.Parameters.ParamByName('ExpSignCauseCode').Value:=ComboBox2.Text;
  adotemp11.Parameters.ParamByName('ExpSignDesc').Value:=LabeledEdit2.Text;
  adotemp11.Parameters.ParamByName('ExpSignTime').Value:=strtodatetime(datetostr(DateTimePicker1.Date)+' '+timetostr(DateTimePicker2.Time));
  adotemp11.Parameters.ParamByName('ExpSignEstimateBackTime').Value:=strtodatetime(datetostr(DateTimePicker3.Date)+' '+timetostr(DateTimePicker4.Time)) ;
  adotemp11.Parameters.ParamByName('Unid').Value:=frmCommQuery.ADOQuery1.fieldbyname('Unid').AsInteger;
  adotemp11.ExecSQL;
  adotemp11.Free;

  Close;

  frmCommQuery.ADOQuery1.Refresh;
end;

procedure TfrmExpSign.FormCreate(Sender: TObject);
begin
  SetWindowLong(LabeledEdit1.Handle, GWL_STYLE, GetWindowLong(LabeledEdit1.Handle, GWL_STYLE) or ES_NUMBER);//只能输入数字
end;

initialization
  ffrmExpSign:=nil;

end.
