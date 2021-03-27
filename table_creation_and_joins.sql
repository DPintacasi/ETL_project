drop table revenue;
CREATE TABLE revenue (
	movie_title varchar(60), 
	release_date varchar(20),
	genre varchar(20),
	mpaa_rating varchar(20),
	total_gross bigint,
	inflation_adjusted_gross bigint,
	primary key (movie_title, release_date)
	);

drop table characters;
CREATE TABLE characters (
	movie_title varchar(60),
	hero varchar(20),
	villian varchar(20)
);

drop table directors;
CREATE TABLE directors (
	movie_title varchar,
	name varchar,
	primary key (movie_title, name)
);

drop table voice_actors;
CREATE TABLE voice_actors (
	movie_title varchar,
	character varchar,
	voice_actor varchar,
	primary key (movie_title, character)
);

--joins 
select r.movie_title, c.hero, c.villian, r.total_gross, r.inflation_adjusted_gross
from revenue r
join characters c 
on r.movie_title = c.movie_title;

select d.movie_title, 
		d.director, 
		r.release_date, 
		r.total_gross, 
		r.inflation_adjusted_gross 
from directors d
join revenue r
on d.movie_title = r.movie_title;

select d.director, 
		sum(r.total_gross) as total_gross, 
		sum(r.inflation_adjusted_gross) as inflation_adjusted_gross
from directors d
join revenue r
on d.movie_title = r.movie_title
group by director
order by sum(r.inflation_adjusted_gross) desc;




