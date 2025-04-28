/*BD – EXERCÍCIOS – PRÁTICA 08
Fazer a modelagem lógica de um sistema para cadastrar os clientes, suas vendas e
seus respectivos produtos.
- Cada cliente realiza mais de uma venda.
- Cada venda é de apenas um cliente e tem mais de um produto.
- Cada produto pode ser vendido em mais de uma venda.
- Sobre cada cliente, o sistema guarda um identificador, que identifica de forma única
cada cliente. Além desse identificador, o sistema guarda o nome, o email e o
endereço.
- Sobre cada venda, o sistema guarda um identificador, que identifica de forma única
cada venda. O sistema também guarda o total da venda e a data.
- Sobre cada produto, o sistema guarda um identificador, que identifica de forma
única cada produto. Além desse identificador, o sistema guarda o nome, a descrição
e o preço do produto.
- Um cliente indica outro cliente, necessário que o sistema guarde qual cliente indicou
o outro cliente. Cada cliente pode indicar muitos clientes e cada cliente é indicado por
apenas um cliente.
- O sistema ainda precisa saber quantidade do produto vendido numa determinada
venda e o valor do desconto.
Abra no MySQL Workbench uma nova aba para fazer os comandos SQL.
Escrever os comandos do MySQL para:
a) Criar um banco de dados chamado Venda.
b) Selecionar esse banco de dados.
c) Criar as tabelas correspondentes à sua modelagem.
d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
cliente, e mais de um cliente sendo indicado por outro cliente.
e) Exibir todos os dados de cada tabela criada, separadamente.
f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
das tabelas.
g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
e os dados de suas respectivas vendas.
i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.*/

create database sprint3;

use sprint3;

drop database sprint3;

create table cliente(
idCliente int primary key auto_increment,
fkIndicado int,
email varchar(45),
senha varchar(45),
endereco varchar(45),
constraint pkIndicado foreign key(fkIndicado) references cliente(idCliente) 
);

create table venda(
idVenda int,
fkCliente int,
total int,
dtVenda date,
constraint pkCompostaVenda primary key(fkCliente, idVenda),
constraint fkCliente foreign key(fkCliente) references cliente(idCliente) 
);

create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(200),
preco int
);

create table carrinho(
);


show tables;