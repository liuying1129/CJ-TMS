select sc_ydh as �����г�����,ydh_js as �ϴ��ļƷѼ���,
(
select isnull(sum(TempA.SC_BillNo_Js),0) as z_js from 
                      ( 
                      select SC_BillNo,SC_BillNo_Js from yd_c 
                      where SC_COMPANY=feeinfo.sc_company
                      AND SC_YDH=feeinfo.sc_ydh
                      group by SC_BillNo,SC_BillNo_Js 
                      ) TempA 
) as �嵥����֮��
from feeinfo
where sc_company like '%����%' 
and sc_ydh>'20150318'
and sc_ydh<'20150524'
and ydh_js<>
(
select isnull(sum(TempA.SC_BillNo_Js),0) as z_js from 
                      ( 
                      select SC_BillNo,SC_BillNo_Js from yd_c 
                      where SC_COMPANY=feeinfo.sc_company
                      AND SC_YDH=feeinfo.sc_ydh
                      group by SC_BillNo,SC_BillNo_Js 
                      ) TempA 
)