:setvar NR_VERSAO "1.1.1"
GO
CREATE OR ALTER PROCEDURE [dbo].[p_procedure_teste]
(
	/*Parâmetros alternativos*/
	 @id_tabela					INT 
	,@nm_tabela				VARCHAR(200)
	,@dt_criacao_tabela   DATETIME
	,@qt_exemplo				INT
	,@fl_ativo					BIT
   /*Parâmetros obrigatórios*/
    ,@cd_retorno				INT OUTPUT
    ,@nm_retorno				VARCHAR(MAX) OUTPUT
    ,@nr_versao				VARCHAR(15) OUTPUT
)
AS 
/*
		*Data:		01/09/2026
	    *Objetivo: Informar a finalidade da procedure

		DECLARE
			@cd_retorno		INT
		   ,@nm_retorno		VARCHAR(255)

		EXEC [dbo].[p_procedure_teste]

*/
SET NOCOUNT ON 

	DECLARE 
		@nm_proc	varchar(128)
	
	SELECT
	     @nr_versao = '$(NR_VERSAO)'
	    ,@nm_proc = OBJECT_NAME(@@PROCID);

	BEGIN TRY

	/*Aqui há um teste de procedure*/
	/*Dois testes de procedure*/

		SELECT id_tabela 
		FROM t_nome

		SELECT @cd_retorno = 0
					   ,@nm_retorno = 'Processamento efetuado com sucesso!'

	END TRY 
	BEGIN CATCH 
		/*	TRATAMENTO DE ERRO	*/
		SELECT 
			@cd_retorno = CASE WHEN ISNULL(@cd_retorno, 0) < 1 THEN 1 ELSE @cd_retorno END,
			@nm_retorno = CASE WHEN OBJECT_NAME(@@PROCID) <> ISNULL(ERROR_PROCEDURE(), OBJECT_NAME(@@PROCID))
												THEN 'ERRO NA PROC: ' + ISNULL(CONVERT(VARCHAR(100), ERROR_PROCEDURE()), '') 
										ELSE ''
									END 
	END CATCH

GO
