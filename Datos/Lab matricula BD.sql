--LABORATORIO MATRICULA

--ESQUEMA

CREATE TABLESPACE LAB_MATRICULA
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\LAB_MATRICULA.dbf'
SIZE 100M 
ONLINE;
CREATE TEMPORARY TABLESPACE LAB_MATRICULA_TEMP
TEMPFILE 'C:\oraclexe\app\oracle\oradata\XE\LAB_MATRICULA_TEMP.dbf'
SIZE 12M
AUTOEXTEND ON;
CREATE USER LAB_MATRICULA IDENTIFIED BY root123
  DEFAULT TABLESPACE LAB_MATRICULA
  TEMPORARY TABLESPACE LAB_MATRICULA_TEMP;
GRANT RESOURCE, CONNECT TO LAB_MATRICULA;
GRANT CREATE SESSION TO LAB_MATRICULA;
GRANT ALL PRIVILEGES TO LAB_MATRICULA;

--TABLAS

CREATE TABLE CARRERA(
CODIGO_CARRERA VARCHAR2(50),
NOMBRE VARCHAR2(50),
TITULO VARCHAR2(50),
CONSTRAINTS CARRERA_PK PRIMARY KEY(CODIGO_CARRERA));

CREATE TABLE CURSO(
CODIGO_CURSO VARCHAR2(50),
CODIGO_CARRERA VARCHAR2(50),
NO_CICLO VARCHAR2(50),
NOMBRE VARCHAR2(50),
CREDITOS NUMBER(1),
HORAS_SEMANALES NUMBER(3),
CONSTRAINTS CURSO_PK PRIMARY KEY(CODIGO_CURSO));

CREATE TABLE PROFESOR(
CEDULA_PROFESOR VARCHAR2(50),
NOMBRE VARCHAR2(50),
TELEFONO VARCHAR2(50),
EMAIL VARCHAR2(50),
CONSTRAINTS PROFESOR_PK PRIMARY KEY(CEDULA_PROFESOR));

CREATE TABLE ALUMNO(
CEDULA_ALUMNO VARCHAR2(50),
NOMBRE VARCHAR2(50),
TELEFONO VARCHAR2(50),
EMAIL VARCHAR2(50),
FECHA_NACIMIENTO DATE,
CARRERA VARCHAR2(50),
CONSTRAINTS ALUMNO_PK PRIMARY KEY(CEDULA_ALUMNO));

CREATE TABLE CICLO(
NO_CICLO VARCHAR2(50),
ANIO VARCHAR2(4),
NUMERO VARCHAR2(1),
FECHA_INICIO DATE,
FECHA_FIN DATE,
CONSTRAINTS CICLO_PK PRIMARY KEY(NO_CICLO));

CREATE TABLE GRUPO(
NUMERO_GRUPO VARCHAR2(50),
NO_CICLO VARCHAR2(50),
CODIGO_CURSO VARCHAR2(50),
CEDULA_PROFESOR VARCHAR2(50),
HORARIO VARCHAR2(50),
CONSTRAINTS GRUPO_PK PRIMARY KEY(NUMERO_GRUPO));

CREATE TABLE USUARIOS(
CEDULA VARCHAR2(50),
CLAVE VARCHAR2(50),
IND_ADMINISTRADOR VARCHAR2(1),
IND_MATRICULADOR VARCHAR2(1),
IND_PROFESOR VARCHAR2(1),
IND_ALUMNO VARCHAR2(1),
CONSTRAINTS USUARIOS_PK PRIMARY KEY(CEDULA));

CREATE TABLE MATRICULAS(
NO_MATRICULA VARCHAR2(50),
CEDULA_ALUMNO VARCHAR2(50),
NUMERO_GRUPO VARCHAR2(50),
NOTA VARCHAR2(50),
CONSTRAINTS MATRICULAS_PK PRIMARY KEY(NO_MATRICULA));

--------------------------------------------------------------------------------------------------------------------

--LLAVES FORÁNEAS

--TABLA CURSO
ALTER TABLE CURSO ADD CONSTRAINT FK_CURSO_CARRERA
FOREIGN KEY(CODIGO_CARRERA)
REFERENCES CARRERA(CODIGO_CARRERA);

ALTER TABLE CURSO ADD CONSTRAINT FK_CURSO_CICLO
FOREIGN KEY(NO_CICLO)
REFERENCES CICLO(NO_CICLO);

--TABLA GRUPO
ALTER TABLE GRUPO ADD CONSTRAINT FK_GRUPO_CURSO
FOREIGN KEY(CODIGO_CURSO)
REFERENCES CURSO(CODIGO_CURSO);

ALTER TABLE GRUPO ADD CONSTRAINT FK_GRUPO_CICLO
FOREIGN KEY(NO_CICLO)
REFERENCES CICLO(NO_CICLO);

ALTER TABLE GRUPO ADD CONSTRAINT FK_GRUPO_PROFESOR
FOREIGN KEY(CEDULA_PROFESOR)
REFERENCES PROFESOR(CEDULA_PROFESOR);

--TABLA USUARIOS
ALTER TABLE USUARIOS ADD CONSTRAINT FK_USUARIOS_PROFESOR
FOREIGN KEY(CEDULA)
REFERENCES PROFESOR(CEDULA_PROFESOR);

ALTER TABLE USUARIOS ADD CONSTRAINT FK_USUARIOS_ALUMNO
FOREIGN KEY(CEDULA)
REFERENCES ALUMNO(CEDULA_ALUMNO);

--TABLA MATRICULAS
ALTER TABLE MATRICULAS ADD CONSTRAINT FK_MATRICULAS_ALUMNO
FOREIGN KEY(CEDULA_ALUMNO)
REFERENCES ALUMNO(CEDULA_ALUMNO);

ALTER TABLE MATRICULAS ADD CONSTRAINT FK_MATRICULAS_GRUPO
FOREIGN KEY(NUMERO_GRUPO)
REFERENCES GRUPO(NUMERO_GRUPO);

--------------------------------------------------------------------------------------------------------------------

--PROCEDIMIENTOS ALMACENADOS

CREATE OR REPLACE PACKAGE TYPES

AS

TYPE REF_CURSOR IS REF CURSOR;

END;

/

--TABLA CARRERA--------------------------------------------------------------------------------------------------------------------

--INSERTAR
CREATE OR REPLACE PROCEDURE INSERTAR_CARRERA(CODIGO_CARRERA IN CARRERA.CODIGO_CARRERA%TYPE,NOMBRE IN CARRERA.NOMBRE%TYPE,TITULO IN CARRERA.TITULO%TYPE)

AS

BEGIN

INSERT INTO CARRERA VALUES(CODIGO_CARRERA,NOMBRE,TITULO);

END;

/

--MODIFICAR
CREATE OR REPLACE PROCEDURE MODIFICAR_CARRERA(P_CODIGO_CARRERA IN CURSO.CODIGO_CARRERA%TYPE,P_NOMBRE IN CURSO.NOMBRE%TYPE,P_TITULO IN CARRERA.TITULO%TYPE)

AS

BEGIN

UPDATE CARRERA SET NOMBRE = P_NOMBRE, TITULO = P_TITULO  WHERE CODIGO_CARRERA = P_CODIGO_CARRERA;

END;

/

--BUSCAR (UN ELEMENTO)

CREATE OR REPLACE FUNCTION BUSCAR_CARRERA(P_CODIGO_CARRERA IN CARRERA.CODIGO_CARRERA%TYPE)

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_CARRERA TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_CARRERA FOR 

SELECT CODIGO_CARRERA,NOMBRE,TITULO FROM CARRERA WHERE CODIGO_CARRERA = P_CODIGO_CARRERA; 

RETURN CURSOR_CARRERA; 

END;

/

--LISTAR (TODOS LOS ELEMENTOS)

CREATE OR REPLACE FUNCTION LISTAR_CARRERA

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_CARRERA TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_CARRERA FOR 

SELECT CODIGO_CARRERA,NOMBRE,TITULO FROM CARRERA; 

RETURN CURSOR_CARRERA; 

END;

/

--BORRAR
CREATE OR REPLACE PROCEDURE ELIMINAR_CARRERA(P_CODIGO_CARRERA IN CARRERA.CODIGO_CARRERA%TYPE)

AS

BEGIN

DELETE FROM CARRERA WHERE CODIGO_CARRERA = P_CODIGO_CARRERA;

END;

/

--TABLA CURSO--------------------------------------------------------------------------------------------------------------------

--INSERTAR
CREATE OR REPLACE PROCEDURE INSERTAR_CURSO(CODIGO_CURSO IN CURSO.CODIGO_CURSO%TYPE,CODIGO_CARRERA IN CURSO.CODIGO_CARRERA%TYPE,NO_CICLO IN CURSO.NO_CICLO%TYPE,NOMBRE IN CURSO.NOMBRE%TYPE,CREDITOS IN CURSO.CREDITOS%TYPE,HORAS_SEMANALES IN CURSO.HORAS_SEMANALES%TYPE)

AS

BEGIN

INSERT INTO CURSO VALUES(CODIGO_CURSO,CODIGO_CARRERA,NO_CICLO,NOMBRE,CREDITOS,HORAS_SEMANALES);

END;

/

--MODIFICAR
CREATE OR REPLACE PROCEDURE MODIFICAR_CURSO(P_CODIGO_CURSO IN CURSO.CODIGO_CURSO%TYPE,P_CODIGO_CARRERA IN CURSO.CODIGO_CARRERA%TYPE,P_NO_CICLO IN CURSO.NO_CICLO%TYPE,P_NOMBRE IN CURSO.NOMBRE%TYPE,P_CREDITOS IN CURSO.CREDITOS%TYPE,P_HORAS_SEMANALES IN CURSO.HORAS_SEMANALES%TYPE)

AS

BEGIN

UPDATE CURSO SET CODIGO_CARRERA = P_CODIGO_CARRERA, NO_CICLO = P_NO_CICLO, NOMBRE = P_NOMBRE, CREDITOS = P_CREDITOS, HORAS_SEMANALES = P_HORAS_SEMANALES  WHERE CODIGO_CURSO = P_CODIGO_CURSO;

END;

/

--BUSCAR (UN ELEMENTO)

CREATE OR REPLACE FUNCTION BUSCAR_CURSO(P_CODIGO_CURSO IN CURSO.CODIGO_CURSO%TYPE)

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_CURSO TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_CURSO FOR 

SELECT CODIGO_CURSO,CODIGO_CARRERA,NO_CICLO,NOMBRE,CREDITOS,HORAS_SEMANALES FROM CURSO WHERE CODIGO_CURSO = P_CODIGO_CURSO; 

RETURN CURSOR_CURSO; 

END;

/

--LISTAR (TODOS LOS ELEMENTOS)

CREATE OR REPLACE FUNCTION LISTAR_CURSO

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_CURSO TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_CURSO FOR 

SELECT CODIGO_CURSO,CODIGO_CARRERA,NO_CICLO,NOMBRE,CREDITOS,HORAS_SEMANALES FROM CURSO; 

RETURN CURSOR_CURSO; 

END;

/

--BORRAR
CREATE OR REPLACE PROCEDURE ELIMINAR_CURSO(P_CODIGO_CURSO IN CURSO.CODIGO_CURSO%TYPE)

AS

BEGIN

DELETE FROM CURSO WHERE CODIGO_CURSO = P_CODIGO_CURSO;

END;

/

--TABLA PROFESOR--------------------------------------------------------------------------------------------------------------------

--INSERTAR
CREATE OR REPLACE PROCEDURE INSERTAR_PROFESOR(CEDULA_PROFESOR IN PROFESOR.CEDULA_PROFESOR%TYPE,NOMBRE IN PROFESOR.NOMBRE%TYPE,TELEFONO IN PROFESOR.TELEFONO%TYPE,EMAIL IN PROFESOR.EMAIL%TYPE)

AS

BEGIN

INSERT INTO PROFESOR VALUES(CEDULA_PROFESOR,NOMBRE,TELEFONO,EMAIL);

END;

/

--MODIFICAR
CREATE OR REPLACE PROCEDURE MODIFICAR_PROFESOR(P_CEDULA_PROFESOR IN PROFESOR.CEDULA_PROFESOR%TYPE,P_NOMBRE IN PROFESOR.NOMBRE%TYPE,P_TELEFONO IN PROFESOR.TELEFONO%TYPE,P_EMAIL IN PROFESOR.EMAIL%TYPE)

AS

BEGIN

UPDATE PROFESOR SET NOMBRE = P_NOMBRE, TELEFONO = P_TELEFONO, EMAIL = P_EMAIL  WHERE CEDULA_PROFESOR = P_CEDULA_PROFESOR;

END;

/

--BUSCAR (UN ELEMENTO)

CREATE OR REPLACE FUNCTION BUSCAR_PROFESOR(P_CEDULA_PROFESOR IN PROFESOR.CEDULA_PROFESOR%TYPE)

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_PROFESOR TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_PROFESOR FOR 

SELECT CEDULA_PROFESOR,NOMBRE,TELEFONO,EMAIL FROM PROFESOR WHERE CEDULA_PROFESOR = P_CEDULA_PROFESOR; 

RETURN CURSOR_PROFESOR; 

END;

/

--LISTAR (TODOS LOS ELEMENTOS)

CREATE OR REPLACE FUNCTION LISTAR_PROFESOR

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_PROFESOR TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_PROFESOR FOR 

SELECT CEDULA_PROFESOR,NOMBRE,TELEFONO,EMAIL FROM PROFESOR; 

RETURN CURSOR_PROFESOR; 

END;

/

--BORRAR
CREATE OR REPLACE PROCEDURE ELIMINAR_PROFESOR(P_CEDULA_PROFESOR IN PROFESOR.CEDULA_PROFESOR%TYPE)

AS

BEGIN

DELETE FROM PROFESOR WHERE CEDULA_PROFESOR = P_CEDULA_PROFESOR;

END;

/

--TABLA ALUMNO--------------------------------------------------------------------------------------------------------------------

--INSERTAR
CREATE OR REPLACE PROCEDURE INSERTAR_ALUMNO(CEDULA_ALUMNO IN ALUMNO.CEDULA_ALUMNO%TYPE,NOMBRE IN ALUMNO.NOMBRE%TYPE,TELEFONO IN ALUMNO.TELEFONO%TYPE,EMAIL IN ALUMNO.EMAIL%TYPE,FECHA_NACIMIENTO IN ALUMNO.FECHA_NACIMIENTO%TYPE,CARRERA IN ALUMNO.CARRERA%TYPE)

AS

BEGIN

INSERT INTO ALUMNO VALUES(CEDULA_ALUMNO,NOMBRE,TELEFONO,EMAIL,FECHA_NACIMIENTO,CARRERA);

END;

/

--MODIFICAR
CREATE OR REPLACE PROCEDURE MODIFICAR_ALUMNO(P_CEDULA_ALUMNO IN ALUMNO.CEDULA_ALUMNO%TYPE,P_NOMBRE IN ALUMNO.NOMBRE%TYPE,P_TELEFONO IN ALUMNO.TELEFONO%TYPE,P_EMAIL IN ALUMNO.EMAIL%TYPE,P_FECHA_NACIMIENTO IN ALUMNO.FECHA_NACIMIENTO%TYPE,P_CARRERA IN ALUMNO.CARRERA%TYPE)

AS

BEGIN

UPDATE ALUMNO SET NOMBRE = P_NOMBRE, TELEFONO = P_TELEFONO, EMAIL = P_EMAIL, FECHA_NACIMIENTO = P_FECHA_NACIMIENTO, CARRERA = P_CARRERA  WHERE CEDULA_ALUMNO = P_CEDULA_ALUMNO;

END;

/

--BUSCAR (UN ELEMENTO)

CREATE OR REPLACE FUNCTION BUSCAR_ALUMNO(P_CEDULA_ALUMNO IN ALUMNO.CEDULA_ALUMNO%TYPE)

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_ALUMNO TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_ALUMNO FOR 

SELECT CEDULA_ALUMNO,NOMBRE,TELEFONO,EMAIL,FECHA_NACIMIENTO,CARRERA FROM ALUMNO WHERE CEDULA_ALUMNO = P_CEDULA_ALUMNO; 

RETURN CURSOR_ALUMNO; 

END;

/

--LISTAR (TODOS LOS ELEMENTOS)

CREATE OR REPLACE FUNCTION LISTAR_ALUMNO

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_ALUMNO TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_ALUMNO FOR 

SELECT CEDULA_ALUMNO,NOMBRE,TELEFONO,EMAIL,FECHA_NACIMIENTO,CARRERA FROM ALUMNO; 

RETURN CURSOR_ALUMNO; 

END;

/

--BORRAR
CREATE OR REPLACE PROCEDURE ELIMINAR_ALUMNO(P_CEDULA_ALUMNO IN ALUMNO.CEDULA_ALUMNO%TYPE)

AS

BEGIN

DELETE FROM ALUMNO WHERE CEDULA_ALUMNO = P_CEDULA_ALUMNO;

END;

/

--TABLA CICLO--------------------------------------------------------------------------------------------------------------------

--LISTAR (TODOS LOS ELEMENTOS)

CREATE OR REPLACE FUNCTION LISTAR_CICLO

RETURN TYPES.REF_CURSOR 

AS 

CURSOR_CICLO TYPES.REF_CURSOR; 

BEGIN 

OPEN CURSOR_CICLO FOR 

SELECT NO_CICLO,ANIO,NUMERO,FECHA_INICIO,FECHA_FIN FROM CICLO; 

RETURN CURSOR_CICLO; 

END;

/

--------------------------------------------------------------------------------------------------------------------

--DATOS DE PRUEBA

INSERT INTO CICLO(NO_CICLO,ANIO,NUMERO,FECHA_INICIO,FECHA_FIN) VALUES('1','2019','1',SYSDATE,SYSDATE);

BEGIN

--TABLA CARRERA
INSERTAR_CARRERA('IN001','INGENIERIA DE SISTEMAS','DIPLOMADO');
INSERTAR_CARRERA('BI001','BIOLOGIA','DIPLOMADO');

--TABLA CURSO
INSERTAR_CURSO('AD100','IN001','1','ADMINISTRACION DE BASE DE DATOS',4,8);
INSERTAR_CURSO('BI100','BI001','1','BIOLOGIA I',4,8);

--TABLA PROFESOR
INSERTAR_PROFESOR('117772210','ALVARO SOLIS','88293785','ASOLIS@CORREO.COM');
INSERTAR_PROFESOR('217772210','MARIA RODRIGUEZ','88293786','MRODRIGUEZ@CORREO.COM');

--TABLA ALUMNO
INSERTAR_ALUMNO('119994410','VICTOR SALAZAR','66293785','VSALAZAR@CORREO.COM',SYSDATE,'IN001');
INSERTAR_ALUMNO('219994410','CATALINA SANCHEZ','66293786','CSANCHEZ@CORREO.COM',SYSDATE,'BI001');

COMMIT;

END;