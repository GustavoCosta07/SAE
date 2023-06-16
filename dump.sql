-- Criação da tabela USUARIOS
CREATE TABLE IF NOT EXISTS `USUARIOS` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `EMAIL` VARCHAR(255) NOT NULL UNIQUE,
    `MATRICULA` VARCHAR(255) NOT NULL UNIQUE,
    `SENHA` VARCHAR(255) NOT NULL,
    `NOME` VARCHAR(255) NOT NULL,
    `DESCRICAO` VARCHAR(255),
    `TOPICOS` VARCHAR(255),
    `TELEFONE` VARCHAR(20),
    `CONFIRMACAO_REGISTRO` BOOLEAN DEFAULT 0
);

-- Criação da tabela PROFISSIONAIS
CREATE TABLE PROFISSIONAIS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100),
    EMAIL VARCHAR(100),
    TELEFONE VARCHAR(20),
    GENERO ENUM('M', 'F'),
    ESPECIALIDADE VARCHAR(100),
    SOBRE_MIM TEXT
);

-- Criação da tabela HORARIOS
CREATE TABLE HORARIOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_PROFISSIONAL INT,
    DATA_HORA DATETIME,
    DISPONIVEL ENUM('S', 'N'),
    FOREIGN KEY (ID_PROFISSIONAL) REFERENCES PROFISSIONAIS(ID)
);

-- Criação da tabela CONSULTAS
CREATE TABLE CONSULTAS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MATRICULA_USUARIO VARCHAR(255),
    ID_PROFISSIONAL INT,
    ID_HORARIO INT,
    DATA_HORA DATETIME,
    FOREIGN KEY (MATRICULA_USUARIO) REFERENCES USUARIOS(MATRICULA),
    FOREIGN KEY (ID_PROFISSIONAL) REFERENCES PROFISSIONAIS(ID),
    FOREIGN KEY (ID_HORARIO) REFERENCES HORARIOS(ID)
);

INSERT INTO PROFISSIONAIS (NOME, EMAIL, TELEFONE, GENERO, ESPECIALIDADE, SOBRE_MIM)
VALUES
    ('João Silva', 'joao.silva@example.com', '123456789', 'M', 'Psicologia Clínica', 'Sou formado em Psicologia Clínica e tenho experiência em terapia individual.'),
    ('Maria Santos', 'maria.santos@example.com', '987654321', 'F', 'Psicologia Infantil', 'Trabalho principalmente com crianças e adolescentes, utilizando técnicas lúdicas e terapia familiar.'),
    ('Pedro Almeida', 'pedro.almeida@example.com', '456789123', 'M', 'Psicologia Organizacional', 'Especializado em desenvolvimento de equipes e gestão de recursos humanos.'),
    ('Ana Oliveira', 'ana.oliveira@example.com', '321654987', 'F', 'Psicologia Esportiva', 'Ajudo atletas a lidar com questões emocionais e melhorar seu desempenho nas competições.'),
    ('Lucas Barbosa', 'lucas.barbosa@example.com', '987123654', 'M', 'Psicologia Social', 'Pesquiso e atuo na área de psicologia comunitária e intervenções sociais.'),
    ('Juliana Costa', 'juliana.costa@example.com', '654321987', 'F', 'Psicologia Educacional', 'Trabalho com alunos e professores, ajudando no desenvolvimento acadêmico e emocional.'),
    ('Rafaela Ferreira', 'rafaela.ferreira@example.com', '456123789', 'F', 'Psicologia do Desenvolvimento', 'Especializada em acompanhamento psicológico de crianças em diferentes fases do desenvolvimento.'),
    ('Fernando Carvalho', 'fernando.carvalho@example.com', '987321456', 'M', 'Psicologia Hospitalar', 'Trabalho com pacientes hospitalizados, auxiliando no enfrentamento das dificuldades emocionais.'),
    ('Isabela Santos', 'isabela.santos@example.com', '789123456', 'F', 'Psicologia Clínica', 'Atuo com adultos e idosos, oferecendo suporte emocional e orientação terapêutica.'),
    ('Gustavo Rodrigues', 'gustavo.rodrigues@example.com', '321987654', 'M', 'Psicologia Forense', 'Realizo avaliações psicológicas em contextos jurídicos e ofereço apoio a vítimas de crimes.'),
    ('Carolina Lima', 'carolina.lima@example.com', '654789123', 'F', 'Psicologia Organizacional', 'Auxilio empresas a desenvolver um ambiente de trabalho saudável e produtivo.'),
    ('André Torres', 'andre.torres@example.com', '789654123', 'M', 'Psicologia Escolar', 'Atuo com alunos, pais e professores, promovendo a saúde mental e o bem-estar nas instituições de ensino.'),
    ('Mariana Costa', 'mariana.costa@example.com', '321789654', 'F', 'Psicologia do Esporte', 'Apoio atletas de alto rendimento a lidar com a pressão e os desafios psicológicos do esporte.'),
    ('Rodrigo Ferreira', 'rodrigo.ferreira@example.com', '654123789', 'M', 'Psicologia Social', 'Realizo pesquisas e intervenções comunitárias, visando promover mudanças sociais positivas.'),
    ('Camila Alves', 'camila.alves@example.com', '789456123', 'F', 'Psicologia Hospitalar', 'Trabalho em hospitais, ajudando pacientes e familiares a lidar com a doença e o processo de tratamento.');
