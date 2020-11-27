use netflix_T;

ALTER TABLE dim_cast
MODIFY COLUMN id_cast int auto_increment;

select count(*) from facts f, dim_show e, dim_cast c, dim_cast_has_dim_actor a, dim_actor y
where f.show_info = e.id_show and e.id_cast = c.id_cast and c.id_cast = a.id_cast and a.id_actor = y.id_actor and y.actor = "Kenta Miyake";

select * from dim_cast_has_dim_actor ;

CREATE TABLE dim_show (
    id_show BIGINT NOT NULL,
    title VARCHAR(45),
    rating VARCHAR(45),
    release_year int,
    vuration VARCHAR(45),
    OrderNumber int NOT NULL,
    id_cast int,
    id_directors int,
    PRIMARY KEY (id_show),    
    FOREIGN KEY (id_cast) REFERENCES dim_cast(id_cast),
    FOREIGN KEY (id_directors) REFERENCES dim_directors(id_directors)
);

select b.title from facts a, dim_show b where b.id_show = a.show_info;
ALTER TABLE dim_show
DROP  OrderNumber;

delete a from facts a;

ALTER TABLE dim_show
add show_info BIGINT,
ADD FOREIGN KEY (show_info) REFERENCES dim_show(id_show);
