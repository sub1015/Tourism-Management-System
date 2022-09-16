\c tourism 


create user user_customer with password 'psd1' createdb;
grant all on customer, payment, feedback to user_customer;
grant select on destination, hotels, transportation,agency to user_customer;
 

create user user_agency with password 'agency123' createdb;
grant select on customer, payment, feedback to user_agency;
grant all on agent,agency, destination, hotels, transportation to user_agency;

create user user_staff with password 'staff123' createdb;
grant select on agency to user_staff;
grant all on staff to user_staff;
