CREATE TABLE Aeronave (
codigo INT NOT NULL AUTO_INCREMENT,
modelo VARCHAR(40),
qtdeAssentos INT,
qtdeAssEspeciais INT,
PRIMARY KEY (codigo));

CREATE TABLE Destino (
codAeroporto VARCHAR(40) NOT NULL,
nomeAeroporto VARCHAR(40),
taxaEmbarque DOUBLE,
PRIMARY KEY (codAeroporto));

CREATE TABLE Passageiro (
numDocumento VARCHAR(40) NOT NULL,
nome VARCHAR(40),
dataNascimento DATE,
PRIMARY KEY (numDocumento));

CREATE TABLE Voo (
codigo INT NOT NULL AUTO_INCREMENT,
codigoAeronave INT NOT NULL,
codAeroportoDestino VARCHAR(40) NOT NULL,
dataPartida DATE,
valorPassagem DOUBLE,
PRIMARY KEY (codigo),
FOREIGN KEY (codigoAeronave) REFERENCES Aeronave(codigo) ON DELETE CASCADE,
FOREIGN KEY (codAeroportoDestino) REFERENCES Destino(codAeroporto) ON DELETE CASCADE);

CREATE TABLE PassageirosVoo (
numAssento INT NOT NULL,
codigoVoo INT NOT NULL,
numDocumentoPassageiro VARCHAR(40) NOT NULL,
solicitacoes VARCHAR(40),
tipoAssento INT,
formaPago INT,
valorPago DOUBLE,
PRIMARY KEY (numAssento, codigoVoo, numDocumentoPassageiro),
FOREIGN KEY (codigoVoo) REFERENCES Voo(codigo) ON DELETE CASCADE,
FOREIGN KEY (numDocumentoPassageiro) REFERENCES Passageiro(numDocumento) ON DELETE CASCADE);
