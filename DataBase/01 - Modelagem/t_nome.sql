/*====================================================================
	TABELA (Nome da tabela): Função da tabela
======================================================================*/
CREATE TABLE [dbo].[t_nome]
(
	 id_tabela					INT NOT NULL
	,nm_tabela				VARCHAR(200)
	,dt_criacao_tabela   DATETIME
	,qt_exemplo				INT
	,fl_ativo					BIT
)

ALTER TABLE [dbo].[t_nome]
ADD CONSTRAINT [PK_t_nome(id_tabela)] PRIMARY KEY (id_tabela)