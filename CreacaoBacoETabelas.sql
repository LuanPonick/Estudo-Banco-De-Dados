CREATE database Projeto;

use Projeto;

DROP database Projeto

CREATE TABLE PRE_REQ(
	codigo_disc int,
	codigo_disc_dependencia int

	primary key (codigo_disc, codigo_disc_dependencia)
);

CREATE TABLE DEPARTAMENTO(
	codigo int,
	nome varChar(30)

	primary key(codigo)
);


CREATE TABLE PROFESSOR(
	matricula int,
	nome varChar(30),
	endereco varChar(100),
	telefone varChar(14),
	data_nasc date,
	codigo_depto int,
	data_contratacao date,

	primary key(matricula),
	constraint fk_ProDep foreign key(codigo_depto) references DEPARTAMENTO(codigo)
);

CREATE TABLE COMPOE(
	codigo_curso int,
	codigo_disc int,

	primary key(codigo_curso, codigo_disc),
	constraint fk_ComCur foreign key(codigo_curso) references CURSO(codigo),
	constraint fk_ComDis foreign key(codigo_disc) references DISCIPLINA(codigo)
);

CREATE TABLE CURSA (
cpf_aluno varChar(11),
codigo_disc int,

primary key (cpf_aluno),
constraint fk_CurDis foreign key(codigo_disc) references DISCIPLINA (codigo_disc)
);

CREATE TABLE DISCICLINA (
codigo int,
qtde_creditos numeric(9,2),
matricula_prof int,
nome varChar (40),

primary key (codigo),
constraint fk_disPro (matricula_prof) references PROFESSOR (matricula_prof);
);

CREATE TABLE MATRICULA(
    codigo_curso int,
    cpf_aluno varchar(11),
    data_matricula date

    primary key(codigo_curso, cpf_aluno),
    constraint fk_MatCur foreign key (codigo_curso) references CURSO (codigo)
);

CREATE TABLE CURSO(
    codigo int,
    nome varchar(30),
    descricao text,
    codigo_dpto int,
    
    primary key(codigo),
    constraint fk_CurDep foreign key (codigo_dpto) references DEPARTAMENTO (codigo)
);

CREATE TABLE ALUNO (
	cpf varChar(11),
	nome varChar(30),
	endereco varChar(100),
	telefone varChar(13),
	data_nasc date
	primary key(cpf)
);