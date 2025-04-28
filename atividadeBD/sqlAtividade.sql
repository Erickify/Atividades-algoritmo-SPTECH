create database sprint2;

use sprint2;

create table projeto (
idProj int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);

INSERT INTO projeto (nome, descricao) VALUES 
('Exploração Espacial', 'Projeto espacial.'),
('Desafio Inteligente', 'Desafios Inteligentes.'),
('Conexões Sustentáveis', 'Conexoes.'),
('IA para Educação', 'IA educacao.'),
('Tecnologia da Imortalidade', 'Imortalidades');


create table aluno (
idRaAluno int primary key auto_increment,
nome varchar(45),
telefone char(11),
fkRepre int,
fkProjeto int,
constraint fkAlunoProjeto foreign key (fkProjeto)
	references projeto(idProj),
constraint fkAlunoRepre foreign key (fkRepre)
	references aluno(idRaAluno)
);

insert into aluno values -- representante Erick Gomes
	(1,'Erick Gomes', 11234567890, 1, 1);
    
insert into aluno values
	(2,'Hyguino Gomes', 11234567891, 1, 2),
    (3,'Ana Gomes', 11234567892, 1, 3);

insert into aluno values -- representante João Victor
	(4,'João Victor', 11234567893, 4, 4);
    
insert into aluno values
	(5,'Akira Gomes', 11234567891, 4, 5),
    (6,'Emile Gomes', 11234567891, 4, 1);
    
select * from aluno;

select * from projeto;

select al.idRaAluno as RA, al.telefone as Telefone, al.nome as aluno,
	proj.nome as projeto, proj.descricao
    from aluno as al 
    join projeto as proj
    on al.fkProjeto = proj.idProj
    order by al.idRaAluno asc;

select al.idRaAluno as RA, al.telefone as Telefone, al.nome as aluno,
	repre.nome as representante
    from aluno as al 
    join aluno as repre
    on al.fkRepre = repre.idRaAluno
    order by al.idRaAluno asc;

select al.idRaAluno as RA, al.telefone as Telefone, al.nome as aluno,
	proj.nome as projeto, proj.descricao
    from aluno as al 
    join projeto as proj
    on al.fkProjeto = proj.idProj
    where idProj = 1
    order by al.idRaAluno asc;


-- exercicio 2
create database campanha;

use campanha;


create table organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
endereco varchar(100),
email varchar(45),
fkVeterano int,
constraint fkOrgaVeterano foreign key (fkVeterano)
	references Organizador(idOrganizador)

) auto_increment = 30;

-- Inserir organizador sem veterano (fkVeterano = NULL)
INSERT INTO organizador (nome, endereco, email, fkVeterano) VALUES 
( 'Carlos Pereira', 'Rua C, 789', 'carlos.pereira@email.com', 30),
( 'Ana Costa', 'Rua D, 101', 'ana.costa@email.com', 31);

-- Inserir organizador com veterano
INSERT INTO organizador (nome, endereco, email, fkVeterano)
VALUES 
('Luiza Martins', 'Avenida E, 202', 'luiza.martins@email.com', 30),  -- Veterano com id 30 (João Silva)
('Roberto Lima', 'Rua F, 303', 'roberto.lima@email.com', 31),        -- Veterano com id 1 (João Silva)
('Patrícia Oliveira', 'Rua G, 404', 'patricia.oliveira@email.com', 30),  -- Veterano com id 2 (Maria Souza)
('Ricardo Gomes', 'Avenida H, 505', 'ricardo.gomes@email.com', 30),     -- Veterano com id 30 (João Silva)
('Mariana Rocha', 'Rua I, 606', 'mariana.rocha@email.com', 31);         -- Veterano com id 3 (Carlos Pereira)


create table campanha (
idCampanha int auto_increment,
fkOrganizador int,
categoria varchar(45),
instituicao varchar(45),
dataFinal date,
constraint fkCampOrganizador foreign key (fkOrganizador)
	references Organizador(idOrganizador),
constraint pkCampanha primary key (idCampanha, fkOrganizador)

)auto_increment = 500;

-- Inserir campanhas com organizadores
INSERT INTO campanha (fkOrganizador, categoria, instituicao, dataFinal)
VALUES 
(31, 'Educação', 'Instituto ABC', '2025-06-30'),     -- Organizador com id 1 (João Silva)
(30, 'Saúde', 'Hospital XYZ', '2025-12-15'),         -- Organizador com id 30 (João Silva)
(32, 'Meio Ambiente', 'ONG Verde', '2025-08-20'),     -- Organizador com id 2 (Maria Souza)
(33, 'Tecnologia', 'Universidade PQR', '2025-10-01'), -- Organizador com id 3 (Carlos Pereira)
(34, 'Cultura', 'Museu Nacional', '2025-11-10');      -- Organizador com id 5 (Ana Costa)

select * from campanha;

select * from organizador;

select org.idOrganizador as idOrganizador, org.email as Email, org.endereco as 'endereco', org.nome as 'Organizador',
	camp.categoria as Campanha, camp.idCampanha
    from campanha as camp 
    join organizador as org
    on camp.fkOrganizador = org.idOrganizador
    order by org.idOrganizador asc;

select org.idOrganizador as idOrganizador, org.email as Email, org.endereco as 'endereco', org.nome as 'Organizador',
	camp.categoria as Campanha, camp.idCampanha
    from campanha as camp 
    join organizador as org
    on camp.fkOrganizador = org.idOrganizador
    where org.nome = 'Carlos Pereira'
    order by org.idOrganizador asc;
    

select org.idOrganizador as idOrganizador, org.endereco as Endereço, org.email as Email, org.nome as 'Organizador',
	vet.nome as 'Organizador Veterano', vet.idOrganizador
    from organizador as org 
    join organizador as vet
    on org.fkVeterano = vet.idOrganizador
    order by org.idOrganizador asc;

select org.idOrganizador as idOrganizador, org.endereco as Endereço, org.email as Email, org.nome as 'Organizador',
	vet.nome as 'Organizador Veterano', vet.idOrganizador
    from organizador as org 
    join organizador as vet
    on org.fkVeterano = vet.idOrganizador
    where vet.nome = 'Ana Costa'
    order by org.idOrganizador asc;

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas
-- organizadas e os dados dos respectivos organizadores orientadores.

select org.idOrganizador as idOrganizador, org.email as Email, org.endereco as 'endereco', vet.nome as 'Organizador',
	camp.categoria as Campanha, camp.idCampanha,
    org.nome as Veterano
    from organizador as org 
    join organizador as vet
    on org.fkVeterano = org.idOrganizador
	join campanha as camp
    on camp.fkOrganizador = org.idOrganizador
    order by org.idOrganizador asc;
    
select org.idOrganizador as idOrganizador, org.email as Email, org.endereco as 'endereco', vet.nome as 'Organizador',
	camp.categoria as Campanha, camp.idCampanha,
    org.nome as Veterano
    from campanha as camp 
    join organizador as org
    on camp.fkOrganizador = org.idOrganizador
	join organizador as vet
    on org.fkVeterano = org.idOrganizador
    where org.nome = 'Ana Costa'
    order by org.idOrganizador asc;
        

truncate organizador;

drop database sprint2;