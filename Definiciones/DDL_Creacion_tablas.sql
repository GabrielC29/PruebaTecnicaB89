CREATE DATABASE B89_remittances;

USE B89_remittances;

-- Tabla merchants
CREATE TABLE Merchants(
	MerchantID int auto_increment primary key,
    Name varchar(255) not null,
    Email varchar(255) not null,
    Phone varchar(50)
);

-- Tabla remitentesbankaccounts
CREATE TABLE Senders(
	SenderID int auto_increment primary key,
    DocumentType varchar (50) not null,
    DocumentNumber varchar (50) not null,
    FirstName varchar (255) not null,
    LastName varchar (255) not null,
    Email varchar (255) not null,
    Phone varchar (50) 
);

-- Tabla beneficiarios
CREATE TABLE Recipients(
	RecipientID int auto_increment primary key,
    DocumentType varchar (50) not null,
    DocumentNumber varchar (50) not null,
    FirstName varchar (255) not null,
    LastName varchar (255) not null,
    Email varchar (255) not null,
    Phone varchar (50)
);

-- Tabla cuentas bancarias
CREATE TABLE BankAccounts(
	BankAccountID int auto_increment primary key,
    RecipientID int not null,
    BankName varchar (255)  not null,
    AccountNumber varchar (255)  not null,
    unique key Unique_AccountNumber (AccountNumber),
    foreign key (RecipientID) references Recipients(RecipientID)
);

-- Tabla de estado para remesas
CREATE TABLE RemittanceStatus (
	StatusID int auto_increment primary key,
    StatusName varchar (50) not null,
    unique key Unique_StatusName (StatusName)
);

-- Tabla de remesas
CREATE TABLE Remittances (
	RemittanceID int auto_increment primary key,
    MerchantID int not null,
    Amount decimal (10,2) not null,
    Currency varchar (10) not null,
    SenderID int not null,
    RecipientID int not null,
    BankAccountID int not null,
    StatusID int not null,
    CreatedAt timestamp default current_timestamp,
    UpdateAt timestamp default current_timestamp on update current_timestamp,
    foreign key (MerchantID) references Merchants(MerchantID),
    foreign key (SenderID) references Senders(SenderID),
    foreign key (RecipientID) references Recipients(RecipientID),
    foreign key (BankAccountID) references BankAccounts(BankAccountID),
    foreign key (StatusID) references RemittanceStatus(StatusID)
);









