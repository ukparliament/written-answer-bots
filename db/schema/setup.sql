drop table if exists written_statements;
drop table if exists members;
drop table if exists questions;
drop table if exists answering_bodies;
drop table if exists written_statements;

create table answering_bodies (
	id serial,
	mnis_id int not null,
	name varchar(255) not null,
	primary key (id)
);

create table members (
	id serial,
	mnis_id int not null,
	display_name varchar(255) not null,
	handle varchar(255),
	primary key (id)
);

create table questions (
	id serial,
	question_id int not null,
	asking_member_id int not null,
	house varchar(20) not null,
	member_interest boolean default false,
	date_tabled date not null,
	uin varchar(20) not null,
	question_text text not null,
	is_named_day boolean default false,
	is_holding_answer boolean default false,
	is_correcting_answer boolean default false,
	answering_member_id int not null,
	correcting_member_id int,
	date_answered date not null,
	answer_text text not null,
	original_answer_text text,
	comparable_answer_text text,
	date_answer_corrected date,
	date_answer_holding date,
	heading varchar(255),
	pertinent_date date not null,
	answering_body_id int not null,
	tweeted boolean default false,
	constraint fk_answering_body foreign key (answering_body_id) references answering_bodies(id),
	primary key (id)
);

create table written_statements (
	id serial,
	made_on date not null,
	uin varchar(20) not null,
	title varchar(255) not null,
	house_name varchar(20) not null,
	member_role varchar(255) not null,
	member_id int not null,
	answering_body_id int not null,
	posted_to_mastodon boolean default false,
	posted_to_bluesky boolean default false,
	constraint fk_member foreign key (member_id) references members(id),
	constraint fk_answering_body foreign key (answering_body_id) references answering_bodies(id),
	primary key (id)
);