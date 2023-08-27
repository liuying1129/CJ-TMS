program YK_TMS;

uses
  Forms,
  UfrmMain in 'UfrmMain.pas' {frmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  UfrmCommCode in 'UfrmCommCode.pas' {frmCommCode},
  UfrmLogin in 'UfrmLogin.pas' {frmLogin},
  Ufrmdocset in 'Ufrmdocset.pas' {frmdocset},
  UfrmBackBill in 'UfrmBackBill.pas' {frmBackBill},
  UfrmCommQuery in 'UfrmCommQuery.pas' {frmCommQuery},
  UfrmHistCommQuery in 'UfrmHistCommQuery.pas' {frmHistCommQuery},
  UfrmExpSign in 'UfrmExpSign.pas' {frmExpSign},
  UfrmFeeInfo in 'UfrmFeeInfo.pas' {frmFeeInfo},
  softMeter_globalVar in 'softMeter_globalVar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
