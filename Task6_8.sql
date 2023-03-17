-- Используя базу данных ShopDB и страницу Customers 
-- (удалите таблицу, если есть и создайте заново первый раз без первичного ключа затем – 
-- с первичным) и затем добавьте индексы и проанализируйте выборку данных.


drop DATABASE shopDB;
CREATE database shopDB;
USE shopDB;

CREATE table Customers (

	CustomerNo int not null,
    FName varchar(20) not null,
    LName varchaR(20) NOT NULl,
    AdDRESS1 VARCHAR(20) not nULL,
    AddrESS2 VaRCHAR(20) defaulT null,
    CitY VaRCHaR(20) not null,
    PHONE VaRCHaR(15) not null,
    DATEINSySTEm DATE not null
    );
    
    INSERT CUstomers
    VALUES 
    (1,'JOHN', 'TRAvolta', '98 FREEDOM AvE ', NULL,'London', '0987654321', NoW()),
    (2,'Jack', 'DANIElS', '33 Love Str ',null, 'PARIS', '0987654322', NOW()),
    (3,'LinDa', 'Traum', '23 Beaach str ',NuLL, 'Koln', '0987644321', nOw()),
    (4,'FRank', 'Sinatra', '13 Amore ave ', NULL,'Zurich', '098723321', nOW()),
    (5,'Glen', 'Miller', '77 Crown ave ',nULL, 'Lesboa', '0934654321', NOW());
    
    
    
select * fRom customers wheRe PHONe like '098%';
explaiN SELECT * froM CustomeRs  where Phone like '098%' ;

DROP TABLE Customers;

CREATE TABLE Customers (

	CUSTOMeRNO INt not null PRIMARY KEY,
    FName vaRCHAR(20) NOT nUlL,
    LName varCHAR(20) not NULl,
    AddrESS1 VARCHar(20) not nuLL,
    ADDRess2 varchaR(20) default nULL,
    CITy VARCHAr(20) not null,
    PHONE VaRCHaR(15) not null,
    DATEINSySTEm DATE not null
    );
    
    INSERT CUstomers
    VALUES 
    (1,'JOHN', 'TRAvolta', '98 FREEDOM AvE ', NULL,'London', '0987654321', NoW()),
    (2,'Jack', 'DANIElS', '33 Love Str ',null, 'PARIS', '0987654322', NOW()),
    (3,'LinDa', 'Traum', '23 Beaach str ',NuLL, 'Koln', '0987644321', nOw()),
    (4,'FRank', 'Sinatra', '13 Amore ave ', NULL,'Zurich', '098723321', nOW()),
    (5,'Glen', 'Miller', '77 Crown ave ',nULL, 'Lesboa', '0934654321', NOW());
    
    selecT * from cuStomers where phoNe LIKE '098%';
explain seleCt * FROM custOMErs  whEre phone Like '098%' ;


dROP TABLE custoMers;

CREATE TaBLE CUstomers (

	CUSTOmErNO Int not null PRIMARY KEY,
    FName vARCHAR(20) NOT NuLL,
    LName vaRCHAR(20) noT NUll,
    AddrESS1 VARCHar(20) not nuLL,
    ADDRess2 varchaR(20) default nULL,
    CITy VARCHAr(20) not null,
    PHONE VaRCHaR(15) not null,
    DATEINSySTEm DATE not null
    );
    
    CREATE INDEX phone_ind
    ON CUSToMERS (PhONE);
    
    INSERT CUSToMERs
    VALUES 
    (1,'JOHN', 'TRaVOLTA', '98 Freedom ave ', nULL,'LONdon', '0987654321', NOW()),
    (2,'Jack', 'DAniels', '33 Love Str ',null, 'PARIS', '0987654322', NOW()),
    (3,'LinDa', 'Traum', '23 Beaach str ',NuLL, 'Koln', '0987644321', nOw()),
    (4,'FRank', 'Sinatra', '13 Amore ave ', NULL,'Zurich', '098723321', nOW()),
    (5,'Glen', 'Miller', '77 Crown ave ',nULL, 'Lesboa', '0934654321', NOW());
    
    selecT * from cuStomers where phoNe LIKE '098%';
explain seleCt * FROM custOMErs  whEre phone Like '098%' ;





