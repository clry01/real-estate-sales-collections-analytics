--Q9 CUANTO LOTES HAN SIDO VENDIDO
SELECT  COUNT(DISTINCT CONT.nIdLote) AS LOTES_VENDIDOS FROM DB_INMOBISOFT_2.contratos.Contrato CONT
WHERE CONT.nIdEstado=54

--10 VENTAS POR PROYECTO
SELECT P.sDescripcion,COUNT(DISTINCT CONT.nIdLote) AS LOTES_VENDIDOS
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

--Q11 VENTA POR LOTE

SELECT P.sDescripcion, CONCAT('LOTE',' ',L.sLote), CONT.nMontoFinanciado
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