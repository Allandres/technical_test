SELECT 
CF.Country_Name  AS PAIS 
,CF.Format_Name  AS FORMATO
,ST.Store_Code   AS Numero_de_Tienda
,ST.Store_Name   As Nombre_de_Tienda
,SL.Date         AS Fecha
,ROUND(SUM(SL.Quantity/NULLIF(SL.Transactions, 0)),2) AS Unidades_Promedio
,ROUND(SUM(SL._Sales_/NULLIF(SL.Transactions,0)),2) AS Transaccion_Promedio
,ROUND(SUM(SL._Sales_/NULLIF(SL.Quantity,0)),2) AS Precio_Promedio

FROM ace-sight-250320.Test_Walmart.Cntry_Frmt CF
INNER JOIN ace-sight-250320.Test_Walmart.Stores ST
        ON CF.Country_Format = ST.Country_Format
INNER JOIN ace-sight-250320.Test_Walmart.Sales SL
        ON ST.Store_Code = SL.Store_Code

GROUP BY 
CF.Country_Name   
,CF.Format_Name  
,ST.Store_Code   
,ST.Store_Name  
,SL.Date        
