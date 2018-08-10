


DDL SCRIPT



create schema Jewellery_Shop;

set search_path to Jewellery_Shop;

create table Admin(
		username varchar(50),
		password varchar(10),
		primary key(username)
          );

create table Employee(
		eid integer  primary key,
		ename varchar(50) NOT NULL,
		phone_no integer NOT NULL,
		type varchar(50) NOT NULL,
		salary integer NOT NULL,
		password varchar(20) NOT NULL,
		email varchar(50) NOT NULL
	);	     

create table Employee_Transaction
(
 	eid integer references Employee(eid),
	advanced_payment integer,
	salary_paid integer,
	date date,
	primary key(eid,date)
);

create table Supplier(
	sid integer primary key,
	phone_number integer,
	name varchar(30), 
	city varchar(20) 
);

create table Supplier_Accounting(
	sid integer  references Supplier(sid),
	S_transid integer primary key,
	S_transdate date, 
     goldp numeric(8,3),         
     silverp numeric(8,3),       
 
);

create table Mortage(
	mid integer primary key,
	product_name varchar(20),
	weight numeric(10,3), 
      customer_name varchar(50),
	date_of_submission date,
	price integer,
	phone_no integer                 
);

create table Mortage_Transaction(
	mid integer references Mortage(mid),
m_transid integer primary key,    //alter remaining,interest_paid
	amount integer, 
	m_transdate date,
	remaining integer;
	interest_paid  integer;
);

create table Scheme(
	Scheme_id integer primary key,
	duration integer,
	installment integer,
	return_amount integer,
	scheme_name varchar(30);
);

create table Customer(
	cid integer primary key,
	cphone_no integer,
	c_email varchar(50),
	c_city varchar(20),
	c_locality varchar(50),
	c_name varchar(50) 
);


create table Customer_Scheme(
	cid integer references Customer(cid),
	sid integer references Scheme(Scheme_id), \\\\alter krna he 
	start_date date
	);

create table Scheme_transaction(
	s_transid integer primary key,
	paid integer,
	date date,
	schemeid references Customer_Scheme(sid),
	cid references Customer_Scheme(cid)
	);

     create table product(
	pid integer primary key,
	name varchar(50),
	material varchar(10),
	style varchar(30),
     percentage numeric(3,1),
	weight numeric(10,3),
	no_peices integer
	);

	create table Billing(
	bill_id integer primary key,
	cid integer references Customer(cid),
	discount integer,
	payable integer,
     net_profit integer,
	cash integer,
	silver_return integer,
	gold_return integer
	);

	create table Customer_Transaction(
	cid integer references Customer(cid),
	c_transid integer primary key,
	remaining integer,
	amount integer,
     date date,
	bill_id integer references Billing(bill_id)
     );

     create table Product_Info(
	bill_id integer references Billing(bill_id),
	pid integer references Product(pid),
	price/10g numeric(8,2),
	wastage integer,
     labour integer,
	price_total integer,
	quantity integer
     );


create table M_product_info(mid integer references mortgage(mid),
                            pname varchar(30),
                            weight numeric(8,3),
                            quantity integer,
                            material varchar(10));




//ADMIN


INSERT INTO Admin VALUES ('Rajat_Soni','12345678')
INSERT INTO Admin VALUES ('Ayush_Saxena','12345678')
INSERT INTO Admin VALUES ('Urvashi_Meena','12345678')
INSERT INTO Admin VALUES ('Monika_Singh','12345678')



//EMPLOYEE


INSERT INTO Employee(ename,phone_no,email,salary,password,type) VALUES('Sumit',7654322212,'sumit@gmail.com',10000,'1010','Accountant')
INSERT INTO Employee(ename,phone_no,email,salary,password,type) VALUES('Amit',7123322214,'amit@gmail.com',2000,'100','Cleaner')
INSERT INTO Employee(ename,phone_no,email,salary,password,type) VALUES('Abhi',7145672212,'abhi@gmail.com',4000,'101','Worker')
INSERT INTO Employee(ename,phone_no,email,salary,password,type) VALUES('Vineet',9898321315,'vineet@gmail.com',12000,'1234','Manager')



//EMPLOYEE_TRANSACTION

INSERT INTO jewellery_shop.employee_transaction
(eid,transid,advanced_payment, salary_paid, transaction_date)
VALUES(1,201,0,10000,'05/01/2016'),
(2,202,0,2000,'05/01/2016'),
(3,203,0,4000,'05/01/2016'),
(4,204,0,12000,'05/01/2016'),
(1,205,4000,0,'05/21/2016'),
(1,206,2000,8000,'06/02/2016'),
(2,207,0,2000,'06/02/2016'),
(3,208,0,4000,'06/02/2016'),
(4,209,6000,12000,'06/02/2016'),






//supplier

INSERT INTO supplier(sid,name,phone_number,city) (1,'Vivek',75685854,'Baswada'),
(2,'Sunil',75234854,'Bagidora'),
(3,'Hitesh',72667854,'Chittorhgadh'),
(4,'Pala',9225854,'Udaipur'),
(5,'purvi',92275854,'jaipur');




//supplier_Accounting

INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(401,1,1000.25,0,'06/1/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(402,1,501,0,'08/18/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(403,1,10250.25,0,'09/25/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(404,1,10000,0,'11/18/2016');

INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(405,2,1000.25,0,'07/01/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(406,2,1025.11,0,'07/25/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(407,2,1000,0,'08/06/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(408,2,1500.25,0,'10/10/2016');

INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(409,3,0,10000.25,'06/10/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(410,3,0,15000,'07/06/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(411,3,0,20000.72,'08/08/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(412,3,0,10000,'9/10/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(413,3,0,25000,'10/10/2016');


INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(414,4,0,10250,'06/25/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(415,4,0,10000,'07/20/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(416,4,0,12000,'08/24/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(417,4,0,16000,'09/27/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(418,4,0,18000,'10/19/2016');


INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(419,5,1000,2500,'06/08/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(420,5,1500,2000,'08/10/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(421,5,1000,2000,'09/01/2016');
INSERT INTO Supplier_Accounting(s_transid,sid,goldp,silverp,s_transdate) VALUES(422,5,1000,2200,'11/15/2016');




////Mortgage

INSERT INTO MORTGAGE(mid,customer_name,date_of_submission,price,phone_no,city)
values(601,'monika singh','06/01/2016',50000,76986919,'visakhapatnam'),
(602,'urvashi meena','08/05/2016',40000,76986928,'udaipur'),
(603,'ayush saxena','10/10/2016',30000,76986917,'rajkot'),
(604,'rajat soni','12/15/2016',20000,76986916,'banswara'),
(605,'surbhi jain','02/20/2017',10000,76992115,'jabalpur');





///Mortgage Transaction

INSERT INTO MORTGAGE_transaction(m_transid,mid,amount,m_transdate,remaining,interest_paid)
values(801,601,5000,'07/02/2016',45000,500),
(802,601,10000,'08/07/2016',35000,450),
(803,601,20000,'10/29/2016',15000,350),
(804,605,5000,'03/16/2017',5000,100),
(805,605,5000,'04/14/2016',0,50),
(806,603,10000,'12/02/2016',20000,300),
(807,603,5000,'07/02/2016',15000,200);

//SCHEME 

INSERT INTO Scheme(Scheme_id,duration,installment,return_amount,scheme_name)


VALUES (101,6,2000,14000,'6-month-plan1'),
(102,12,5000,65000,'1-year plan1'),
(103,24,3000,80000,'2-years plan'),
(104,6,2000,14000,'6-months plan2'),
(105,12,1000,13000,'1-year plan2');



//////customer
INSERT INTO customer(cid,cphone_no,c_email,c_city,c_locality,c_name)

VALUES (1,943874838,'moni@gmail.com','SKagen 21','Stavanger','Monica singh'),
(2,943874838,'ushu@gmail.com','udaipur','ashok nagar','urvashi'),
(3,768692119,'ayush@gmail.com','rajkot','pethapur','Ayush Saxena'),
(4,768692116,'rajo@gmail.com','Bhilwada','infocity','Rajat soni'),
(5,,'ushu@gmail.com','udaipur','ashok nagar','urvashi'),
(6,768692119,'ayush@gmail.com','rajkot','pethapur','Ayush Saxena'),
(7,768692115,'riya@gmail.com','hyderabad','amirpeth','riya samuel'),
(8,768692116,'rajo@gmail.com','Bhilwada','infocity','Rajat soni'),
(9,768692114,'shefali@gmail.com','jodhpur','kalapur','shefali soni'),
(10,768692113,'sakshee@gmail.com','jabalpur','pritampura','sakshee jain'),
(11,768692111,'sharmu@gmail.com','dholakua','sardiwada','sakshee sharma'),
(12,768692101,'dubey@gmail.com','jodhpur','sec 28','tarun dubey'),
(13,768692102,'pankaj@gmail.com','hyderabad','ganesh nagar','pankaj mitry'),
(14,78692103,'aashu@gmail.com','jodhpur','kalka mata road','aashutosh singh'),
(15,78692104,'priya@gmail.com','udaipur','sec 45','priyanka meena'),
(16,78692105,'gayu@gmail.com','udaipu','sec 43','subramaniam gayathri'),
(17,798692106,'surbhi@gmail.com','udaipur','randheja','surbhi jain'),
(18,78692107,'diksha@gmail.com','udaipur','guruwada','diksha chaudhary'),
(19,78692108,'sid@gmail.com','jabalpur','suravada','sidharth jain'),
(20,78692109,'yash@gmail.com','jabalpur','bora ganesh','yash ladha'),
(21,78692104,'niranjan@gmail.com','delhi','gift city','niranjan chaudhary'),
(22,78692103,'abhi@gmail.com','delhi','gift city','ABHIMANYU MEENA'),
(23,78692102,'ishita@gmail.com','rajkot','kranti nagar','ishita das'),
(24,798692001,'pritha@gmail.com','rajkot','urvi nagar','pritha upadhyay'),
(25,78692002,'monisha@gmail.com','Bhilwada','pethanagar','monisha wamankar'),
(26,786921003,'sneha@gmail.com','hyderabad','sec 12','sneha bisht'),
(27,769921004,'kriti@gmail.com','chittor','boring road','kriti singhal'),
(28,769861004,'sonum@gmail.com','udaipur','sec 12','sidharth jain'),
(29,76986926,'sashi@gmail.com','Bihar','sec 48','sashi bhushan'),
(30,76986107,'golu@gmail.com','jaipur','kori area','tarun jain'),






////customer_scheme




INSERT INTO jewellery_shop.customer_scheme(
	cid, sid, start_date, purchased)
	VALUES (25,102,'10/17/2016',false);
	(9,101,'05/02/2016',true),
	(9,104,'05/02/2016',true),
	(11,103,'05/12/2016',false),
	(17,102,'07/20/2016',false),
	(21,105,'07/30/2016',false),
	(26,101,'08/04/2016',false);



//scheme_transaction

INSERT INTO jewellery_shop.scheme_transaction(
	s_transid, paid, date, schemeid, cid, penalty)
	VALUES (901,2000,'05/02/2016',101,9,0),
    (902,3000,'05/02/2016',104,9,0),
    (903,10000,'05/12/2016',103,11,0),
    (904,2000,'06/07/2016',101,9,0),
    (905,3000,'06/07/2016',104,9,0),
    (906,2000,'07/05/2016',101,9,0),
    (907,3000,'07/05/2016',104,9,0),
    (910,7000,'07/20/2016',102,17,0),
    (911,3000,'07/30/2016',105,21,0),
    (912,2000,'08/04/2016',101,26,0),
    (913,2000,'08/04/2016',101,9,0),
    (914,3000,'08/04/2016',104,9,0),
    (915,3000,'09/1/2016',105,21,0),
    (916,2000,'09/06/2016',101,9,0),
    (917,3000,'09/06/2016',104,9,0),
    (918,7000,'09/22/2016',102,17,0),
    (919,4000,'10/02/2016',101,26,40),
    (920,2000,'10/03/2016',101,9,0),
    (921,3000,'10/03/2016',104,9,0),
    (922,10000,'10/04/2016',103,11,400),
    (923,7000,'10/17/2016',102,25,0),
    (924,2000,'11/06/2016',101,26,0),
    (925,3000,'11/06/2016',105,21,0);





product/////



INSERT INTO  Product(pid,name,material,style,percentage,weight,no_peices)

VALUES (501, 'Haar', 'gold','rajkoti_haar',91.6,350.89,15),
(502, 'Haar', 'gold', 'italian_haar', 91.6,500.12,20),
(503, 'ring_ladies', 'gold','normal',91.6,273.5,50),
(504, 'ring_gents', 'gold','Dhalma',91.6,147.23,25),
(505, 'earings', 'gold','hanging',91.6,170.6,30),
(506, 'earings', 'gold','tops',91.6,112,50),
(507, 'anklet', 'silver','MBR',72,3215.7,50),
(508, 'anklet', 'silver','CB',80,2943.32,40),
(509, 'chain', 'gold','sadak',91.6,275.89,22),
(510, 'chain', 'gold','highway',91.6,192.43,18),
(511, 'chain', 'gold','lotus',91.6,225.73,20),
(512,'bangles', 'gold','normal',91.6,420.5,10),
(513, 'bajubandh', 'gold','normal',91.6,287.72,10),
(514, 'bracelet_ladies', 'silver','normal',80,1325.2,40),
(515, 'bracelet_gents', 'silver','normal',72,1892.4,40),
(516, 'mangalsutra', 'gold','normal',91.6,150.6,12),
(517, 'bichhiya', 'silver','normal',72,4350.5,150),
(518, 'kamarbandh_ladies', 'silver','normal',80,6456.6,20),
(519, 'kamarbandh_gents', 'silver','normal',80,5230.4,10),
(520, 'nath', 'gold','normal',67,90.2,150);




//Billing

INSERT INTO Billing(bill_id,cid,discount,payable,net_profit,cash,silver_return,gold_return,date)

VALUES (701,2,69,100500,8500,30000,0,25000,'06/12/2016'),
(702,3,20,1570,150,1570,0,0,'07/17/2016'),
(703,1,102,62700,6000,40000,3000,9500,'07/22/2016'),
(704,8,310,196750,15200,196750,0,0,'07/22/2016'),
(705,2,6,2350,100,2000,0,0,'07/22/2016'),
(706,20,0,838,120,838,0,0,'10/08/2016'),
(707,24,188,99100,6120,60000,1220,10200,'12/12/2016');





//customer_transaction



INSERT INTO customer_transaction (cid,c_transid,remaining,amount,date,bill_id)
   
VALUES (2,301,45500,55000,'06/12/2016',701),
(2,302,35000,10500,'06/25/2016',701),
(3,303,0,1590,'07/17/2016',702),
(1,304,10200,52500,'07/22/2016',703),
(2,305,30000,5000,'07/22/2016',701),
(8,306,0,196750,'07/22/2016',704),
(2,307,350,2000,'07/22/2016',705),
(2,308,10000,20000,'07/28/2016',701),
(2,309,0,10000,'08/25/2016',701),
(2,310,0,350,'08/25/2016',705),
(1,311,5000,5200,'08/30/2016',703),
(1,312,0,5200,'09/22/2016',703),
(20,313,0,838,'10/08/2016',706),
(24,314,22680,71420,'12/12/2016',707);






/// product_info

INSERT INTO Product_Info(pid,bill_id,price_per_10g,wastage,labour,price_total,
quantity,weight)

VALUES 
(501,701,28500,102,5000,78052,1,25.73),
(503,701,28500,102,1500,22517,2,7.23),
(508,702,420,0,120,1590,1,35.2),
(510,703,29200,102,2400,38140,1,12),
(519,703,450,0,2500,24662,1,492.5),
(516,704,29200,102,8400,133492,2,42),
(511,704,29200,102,4000,63568,1,20),
(520,705,29200,0,50,2356,1,0.79),
(517,706,410,0,100,838,3,18),
(512,707,27300,102,5600,84209,1,28.23),
(508,707,420,0,150,15078,1,34);












INSERT INTO M_PRODUCT_INFO(mid,pname,weight,material,quantity)
values(601,'haar',30,'gold',1),
(602,'magalsuthra',100,'gold',1),
(601,'anklet',100,'silver',3),
(603,'bracelet',200,'silver',5),
(602,'haar',25.73,'gold',1),
(604,'ladies_ring',2.2,'gold',4),
(605,'bajubandh',15,'gold',2);




////////////////////////////////////STORED PROCEDURE////////////////////////////////////



set search_path to jewellery_shop;
1)Autoincrement



create or replace function autoincrement_id( ) returns integer  as $$
DECLARE
a1 int;
BEGIN

     select max(cid) into a1  from  customer;

      a1=a1+1;

     return a1;

END    

  $$ LANGUAGE plpgsql;



2)Username must be unique


create or replace function check_username( user_name varchar(50 ) ) returns boolean  as

$BODY$
DECLARE
a1 varchar(50) ;
BEGIN

     LOOP

            for select username into a1 from admin; 

                        if username=user_name

                                    return true;

                            else

                                    return false;

                        end if;

END    

  $BODY$ LANGUAGE plpgsql;


3)FOR LOGIN(if username and password are in admin table the succefully login otherewise give error) 


create or replace function validity(user_name varchar(50),pass_w varchar(50)) returns integer as
$BODY$
DECLARE
f int ; 
BEGIN
     		       select count(username) into f count(password) into g from admin where (username = user_name) AND (password=pass_w);
                        if f=1 and g=1 then
                                    return 1;
                        else
                                    return 0;
                        end if;
           
END $BODY$ LANGUAGE plpgsql;


4)To check whether the date is correct or not.



create or replace function re(Date date) returns boolean  as $$
DECLARE
a1 int; a2 int; a3 int; a4 int; a5 int; a6 int;
BEGIN
select  SUM(extract(day from Date))into a1;
select  SUM(extract(month from Date))into a2;
select  SUM(extract(year from Date))into a3;
 
if a1>1 AND a1<31 AND a2>1 AND a2<12 AND a3>2014 AND a3<2017 then
  return true;
 else
  return false;
  end if;
 end
 $$ LANGUAGE plpgsql;






