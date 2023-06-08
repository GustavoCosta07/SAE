CREATE TABLE IF NOT EXISTS `TIPO_USUARIO` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `DESCRICAO` VARCHAR(255) NOT NULL
);

INSERT INTO `TIPO_USUARIO` (`DESCRICAO`)
VALUES ('COMUM'), ('PSICOLOGO'), ('ADVOGADO');

CREATE TABLE IF NOT EXISTS `USUARIOS` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `EMAIL` VARCHAR(255) NOT NULL UNIQUE,
    `MATRICULA` VARCHAR(255) NOT NULL UNIQUE,
    `SENHA` VARCHAR(255) NOT NULL,
    `NOME` VARCHAR(255) NOT NULL,
    `DESCRICAO` VARCHAR(255),
    `TOPICOS` VARCHAR(255),
    `TELEFONE` VARCHAR(20),
    `TIPO` INT,
    `CONFIRMACAO_REGISTRO` BOOLEAN DEFAULT 0,
    FOREIGN KEY (`TIPO`) REFERENCES `TIPO_USUARIO`(`ID`)
);

CREATE TABLE IF NOT EXISTS `DISPONIBILIDADE` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `ID_USUARIO` INT,
    `DATA_HORA_INICIO` DATETIME,
    `DATA_HORA_FIM` DATETIME,
    `ESTADO` ENUM('disponível', 'reservado', 'indisponível'),
    FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIOS`(`ID`)
);

CREATE TABLE IF NOT EXISTS `CONSULTAS` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `ID_USUARIO` INT,
    `ID_PROFISSIONAL` INT,
    `DATA_HORA` DATETIME,
    FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIOS`(`ID`),
    FOREIGN KEY (`ID_PROFISSIONAL`) REFERENCES `USUARIOS`(`ID`)
);

INSERT INTO `USUARIOS` (`EMAIL`, `MATRICULA`, `SENHA`, `NOME`, `DESCRICAO`, `TOPICOS`, `TELEFONE`, `TIPO`)
VALUES
    ('psicologo1@facul.com', 'matriculaps1', 'password1', 'Carlos Silva', 'Psicologia, 3º período', 'Psicanálise e Saúde Mental', '(31)993344556', 2),
    ('psicologo2@facul.com', 'matriculaps2', 'password2', 'Fernanda Souza', 'Psicologia, 4º período', 'Psicologia cognitiva', '(31)993344557', 2),
    ('psicologo3@facul.com', 'matriculaps3', 'password3', 'Mariana Lima', 'Psicologia, 5º período', 'Psicologia clínica', '(31)993344558', 2),
    ('psicologo4@facul.com', 'matriculaps4', 'password4', 'Guilherme Santos', 'Psicologia, 6º período', 'Psicologia do desenvolvimento', '(31)993344559', 2),
    ('psicologo5@facul.com', 'matriculaps5', 'password5', 'Aline Costa', 'Psicologia, 7º período', 'Psicologia social', '(31)993344560', 2),
    ('psicologo6@facul.com', 'matriculaps6', 'password6', 'Tiago Alves', 'Psicologia, 8º período', 'Psicologia forense', '(31)993344561', 2),
    ('psicologo7@facul.com', 'matriculaps7', 'password7', 'Larissa Pereira', 'Psicologia, 2º período', 'Psicologia da saúde', '(31)993344562', 2),
    ('psicologo8@facul.com', 'matriculaps8', 'password8', 'Paulo Ribeiro', 'Psicologia, 3º período', 'Psicologia da educação', '(31)993344563', 2),
    ('psicologo9@facul.com', 'matriculaps9', 'password9', 'Bruna Rocha', 'Psicologia, 1º período', 'Psicologia organizacional', '(31)993344564', 2),
    ('psicologo10@facul.com', 'matriculaps10', 'password10', 'Rafaela Soares', 'Psicologia, 4º período', 'Psicologia esportiva', '(31)993344565', 2),
    ('psicologo11@facul.com', 'matriculaps11', 'password11', 'Leonardo Machado', 'Psicologia, 5º período', 'Psicologia comportamental', '(31)993344566', 2),
    ('psicologo12@facul.com', 'matriculaps12', 'password12', 'Roberta Castro', 'Psicologia, 6º período', 'Psicologia educacional', '(31)993344567', 2),
    ('psicologo13@facul.com', 'matriculaps13', 'password13', 'João Oliveira', 'Psicologia, 7º período', 'Psicologia humanista', '(31)993344568', 2),
    ('psicologo14@facul.com', 'matriculaps14', 'password14', 'Camila Dias', 'Psicologia, 8º período', 'Psicologia evolutiva', '(31)993344569', 2),
    ('psicologo15@facul.com', 'matriculaps15', 'password15', 'Mateus Pereira', 'Psicologia, 2º período', 'Psicologia transpessoal', '(31)993344570', 2);