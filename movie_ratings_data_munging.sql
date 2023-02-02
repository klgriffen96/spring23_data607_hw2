# Inspect the data     
SELECT * FROM movie_ratings;

DROP TABLE IF EXISTS movie_ratings_unpivot;

# Create new table
CREATE TABLE movie_ratings_unpivot(
    s_name char(255), 
    movie char(255),
    rating char(255)
)
; 
# I learned how to unpivot in sql from this stackoverflow example
# https://stackoverflow.com/questions/15184381/mysql-how-to-unpivot-columns-to-rows
# Option 1 - Unions - I am using this option
insert into movie_ratings_unpivot
select s_name, 'avatar' movie, avatar rating
from movie_ratings
union all
select s_name, 'inception' movie, inception rating
from movie_ratings
union all
select s_name, 'rodents' movie, rodents rating
from movie_ratings
union all
select s_name, 'harry_potter' movie, harry_potter rating
from movie_ratings
union all
select s_name, 'top_gun_maverick' movie, top_gun_maverick rating
from movie_ratings
union all
select s_name, 'causeway' movie, causeway rating
from movie_ratings
ORDER BY s_name, movie;

# Option 2 just for documentation - unions in different format
/*
select t.s_name,
  c.movie,
  case c.movie
    when 'avatar' then avatar
    when 'inception' then inception
    when 'rodents' then rodents
    when 'harry_potter' then harry_potter
	when 'top_gun_maverick'  then top_gun_maverick
    when 'causeway' then causeway
  end as rating
from movie_ratings t
cross join
(
  select 'avatar' as movie
  union all select 'inception'
  union all select 'rodents'
  union all select 'harry_potter'
  union all select 'top_gun_maverick'
  union all select 'causeway'
) c
ORDER BY t.s_name, movie;
*/
# Update rating values
SET SQL_SAFE_UPDATES = 0;

UPDATE movie_ratings_unpivot
SET rating = NULL
WHERE rating LIKE '%I did not watch this movie%';

UPDATE movie_ratings_unpivot
SET rating = 1
WHERE rating LIKE '%1%';

UPDATE movie_ratings_unpivot
SET rating = 2
WHERE rating LIKE '%2%';

UPDATE movie_ratings_unpivot
SET rating = 3
WHERE rating LIKE '%3%';

UPDATE movie_ratings_unpivot
SET rating = 4
WHERE rating LIKE '%4%';

UPDATE movie_ratings_unpivot
SET rating = 5
WHERE rating LIKE '%5%';

# Clean up NULLS
DELETE FROM movie_ratings_unpivot 
WHERE rating IS NULL;

SELECT * FROM movie_ratings_unpivot;



