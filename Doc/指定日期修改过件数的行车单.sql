select sc_ydh as 华润行车单号,ydh_js as 件数 from feeinfo
where sc_company like '%华润%' 
and isedited>1
and sc_ydh>'20150318'
and sc_ydh<'20150324'