use mydb;

select e.idPaís as País, (select sum(m.nTestes) from país t , testData m 
where t.idPaís = m.País_idPaís and e.idPaís = t.idPaís ) as totalTestes from país e
group by e.idPaís
order by totalTestes desc;

select e.idPaís as País, (select sum(m.mortes) from país t , date m 
where t.idPaís = m.idPais and e.idPaís = t.idPaís ) as totalMortes from país e
group by e.idPaís
order by totalMortes desc;

select e.idPaís as País, (select sum(m.nCasos) from país t , date m 
where t.idPaís = m.idPais and e.idPaís = t.idPaís ) as totalCasos from país e
group by e.idPaís
order by totalCasos desc;

select sum(m.nTestes) as ola from testData m where m.País_idPaís = 'UK';

select sum(m.mortes) as ola from date m where m.idPais = 'UK';
select sum(m.nCasos) as ola from date m where m.idPais = 'UK';
select * from testdata;