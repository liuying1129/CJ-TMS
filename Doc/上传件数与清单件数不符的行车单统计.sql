select sc_ydh as 华润行车单号,ydh_js as 上传的计费件数,
(
select isnull(sum(TempA.SC_BillNo_Js),0) as z_js from 
                      ( 
                      select SC_BillNo,SC_BillNo_Js from yd_c 
                      where SC_COMPANY=feeinfo.sc_company
                      AND SC_YDH=feeinfo.sc_ydh
                      group by SC_BillNo,SC_BillNo_Js 
                      ) TempA 
) as 清单件数之和
from feeinfo
where sc_company like '%华润%' 
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