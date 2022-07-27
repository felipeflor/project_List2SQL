CREATE TABLE tb_cliente(
	Id INT NOT NULL IDENTITY,
	Nome VARCHAR(50) NOT NULL,
	Cpf INT NOT NULL PRIMARY KEY,
	Telefone INT NOT NULL,
	Endereco VARCHAR(255) NOT NULL
);


ALTER TABLE tb_usuarios ADD usuario VARCHAR(50) NOT NULL;
ALTER TABLE tb_usuarios ADD senha VARCHAR(100) NOT NULL;
ALTER TABLE tb_usuarios ADD tipo_pessoa VARCHAR(50);

CREATE TABLE tb_anuncios(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	Titulo VARCHAR(45) NOT NULL,
	Descricao VARCHAR(100),
	Contato VARCHAR(100),
	Foto VARCHAR(50) NOT NULL,
	Dia DATE,
	FK_Usuario INT NOT NULL,
	FOREIGN KEY (FK_Usuario) REFERENCES tb_usuarios(Id)
);


ALTER TABLE tb_pedido ADD Dia DATE;

ALTER TABLE tb_produto ADD FK_Categoria INT;

CREATE TABLE tb_Categorias(
	Id INT PRIMARY KEY IDENTITY,
	Categoria VARCHAR(50)
);

CREATE TABLE tb_produto(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	Produto VARCHAR(50),
	Descricao VARCHAR(100),
	Preco FLOAT(50) NOT NULL,
	Estoque INT NOT NULL,
	Foto VARCHAR(50) NOT NULL,
	FK_Criador INT NOT NULL,
	FOREIGN KEY (FK_Criador) REFERENCES tb_Categorias(Id)
);



CREATE TABLE tb_pedido(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	FK_Cpf_Cliente INT NOT NULL,
	FOREIGN KEY (FK_Cpf_Cliente) REFERENCES tb_cliente(Cpf),
	FK_Id_Produto INT NOT NULL,
	FOREIGN KEY (FK_Id_Produto) REFERENCES tb_produto(Id)
);


ALTER TABLE tb_postagens ADD Dia DATE;

CREATE TABLE tb_grupos (
	Id INT PRIMARY KEY IDENTITY,
	Grupo VARCHAR(45),
	Descricao VARCHAR(100),
	Url_Imagem VARCHAR(100),
	FK_Criador INT NOT NULL,
	FOREIGN KEY (FK_Criador) REFERENCES tb_usuarios(Id)
);

CREATE TABLE tb_inscritos(
	FK_Usuarios INT NOT NULL,
	FOREIGN KEY (FK_Usuarios) REFERENCES tb_usuarios(Id),
	FK_Grupo INT NOT NULL,
	FOREIGN KEY (FK_Grupo) REFERENCES tb_grupos(Id)
);

