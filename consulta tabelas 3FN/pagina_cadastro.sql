-- Sprint V
-- SQL da Página de Cadastro

-- Criar tabela usuarios
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    usuario VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
  	data_nascimento DATE NOT NULL,
  	email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(150) NOT NULL
);
-- Criar tabela genero
CREATE TABLE genero (
    id_genero SERIAL PRIMARY KEY,
    genero VARCHAR(20) NOT NULL
);
-- Criar tabela validacao
CREATE TABLE validacao (
    id_usuario INT PRIMARY KEY REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    senha VARCHAR(100) NOT NULL
);
-- Adicionar a coluna id_genero na tabela usuarios
ALTER TABLE usuarios
	ADD COLUMN id_genero INTEGER REFERENCES genero(id_genero);
 -- Criar a restrição de chave estrangeira
ALTER TABLE usuarios
	ADD CONSTRAINT fk_genero
	FOREIGN KEY (id_genero) 
	REFERENCES genero(id_genero);
    -- Inserir dados na tabela genero
INSERT INTO genero (genero)
	VALUES ('Masculino');
  -- Inserir dados na tabela genero
INSERT INTO genero (genero)
	VALUES ('Feminino');  
    -- Inserir dados na tabela usuarios
INSERT INTO usuarios (usuario, nome, sobrenome, data_nascimento, email, telefone, endereco, id_genero)
	VALUES ('marley_paranhos',
            'Marley',
            'Paranhos',
            '1976-3-13',
            'mpsvideos.marley@gmail.com',
            '31 980139754',
            'Alameda Carcará, 110',
           1);
          -- Inserir dados na tabela usuarios
INSERT INTO usuarios (usuario, nome, sobrenome, data_nascimento, email, telefone, endereco, id_genero)
	VALUES ('dd_lindona',
            'Andrezza',
            'Ferrerira',
            '1982-6-16',
            'dd_lindona@gmail.com',
            '31 999998877',
            'Rua do Galo, 13',
           2); 
           -- Inserir dados na tabela validacao
INSERT INTO validacao (id_usuario, senha)
	VALUES (1, '123456');
    -- Inserir dados na tabela validacao
INSERT INTO validacao (id_usuario, senha)
	VALUES (2, '654321');
-- Consulta simples das tabelas
SELECT * FROM usuarios;
SELECT * FROM genero;
SELECT * FROM validacao;

-- Consulta com junções das tabelas
SELECT usuarios.usuario, usuarios.nome, usuarios.sobrenome,
		usuarios.data_nascimento, usuarios.email, genero.genero, validacao.senha
	FROM usuarios
	JOIN genero ON usuarios.id_genero = genero.id_genero
	JOIN validacao ON usuarios.id_usuario = validacao.id_usuario;
   -- Consulta com junções das tabelas usando where
SELECT usuarios.usuario, usuarios.nome, usuarios.sobrenome,
		usuarios.data_nascimento, usuarios.email, genero.genero, validacao.senha
	FROM usuarios
	JOIN genero ON usuarios.id_genero = genero.id_genero
	JOIN validacao ON usuarios.id_usuario = validacao.id_usuario
    WHERE sobrenome = 'Paranhos'; 
