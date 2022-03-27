show databases;
use film_library;

create table if not exists customer_details(
id varchar(10) not null primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
dob DATE,
email varchar(30) not null);

create table genre_details(
genre_id varchar(10) not null primary key,
genre varchar(30) not null);

create table films(
id varchar (5) not null primary key,
film_name varchar(100) not null, 
uk_release_date date,
genre varchar(20) not null,
film_summary text (1000) not null,
runtime time, 
age_rating varchar (10) not null);

create table if not exists film_rank(
id varchar(10) not null primary key,
source_name varchar(100),
rank_1 varchar (10),
rank_2 varchar (10),
rank_3 varchar (10),
rank_4 varchar (10),
rank_5 varchar (10),
foreign key(rank_1) references films(id),
foreign key(rank_2) references films(id),
foreign key(rank_3) references films(id),
foreign key(rank_4) references films(id),
foreign key(rank_5) references films(id),
web_source varchar(200));

create table loaned_items(
id int not null primary key auto_increment,
item_id varchar(10) not null,
user_id varchar(10) not null,
date_borrowed date not null,
date_due date not null,
date_returned date not null,
foreign key(item_id) references films(id),
foreign key(user_id) references customer_details(id));

insert into customer_details (id, first_name, last_name, dob, email)
values ('C0001','Natalie', 'Beddow', '1988-10-08', 'madeupemail1@gmail.com'),
('C0002','Nadia', 'Zia', '1990-12-01', 'madeupemail2@gmail.com'), 
('C0003','Lucy', 'Whitchurch', '1990-11-01', 'madeupemail3@gmail.com'),
('C0004', 'Fiona', 'Hogg', '1990-10-01', 'madeupemail4@gmail.com');

insert into films values ('F0001','The Power of the Dog','2021-11-19','Drama', 'Charismatic rancher Phil Burbank inspires fear and awe in those around him. When his brother brings home a new wife and her son, Phil torments them until he finds himself exposed to the possibility of love.', '02:06:00','R'),
('F0002','The Green Knight','2021-11-24','Adventurey','An epic fantasy adventure based on the timeless Arthurian legend, The Green Knight tells the story of Sir Gawain (Dev Patel), King Arthur\'s reckless and headstrong nephew, who embarks on a daring quest to confront the eponymous Green Knight, a gigantic emerald-skinned stranger and tester of men. Gawain contends with ghosts, giants, thieves, and schemers in what becomes a deeper journey to define his character and prove his worth in the eyes of his family and kingdom by facing the ultimate challenger. From visionary filmmaker David Lowery comes a fresh and bold spin on a classic tale from the knights of the round table.','02:10:00','R'),
('F0003','Petite Maman','2021-11-19','Drama','Nelly has just lost her grandmother and is helping her parents clean out her mothers childhood home. She explores the house and the surrounding woods. One day she meets a girl her same age building a treehouse.','01:12:00','U'),
('F0004','Drive My Car','2021-11-19','Drama','A renowned stage actor and director learns to cope with his wifes unexpected passing when he receives an offer to direct a production of Uncle Vanya in Hiroshima.','02:59:00','R'),
('F0005','Nomadland','2021-05-17','Drama','A woman in her sixties who, after losing everything in the Great Recession, embarks on a journey through the American West, living as a van-dwelling modern-day nomad.','01:47:00','R'),
('F0006','76 Days','2021-01-22','Documentary','Raw and intimate, this documentary captures the struggles of patients and frontline medical professionals battling the COVID-19 pandemic in Wuhan.','01:33:00','Unknown'),
('F0007',"'Qui Vadis, Aida?'",'2021-01-22','War','Bosnia, July 1995. Aida is a translator for the UN in the small town of Srebrenica. When the Serbian army takes over the town, her family is among the thousands of citizens looking for shelter in the UN camp. As an insider to the negotiations Aida has access to crucial information that she needs to interpret. What is at the horizon for her family and people - rescue or death? Which move should she take?','01:42:00','15'),
('F0008','Slalom','2021-02-12','Drama','This riveting, Cannes-selected #MeToo drama from debut filmmaker Charlène Favier follows the relationship between a teenage ski prodigy and her predatory instructor, played by frequent Dardenne brothers collaborator Jérémie Renier. In a breakthrough role, Noée Abita plays 15-year-old Lyz, a high school student in the French Alps who has been accepted to an elite ski club known for producing some of the country\'s top professional athletes. Taking a chance on his new recruit, ex-champion turned coach Fred decides to mold Lyz into his shining star despite her lack of experience. Under his influence, she will have to endure more than the physical and emotional pressure of the training. Will Lyz\'s determination help her escape Fred\'s exploitative grip?','01:32:00','18'),
('F0009','Woodlands Dark and Days Bewitched: A History of Folk Horror','2021-03-16','Documentary','WOODLANDS DARK AND DAYS BEWITCHED explores the folk horror phenomenon from its beginnings in a trilogy of films - Michael Reeves Witchfinder General (1968), Piers Haggards Blood on Satans Claw (1971) and Robin Hardys The Wicker Man (1973) - through its proliferation on British television in the 1970s and its culturally specific manifestations in American, Asian, Australian and European horror, to the genres revival over the last decade. Touching on over 100 films and featuring over 50 interviewees, WOODLANDS DARK AND DAYS BEWITCHED investigates the many ways that we alternately celebrate, conceal and manipulate our own histories in an attempt to find spiritual resonance in our surroundings.','03:14:00','18'),
('F0010','Luzzu','2022-05-13','Drama','A poor Maltese fisherman faces temptation to sell his wooden fishing boat and join a black-market operation that\'s decimating the Mediterranean fish population and the livelihoods of local families.','01:34:00','12'),
('F0011','Dune','2021-10-31','Science Fiction','Paul Atreides arrives on Arrakis after his father accepts the stewardship of the dangerous planet. However, chaos ensues after a betrayal as forces clash to control melange, a precious resource.','02:36:00','12'),
('F0012','Sound of Metal','2021-05-17','Drama','A heavy-metal drummer\'s life is turned upside down when he begins to lose his hearing and he must confront a future filled with silence.','02:00:00','15'),
('F0013','Minari','2021-05-07','Drama','A Korean American family moves to an Arkansas farm in search of its own American dream. Amidst the challenges of this new life in the strange and rugged Ozarks, they discover the undeniable resilience of family and what really makes a home.','01:55:00','PG-13'),
('F0014','West Side Story','2021-12-10','Musical','A musical in which a modern day Romeo and Juliet are involved in New York street gangs. On the harsh streets of the upper west side, two gangs battle for control of the turf. The situation becomes complicated when a gang members falls in love with a rival\'s sister','02:36:00','12-A'),
('F0015','Memoria','2021-01-14','Drama Fantasy','A Scottish woman, after hearing a loud bang at daybreak, begins experiencing a mysterious sensory syndrome while traversing the jungles of Colombia','02:16:00','PG'),
('F0016','The Worst Person in the World','2022-03-05','Romance','A young woman battles indecisiveness as she traverses the troubled waters of her love life and struggles to find her career path','02:08:00','R'),
('F0017','Licorice Pizza','2022-01-01','Romanc','Alana Kane and Gary Valentine grow up, run around, and fall in love in Californias San Fernando Valley in the 1970s.','02:13:00','R'),
('F0018','Zola','2022-01-30','Crime','Zola, a part-time stripper, meets and befriends a woman who informs her about a way to make easy money in Florida. However, their trip gradually turns into a sleepless odyssey','01:27:00','R'),
('F0019','Pig','2021/08/20','Thriller','Living alone in the Oregon wilderness, a truffle hunter returns to Portland to find the person who stole his beloved pig.','01:32:00','R');

insert into genre_details values
('GOO1', 'Drama'),
('GOO2', 'Adventurey'),
('G003', 'Documentary'),
('G004', 'War'),
('G005', 'Science Fiction'),
('G006', 'Musical'),
('G007', 'Drama'),
('G009', 'Romance'),
('G0010', 'Crime'),
('G0011', 'Thriller'),
('G0012', 'Fantasy');

insert into film_rank values
('S0001', 'The Guardian', 'F0001', 'F0002', 'F0003', 'F0004', 'F0005', 'https://www.theguardian.com/film/2021/nov/30/the-50-best-films-of-2021-in-the-uk'),
('S0002', 'Rotten Tomatoes', 'F0006', 'F0007', 'F0008', 'F0009', 'F0010', 'https://editorial.rottentomatoes.com/guide/2021-best-movies/'),
('S0003', 'Empire Online', 'F0011', 'F0012', 'F0013', 'F0005', 'F0014', 'https://www.empireonline.com/movies/features/best-movies-2021/'),
('S0004', 'IndieWire', 'F0015', 'F0016', 'F0017', 'F0004', 'F0001', 'https://www.indiewire.com/gallery/50-best-movies-2021-critics-poll/'),
('S0005', 'Thrillist', 'F0017', 'F0018', 'F0016', 'F0019', 'F0001', 'https://www.thrillist.com/entertainment/nation/best-movies-of-2021');

insert into loaned_items values
(1, 'F0001', 'C0001', '2022-01-22', '2022-02-12', '2022-02-11'),
(2, 'F0002', 'C0001', '2022-01-22', '2022-02-12', '2022-01-31'),
(3, 'F0013', 'C0001', '2022-01-22', '2022-02-12', '2022-01-31'),
(4, 'F0013', 'C0003', '2022-02-01', '2022-02-22', '2022-02-10'),
(5, 'F0017', 'C0002', '2022-02-02', '2022-02-23', '2022-03-01'),
(6, 'F0019', 'C0002', '2022-03-21', '2022-04-11', '2022-04-09'),
(7, 'F0012', 'C0004', '2022-03-21', '2022-04-11', '2022-04-25'),
(8, 'F0009', 'C0004', '2022-03-21', '2022-04-11', '2022-04-21'),
(9, 'F0005', 'C0001', '2022-05-26', '2022-06-16', '2022-06-10'),
(10, 'F0001', 'C0001', '2022-02-11', '2022-03-04', '2022-03-04'),
(11, 'F0019', 'C0002', '2022-04-09', '2022-04-30', '2022-05-03'),
(12, 'F0005', 'C0001', '2022-06-10', '2022-07-01', '2022-06-26'),
(13, 'F0012', 'C0004', '2022-04-25', '2022-05-16', '2022-05-26'),
(14, 'F0011', 'C0003', '2022-03-27', '2022-04-17', '2022-04-17'),
(15, 'F0015', 'C0003', '2022-03-27', '2022-04-17', '2022-04-06'),
(16, 'F0017', 'C0003', '2022-01-01', '2022-01-22', '2022-01-18');


select * from genre_details;
select * from film_rank;
select * from films;
select * from genre_details;
select * from loaned_items;