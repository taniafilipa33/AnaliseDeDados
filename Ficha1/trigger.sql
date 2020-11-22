delimiter |
CREATE TRIGGER mydb.trigge 
    AFTER UPDATE
	ON mydb.país
    for each row
    BEGIN   
        update testdata set testingRate = (testdata.nTestes / (select tp.populacao from país tp where tp.idPaís = testdata.País_idPaís)) * 100000;
    END;
 |

delimiter ;   

DROP TRIGGER mydb.trigge; 
 
 select * from país;
select *from testData;

INSERT INTO date (idDate,mortes,nCasos,idSemana,dia,mes,ano,idPais,comulative14days) VALUES ('2020-02-11 22:17:49',0,0,7,11,2,2020,'DE',001445449);
UPDATE país set populacao = 8858775 where idPaís='AT';
INSERT INTO testdata (País_idPaís,idSemana,testingRate,positivityRate,source,nTestes) VALUES ('AT',1,0,2.6786,'Manual webscraping',4444);