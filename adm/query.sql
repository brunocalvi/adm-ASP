CREATE TABLE `tb_modulo` (
  `cd_modulo` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ds_modulo` VARCHAR(80),
  `texto` LONGTEXT,
  `anexo` VARCHAR(20),
   `cd_curso` VARCHAR(70) 
);

CREATE TABLE `tb_curso` (
  `cd_curso` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ds_curso` VARCHAR(80),
  `ativo` INT DEFAULT 1,
  `resumo` LONGTEXT,
  `cd_professor` INT
);

CREATE TABLE `tb_professor` (
  `cd_professor` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ds_professor` VARCHAR(70),
  `cpf` VARCHAR(15),
  `data_nascimento` DATE,
  `endereco` VARCHAR(100),
  `cidade` VARCHAR(50),
  `curriculo` VARCHAR(300),
  `email` VARCHAR(80),
  `foto` VARCHAR(20)
);

CREATE TABLE `tb_usuario` (
  `cd_usuario` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ds_usuario` VARCHAR(20),
  `senha` VARCHAR(10)
);

CREATE TABLE `tb_contato` (
  `cd_contato` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `assunto` VARCHAR(150),
  `email` VARCHAR(50),
  `mensagem` TEXT
);