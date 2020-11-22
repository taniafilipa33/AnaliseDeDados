select * from facto_caso;
select * from provincia;
delete from provincia t where t.provincia = 'city';
select t.idPaciente , t.dataMorte from facto_caso t where t.estado='deceased';

select t.idPaciente , a.provincia from facto_caso t, provincia a where t.idCity=a.idCity and a.cidade='Busan';

select t.idPaciente, a.contact_number as Contactos from facto_caso t, infection_data a 
where t.idInfection_data = a.idInfection_data 
group by t.idPaciente 
order by Contactos desc;