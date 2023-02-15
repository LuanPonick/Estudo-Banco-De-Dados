CREATE database Projeto;
USE Projeto;

--1
CREATE TABLE ALUNO (
	cpf varChar(11),
	nome varChar(80),
	endereco varChar(100),
	telefone varChar(30),
	data_nasc date
	primary key(cpf)
);
--2
CREATE TABLE DEPARTAMENTO(
	codigo int,
	nome varChar(80)

	primary key(codigo)
);

--3
CREATE TABLE PROFESSOR(
	matricula int,
	nome varChar(80),
	endereco varChar(100),
	telefone varChar(30),
	data_nasc date,
	codigo_depto int,
	data_contratacao date,

	primary key(matricula),
	constraint fk_ProDep foreign key(codigo_depto) references DEPARTAMENTO(codigo)
);

--4
CREATE TABLE DISCIPLINA (
codigo int,
qtde_creditos numeric(9,2),
matricula_prof int,
nome varChar (80),

primary key (codigo),
constraint fk_DisPro foreign key (matricula_prof) references PROFESSOR (matricula)
);
--5
CREATE TABLE CURSA (
cpf_aluno varChar(11),
codigo_disc int,

primary key (cpf_aluno,codigo_disc),
constraint fk_CurDis foreign key(codigo_disc) references DISCIPLINA (codigo),
constraint fk_CurAlu foreign key(cpf_aluno) references ALUNO (cpf)
);
--6
CREATE TABLE CURSO(
    codigo int,
    nome varchar(80),
    descricao text,
    codigo_dpto int,
    
    primary key(codigo),
    constraint fk_CurDep foreign key (codigo_dpto) references DEPARTAMENTO (codigo)
);
--7
CREATE TABLE MATRICULA(
    codigo_curso int,
    cpf_aluno varchar(11),
    data_matricula date

    primary key(codigo_curso, cpf_aluno),
    constraint fk_MatCur foreign key (codigo_curso) references CURSO (codigo),
	constraint fk_MatAlu foreign key (cpf_aluno) references ALUNO (cpf)
);
--8
CREATE TABLE COMPOE(
	codigo_curso int,
	codigo_disc int,

	primary key(codigo_curso, codigo_disc),
	constraint fk_ComCur foreign key(codigo_curso) references CURSO(codigo),
	constraint fk_ComDic foreign key(codigo_disc) references DISCIPLINA(codigo)
);

--9
CREATE TABLE PRE_REQ(
	codigo_disc int,
	codigo_disc_dependencia int

	primary key (codigo_disc, codigo_disc_dependencia),
	constraint fk_PreDis foreign key (codigo_disc) references DISCIPLINA (codigo),
	constraint fk_PreDisDep foreign key (codigo_disc_dependencia) references DISCIPLINA (codigo)
);

-- SEQUENCE
create sequence codigoDis_seq
	start with 1
	increment by 1;

create sequence matricula_seq
	start with 1
	increment by 1;
	
create sequence codigoCur_seq
	start with 1
	increment by 1;

create sequence codigoDep_seq
	start with 1
	increment by 1;

create sequence codigo_seq
	start with 1
	increment by 1;
