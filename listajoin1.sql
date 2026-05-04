SELECT nome_autor, titulo from livros
LEFT JOIN autores
ON autores.id_autor = livros.id_autor;

SELECT nome_autor, titulo from livros
JOIN autores
ON autores.id_autor = livros.id_autor;

SELECT nome_autor, titulo, nome_aluno, data_emprestimo, data_devolucao from autores
JOIN livros
JOIN emprestimos
ON autores.id_autor = livros.id_autor;

SELECT titulo, nome_aluno from livros
JOIN emprestimos;

SELECT nome_autor, titulo from autores
JOIN livros
ON autores.id_autor = livros.id_autor;