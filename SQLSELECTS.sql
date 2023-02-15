use Projeto

-- Exercicio 1
SELECT * 
FROM MATRICULA as M
	INNER JOIN ALUNO as A 
ON 
	A.cpf = M.cpf_aluno;
-- Exercicio 2
SELECT CUR.codigo, CUR.nome, CUR.descricao ,DIS.nome FROM CURSO AS CUR
INNER JOIN COMPOE AS COM 
ON 
	CUR.CODIGO = COM.CODIGO_CURSO
INNER JOIN DISCIPLINA AS DIS
ON
	DIS.codigo = COM.codigo_disc;

-- Exercicio 3 
