-- CREATING TABLE
CREATE TABLE IF NOT EXIXTS emp(
eid INTEGER(5),
ename varchar(20),
ejob varchar(20),
esal decimal (8,2));
--INSERTING VALUES
INSERT INTO emp VALUES(1,'raj','manager',4000);
INSERT INTO emp VALUES(2,'Ishaan','clerk',500);
INSERT INTO emp VALUES(3,'Dhruv','clerk',200);
INSERT INTO emp VALUES(4,'Diya','manager',1100);
INSERT INTO emp VALUES(5,'Ananya','clerk',400);
INSERT INTO emp VALUES(6,'amar','accountant',2500);
INSERT INTO emp VALUES(7,'aditi','accountant',900);
INSERT INTO emp VALUES(8,'nitin','manager',2000);
--Q1.1 WHERE NAME STARTS/ENDS WITH N
SELECT * FROM emp WHERE ename LIKE 'n%n';
--Q1.2 
SELECT * FROM emp WHERE ename RLIKE 'a|i' AND ename NOT RLIKE 'e';
--Q1.3
--Q1.4 all employees of job category avg < 1200
select * from emp where ejob IN (SELECT ejob FROM emp group by ejob having avg(esal)<1200);


-- Q2 PROCEDURES QUESTION
DECLARE
    n number := &n;
    product number;
BEGIN
    for i in 1..10 loop
     product := n * i;
     dbms_output.put_line(n||' * '||lpad(i,2,' ')
||' = '||lpad(product,3,' '));
    end loop;
END;

--Q3 FUNCTION QUESTION

CREATE FUNCTION Factorial ( @iNumber int )
RETURNS INT
AS
BEGIN
DECLARE @i  int

    IF @iNumber <= 1
        SET @i = 1
    ELSE
        SET @i = @iNumber * Factorial( @iNumber - 1 )
RETURN (@i)
END

--Q4 TRIIGERS QUESTION

CREATE TRIGGER [block_ddl]
    ON DATABASE Bank
    FOR ALTER_PROCEDURE, DROP_PROCEDURE, 
        ALTER_TABLE, DROP_TABLE, 
        ALTER_FUNCTION, DROP_FUNCTION, 
        ALTER_INDEX, DROP_INDEX, 
        ALTER_VIEW, DROP_VIEW,
        ALTER_TRIGGER, DROP_TRIGGER
    AS
    BEGIN
	ROLLBACK TRANSACTION
    END
    
