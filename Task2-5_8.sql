drop DATABASE myfunkdb;
CREATE DATABASE myfunkdb;

use myfunkdb;

-- В данной базе данных создать 3 таблицы: В 1-й содержатся имена и 
-- номера телефонов сотрудников некоторой компании. 
-- Во 2-й Ведомости об их зарплате, и должностях: главный директор, менеджер, рабочий. 
-- В 3-й семейном положении, дате рождения, где они проживают. 

CREATE TABLE people (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    ph_num VARCHAR(15) NOT NULL 
);
 
CREATE TABLE off_inf (
    pers_id INT NOT NULL,
    salary INT NOT NULL,
    position_name VARCHAR(30) NOT NULL,
    FOREIGN KEY (pers_id) REFERENCES people(id)
    on update cascade on delete no action
);


CREATE TABLE pers_inf (
    pers_id INT NOT NULL ,
    fam_status VARCHAR(15) NOT NULL,
    birthdate DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    FOREIGN KEY (pers_id) REFERENCES people(id)
    on update cascade on delete no action
);



-- Выполните ряд записей вставки в виде транзакции в хранимой процедуре. 
-- Если такой сотрудник имеется откатите базу данных обратно. 

DELIMITER | 
|
CREATE PROCEDURE InsertNewPersonWithControl(name_param varchar(30), ph_num_param VARCHAR(15), 
salary_param int, position_param VARCHAR(30), family_stat_param VARCHAR (15), birthdate_param DATE,
address_param varchar(30))

begin
DECLARE id_par int;

start TRANSACTION;

INSERT into people 
(name, ph_num)
VALUES 
(name_param, ph_num_param);

set id_par = @@identity;

INSERT INTO off_inf
VALUES
(id_par, salary_param, position_param);

INSERT INTO pers_inf
VALUES
(id_par, family_stat_param, birthdate_param, address_param);

IF EXISTS (select * from people where name = name_param
and ph_num = ph_num_param and id_par != id)
then 
select 'duplication';
ROLLBACK;
ELSE
COMMIT;
end if;

end; 
|





drop PROCEDURE InsertNewPersonWithControl;|


call InsertNewPersonWithControl('john5', '0987654321', 
12000, 'manager', 'married', '1995-11-22',
'Paris, 4333223');|
call InsertNewPersonWithControl('john5', '0987654321', 
12000, 'manager', 'married', '1995-11-22',
'Paris, 4333223');|
call InsertNewPersonWithControl('john6', '0987654321', 
11000, 'manager', 'married', '1995-11-22',
'Paris, 4333223');|




select * from people;|
select * from off_inf;|
select * from pers_inf;|

delete from people
where id = 1;|

update people 
set id = 555 where id = 4;|
|

-- Создайте триггер, который будет удалять записи со 2-й и 3-й таблиц перед 
-- удалением записей из таблиц сотрудников (1-й таблицы), 
-- чтобы не нарушить целостность данных.

CREATE TRIGGER deleteTrigger

BEFORE DELETE on people
FOR EACH ROW
BEGIN
DELETE FROM off_inf 
WHERE
    pers_id = OLD.id;
DELETE FROM pers_inf 
WHERE
    pers_id = OLD.id;
END;|

delete from people
where id = 1;|




