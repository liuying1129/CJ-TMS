unit UfrmCommCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, DosMove,StrUtils,
  ULYDataToExcel, ComCtrls;

type
  TfrmCommCode = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DosMove1: TDosMove;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearEdit;
    procedure updateEdit;
    procedure updateAdoQuery1;
  public
    { Public declarations }
  end;

//var
function  frmCommCode: TfrmCommCode;

implementation

uses    UDM;
var
  ffrmCommCode: TfrmCommCode;
  ifNewAdd:boolean;
{$R *.dfm}
function  frmCommCode: TfrmCommCode;
begin
  if ffrmCommCode=nil then ffrmCommCode:=TfrmCommCode.Create(application.mainform);
  result:=ffrmCommCode;
end;

procedure TfrmCommCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  if ffrmCommCode=self then ffrmCommCode:=nil;
end;

procedure TfrmCommCode.FormCreate(Sender: TObject);
begin
  adoquery1.Connection:=DM.ADOConnection1;
end;

procedure TfrmCommCode.FormShow(Sender: TObject);
//var
//  adotemp22,adotemp33:tadoquery;
//  iNum:integer;
begin
  ifNewAdd:=false;

  LoadGroupName(ComboBox1,'select TypeName from CommCode group by TypeName');//����ComboBox1
  if ComboBox1.Items.Count>=1 then ComboBox1.ItemIndex:=0;

  updateAdoQuery1;
  //updateEdit;
end;

procedure TfrmCommCode.ClearEdit;
begin
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
  LabeledEdit11.Clear;
  LabeledEdit12.Clear;
  LabeledEdit13.Clear;
end;

procedure TfrmCommCode.updateEdit;
begin
  if adoquery1.RecordCount<>0 then
  begin
    LabeledEdit1.Text:=trim(adoquery1.fieldbyname('����').AsString);
    LabeledEdit2.Text:=trim(adoquery1.fieldbyname('����').AsString);
    LabeledEdit3.Text:=trim(adoquery1.fieldbyname('��ע').AsString);
    LabeledEdit4.Text:=trim(adoquery1.fieldbyname('�����ֶ�1').AsString);
    LabeledEdit5.Text:=trim(adoquery1.fieldbyname('�����ֶ�2').AsString);
    LabeledEdit6.Text:=trim(adoquery1.fieldbyname('�����ֶ�3').AsString);
    LabeledEdit7.Text:=trim(adoquery1.fieldbyname('�����ֶ�4').AsString);
    LabeledEdit8.Text:=adoquery1.fieldbyname('�����ֶ�5').AsString;
    LabeledEdit9.Text:=adoquery1.fieldbyname('�����ֶ�6').AsString;
    LabeledEdit10.Text:=adoquery1.fieldbyname('�����ֶ�7').AsString;
    LabeledEdit11.Text:=adoquery1.fieldbyname('�����ֶ�8').AsString;
    LabeledEdit12.Text:=adoquery1.fieldbyname('�����ֶ�9').AsString;
    LabeledEdit13.Text:=adoquery1.fieldbyname('�����ֶ�10').AsString;
  end else
  begin
    ClearEdit;
  end;
end;

procedure TfrmCommCode.BitBtn1Click(Sender: TObject);
begin
  ClearEdit;
  LabeledEdit1.SetFocus;
  ifNewAdd:=true;
end;

procedure TfrmCommCode.BitBtn2Click(Sender: TObject);
var
  adotemp11:tadoquery;
  sqlstr:string;
  Insert_Identity:integer;
  //WBM,PYM:string;
  //pName,pWBM,pPYM:Pchar;
  iReserve5,iReserve6:integer;
  iReserve7,iReserve8:single;
  iReserve9,iReserve10:TDateTime;
begin
  //pName:=pchar(trim(LabeledEdit2.Text));
  //pWBM:=GETBM(pName,1);
  //pPYM:=GETBM(pName,3);
  //WBM:=StrPas(pWBM);
  //PYM:=StrPas(pPYM);

  adotemp11:=tadoquery.Create(nil);
  adotemp11.Connection:=DM.ADOConnection1;
  if ifNewAdd then //����
  begin
    ifNewAdd:=false;

    if ComboBox1.ItemIndex=-1 then
    BEGIN
      adotemp11.Free;
      SHOWMESSAGE('��ѡ��ͨ�ô������');
      EXIT;
    END;

    sqlstr:='Insert into CommCode ('+
                        ' ID,name,Remark,TypeName,Reserve,Reserve2,Reserve3,Reserve4,Reserve5,Reserve6,Reserve7,Reserve8,Reserve9,Reserve10) values ('+
                        ' :ID,:name,:Remark,:TypeName,:Reserve,:Reserve2,:Reserve3,:Reserve4,:Reserve5,:Reserve6,:Reserve7,:Reserve8,:Reserve9,:Reserve10) ';
    adotemp11.Close;
    adotemp11.SQL.Clear;
    adotemp11.SQL.Add(sqlstr);
    adotemp11.SQL.Add(' SELECT SCOPE_IDENTITY() AS Insert_Identity ');
    adotemp11.Parameters.ParamByName('ID').Value:=trim(LabeledEdit1.Text);
    adotemp11.Parameters.ParamByName('name').Value:=trim(LabeledEdit2.Text);
    adotemp11.Parameters.ParamByName('Remark').Value:=trim(LabeledEdit3.Text);
    adotemp11.Parameters.ParamByName('TypeName').Value:=trim(ComboBox1.Text);
    //adotemp11.Parameters.ParamByName('PYM').Value:=PYM;
    //adotemp11.Parameters.ParamByName('WBM').Value:=WBM;
    adotemp11.Parameters.ParamByName('Reserve').Value:=trim(LabeledEdit4.Text);
    adotemp11.Parameters.ParamByName('Reserve2').Value:=trim(LabeledEdit5.Text);
    adotemp11.Parameters.ParamByName('Reserve3').Value:=trim(LabeledEdit6.Text);
    adotemp11.Parameters.ParamByName('Reserve4').Value:=trim(LabeledEdit7.Text);
    if trystrtoint(LabeledEdit8.Text,iReserve5) then
      adotemp11.Parameters.ParamByName('Reserve5').Value:=iReserve5
    else adotemp11.Parameters.ParamByName('Reserve5').Value:=null;
    if trystrtoint(LabeledEdit9.Text,iReserve6) then
      adotemp11.Parameters.ParamByName('Reserve6').Value:=iReserve6
    else adotemp11.Parameters.ParamByName('Reserve6').Value:=null;
    if trystrtofloat(LabeledEdit10.Text,iReserve7) then
      adotemp11.Parameters.ParamByName('Reserve7').Value:=iReserve7
    else adotemp11.Parameters.ParamByName('Reserve7').Value:=null;
    if trystrtofloat(LabeledEdit11.Text,iReserve8) then
      adotemp11.Parameters.ParamByName('Reserve8').Value:=iReserve8
    else adotemp11.Parameters.ParamByName('Reserve8').Value:=null;
    if trystrtodatetime(LabeledEdit12.Text,iReserve9) then
      adotemp11.Parameters.ParamByName('Reserve9').Value:=iReserve9
    else adotemp11.Parameters.ParamByName('Reserve9').Value:=null;
    if trystrtodatetime(LabeledEdit13.Text,iReserve10) then
      adotemp11.Parameters.ParamByName('Reserve10').Value:=iReserve10
    else adotemp11.Parameters.ParamByName('Reserve10').Value:=null;
    adotemp11.Open;
    ADOQuery1.Requery([]);
    Insert_Identity:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
  end else //�޸�
  begin
    IF AdoQuery1.RecordCount=0 THEN
    BEGIN
      adotemp11.Free;
      SHOWMESSAGE('û�м�¼�����޸ģ���Ҫ���������ȵ��"������ť"��');
      EXIT;
    END;
    Insert_Identity:=ADOQuery1.fieldbyname('Unid').AsInteger;
    adotemp11.Close;
    adotemp11.SQL.Clear;
    adotemp11.SQL.Text:=' Update CommCode  '+
    '  set ID=:ID,name=:name,Remark=:Remark,Reserve=:Reserve,Reserve2=:Reserve2,Reserve3=:Reserve3,Reserve4=:Reserve4,Reserve5=:Reserve5,Reserve6=:Reserve6,Reserve7=:Reserve7,Reserve8=:Reserve8,Reserve9=:Reserve9,Reserve10=:Reserve10  '+
    '  Where    Unid=:Unid      ';
    adotemp11.Parameters.ParamByName('ID').Value:=trim(LabeledEdit1.Text);
    adotemp11.Parameters.ParamByName('name').Value:=trim(LabeledEdit2.Text);
    adotemp11.Parameters.ParamByName('Remark').Value:=trim(LabeledEdit3.Text);
    //adotemp11.Parameters.ParamByName('PYM').Value:=PYM;
    //adotemp11.Parameters.ParamByName('WBM').Value:=WBM;
    adotemp11.Parameters.ParamByName('Reserve').Value:=trim(LabeledEdit4.Text);
    adotemp11.Parameters.ParamByName('Reserve2').Value:=trim(LabeledEdit5.Text);
    adotemp11.Parameters.ParamByName('Reserve3').Value:=trim(LabeledEdit6.Text);
    adotemp11.Parameters.ParamByName('Reserve4').Value:=trim(LabeledEdit7.Text);
    if trystrtoint(LabeledEdit8.Text,iReserve5) then
      adotemp11.Parameters.ParamByName('Reserve5').Value:=iReserve5
    else adotemp11.Parameters.ParamByName('Reserve5').Value:=null;
    if trystrtoint(LabeledEdit9.Text,iReserve6) then
      adotemp11.Parameters.ParamByName('Reserve6').Value:=iReserve6
    else adotemp11.Parameters.ParamByName('Reserve6').Value:=null;
    if trystrtofloat(LabeledEdit10.Text,iReserve7) then
      adotemp11.Parameters.ParamByName('Reserve7').Value:=iReserve7
    else adotemp11.Parameters.ParamByName('Reserve7').Value:=null;
    if trystrtofloat(LabeledEdit11.Text,iReserve8) then
      adotemp11.Parameters.ParamByName('Reserve8').Value:=iReserve8
    else adotemp11.Parameters.ParamByName('Reserve8').Value:=null;
    if trystrtodatetime(LabeledEdit12.Text,iReserve9) then
      adotemp11.Parameters.ParamByName('Reserve9').Value:=iReserve9
    else adotemp11.Parameters.ParamByName('Reserve9').Value:=null;
    if trystrtodatetime(LabeledEdit13.Text,iReserve10) then
      adotemp11.Parameters.ParamByName('Reserve10').Value:=iReserve10
    else adotemp11.Parameters.ParamByName('Reserve10').Value:=null;
    adotemp11.Parameters.ParamByName('Unid').Value:=Insert_Identity;
    adotemp11.ExecSQL;
    AdoQuery1.Refresh;
  end;

  adotemp11.Free;
  AdoQuery1.Locate('Unid',Insert_Identity,[loCaseInsensitive]) ;
  updateEdit;
end;

procedure TfrmCommCode.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  ifNewAdd:=false;
  updateEdit;
end;

procedure TfrmCommCode.BitBtn3Click(Sender: TObject);
var
  adotemp11:tadoquery;
begin
  if not DBGrid1.DataSource.DataSet.Active then exit;
  if DBGrid1.DataSource.DataSet.RecordCount=0 then exit;
  
  if (MessageDlg('ȷʵҪɾ���ü�¼��',mtWarning,[mbYes,mbNo],0)<>mrYes) then exit;

  //ɾ���ò��ŵ���Ա
  if ComboBox1.Text='����' then
  begin
    adotemp11:=tadoquery.Create(nil);
    adotemp11.Connection:=DM.ADOConnection1;
    adotemp11.Close;
    adotemp11.SQL.Clear;
    adotemp11.SQL.Add('delete from worker where pkdeptid='+DBGrid1.DataSource.DataSet.fieldbyname('Unid').AsString);
    adotemp11.ExecSQL;
    adotemp11.free;
  end;
  //================

    DBGrid1.DataSource.DataSet.Delete;

    adoquery1.Refresh;
    updateEdit;
end;

procedure TfrmCommCode.updateAdoQuery1;
begin
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Text:='select ID as ����,name as ����,Remark as ��ע,'+
  'Reserve as �����ֶ�1,Reserve2 as �����ֶ�2,Reserve3 as �����ֶ�3,Reserve4 as �����ֶ�4,'+
  'Reserve5 as �����ֶ�5,Reserve6 as �����ֶ�6,Reserve7 as �����ֶ�7,Reserve8 as �����ֶ�8,'+
  'Reserve9 as �����ֶ�9,Reserve10 as �����ֶ�10,Unid from CommCode WHERE TypeName='''+ComboBox1.Text+''' order by ���� ';
  adoquery1.Open;

  if ComboBox1.Text='ϵͳ����' then Label2.Visible:=true else Label2.Visible:=false;
end;

procedure TfrmCommCode.ComboBox1Change(Sender: TObject);
begin
  updateAdoQuery1;
end;

procedure TfrmCommCode.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;
  dbgrid1.Columns.Items[0].Width:=60;
  dbgrid1.Columns.Items[1].Width:=150;
  dbgrid1.Columns.Items[2].Width:=150;
  dbgrid1.Columns.Items[3].Width:=100;
  dbgrid1.Columns.Items[4].Width:=100;
  dbgrid1.Columns.Items[5].Width:=100;
  dbgrid1.Columns.Items[6].Width:=100;
end;

procedure TfrmCommCode.BitBtn4Click(Sender: TObject);
var
  LYDataToExcel11:TLYDataToExcel;
begin
  LYDataToExcel11:=TLYDataToExcel.create(nil);
  LYDataToExcel11.DataSet:=adoquery1;
  LYDataToExcel11.ExcelTitel:=ComboBox1.text;
  LYDataToExcel11.Execute;
  LYDataToExcel11.Free;
end;

procedure TfrmCommCode.DateTimePicker1Change(Sender: TObject);
begin
  LabeledEdit12.Text:=datetostr((sender as TDateTimePicker).date);
end;

procedure TfrmCommCode.DateTimePicker2Change(Sender: TObject);
begin
  LabeledEdit13.Text:=datetostr((sender as TDateTimePicker).date);
end;

procedure TfrmCommCode.BitBtn5Click(Sender: TObject);
var
  adotemp22,adotemp33:tadoquery;
  sTypeName:string;
  iNum:integer;
begin
  if not InputQuery('��ʾ','������Ҫ���ӵ�����',sTypeName) then exit;
  sTypeName:=trim(sTypeName);
  if sTypeName='' then
  begin
    MESSAGEDLG('���Ͳ���Ϊ��!',MTINFORMATION,[MBOK],0);
    exit;
  end;
  adotemp22:=tadoquery.Create(nil);
  adotemp22.Connection:=dm.ADOConnection1;
  adotemp22.Close;
  adotemp22.SQL.Clear;
  adotemp22.SQL.Text:='select count(*) as iNum from CommCode where TypeName='''+sTypeName+''' ';
  adotemp22.Open;
  iNum:=adotemp22.fieldbyname('iNum').AsInteger;
  adotemp22.Free;
  if iNum<=0 then
  begin
    adotemp33:=tadoquery.Create(nil);
    adotemp33.Connection:=dm.ADOConnection1;
    adotemp33.Close;
    adotemp33.SQL.Clear;
    adotemp33.SQL.Add('Insert into CommCode (ID,name,TypeName) values (''��ʼID'',''��ʼName'','''+sTypeName+''') ');
    adotemp33.ExecSQL;
    adotemp33.Free;

    LoadGroupName(ComboBox1,'select TypeName from CommCode group by TypeName');//����ComboBox1
  end;

  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(sTypeName);

  updateAdoQuery1;
end;

initialization
  ffrmCommCode:=nil;

end.