SELECT 
CF.Country_Name  AS PAIS 
,CF.Format_Name  AS FORMATO
,SP.Date         AS Fecha
,ROUND(SUM(1-(SP._Sales_Plan_ - SL._SALES_)/NULLIF(SL._SALES_, 0)),2) AS Alcance_al_Plan

FROM ace-sight-250320.Test_Walmart.Cntry_Frmt CF
INNER JOIN ace-sight-250320.Test_Walmart.Stores ST
        ON CF.Country_Format = ST.Country_Format
INNER JOIN ace-sight-250320.Test_Walmart.Sales SL
        ON ST.Store_Code = SL.Store_Code
INNER JOIN ace-sight-250320.Test_Walmart.Sales_Plan SP
        ON CF.Country_Format = SP.Country_Format

GROUP BY 
CF.Country_Name   
,CF.Format_Name 
,SP.Date        
