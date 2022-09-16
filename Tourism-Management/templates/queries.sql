\c tourism


select place from destination where country='India';

select vehicle_type from transportation;

select agent_name, contact_no from agent_contact as ac,agent as a where ac.agent_id = a.agent_id;

select customer_name from customer as c,destination as d where d.place = 'ooty' and c.dest_id = d.dest_id;

select * from hotels where hotel_rent = (select min(hotel_rent) from hotels);

select vehicle_id,vehicle_type from transportation where rate = (select min(rate) from transportation);


select customer_name from customer as c, destination as d where d.place = 'ooty' and d.dest_id = c.dest_id;

select hotel_name from hotels as h,destination as d where d.country = 'India' and d.dest_id = h.dest_id;

select agency_name,count(staff_id) from agency_staff as ast , agency as a group by a.agency_name,ast.agency_id,a.agency_id having ast.agency_id = a.agency_id;


