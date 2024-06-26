-- Sprint V
-- SQL Página Loja

-- criar tabela categoria
CREATE TABLE categoria (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(255)
);
-- inserir dados na tabela categoria
INSERT INTO categoria (nome)
	VALUES ('Culinária');
 -- consulta todos os dados da tabela categoria]
SELECT * FROM categoria; 
-- criar tabela livro_de_receitas
CREATE TABLE livro_de_receitas (
    livro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    valor DECIMAL(10, 2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id)
);
-- inserir dados na tabela livro_de_receitas
INSERT INTO livro_de_receitas (titulo, autor, valor, categoria_id)
	VALUES ('Segredos da cozinha', 'Tatiane', 20, 1);
    
    -- consulta todos os dados da tabela livro_de_receitas
SELECT * from livro_de_receitas;

-- criar tabela cliente
CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    email VARCHAR(255)
);
-- inserir dados na tabela cliente
INSERT INTO cliente (nome, endereco, email)
	VALUES ('Marley', 'Rua do Galo, 13', 'marley@gmail.com');
   -- criar tabela pedido
CREATE TABLE pedido (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT,
    data DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
); 
-- inserir dados na tabela pedido
INSERT INTO pedido (cliente_id, data)
	values (1, '2024-4-30');
   -- consulta todos os dados da tabela pedido
SELECT * from pedido; 
-- criar tabela item_de_pedido
CREATE TABLE item_de_pedido (
    item_id SERIAL PRIMARY KEY,
    pedido_id INT,
    livro_id INT,
    quantidade INT,
    valor_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id),
    FOREIGN KEY (livro_id) REFERENCES livro_de_receitas(livro_id)
);

-- inserir dados na tabela item_de_pedido
INSERT INTO item_de_pedido (pedido_id, livro_id, quantidade, valor_unitario)
	VALUES (1, 1, 2, 20);
    -- consulta todos os dados da tabela item_do_pedido
SELECT * FROM item_de_pedido;
-- consulta com junção: todos os pedidos com informações do cliente
SELECT Pedido.*, Cliente.nome AS nome_cliente
	FROM Pedido
	JOIN Cliente ON Pedido.cliente_id = Cliente.cliente_id;
    
  -- consulta com junção: todos os itens de pedido com informações do livro de receitas e do pedido
SELECT Item_de_Pedido.*, Livro_de_Receitas.titulo AS titulo_livro, Pedido.data AS data_pedido
	FROM Item_de_Pedido
	JOIN Livro_de_Receitas ON Item_de_Pedido.livro_id = Livro_de_Receitas.livro_id
	JOIN Pedido ON Item_de_Pedido.pedido_id = Pedido.pedido_id;  
   -- consulta com junção: título do livro de receitas e o nome do autor para cada item de pedido
SELECT Item_de_Pedido.*, Livro_de_Receitas.titulo AS titulo_livro, Livro_de_Receitas.autor AS autor_livro
	FROM Item_de_Pedido
	JOIN Livro_de_Receitas ON Item_de_Pedido.livro_id = Livro_de_Receitas.livro_id; 
    