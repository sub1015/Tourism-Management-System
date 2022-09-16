\c tourism

INSERT into destination values ('643001','ooty','India'),('530068','Bengaluru','India'),('199011','Sentosa Island','Singapore'),('67301','California','USA'),('123456','Tamil Nadu','India');

INSERT into agency values ('agc001','ooty days'),('agc002','Bengaluru Holidays'),('agc003','Island Luxury'),('agc004','Star Time'),('agc005','Pongal Travels');

INSERT into customer values ('c1000','nandana','ndna001@gmail.com','643001','agc001'),('c1001','naveen','naveen@gmail.com','530068','agc002'),('c1002','ram','ram234@gmail.com','199011','agc003'),('c1003','shyam','shyam56ty@gmail.com','67301','agc004'),('c1004','rakesh','rakesh@gamil.com','123456','agc005');

INSERT into agent values ('agn001','subramanya','yes'),('agn002','suresh','yes'),('agn003','suryakumar','yes'),('agn004','michael','yes'),('agn005','Palan','no');

 INSERT into transportation values ('KA0001',1000,'bus'),('KA0002',2500,'car'),('KA0003',4900,'ship'),('KA0004',15400,'aeroplane'),('KA0005',2400,'bus');

 INSERT into transportation values ('KA0006',2500);

 INSERT into hotels values ('ht001','taj',5,3000,'643001'),('ht002','bengaluru star',4,4500,'530068'),('ht003','Sing Days',5,8400,'199011'),('ht004','Chill and enjoy',5,19600,'67301'),('ht005','Pongal Express',4,4000,'123456');

 INSERT into payment values ('pay001','2021-10-28',10000,'c1000'),('pay002','2021-10-27',14000,'c1001'),('pay003','2021-10-27',20000,'c1002'),('pay004','2021-10-26',54000,'c1003'),('pay005','2021-10-27',13000,'c1004');

 INSERT into staff values ('st001','rajesh','rajesh@gmail.com','rajesh123'),('st002','ramesh','ramesh@gmail.com','ramesh123'),('st003','mohith','mohith@gmail.com','mohith123'),('st004','manish','manish@gmail.com','manish123'),('st005','kalyan','kalyan@gmail.com','kalyan123');

 INSERT into feedback values ('fd001',3,'c1000'),('fd002',4,'c1001'),('fd003',4,'c1002'),('fd004',5,'c1003'),('fd005',4,'c1004');

 INSERT into adverstisement values ('ad001','agc001'),('ad002','agc002'),('ad003','agc003'),('ad004','agc004'),('ad005','agc005');

 INSERT into agency_staff values('agc001','st001'),('agc002','st002'),('agc003','st003'),('agc004','st004'),('agc005','st005');

 INSERT into agency_agent values('agc001','agn001'),('agc002','agn002'),('agc003','agn003'),('agc004','agn004'),('agc005','agn005');

 INSERT into agent_contact values('9839239232','agn001'),('8456712345','agn002'),('4567016744','agn003'),('7890789012','agn004'),('6512905678','agn005');

 INSERT into customer_contact values('928102193','c1000'),('1234567890','c1001'),('9445678901','c1002'),('9845034567','c1003'),('8045703217','c1004');

 INSERT into agent_transport values('agn001','KA0001'),('agn002','KA0002'),('agn003','KA0003'),('agn004','KA0004'),('agn005','KA0005');

update agent 
set availibility = 'no'
where agent_id in
(select agent_id from  agency_agent 
where agency_id in (select agency_id from customer));
