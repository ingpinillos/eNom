use pcgc
Go
Declare @eNom50 char(50)='eNom 2021-11-25 10:26 --> ' + replace(convert(char(16),getdate(),126),'T',' ')
print @eNom50
-- PCGC
-- eNom
/* 
select * from LIBROHORASEXTRAS 
MTTIPCONTR
*/
Set nocount on;
/*
Update Consecut Set Consecut=5009, consecini=5000 From Consecut Where Origen='NOM' and Tipodcto='NE'
UpDate MTLiqNom Set ConsecNE='0', eNomFcGen='1900-01-01', eNomFcTrn='1900-01-01', eNomStTrn='',meuuid='',eNomobser='', eNomresul='',eNomSelec=0 
Where MTLiqNom Where len(meuuid)='' and NomAbierta=0 and ConsecNE!=0 and ENOMSTTRN='En Construcción'
*/
	If exists(SELECT name FROM master..sysdatabases WHERE (name = 'CONTROL_OFIMAENTERPRISE'))
	Begin
		IF not EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 9)
			insert into CONTROL_OFIMAEnterprise..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(0, 'NOMPL','Específicos',0,'','','NOM_Espec','','','(Todos)','','','9','','',1,0)
		Else 
			IF EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 9 and IDMENU='NOM_eNom')
				UpDate CONTROL_OFIMAEnterprise..MTMENU 
				Set POSMENU = 91
				WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 9 and IDMENU='NOM_eNom'

		IF not EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 91)
			insert into CONTROL_OFIMAEnterprise..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(0, 'NOMPL','Nomina Electronica',0,'','','NOM_eNom','eNom','','(Todos)','','','91','','eNom',1,0)
		Else
			IF EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 91 and IDMENU='NOM_eNomV10')
				UpDate CONTROL_OFIMAEnterprise..MTMENU 
				Set POSMENU = 911
				WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 91 and IDMENU='NOM_eNomV10'

		IF not EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 911)
			insert into CONTROL_OFIMAEnterprise..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(1,'NOMPL','eNom - Generar',1,'','','NOM_eNomV10','Generar','eNom.spx','(Todos)','','46','911','','eNom Generar',1,0)
		Else
			IF EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 92 and IDMENU='NOM_eNomConDIAN')
				UpDate CONTROL_OFIMAEnterprise..MTMENU 
				Set POSMENU = 912
				WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 92 and IDMENU='NOM_eNomConDIAN'
			Else
				UpDate CONTROL_OFIMAEnterprise..MTMENU 
				Set TITULBOTON='eNom Generar'
				,NOMBREOPC='Generar'
				,DETALLE='eNom - Generar' 
				,POSMENU = 912
				Where CODPROGRAM='NOMPL' and POSMENU='911' 

		IF not EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 912)
			insert into CONTROL_OFIMAEnterprise..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(1,'NOMPL','eNom - Conceptos DIAN',1,'','','NOM_eNomConDIAN','Conceptos DIAN','EJECUTARREPORTE.SPX WITH "MAESTRO DE CONCEPTOS DIAN','(Todos)','','','912','','',1,0)
		Else
			IF EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 93 and IDMENU='NOM_eNomDocAju')
				UpDate CONTROL_OFIMAEnterprise..MTMENU 
				Set POSMENU = 913
				WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 93 and IDMENU='NOM_eNomDocAju'
			Else
				UpDate CONTROL_OFIMAEnterprise..MTMENU 
				Set TITULBOTON=''
				,NOMBREOPC='Conceptos DIAN'
				,DETALLE='eNom - Conceptos DIAN'
				,NOMBREPRG='EJECUTARREPORTE.SPX WITH "MAESTRO DE CONCEPTOS DIAN"'
				,POSMENU = 913
				WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 912

		IF not EXISTS(SELECT * FROM CONTROL_OFIMAEnterprise..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 913)
			insert into CONTROL_OFIMAEnterprise..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(1,'NOMPL','eNom - Documentos Ajuste',1,'','','NOM_eNomDocAju','Documentos Ajuste','eNom_Doc.spx','(Todos)','','','913','','',1,1)
		Else
			UpDate CONTROL_OFIMAEnterprise..MTMENU 
			Set TITULBOTON=''
			,NOMBREOPC='Documentos Ajuste'
			,DETALLE='eNom - Documentos Ajuste'
			,NOMBREPRG='eNom_Doc.spx'
			,IMRC=1
			WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 913
		update CONTROL_OFIMAEnterprise..CAMPOOFIMA Set Longitud=100 From CONTROL_OFIMAEnterprise..CAMPOOFIMA
			inner join CONTROL_OFIMAEnterprise..TABLAOFIMA on CAMPOOFIMA.idTabla = TABLAOFIMA.idTabla 
		Where upper(NombreCampo)='MEUUID' and Upper(NombreTabla)='MTLIQNOM' and Longitud<>100 
	End
	Else
	Begin
		IF not EXISTS(SELECT * FROM CONTROL_OFIMA2015_01..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 9)
			insert into CONTROL_OFIMA2015_01..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(0, 'NOMPL','Nomina Electronica',0,'','','NOM_eNom','eNom','','(Todos)','','','9','','eNom',1,0)
		IF not EXISTS(SELECT * FROM CONTROL_OFIMA2015_01..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 91)
			insert into CONTROL_OFIMA2015_01..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(1,'NOMPL','eNom - Generar',1,'','','NOM_eNomV10','Generar','eNom.spx','(Todos)','','46','91','','eNom Generar',1,0)
		Else
			UpDate CONTROL_OFIMA2015_01..MTMENU 
			Set TITULBOTON='eNom Generar'
			,NOMBREOPC='Generar'
			,DETALLE='eNom - Generar' 
			Where CODPROGRAM='NOMPL' and POSMENU='91' 

		IF not EXISTS(SELECT * FROM CONTROL_OFIMA2015_01..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 92)
			insert into CONTROL_OFIMA2015_01..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(1,'NOMPL','eNom - Conceptos DIAN',1,'','','NOM_eNomConDIAN','Conceptos DIAN','eNom.spx','(Todos)','','','92','','',1,0)
		Else
			UpDate CONTROL_OFIMA2015_01..MTMENU 
			Set TITULBOTON=''
			,NOMBREOPC='Conceptos DIAN'
			,DETALLE='eNom - Conceptos DIAN'
			,NOMBREPRG='EJECUTARREPORTE.SPX WITH "MAESTRO DE CONCEPTOS DIAN"'
			WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 92

		IF not EXISTS(SELECT * FROM CONTROL_OFIMA2015_01..MTMENU WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 93)
			insert into CONTROL_OFIMA2015_01..MTMENU
			(BOTON, CODPROGRAM, DETALLE, EJECUTA, GRUPO, ICONO, IDMENU, NOMBREOPC, NOMBREPRG, PAIS, PARAMETRO, POSBOTON, POSMENU, TECLARAPID, TITULBOTON, CODNIVEL, IMRC)
			Values(1,'NOMPL','eNom - Documentos Ajuste',1,'','','NOM_eNomDocAju','Documentos Ajuste','eNom_Doc.spx','(Todos)','','','93','','',1,0)
		Else
			UpDate CONTROL_OFIMA2015_01..MTMENU 
			Set TITULBOTON=''
			,NOMBREOPC='Documentos Ajuste'
			,DETALLE='eNom - Documentos Ajuste'
			,NOMBREPRG='eNom_Doc.spx'
			,IMRC=1
			WHERE CODPROGRAM = 'NOMPL' AND POSMENU = 933
		update CONTROL_OFIMA2015_01..CAMPOOFIMA Set Longitud=100 From CONTROL_OFIMA2015_01..CAMPOOFIMA
			inner join CONTROL_OFIMA2015_01..TABLAOFIMA on CAMPOOFIMA.idTabla = TABLAOFIMA.idTabla 
		Where upper(NombreCampo)='MEUUID' and Upper(NombreTabla)='MTLIQNOM' and Longitud<>100 
	End

	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTTIPCONTR' AND COLUMN_NAME='CODDIAN')
		ALTER TABLE dbo.MTTIPCONTR add CODDIAN CHAR(1) NOT NULL DEFAULT '0'
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMFCGEN')
		ALTER TABLE dbo.MTLIQNOM add ENOMFCGEN datetime NOT NULL DEFAULT ''
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMFCTRN')
		ALTER TABLE dbo.MTLIQNOM add ENOMFCTRN datetime NOT NULL DEFAULT ''
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMSTTRN')
		ALTER TABLE dbo.MTLIQNOM add ENOMSTTRN char(20) NOT NULL DEFAULT ''
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMVLDEV')
		ALTER TABLE dbo.MTLIQNOM add ENOMVLDEV Numeric(17,7) NOT NULL DEFAULT 0
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMVLDED')
		ALTER TABLE dbo.MTLIQNOM add ENOMVLDED Numeric(17,7) NOT NULL DEFAULT 0
	IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='MEUUID' AND COALESCE(CHARACTER_MAXIMUM_LENGTH,0)<>100)
		ALTER TABLE dbo.MTLIQNOM alter Column MEUUID CHAR(100) 
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMOBSER')
		ALTER TABLE dbo.MTLIQNOM add ENOMOBSER char(100) NOT NULL DEFAULT ''
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMRESUL')
		ALTER TABLE dbo.MTLIQNOM add ENOMRESUL text NOT NULL DEFAULT ''
	IF not EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MTLIQNOM' AND COLUMN_NAME='ENOMSELEC')
		ALTER TABLE dbo.MTLIQNOM add ENOMSELEC bit NOT NULL DEFAULT 1

	IF NOT EXISTS (SELECT NAME FROM SYSINDEXES WHERE NAME = 'IDX_ENOM_MTLIQNOM_NOMABIERTA') 
		CREATE NONCLUSTERED INDEX IDX_ENOM_MTLIQNOM_NOMABIERTA
		ON [dbo].[MTLIQNOM] ([NOMABIERTA])
		INCLUDE ([CODIGO],[FECFIN],[GRUPO],[MEUUID],[CONSECNE],[ENOMFCGEN],[ENOMFCTRN],[ENOMSTTRN])

	IF NOT EXISTS (SELECT NAME FROM SYSINDEXES WHERE NAME = 'IDX_ENOM_MTLIQNOM_NOMABIERTA2') 
		CREATE NONCLUSTERED INDEX IDX_ENOM_MTLIQNOM_NOMABIERTA2
		ON [dbo].[MTLIQNOM] ([NOMABIERTA])
		INCLUDE ([CODIGO],[DIASPAG],[FECFIN],[GRUPO],[MEUUID],[NOTA],[CONSECNE],[ENOMFCGEN],[ENOMFCTRN],[ENOMSTTRN],[ENOMVLDEV],[ENOMVLDED])

	IF NOT EXISTS (SELECT NAME FROM SYSINDEXES WHERE NAME = 'IDX_ENOM_MTLIQNOM_CONSECNE') 
		CREATE NONCLUSTERED INDEX IDX_ENOM_MTLIQNOM_CONSECNE
		ON [dbo].[MTLIQNOM] ([CONSECNE])
		INCLUDE ([FECHPAGO])

	IF NOT EXISTS (SELECT NAME FROM SYSINDEXES WHERE NAME = 'IDX_ENOM_MTLIQNOM_ORIGEN') 
		CREATE NONCLUSTERED INDEX IDX_ENOM_MTLIQNOM_ORIGEN
		ON [dbo].[MTLIQNOM] ([ORIGEN])
		INCLUDE ([FECFIN],[MEUUID],[CONSECNE],[ENOMFCGEN],[ENOMFCTRN],[ENOMSTTRN],[ENOMVLDEV],[ENOMVLDED])

	IF NOT EXISTS (SELECT NAME FROM SYSINDEXES WHERE NAME = 'IDX_ENOM_MTLIQNOM_NOMABIERTA3') 
		CREATE NONCLUSTERED INDEX IDX_ENOM_MTLIQNOM_NOMABIERTA3
		ON [dbo].[MTLIQNOM] ([NOMABIERTA])
		INCLUDE ([FECFIN],[FECINI],[GRUPO],[CODIGO],[MEUUID],[CONSECNE],[ENOMFCGEN],[ENOMFCTRN],[ENOMSTTRN],[ENOMSELEC])

	if exists(SELECT name FROM sys.all_objects Where name='eNom_Fec_txt') Drop Function eNom_Fec_txt
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Hora_txt') Drop Function eNom_Hora_txt
	if exists(SELECT name FROM sys.all_objects Where name='eNom_TieL') Drop Function eNom_TieL
	if exists(SELECT name FROM sys.all_objects Where name='eNom_PNm') Drop Function eNom_PNm
	if exists(SELECT name FROM sys.all_objects Where name='eNom_PorCes') Drop Function eNom_PorCes
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Por') Drop Function eNom_Por
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Fec_DT') Drop Function eNom_Fec_DT
	if exists(SELECT name FROM sys.all_objects Where name='eNom_MTG') Drop View eNom_MTG
	if exists(SELECT name FROM sys.all_objects Where name='eNom_SPConsec') Drop Procedure eNom_SPConsec
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Tra') Drop View eNom_Tra
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Enc') Drop View eNom_Enc
	if exists(SELECT name FROM sys.all_objects Where name='eNom_TRMas') Drop View eNom_TRMas
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Enc2') Drop View eNom_Enc2
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Mov') Drop View eNom_Mov
	if exists(SELECT name FROM sys.all_objects Where name='eNom_FPg') Drop View eNom_FPg
	if exists(SELECT name FROM sys.all_objects Where name='eNom_XLS') Drop View eNom_XLS
	if exists(SELECT name FROM sys.all_objects Where name='eNom_TM') Drop Procedure eNom_TM
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Mas') Drop View eNom_Mas
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Ext') Drop View eNom_Ext
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Inc') Drop View eNom_Inc
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Vac') Drop View eNom_Vac
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Lic') Drop View eNom_Lic
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Aus') Drop View eNom_Aus
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Via') Drop View eNom_Via
	if exists(SELECT name FROM sys.all_objects Where name='eNom_Otr') Drop View eNom_Otr
	
	Declare @wCodEmp VarChar(max)
	SELECT top 1 @wCodEmp=CODEMPRESA FROM MTGLOBAL
	Delete MTGLOBAL where CAMPO in('EFACCLTC','EFACIDEN','EFACPIN','EFACSW','EFACTSTSETID','ENOM15VP','ENOM22TDC')

	UPDATE MTGLOBAL SET DESCRIPCIO = 'eFac - Identificador del Set de Pruebas', MEMO = 'eFac - Identificador del Set de Pruebas' 
		where campo='EFAC16STID' and DESCRIPCIO != 'eFac - Identificador del Set de Pruebas'                  
	UPDATE MTGLOBAL SET DESCRIPCIO = 'eFac - Identificador del Software Propio', MEMO = 'eFac - Identificador del Software Propio' 
		where campo='EFAC17IDEN' and DESCRIPCIO != 'eFac - Identificador del Software Propio'
	UPDATE MTGLOBAL SET DESCRIPCIO = 'eFac - Nombre del Software Propio', MEMO = 'eFac - Nombre del Software Propio' 
		where campo='EFAC18SW' and DESCRIPCIO != 'eFac - Nombre del Software Propio'
	UPDATE MTGLOBAL SET DESCRIPCIO = 'eFac - PIN del Software Propio', MEMO = 'eFac - PIN del Software Propio' 
		where campo='EFAC19PIN' and DESCRIPCIO != 'eFac - PIN del Software Propio'
	UPDATE MTGLOBAL SET DESCRIPCIO = 'eFac - email de Facturación (CCo)', MEMO = 'eFac - email de Facturación (CCo)' 
		where campo='EFAC20FAC' and DESCRIPCIO != 'eFac - email de Facturación (CCo)'
	UPDATE MTGLOBAL SET DESCRIPCIO = 'eFac - Clave Técnica', MEMO = 'eFac - Clave Técnica' 
		where campo='EFAC21CLV' and DESCRIPCIO != 'eFac - Clave Técnica'

	UPDATE MTGLOBAL SET NOMINA=1, DESCRIPCIO = REPLACE(descripcio,'eFac - ','eFac/eNom - '), 
	memo = rtrim(descripcio) + CHAR(13) + CHAR(10) + CHAR(13) + REPLACE(rtrim(descripcio),'eFac - ','eNom - ')
	WHERE NOMINA=0 and CAMPO like 'EFAC%' and 
		CAMPO not in('EFAC12EML','EFAC13EST','EFAC142242','EFAC15VP','EFAC16STID','EFAC17IDEN','EFAC18SW','EFAC19PIN','EFAC20FAC','EFAC21CLV','EFAC22TDC','EFAC31AT1_8')

	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM12EML')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM12EML', @wCodEmp, 1, 'eNom - email Empleador', 1, 0, 
			'eNom - email Empleador', 1, 1, 'Caracter', 'enom@pcgc.com.co')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM13AMB')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM13AMB', @wCodEmp, 1, 'eNom - Ambiente de Destino del Documento (1-Pro/2-Pru)', 1, 0, 
			'eNom - Ambiente de Destino del Documento (1-Producción/2-Pruebas)', 1, 1, 'Caracter', '2')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM14V1_0')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM14V1_0', @wCodEmp, 1, 'eNom - Fecha Inicio nómina electrónica Anexo Técnico Ver 1.0', 1, 0, 
			'eNom - Fecha Inicio nómina electrónica Anexo Técnico Ver 1.0', 1, 1, 'Fecha', '2021-12-31')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM15SETP')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM15SETP', @wCodEmp, 1, 'eNom - Fecha Inicio nómina electrónica SET de Pruebas', 1, 0, 
			'eNom - Fecha Inicio nómina electrónica SET de Pruebas', 1, 1, 'Fecha', '2021-12-31')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM16STID')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM16STID', @wCodEmp, 1, 'eNom - Identificador del Set de Pruebas', 1, 0, 
			'eNom - Identificador del Set de Pruebas', 1, 1, 'Caracter', '')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM17IDEN')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM17IDEN', @wCodEmp, 1, 'eNom - Identificador del Software Propio', 1, 0, 
			'eNom - Identificador del Software Propio', 1, 1, 'Caracter', '')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM18SW')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM18SW', @wCodEmp, 1, 'eNom - Nombre del Software Propio', 1, 0, 
			'eNom - Nombre del Software Propio', 1, 1, 'Caracter', '')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM19PIN')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM19PIN', @wCodEmp, 1, 'eNom - PIN del Software Propio', 1, 0, 
			'eNom - PIN del Software Propio', 1, 1, 'Caracter', '')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM20FAC')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM20FAC', @wCodEmp, 1, 'eNom - email de nomina (CCo)', 1, 0, 
			'eNom - email de nomina (CCo)', 1, 1, 'Caracter', 'enom@pcgc.com.co')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM21CLV')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM21CLV', @wCodEmp, 1, 'eNom - Clave Técnica', 1, 0, 
			'eNom - Clave Técnica', 1, 1, 'Caracter', '')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC24CMUN')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC24CMUN', @wCodEmp, 1, 'eFac - Código Municipio', 1, 0, 
			'eFac - Código Municipio', 1, 1, 'Caracter', '11001')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC25NMUN')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC25NMUN', @wCodEmp, 1, 'eFac - Nombre Municipio', 1, 0, 
			'eFac - Nombre Municipio', 1, 1, 'Caracter', 'BOGOTÁ D.C.')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC26CPAI')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC26CPAI', @wCodEmp, 1, 'eFac - Código Pais', 1, 0, 
			'eFac - Código Pais', 1, 1, 'Caracter', 'CO')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC27NPAI')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC27NPAI', @wCodEmp, 1, 'eFac - Nombre Pais', 1, 0, 
			'eFac - Nombre Pais', 1, 1, 'Caracter', 'Colombia')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC28CDPT')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC28CDPT', @wCodEmp, 1, 'eFac - Código Departamento', 1, 0, 
			'eFac - Código Departamento', 1, 1, 'Caracter', '11')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC29NDPT')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC29NDPT', @wCodEmp, 1, 'eFac - Nombre Departamento', 1, 0, 
			'eFac - Nombre Departamento', 1, 1, 'Caracter', 'BOGOTÁ D.C.')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='EFAC30IDI')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('EFAC30IDI', @wCodEmp, 1, 'eFac - Código Idioma', 1, 0, 
			'eFac - Código Idioma', 1, 1, 'Caracter', 'es')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM31CNE')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM31CNE', @wCodEmp, 1, 'eNom - Código del consecutivo para nómina electrónica', 1, 0, 
			'eNom - Código del consecutivo para documento soporte de pago nómina electrónica', 1, 1, 'Caracter', 'NE001')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM32CAN')=0
		Delete MTGLOBAL WHERE CAMPO='ENOM32CAN'
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM32CNA')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM32CNA', @wCodEmp, 1, 'eNom - Código del consecutivo para ajuste a nómina elec.', 1, 0, 
			'eNom - Código del consecutivo para documentos de ajuste a la nómina electrónica', 1, 1, 'Caracter', 'NE002')
	If (SELECT Count(*) FROM MTGLOBAL WHERE CAMPO='ENOM50')=0
		Insert into MTGlobal (CAMPO, CODEMPRESA, COMUN, DESCRIPCIO, ESEMPRESA, FACTURAS, memo, NOMINA, TECNICO, tipo, valor)
		Values ('ENOM50', @wCodEmp, 1, 'eNom - Ultima fecha de actulización script', 1, 0, 
			'eNom - Ultima fecha de actulización script de nómina electrónica', 1, 1, 'Caracter', @eNom50)

	UPDATE MTGLOBAL SET Valor=@eNom50 where CAMPO='ENOM50'
	UPDATE MTGLOBAL SET FACTURAS=1, DESCRIPCIO = REPLACE(descripcio,'eFac - ','eFac/eNom - '), 
	memo = rtrim(descripcio) + CHAR(13) + CHAR(10) + CHAR(13) + REPLACE(rtrim(descripcio),'eFac - ','eNom - ')
	WHERE FACTURAS=0 and CAMPO in('EFAC24CMUN','EFAC25NMUN','EFAC26CPAI','EFAC27NPAI','EFAC28CDPT','EFAC29NDPT','EFAC30IDI')
	--update MTGLOBAL SET valor='es' where campo='EFAC30IDI'

Set nocount off;
if exists(SELECT name FROM sys.all_objects Where name='eNom_Fec_txt') Drop Function eNom_Fec_txt
Print 'Function eNom_Fec_txt'
Go
Create Function dbo.eNom_Fec_txt(@pFecha datetime)
returns varchar(max)
as
Begin
	Declare @wFecha as varchar(max)
	If cast(@pFecha as date)=cast('' as date)
		Set @wFecha=''
	Else
	Begin
		Set @wFecha=Cast(year(@pFecha) as nvarchar(4))+'-'
		If Month(@pFecha) < 10
			Set @wFecha=@wFecha+'0'
		Set @wFecha=@wFecha+Cast(Month(@pFecha) as nvarchar(2))+'-'
		If Day(@pFecha) < 10
			Set @wFecha=@wFecha+'0'
		Set @wFecha=@wFecha+Cast(Day(@pFecha) as nvarchar(2))
	End
	return @wFecha
End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Hora_txt') Drop Function eNom_Hora_txt
Print 'Function eNom_Hora_txt'
Go
--Select dbo.eNom_Hora_txt(getdate())
Create Function dbo.eNom_Hora_txt(@pFecha datetime)
returns varchar(max)
as
Begin
	Declare @wHora as varchar(max)=''
	Declare @Wval as Integer

	Set @Wval=datepart(hour, @pFecha)
	IF @Wval<10 Set @wHora=@wHora+'0'
	Set @wHora=@wHora+cast(@Wval as varchar(2))+':'

	Set @Wval =datepart(minute, @pFecha)
	IF @Wval<10 Set @wHora=@wHora+'0'
	Set @wHora=@wHora+cast(@Wval as varchar(2))+':'

	Set @Wval =datepart(second, @pFecha)
	IF @Wval<10 Set @wHora=@wHora+'0'
	Set @wHora=@wHora+cast(@Wval as varchar(2))+'-05:00'
	return @wHora
End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_TieL') Drop Function eNom_TieL
print 'Function eNom_TieL'
Go
Create Function dbo.eNom_TieL(@pFecIni datetime, @pFecFin datetime)
returns int
Begin
	Declare @wRet as int
	Declare @wAños int, @wMeses int, @wDias int
	Set @wAños = year(@pFecFin)-year(@pFecIni)
	Set @wMeses = Month(@pFecFin)-Month(@pFecIni)
	If day(@pFecIni)=31
		Set @pFecIni=@pFecIni-1
	If day(@pFecFin)=31
		Set @pFecFin=@pFecFin-1
	Set @wDias = day(@pFecFin)-day(@pFecIni)-3

	Set @wRet = (@wAños * 360)+(@wMeses * 30)+(@wDias)
	return @wRet
End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_DiaPr') Drop Function eNom_DiaPr
print 'Function eNom_DiaPr'
Go
--Numero de dias para las primas
Create Function dbo.eNom_DiaPr(@pCodigo Char(15), @pFecha datetime)
returns int
Begin
	Declare @wRet as int
	Declare @pFecIni datetime, @pFecFin datetime, @wDias int
	Select @pFecIni=FecIni, @pFecFin=FecRetiro From MtEmplea where codigo=@pCodigo
	
	If Year(@pFecha) <> Year(@pFecIni)
		Set @pFecIni=@pFecha

	If Year(@pFecha) <> Year(@pFecFin)
		Set @pFecFin=@pFecha

	Set @wRet = 180--dbo.eNom_TieL(@pFecIni, @pFecFin)
	return @wRet
End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_PNm') Drop Function eNom_PNm
Print 'Function eNom_PNm'
Go
Create Function dbo.eNom_PNm(@pGrupo Char(5), @pFecFin datetime)
returns Char(1)
Begin
	Declare @wRet as Char(1)='6'
	Declare @wVal as Integer

	Select @wVal=isnull(datediff(DD,FecIni,FecFin)+1,0)from mtcalend where grupo=@pGrupo and @pFecFin between FecIni and FecFin

	If isnull(@wVal,0)=0 Select @wVal=round(isnull(AVG(DIASTRAB),0),0) From MtEmplea where grupo=@pGrupo
	If @pGrupo=0 Set @wVal=60

	If @wVal=8 Set @wRet='1'
	Else If @wVal=10 Set @wRet='2'
	Else If @wVal=14 Set @wRet='3'
	Else If @wVal=15 Set @wRet='4'
	Else If @wVal>27 and @wVal<32 Set @wRet='5'
	Else Set @wRet = '6'

	return @wRet
End
Go

if exists(SELECT name FROM sys.all_objects Where name='eNom_Por') Drop Function eNom_Por
Print 'Function eNom_Por'
Go
Create Function eNom_Por(@pNroDcto Char(10), @pConcep Char(5))
returns Numeric(5,2)
As
Begin
	Declare @wRet Numeric(5,2)=0, @wCes Numeric(17,7), @wVal Numeric(17,7), @wInt Numeric(17,7)
	if @pConcep in('117')
	Begin
		Select @wCes=Sum(valor)
		from MtliqNom 
			inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
			inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
			inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
		where ConsecNE=@pNroDcto and MTConceptosDIAN.Codigo in('116')

		Select @wInt=Sum(valor)
		from MtliqNom 
			inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
			inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
			inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
		where ConsecNE=@pNroDcto and MTConceptosDIAN.Codigo in('117')

		If isnull(@wInt,0)!=0 and isnull(@wCes,0)!=0
			Set @wRet=round(@wInt*100/@wCes,2)
	End
	if @pConcep in('203')
	Begin
		Select @wVal=Sum(valor)
		from MtliqNom 
			inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
			inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
			inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
		where ConsecNE=@pNroDcto and MTConceptosDIAN.Codigo in('203')

		If isnull(@wVal,0)!=0
			Set @wRet=0.5
	End
	if @pConcep in('204')
	Begin
		Select @wVal=Sum(valor)
		from MtliqNom 
			inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
			inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
			inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
		where ConsecNE=@pNroDcto and MTConceptosDIAN.Codigo in('204')

		If isnull(@wVal,0)!=0
			Set @wRet=1
	End

	If @pConcep in('105','106','107','108','109','110','111')
	Begin
		Set @wRet=Case @pConcep 
			when '105' then 25
			when '106' then 75
			when '107' then 35
			when '108' then 100
			when '109' then 75
			when '110' then 150
			when '111' then 110
		else 0 end 
	End

	Return @wRet

End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Fec_DT') Drop Function eNom_Fec_DT
Print 'Function eNom_Fec_DT'
Go
Create Function eNom_Fec_DT(@pFecha VarChar(100))
returns datetime
As
Begin
	Declare @wFecha DateTime
	Set @wFecha=Cast(Cast(upper(isnull(LTRIM(RTRIM(@pFecha)),''))as date)as DateTime)

	Return @wFecha 
End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_MTG') Drop View eNom_MTG
Print 'View eNom_MTG'
Go
--Select * From eNom_MTG 
--Select * From eNom_Enc
Create VIEW dbo.eNom_MTG 
AS 
Select *, 'Generado por la solución de software propio '+eNom18+' de: '+eNom05	+' NIT: '+NITCia eNomImp, 
	case when eNom13='2' then dbo.eNom_Fec_DT(eNom15) else dbo.eNom_Fec_DT(eNom14) end eNomFec,
	case when charindex('-',NITCia) > 1 then substring(NITCia,1,charindex('-',NITCia)-1) else NITCia end eNomNIT, 
	case when charindex('-',NITCia)> 1 then substring(NITCia,charindex('-',NITCia)+1,1) else '' end eNomDgV,
	(Select Top 1 TipoDcto From consecut where origen='NOM' and codigocons=eNom31) eNomTDNE, 
	(Select Top 1 TipoDcto From consecut where origen='NOM' and codigocons=eNom32) eNomTDAN
From (Select (SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC00EMP')eNom00,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC01ALS')eNom01,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC02SRV')eNom02,
	(SELECT TOP 1 (isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC03CLV')eNom03,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC04NIT')eNom04,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC05NOM')eNom05,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC06DIR')eNom06,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC07TEL')eNom07,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC08MAT')eNom08,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC09AEF')eNom09,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC10CP')eNom10,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC11RES')eNom11,
/*	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC12EML')eFac12,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC13EST')eFac13,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC142242')eFac14,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC15VP')eFac15,
	(SELECT TOP 1 (isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC16STID')eFac16,
	(SELECT TOP 1 (isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC17IDEN')eFac17,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC18SW')eFac18,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC19PIN')eFac19,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC20FAC')eFac20,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC21CLV')eFac21,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC22TDC')eFac22,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC31AT1_8')eFac31,
*/
--Inicio Variables globales nuevas
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM12EML')eNom12,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM13AMB')eNom13,
	dbo.eNom_Fec_DT((SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM14V1_0'))eNom14,
	dbo.eNom_Fec_DT((SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM15SETP'))eNom15,
	(SELECT TOP 1 (isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM16STID')eNom16,
	(SELECT TOP 1 (isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM17IDEN')eNom17,
	(SELECT TOP 1 (isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM18SW')eNom18,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM19PIN')eNom19,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM20FAC')eNom20,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM21CLV')eNom21,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM22TDC')eNom22,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC23FDG')eNom23,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC24CMUN')eNom24,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC25NMUN')eNom25,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC26CPAI')eNom26,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC27NPAI')eNom27,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC28CDPT')eNom28,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC29NDPT')eNom29,
	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC30IDI')eNom30,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM31CNE')eNom31,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='ENOM32CNA')eNom32,
	(SELECT TOP 1 upper(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='NITCIA')NITCia,
	(SELECT TOP 1 isnull(cast((cast(VALOR as numeric(6,2))-0.5)/3 as numeric(6,2)),0) FROM MTGLOBAL WHERE CAMPO='PORCENTSAL')PorSYP
	) MTG
--	(SELECT TOP 1 lower(isnull(LTRIM(RTRIM(VALOR)),''))FROM MTGLOBAL WHERE CAMPO='EFAC31AT1_8')eFac31,
GO

if exists(SELECT name FROM sys.all_objects Where name='eNom_SPConsec') Drop Procedure eNom_SPConsec
Print 'Procedure eNom_SPConsec'
Go
--execute dbo.eNom_SPConsec 202106
Create Procedure eNom_SPConsec(@pPer Integer)
As
Begin
	--MtGlobal
	--Ini
	/*
	SELECT campo, valor, tipo, descripcio, memo --REPLACE(descripcio,'eFac - ','eFac/eNom - '), rtrim(descripcio) + CHAR(13) + CHAR(10) + CHAR(13) + REPLACE(rtrim(descripcio),'eFac - ','eNom - ') 
	FROM MTGLOBAL WHERE CAMPO like 'EFAC%' or CAMPO like 'ENOM%' 
	*/
	--Fin
	--Consec
	--Ini	
	Declare @wAño Int=@pPer/100
	Declare @wMes Int=@pPer%100
	Declare @wTDNE Char(2), @wTipoDcto Char(2), @wNroDcto Char(20), @wNIT Char(20)
	Declare @wConsecut Int, @wNITAnt Char(20)='', @eNomFec datetime, @eNomPre datetime=Getdate()
	Declare @wTotDed Numeric(17,7)=0, @wTotDev Numeric(17,7)=0

	Select @eNomFec=eNomFec, @wTDNE=eNomTDNE from eNom_MTG 

	Update Consecut Set consecini=Consecut From Consecut Where Origen='NOM' and codigocons=(Select Top 1 eNom31 From eNom_MTG)
		and consecini=0

	Select Top 1 @wConsecut=Consecini From Consecut Where Origen='NOM' and codigocons=(Select Top 1 eNom31 From eNom_MTG)

	Select Top 1 @wConsecut=ConsecNE
		From MTLiqNom 
		Where len(meuuid)='' and NomAbierta=0 and ConsecNE!=0 and ENOMSTTRN<>'En Construcción' and Cast(ConsecNE as integer)>@wConsecut
		Order by Cast(ConsecNE as integer) desc

	If isnull(@wConsecut,0) = 0 
		Select Top 1 @wConsecut=consecini From Consecut Where Origen='NOM' and Tipodcto=@wTDNE
		
	Update Consecut Set Consecut=@wConsecut From Consecut Where Origen='NOM' and Tipodcto=@wTDNE
	
	--Update Consecut Set Consecut=5025, consecini=5025 From Consecut Where Origen='NOM' and Tipodcto='NE'
	--Select * from Consecut Where Origen='NOM' and Tipodcto='NE'
	--UpDate MTLiqNom Set Meuuid='xxx', menoCerSAT='Aprobado' Where Year(MTLiqNom.FecFin)=2021 and Month(MTLiqNom.FecFin)=06
	UpDate MTLiqNom Set ConsecNE=0, eNomFcGen='1900-01-01', eNomStTrn='', eNomSelec=1, eNomFcTrn='1900-01-01'
	Where len(meuuid)='' and NomAbierta=0 and ConsecNE!=0 and eNomStTrn not in('Aprobado','Notificación') and 
		(((Year(MTLiqNom.FecFin)=@wAño and Month(MTLiqNom.FecFin)>=@wMes) or Year(MTLiqNom.FecFin)>@wAño))

	Declare cDctos Cursor For 
	Select TipoDcto, NroDcto, NITCausant
			From MTLiqNom inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
			Where Year(MTLiqNom.FecFin)=@wAño and Month(MTLiqNom.FecFin)=@wMes and NomAbierta=0 and ConsecNE=0 and meuuid =''
				and len(MtEmplea.NITCAUSANT) > 5
			Order by ltrim(rtrim(Apellido)), ltrim(rtrim(Apellido2)), ltrim(rtrim(Nombre)), ltrim(rtrim(Nombre2)), NroDcto

	Select @wConsecut=Consecut From Consecut Where Origen='NOM' and Tipodcto=@wTDNE

	If (Select Count(*) From MTLiqNom inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
			Where Year(MTLiqNom.FecFin)=@wAño and Month(MTLiqNom.FecFin)=@wMes and NomAbierta=0 and ConsecNE>@wConsecut) = 0 
	Begin
		Open cDctos
		Fetch Next From cDctos Into @wTipoDcto, @wNroDcto, @wNIT
		While @@FETCH_STATUS = 0 
		Begin
			If @wNIT != @wNITAnt
			Begin
				Set @wConsecut=@wConsecut+1
				Update Consecut Set Consecut=@wConsecut From Consecut Where Origen='NOM' and Tipodcto=@wTDNE
				Set @wNITAnt= @wNIT
			End
			UpDate MTLiqNom Set ConsecNE=@wConsecut, --MeFechaT=dbo.eNom_Fec_txt(getdate()), 
				eNomStTrn='En Construcción',
				eNomSelec=1,
				eNomFcGen=@eNomPre,
				eNomFcTrn='1900-01-01', 
				meuuid='',
				eNomObser='', 
				eNomResul=''
			Where TipoDcto=@wTipoDcto and NroDcto=@wNroDcto and Year(MTLiqNom.FecFin)=@wAño and Month(MTLiqNom.FecFin)=@wMes and NomAbierta=0

			Select @wTotDev=Sum(case when MTConceptosDIAN.Tipo='Devengado' then Abs(Valor) else 0 end),
				@wTotDed=Sum(case when MTConceptosDIAN.Tipo='Deducciones' then Abs(Valor) else 0 end)
			From MTLiqNom 
				inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
				inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
				inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
			Where MTLiqNom.TipoDcto=@wTipoDcto and MTLiqNom.NroDcto=@wNroDcto and MTLiqNom.ConsecNE=@wConsecut and 
				Year(MTLiqNom.FecFin)=@wAño and Month(MTLiqNom.FecFin)=@wMes and NomAbierta=0

			Set @wTotDev=IsNull(@wTotDev,0)
			Set @wTotDed=IsNull(@wTotDed,0)


			UpDate MTLiqNom Set ENOMVLDEV=@wTotDev, ENOMVLDED=@wTotDed
			From MTLiqNom 
			Where MTLiqNom.TipoDcto=@wTipoDcto and MTLiqNom.NroDcto=@wNroDcto and MTLiqNom.ConsecNE=@wConsecut and 
				Year(MTLiqNom.FecFin)=@wAño and Month(MTLiqNom.FecFin)=@wMes and NomAbierta=0

			Fetch Next From cDctos Into @wTipoDcto, @wNroDcto, @wNIT
		End

		Close cDctos
	End
	DeAllocate cDctos
	--Fin
End
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Tra') Drop View eNom_Tra
Print 'View eNom_Tra'
Go
--Select * from MTEmplea where activo=0
Create View eNom_Tra
As
Select 
	--Inicio Periodo
		dbo.eNom_Fec_Txt(fecing) as FecIng
		, dbo.eNom_Fec_Txt(case when activo=0 then '' else fecretiro end) as FecRet
		, dbo.eNom_TieL(fecing,getdate()) as TieLab
		, MedioPag as PagTra
	--Final Periodo 
	--Inicio Sencuencia
		, '' as PFJTra
	--Final Sencuencia 
		--'" Apellidos y Nombres="'+
		, ltrim(rtrim(ltrim(rtrim(ltrim(rtrim(Apellido))))
			+ ' ' + ltrim(rtrim(ltrim(rtrim(Apellido2))))
			+ ' ' + ltrim(rtrim(ltrim(rtrim(MTEmplea.Nombre))))
			+ ' ' + ltrim(rtrim(ltrim(rtrim(Nombre2)))))) as ApeNom
	--Inicio Trabajador --'<Trabajador CodigoTrabajador="'+
		, ltrim(rtrim(MTEmplea.Codigo)) as CodTra
		--'" OtrosNombres="'+
		, ltrim(rtrim(ltrim(rtrim(Nombre2)))) as Nm2Tra
		--'" PrimerNombre="'+
		, ltrim(rtrim(ltrim(rtrim(MTEmplea.Nombre)))) as Nm1Tra
		--'" SegundoApellido="'+
		, ltrim(rtrim(ltrim(rtrim(Apellido2)))) as Ap2Tra
		--'" PrimerApellido="'+
		, ltrim(rtrim(ltrim(rtrim(Apellido)))) as Ap1Tra
		--'" Sueldo="'+
		, ValorHora*HorasMes as SueTra
		--'" TipoContrato="'+
		, ltrim(rtrim(CodDIAN)) as ConTra/*OJO DIAN*/
		--'" SalarioIntegral="'+
		, Case SalIntegr when 'S' then 'true' else 'false' end as IntTra
		--'" LugarTrabajoDireccion="'+
		, ltrim(rtrim(Direccion)) DirTra
		--'" LugarTrabajoMunicipioCiudad="'+
		, ltrim(rtrim(CDCIIU)) CiuTra
		--'" LugarTrabajoDepartamentoEstado="'+
		, substring(CDCIIU,1,2) DepTra
		--'" LugarTrabajoPais="'+
		, --ltrim(rtrim(PAIS)) 
		'CO' PaiTra
		--'" NumeroDocumento="'+
		, ltrim(rtrim(NITCausant)) as DocTra
		--'" TipoDocumento="'+
		--, ltrim(rtrim(TipDoc)) as TDCTra
		/*
		11-Registro civil
		12-Tarjeta de identidad
		13-Cédula de ciudadanía
		21-Tarjeta de extranjería
		22-Cédula de extranjería
		31-NIT
		41-Pasaporte
		42-Documento de identificación extranjero
		47-PEP
		50-NIT de otro país
		91-NUIP
		*/
		, ltrim(rtrim(Case TipoIdent
			when 'C' then '13'
			when 'T' then '12'
			when 'N' then '31'
			when 'E' then '22'
			when 'P' then '41'
			when 'U' then '91'
			when 'S' then '47'
		Else '0' end)) as TDCTra
		--'" AltoRiesgoPension="'+
		, Case 'N' when 'S' then 'true' else 'false' end as ARPTra
		/*OJO NO SE CUAL CAMPO ES Si el trabajador desarrollo durante el presente periodo 
		alguna de las actividades descritas en el Decreto 2090 de 2003, 
		o la norma que lo modifique, adicione o sustituya.*/
		--'" SubTipoTrabajador="'+
		, ltrim(rtrim(case when SubTipoCot='1' then '01' else '00' end)) as STCTra
		--'" TipoTrabajador="'+
		, ltrim(rtrim(TipoCotiza)) as TipTra
		--'"/>' as eNom_Tra
	--Fin Trabajador
		, Grupo
		, DIASLIQ 
		, DIASTRAB
		, MedioPag 
		, MTBanPro.Nombre BanEmp
		, CtaCte CtaEmp
		, Case When TipoCuenta=0 then 'Ahorros' else 'Corriente' end TCtaEmp
	--Select * 
	From MTEmplea
		inner join (Select max(codigo) cod from mtemplea group by NITCausant) emp on cod=codigo 
		left Join MTBanPro on BancoEmp=MTBanPro.Banco
		left Join MtTipContr on CodTipCont=MtTipContr.Codigo
	Where MTEmplea.Codigo<>'0'
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Enc') Drop View eNom_Enc
Print 'View eNom_Enc'
Go
Create View eNom_Enc
As
Select 'NOM' Origen, eNomTDNE TipoDcto, NroDcto,
	Enc.ConsecNE, dbo.eNom_Fec_Txt(eNomFcGen) FecGen, dbo.eNom_Hora_txt(eNomFcGen) HorGen, Enc.FecLIni, Enc.FecLFin, Enc.FecIn, Enc.Fecha, Enc.meuuid, 
	eNomStTrn Estado, 
	Enc.Periodo, 
	case len(Enc.Nota) when 0 then eNomImp else Enc.Nota end Nota,
	PerNom,
	DiasPag,
	eNom_MTG.*,
	eNom_TRA.*,
	eNomFcGen,
	eNomFcTrn,
	eNomStTrn,
	eNomObser,
	eNomResul,
	eNomSelec,
	eNomVlDev,  
	eNomVlDed,
	eNomVlTot,  
	QR = Case eNom13 when 2 then 'https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey='
		else 'https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=' end+meuuid , 
	--NumNE + FecNE + HorNE + ValDev + ValDed + ValTolNE + NitNE + DocEmp + TipoXML + Software-Pin +TipAmb
	CUNE=rtrim(NroDcto)
		+dbo.eNom_Fec_Txt(eNomFcGen)
		+dbo.eNom_Hora_txt(eNomFcGen)
		+cast(cast(eNomVlDev as numeric(17,2))as varchar(20))--ValDev 
		+cast(cast(eNomVlDed as numeric(17,2))as varchar(20))--ValDed 
		+cast(cast(eNomVlTot as numeric(17,2))as varchar(20)) --ValTolNE 
		+eNomNIT --NitNE 
		+DocTra --DocEmp 
		+'102' --TipoXML --102-Doc soporte de pago;
		+eNom19 --Software-Pin 
		+cast(eNom13 as char(1)), --TipAmb
	--NumNE + FecNE + HorNE + ValDev + ValDed + ValTolNE + NitNE + DocEmp + TipoXML + Software-Pin +TipAmb
	CUDE=rtrim(NroDcto)
		+dbo.eNom_Fec_Txt(eNomFcGen)
		+dbo.eNom_Hora_txt(eNomFcGen)
		+cast(cast(eNomVlDev as numeric(17,2))as varchar(20))--ValDev 
		+cast(cast(eNomVlDed as numeric(17,2))as varchar(20))--ValDed 
		+cast(cast(eNomVlTot as numeric(17,2))as varchar(20)) --ValTolNE 
		+eNomNIT --NitNE 
		+DocTra --DocEmp 
		+'103' --TipoXML --103-Nota de Ajuste;
		+eNom19 --Software-Pin 
		+cast(eNom13 as char(1)), --TipAmb
	Moneda='COP'
		
From (Select ConsecNE, Cast(ConsecNE as Char(10)) NroDcto, 
		NITCausant Codigo,
		eNomFcGen, 
		eNomFcTrn, 
		dbo.eNom_Fec_Txt(Min(MTLiqNom.FecIni)) FecLIni, 
		dbo.eNom_Fec_Txt(Max(MTLiqNom.FecFin)) FecLFin, 
		dbo.eNom_PNm(max(MTLiqNom.Grupo), Max(MTLiqNom.FecFin)) PerNom,
		--month(Max(MTLiqNom.FecFin)) PerNom,
		eNomSelec,
		Max(eNomObser) eNomObser,
		Max(Nota) Nota,
		Max(substring(eNomResul,1,250)) eNomResul,
		Sum(eNomVlDev) eNomVlDev,
		Sum(eNomVlDed) eNomVlDed,
		round(Sum(eNomVlDev-eNomVlDed),2) eNomVlTot,
		Sum(DiasPag) DiasPag,
		Max(MTLiqNom.FecFin) Fecha,
		Min(MTLiqNom.FecIni) FecIn,
		meuuid, 
		eNomStTrn, 
		(Year(MTLiqNom.FecFin)*100)+Month(MTLiqNom.FecFin) Periodo
	--Select * 
	From MTLiqNom inner join MTEmplea on MTLiqNom.Codigo = MTEmplea.Codigo
	Where NomAbierta=0 Group by ConsecNE, eNomSelec, --Grupo, 
		eNomFcTrn, eNomFcGen, eNomStTrn, meuuid, NITCausant, (Year(MTLiqNom.FecFin)*100)+Month(MTLiqNom.FecFin)) Enc, 
		eNom_MTG, eNom_TRA 
	Where FecLFin >= dbo.eNom_Fec_Txt(eNomFec) and Enc.codigo = DocTra
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_TRMas') Drop View eNom_TRMas
Print 'View eNom_TRMas'
Go
--SELECT * FROM eNom_TRMas
Create View eNom_TRMas
As
	Select Origen, TipoDcto, NroDcto, eNomFCGEN, eNomFCTRN, eNomSTTRN, eNomVLDEV,  eNomVLDED, MEUUID CUNE, Fecha FecFin, eNomFec,
		eNomTR=Cast(Case When eNomSTTRN = 'En Construcción' or Len(eNomSTTRN)=0 Then 0 Else 1 End as Bit)
	From eNom_Enc
	Where Origen='NOM' and Fecha >= eNomFec and ConsecNe!=0
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Enc2') Drop View eNom_Enc2
Print 'View eNom_Enc2'
Go
Create View eNom_Enc2
As
Select distinct eNomSelec, CAST(0 as int) nr, Tipodcto TDocNE, ConsecNE, DocTra, ApeNom, eNomFcGen FecGen, eNomFcTrn FecTrn, Periodo, Estado, eNomObser, eNomResul, QR QR_Link, MEUUID 
	From eNom_Enc
where len(DocTra)!=0
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Mov2') Drop View eNom_Mov2
Print 'View eNom_Mov2'
Go
/*
Select * from eNom_Mov2 where NroDcto='5005'
Select * from MTConceptosDIAN
*/
Create View eNom_Mov2
As
Select eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, eNom_Enc.ConsecNE, eNom_Enc.Periodo, eNom_Enc.Estado, eNom_Enc.DocTra, 
	MTConceptosDIAN.Codigo, MTConceptosDIAN.Descripcio, 
	case when MTConceptosDIAN.Codigo in ('125','126','207') then 
	upper(substring(MTConcep.Descripcio,1,1))+
	lower(substring(MTConcep.Descripcio,2,len(MTConcep.Descripcio))) else '' end Etiqueta, MTConceptosDIAN.Tipo,
	sum(Valor) Valor, avg(NroHoras) NroHoras
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE 
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
Where cast(MTLiqNom.ConsecNE as int)<>0 and Valor<>0 
Group by  eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, eNom_Enc.ConsecNE, eNom_Enc.Periodo, eNom_Enc.Estado, eNom_Enc.DocTra, 
	MTConceptosDIAN.Codigo, MTConceptosDIAN.Descripcio, MTConceptosDIAN.Tipo, MTConcep.Descripcio
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_Mov') Drop View eNom_Mov
Print 'View eNom_Mov'
Go
/*
Select * from eNom_Mov where NroDcto='5005'
Select * from MTConceptosDIAN
*/
Create View eNom_Mov
As
Select Origen, TipoDcto, NroDcto, ConsecNE, Periodo, Estado, DocTra, Codigo, Descripcio, Etiqueta, Tipo,
	Sum(case when Valor>0 then Valor else 0 end) Valor_DEV, 
	Sum(case when Valor<0 then Abs(Valor) else 0 end) Valor_DED,
	Sum(case when Codigo in('114','115') then 180 Else NroHoras/8 end) Dias,
	Sum(NroHoras) Horas,
	Sum(Abs(Valor)) Valor, ROW_NUMBER() OVER (Order by NroDcto, Codigo) as idmvtrade,
	Avg(dbo.eNom_Por(NroDcto,Codigo)) Porce
From eNom_Mov2 
Group by  Origen, TipoDcto, NroDcto, ConsecNE, Periodo, Estado, DocTra, Codigo, Descripcio, Etiqueta, Tipo
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_FPg') Drop View eNom_FPg
Print 'View eNom_FPg'
Go
Create View eNom_FPg
As
Select eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, eNom_Enc.ConsecNE, MTLiqNom.FechPago FecPag
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE
Where MTLiqNom.ConsecNE!=0
Group by eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, eNom_Enc.ConsecNE, MTLiqNom.FECHPAGO
Go
if exists(SELECT name FROM sys.all_objects Where name='eNom_XLS') Drop View eNom_XLS
Print 'View eNom_XLS'
Go
Create View eNom_XLS
As
Select eNom_Enc.TipoDcto eNomTDoc, eNom_Enc.NroDcto eNomNDoc, Periodo, DocTra, rtrim(ApeNom) ApeNom, eNom_Enc.Estado, 
	MTConceptosDIAN.Codigo CptoDIAN, 
	case MTConceptosDIAN.Codigo when '0' then MVLiqNom.Concep+'-'else''end + rtrim(MTConceptosDIAN.Descripcio) Descripcio, 
	MTConceptosDIAN.Tipo,
	Case Tipo When 'Deducciones' Then -1 Else 1 End * (Abs(Valor)) Valor, MTLiqNom.TipoDcto, MTLiqNom.NroDcto, 
	dbo.eNom_Fec_Txt(FecIni) FechaInicial, dbo.eNom_Fec_Txt(FecFin)FechaFinal, dbo.eNom_Fec_Txt(FechPago) FechaPago, 
	eNom_Enc.eNomFcGen FechaGen, eNom_Enc.eNomFcTrn FechaTrn, eNom_Enc.eNomObser Observa
From eNom_Enc
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE 
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
Where Valor<>0 and MTLiqNom.ConsecNE!=0
--Group by eNom_Enc2.ConsecNE, eNom_Enc2.Periodo, eNom_Enc2.CodEmp, eNom_Enc2.Estado, MTConceptosDIAN.Codigo, MTConceptosDIAN.Descripcio, MTConceptosDIAN.Etiqueta, MTConceptosDIAN.Tipo
Go

if exists(SELECT name FROM sys.all_objects Where name='eNom_TM') Drop Procedure eNom_TM
Print 'Procedure eNom_TM'
Go
/*
declare @wfec as datetime=getdate()
execute dbo.eNom_TM 'CUNE','NE','5005','e635fe7d2e95f9463cd7ee6be38d94fca534b5d17edabbda43fe4e6ba11456a553f9ba273a95ba2915a49977e764d60f',@wfec
*/
Create Procedure eNom_TM
(@pCampo varchar(max),@pTipDcto varchar(max),@NroDcto varchar(max),@pParam varchar(max),@pParam1 datetime)
As
Begin
	Set NOCOUNT ON 
	declare @wfl as Varchar(60)='',@wvl as Int=0

	If @pCampo='FECHA' and @pParam1>cast((SELECT TOP 1 LTRIM(RTRIM(VALOR))FROM MTGLOBAL WHERE CAMPO='eNom142242') as date)
	Begin
		UpDate MtLiqNom set eNomFcTrn=CAST(@pParam1 as datetime)
		where Origen='NOM' and TipoDcto=@pTipDcto and ConsecNE=@NroDcto
	End
	If @pCampo='CUNE' 
	Begin
		If len(@pParam)=96 or len(@pParam)=40
		Begin
			UpDate MtLiqNom Set MEUUID=@pParam 
			where Origen='NOM' and TipoDcto=@pTipDcto and ConsecNE=@NroDcto and len(rtrim(MEUUID))=0 
		End
		If len(@pParam)!=96 and len(@pParam)!=40
			UpDate MtLiqNom Set MEUUID=''
			where Origen='NOM' and TipoDcto=@pTipDcto and ConsecNE=@NroDcto and len(rtrim(MEUUID))=0 
	End
	/*
	If @pCampo='PRFJ' 
		UpDate eNom_TRMAS set FE_PRFJ=@pParam
		where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto
	If @pCampo='NC_CPTO'
		UpDate eNom_TRMAS set NC_CPTO=@pParam
		where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto
	If @pCampo='NC_NDOC'
		UpDate eNom_TRMAS set NC_NDOC=@pParam
		where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto
	If @pCampo='NC_TDOC'
		UpDate eNom_TRMAS set NC_TDOC=@pParam
		where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto
	If @pCampo='NC_PDOC'
		UpDate eNom_TRMAS set NC_PDOC=@pParam
		where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto
	If @pCampo='NC_CUNE'
		UpDate eNom_TRMAS set NC_CUNE=@pParam
		Where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto	
	If @pCampo='TR_eNom'
	Begin
		UpDate eNom_TRMas set TR_eNom=case when len(rtrim(MEUUID))<>0 and FC_eNom<>'19000101'then 1 else 0 end 
		From eNom_TRMas, TRADE 
		Where eNom_TRMas.Origen='NOM' and eNom_TRMas.TipoDcto=@pTipDcto and eNom_TRMas.NroDcto=@NroDcto and TRADE.Origen=eNom_TRMas.Origen 
			and TRADE.TipoDcto=eNom_TRMas.TipoDcto and TRADE.NroDcto=eNom_TRMas.NroDcto 

		Select @wvl=isnull(ideNom_RSL,0)From eNom_Enc Where Origen='NOM' and eNom_Enc.TipoDcto=@pTipDcto and NroDcto=@NroDcto
		If @wvl=0
			insert into eNom_rsl(CODIGOCONS,CONSECINI,CONSECFIN,CONSEREAL,FHAUTORIZ,FVENRESO,LLAVEDIAN,NRORESOL,PREFIJDIAN,TESTSETID,TIPODCTO,TIPODCTOFR)
			select CODIGOCONS,CONSECINI,CONSECFIN,Cast(@NroDcto As Int),FHAUTORIZ,FVENRESO,LLAVEDIAN,NRORESOL,PREFIJDIAN,TESTSETID,TIPODCTO,TIPODCTOFR from eNom_resol 
			where len(NRORESOL)!=0 and LLAVEDIAN+PREFIJDIAN not in(Select LLAVEDIAN+PREFIJDIAN From eNom_rsl)
		Else
			UpDate eNom_RSL Set ConseReal=Cast(@NroDcto As Int)where @wvl=ideNom_RSL and ConseReal<Cast(@NroDcto As Int)
	End
	If @pCampo='FL_eNom'
	Begin
		Set @wfl='Error'
		IF substring(@pParam,1,2)='NC'
			select @wfl=cast(isnull(max(cast(substring(fl_eNom,16,10) as int)),0)+1 as varchar(10))
			from eNom_mas 
			inner join tipodcto on eNom_mas.tipodcto=tipodcto.tipodcto and eNom_mas.origen=tipodcto.origen 
			where eNom_mas.Origen='NOM' and dctomae in('NC') and year(@pParam1) = cast(2000+substring(fl_eNom,16,2) as int) and eNom_mas.TipoDcto=@pTipDcto
		else IF substring(@pParam,1,2)='ND'
			select @wfl=cast(isnull(max(cast(substring(fl_eNom,16,10) as int)),0)+1 as varchar(10))
			from eNom_mas 
			inner join tipodcto on eNom_mas.tipodcto=tipodcto.tipodcto and eNom_mas.origen=tipodcto.origen 
			where eNom_mas.Origen='NOM' and dctomae in('ND') and year(@pParam1) = cast(2000+substring(fl_eNom,16,2) as int) and eNom_mas.TipoDcto=@pTipDcto
		else IF substring(@pParam,1,2)in('FA','FR')
			select @wfl=cast(isnull(max(cast(substring(fl_eNom,16,10) as int)),0)+1 as varchar(10))
			from eNom_mas 
			inner join tipodcto on eNom_mas.tipodcto=tipodcto.tipodcto and eNom_mas.origen=tipodcto.origen 
			where eNom_mas.Origen='NOM' and dctomae in('FA','FR') and year(@pParam1) = cast(2000+substring(fl_eNom,16,2) as int) and eNom_mas.TipoDcto=@pTipDcto

		if @wfl<>'Error'
		Begin
			if len(@wfl)<8 Set @wfl=substring(cast(year(@pParam1) as varchar(4)),3,2)+replicate('0',8-len(@wfl))+@wfl
			IF substring(@pParam,1,2)='NC'
				Set @wfl='nc0'+substring(@pParam,3,9)+'000'+@wfl
			else IF substring(@pParam,1,2)='ND'
				Set @wfl='nd0'+substring(@pParam,3,9)+'000'+@wfl
			else IF substring(@pParam,1,2)in('FA','FR')
				Set @wfl='fv0'+substring(@pParam,3,9)+'000'+@wfl

			UpDate eNom_TRMAS set fl_eNom=@wfl where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto and len(fl_eNom) = 0
			
			Set @wfl='Error'
			select @wfl=cast(isnull(max(cast(substring(ad_eNom,16,10) as int)),0)+1 as varchar(10))
			from eNom_mas 
			inner join tipodcto on eNom_mas.tipodcto=tipodcto.tipodcto and eNom_mas.origen=tipodcto.origen 
			where eNom_mas.Origen='NOM' and dctomae in('FA','FR','NC','ND') and year(@pParam1) = cast(2000+substring(ad_eNom,16,2) as int)
			
			if len(@wfl)<8 Set @wfl=substring(cast(year(@pParam1) as varchar(4)),3,2)+replicate('0',8-len(@wfl))+@wfl
			Set @wfl='ad0'+substring(@pParam,3,9)+'000'+@wfl
			UpDate eNom_TRMAS set ad_eNom=@wfl where Origen='NOM' and TipoDcto=@pTipDcto and NroDcto=@NroDcto and len(ad_eNom) = 0
		End
	End
	--NC_FCFA
	Begin
		UpDate eNom_trmas set nc_fcfa=fecha from eNom_trmas
			inner join trade on eNom_trmas.origen=trade.origen and eNom_trmas.nc_tdoc=trade.tipodcto and eNom_trmas.nc_ndoc=trade.nrodcto
			inner join tipodcto on eNom_trmas.tipodcto=tipodcto.tipodcto and eNom_trmas.origen=tipodcto.origen 
		where eNom_trmas.Origen='NOM' and dctomae in('NC','ND') and nc_fcfa='19000101' and eNom_trmas.TipoDcto=@pTipDcto and eNom_trmas.NroDcto=@NroDcto
	End
*/
End
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Mas') Drop View eNom_Mas
Print 'View eNom_Mas'
Go
--SELECT * FROM eNom_Mas Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='5001'
Create VIEW dbo.eNom_Mas 
AS 
SELECT *
	FROM eNom_TRMAS
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Ext') Drop View eNom_Ext
Print 'View eNom_Ext'
Go
--SELECT * FROM eNom_Ext Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='900005'
Create VIEW dbo.eNom_Ext 
AS 
Select distinct eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, MTConceptosDIAN.Codigo, 
	Libro.Concepto, 
	Valor=round(VALORHORA*Libro.NroHoras*Factor,0),
	Cast(Libro.FechaFinal as date) FecFin, Cast(Libro.FechaInicial as date) FecIni, 
	dbo.eNom_Fec_txt(Libro.FechaInicial)+'T'+HoraInicial HorIni, 
	dbo.eNom_Fec_txt(Libro.FechaFinal)+'T'+HoraFinal HorFin, Libro.NroHoras Horas, idLibroHExtras as idmvtrade
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE
	inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
	inner join LibroHorasExtras Libro on Libro.Codigo=MTEmplea.Codigo and MTConcep.Concep=Libro.Concepto and FechaInicial>=MTLiqNom.Fecini and FechaFinal<=MTLiqNom.Fecfin
Where cast(MTLiqNom.ConsecNE as int)<>0
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Inc') Drop View eNom_Inc
Print 'View eNom_Inc'
Go
--SELECT * FROM eNom_Inc Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='5001'
Create VIEW dbo.eNom_Inc 
AS 
Select distinct eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, MTConceptosDIAN.Codigo, 
	Libro.Concepto, Factor, round(MVLiqNom.Valor,0) Valor,
	Cast(Libro.FecFin as date) FecFin, Cast(Libro.FecIni as date) FecIni, 
	DateDiff(DD, Libro.FecIni, Libro.FecFin)+1 Dias, 
	case when Libro.TipNovedad='IGE' then '1'
	else case when Libro.TipNovedad='IRP' then '2'
	else case when Libro.TipNovedad='MAT' then '1'
	else '0' end end end Tipo, Libro.idLibIncap as idmvtrade
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE
	inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
	inner join LibIncap Libro on Libro.Codigo=MTEmplea.Codigo and MTConcep.Concep=Libro.Concepto and Libro.FecIni>=FecIn and Libro.FecFin<=Fecha
Where cast(MTLiqNom.ConsecNE as int)<>0
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Vac') Drop View eNom_Vac
Print 'View eNom_Vac'
Go
--SELECT * FROM eNom_Vac Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='5001'
Create VIEW dbo.eNom_Vac 
AS 
Select distinct eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, MTConceptosDIAN.Codigo, 
	Libro.Concepto, Factor, round(MVLiqNom.Valor,0) Valor,
	Cast(Libro.FechaV as date) FecIni, Cast(Libro.FechaR as date) FecFin,
	DiasT Dias, Libro.idLibVac as idmvtrade
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE
	inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
	inner join LibroVac Libro on Libro.Codemp=MTEmplea.Codigo and  MTConcep.Concep=Libro.Concepto and Libro.FechaV>=FecIn and Libro.FechaR<=Fecha
Where cast(MTLiqNom.ConsecNE as int)<>0
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Lic') Drop View eNom_Lic
Print 'View eNom_Lic'
Go
--SELECT * FROM eNom_Lic Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='5001'
Create VIEW dbo.eNom_Lic 
AS 
Select distinct eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, MTConceptosDIAN.Codigo, 
	Libro.Concepto, Factor, round(MVLiqNom.Valor,0) Valor,
	Cast(Libro.FechaV as date) FecFin, Cast(Libro.FechaR as date) FecIni, 
	DateDiff(DD, Libro.FechaV, Libro.FechaR) Dias, Libro.idLibVac as idmvtrade
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE
	inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
	inner join LibroVac Libro on Libro.CodEmp=MTEmplea.Codigo and  MTConcep.Concep=Libro.Concepto and Libro.FechaV>=FecIn and Libro.FechaR<=Fecha
Where cast(MTLiqNom.ConsecNE as int)<>0
GO
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Aus') Drop View eNom_Aus
Print 'View eNom_Aus'
Go
--SELECT * FROM eNom_Aus Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='5001'
Create VIEW dbo.eNom_Aus 
AS 
Select distinct eNom_Enc.Origen, eNom_Enc.TipoDcto, eNom_Enc.NroDcto, MTConceptosDIAN.Codigo, 
	Libro.Concep, Factor, round(MVLiqNom.Valor,0) Valor,
	Cast(Libro.FecIni as date) FecFin, Cast(Libro.FecFin as date) FecIni, 
	DateDiff(DD, Libro.FecIni, Libro.FecFin) Dias, Libro.idMvFalta as idmvtrade
From eNom_Enc 
	inner join MTLiqNom on eNom_Enc.ConsecNE=MTLiqNom.ConsecNE
	inner join MTEmplea on MTLiqNom.Codigo=MTEmplea.Codigo
	inner join MVLiqNom on MTLiqNom.TipoDcto=MVLiqNom.TipoDcto and MTLiqNom.NroDcto=MVLiqNom.NroDcto
	inner join MTConcep on MVLiqNom.Concep = MTConcep.Concep
	inner join MTConceptosDIAN on ConcepDIAN=MTConceptosDIAN.Codigo
	inner join mvfalta Libro on Libro.Codigo=MTEmplea.Codigo and  MTConcep.Concep=Libro.Concep and Libro.FecIni>=FecIn and Libro.FecFin<=Fecha
Where cast(MTLiqNom.ConsecNE as int)<>0
GO
if exists(SELECT name FROM sys.all_objects Where name='eNom_Via') Drop View eNom_Via
Print 'View eNom_Via'
Go
--SELECT * FROM eNom_Via Where Origen='NOM' AND TipoDcto='NE' AND NroDcto='5006'
Create VIEW dbo.eNom_Via 
AS 
Select Origen, TipoDcto, NroDcto, ConsecNE, Periodo, Estado, DocTra, Codigo, Descripcio, Etiqueta, Tipo, Valor_DEV, Valor_DED, Dias, Valor
from eNom_Mov Where codigo in ('103','104')
Union
Select Origen, TipoDcto, NroDcto, ConsecNE, Periodo, Estado, DocTra,
'102'Codigo,
'Auxilio Transporte'Descripcio,
'"AuxilioTransporte": "string",'Etiqueta, 
'Devengado'Tipo, 
sum(Valor_DEV)Valor_DEV, 
sum(Valor_DED)Valor_DED, 
0 Dias, 
sum(Valor)Valor
from eNom_Mov Where codigo in ('103','104') 
Group by Origen, TipoDcto, NroDcto, ConsecNE, Periodo, Estado, DocTra

GO
