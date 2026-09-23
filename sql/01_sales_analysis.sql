--Q1 MONTO TOTAL VENDIDO
SELECT SUM(CONT.nMontoFinanciado) AS TOTAL_VENTAS FROM DB_INMOBISOFT_2.contratos.Contrato CONT
WHERE CONT.nIdEstado=54

--Q2 CANTIDAD DE CONTRATOS
SELECT COUNT(CONT.nIdContrato) AS CANTIDAD_CONTRATOS FROM DB_INMOBISOFT_2.contratos.Contrato CONT
WHERE CONT.nIdEstado NOT IN (55,137,112)

--Q3 MONTO PROMEDIO DE VENTAS
SELECT AVG(CONT.nMontoFinanciado) AS PROMEDIO_VENTAS FROM DB_INMOBISOFT_2.contratos.Contrato CONT
WHERE CONT.nIdEstado NOT IN (55,137,112)

--Q4 VENTA MINIMO Y MAXIMA
SELECT MIN(CONT.nMontoFinanciado) AS VENTA_MINIMA,MAX(CONT.nMontoFinanciado) AS VENTA_MAXIMA FROM DB_INMOBISOFT_2.contratos.Contrato CONT
WHERE CONT.nIdEstado NOT IN (55,137,112)
AND CONT.nMontoFinanciado>0

--Q5 VENTAS POR PROYECTO
SELECT P.sDescripcion,COUNT(nIdContrato) AS CANTIDAD_VENTAS,SUM(CONT.nMontoFinanciado) AS TOTAL_VENDIDO
FROM DB_INMOBISOFT_2.contratos.Contrato CONT
INNER JOIN DB_INMOBISOFT_2.proyectos.Lote L
ON L.nIdLote=CONT.nIdLote
INNER JOIN DB_INMOBISOFT_2.proyectos.Manzana M
ON M.nIdManzana=L.nIdManzana
INNER JOIN DB_INMOBISOFT_2.proyectos.Sector S
ON S.nIdSector=M.nIdSector
INNER JOIN DB_INMOBISOFT_2.proyectos.Proyecto P
ON P.nIdProyecto=S.nIdProyecto
WHERE CONT.nIdEstado=54
AND P.nIdProyecto IN (10,11,16)
GROUP BY P.sDescripcion

--Q6 VENTAS MENSUALES

SELECT YEAR(dFechaVenta) AS AÑO_VENTA,MONTH(dFechaVenta) AS MES_VENTA, SUM(CONT.nMontoFinanciado) AS TOTAL_VENDIDO
FROM DB_INMOBISOFT_2.contratos.Contrato CONT
WHERE dFechaVenta IS NOT NULL
AND CONT.nIdEstado=54
AND nMontoFinanciado>0
GROUP BY YEAR(dFechaVenta),MONTH(dFechaVenta) 
ORDER BY YEAR(dFechaVenta) ASC, MONTH(dFechaVenta) ASC

--Q8 PROYECTO MAYOR MONTO VENDIDO

SELECT P.sDescripcion,SUM(CONT.nMontoFinanciado) AS TOTAL_VENDIDO
FROM DB_INMOBISOFT_2.contratos.Contrato CONT
INNER JOIN DB_INMOBISOFT_2.proyectos.Lote L
ON L.nIdLote=CONT.nIdLote
INNER JOIN DB_INMOBISOFT_2.proyectos.Manzana M
ON M.nIdManzana=L.nIdManzana
INNER JOIN DB_INMOBISOFT_2.proyectos.Sector S
ON S.nIdSector=M.nIdSector
INNER JOIN DB_INMOBISOFT_2.proyectos.Proyecto P
ON P.nIdProyecto=S.nIdProyecto
WHERE CONT.nIdEstado=54
AND P.nIdProyecto IN (10,11,16)
GROUP BY P.sDescripcion
ORDER BY SUM(CONT.nMontoFinanciado) DESC