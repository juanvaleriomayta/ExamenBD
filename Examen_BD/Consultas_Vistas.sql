select * from Medicos
select * from Horarios

CREATE VIEW VW_MedicoDiaHorarios
AS
select Medicos.nombreM, Medicos.direccionM, Horarios.diaH
FROM Medicos
INNER JOIN Horarios
ON Medicos.Horarios_idHorario = Horarios.idHorario

