drop table if exists Fiera;
drop table if exists Area;
drop table if exists Collegamento;
drop table if exists Stand;
drop table if exists Articolo;
drop table if exists Vendita;
drop table if exists Tematica;
drop table if exists Tema;
drop table if exists Visita;
drop table if exists Persona;
drop table if exists Biglietto;

create table Fiera (
	Nome			VARCHAR(50)	 	not null,
	Anno			int			 	not null,
	Città			varchar(50)	 	not null,
	CapienzaTotale	int			 	,
	primary key(Nome, Anno)
);

create table Area (
	Codice			VARCHAR(4)		primary key,
	Esterno			bool			not null,
	CapienzaPersone int				,
	CapacitàStand   int				,
	Fiera			varchar(50)		not null,
	Anno			int				not null,
	foreign key (Fiera, Anno) references Fiera(Nome, Anno) on update cascade on delete cascade
);

create table Collegamento (
	Area1		   varchar(4)	   	not null,
	Area2		   varchar(4)	   	not null,
	primary key(Area1, Area2),
	foreign key(Area1) references Area(codice) on update cascade on delete cascade,
	foreign key(Area2) references Area(codice) on update cascade on delete cascade
);

create table Stand (
	ID				varchar(8)		primary key,
	Nome			varchar(50)		not null,
	Area			varchar(4)		not null,
	foreign key(Area) references Area(codice) on update cascade on delete cascade
);

create table Articolo (
	NumeroSerie 	varchar(32)	   	not null,
	Nome			varchar(50)	  	not null,
	Prezzo		  	decimal(4,2)   	not null,
	primary key(NumeroSerie, Nome)
);

create table Vendita(
	Stand		   	varchar(8)	   	not null,
	Articolo		varchar(32)	   	not null,
	Nome			varchar(50)	   	not null,
	Quantità		int			 	not null,
	primary key(Stand, Articolo, Nome),
	foreign key(Stand) references Stand(ID) on update cascade on delete cascade,
	foreign key(Articolo, Nome) references Articolo(NumeroSerie, Nome) on update cascade on delete cascade
);

create table Tema(
	Nome			varchar(50)	   	not null,
	DataUscita	  	date			not null,
	Autore		  	varchar(50)		not null,
	Tipo			varchar(50)		not null,
	primary key(Nome, DataUscita)
);

create table Tematica(
	Stand		   	varchar(8)	   	not null,
	Tema			varchar(50)	   	not null,
	Data			date			not null,
	primary key(Stand, Tema, Data),
	foreign key(Stand) references Stand(ID) on update cascade on delete cascade,
	foreign key(Tema, Data) references Tema(Nome, DataUscita) on update cascade on delete cascade
);

create table Persona(
	CF				varchar(16)		primary key,
	Nome			varchar(50)		not null,
	Cognome			varchar(50)		not null,
	DataNascita		date			not null,
	Stato			varchar(20)		not null,
	Città			varchar(30)		not null,
	CAP				int				not null,
	Via				varchar(20)		not null,
	N_Civico		int				not null,
	Mail			varchar(30)		not null,
	Telefono		varchar(20)		not null,
	Tipo			varchar(50)		not null,
	Giornale		varchar(50)		,
	Scuola			varchar(50)		,
	Personaggio		varchar(50)		,
	Settore			varchar(50)		,
	Stipendio		decimal(7,2)	,
	Staff			bool			,
	Biglietto		varchar(16)		not null
);

create table Visita(
	Persona			varchar(16)		not null,
	Fiera			varchar(50)		not null,
	Anno			int				not null,
	primary key(Persona, Fiera, Anno),
	foreign key(Persona) references Persona(CF) on update cascade on delete cascade,
	foreign key(Fiera, Anno) references Fiera(Nome, Anno) on update cascade on delete cascade
);

create table Biglietto(
	Codice			varchar(16)		primary key,
	Data			date			not null,
	Validità		date			not null,
	Prezzo			decimal(5,2)	not null,
	Tipo			varchar(50)		not null,
	Persona			varchar(16)		not null,
	foreign key(Persona) references Persona(CF) on update cascade on delete cascade
);
alter table Persona
add foreign key(Biglietto) references Biglietto(Codice) on update cascade on delete cascade



-- inserts

insert into area (codice, esterno, capienzapersone, capacitàstand, fiera, anno) values
("A346", true, null, 20, "Romics", 2021),
("A493", false, 1000, 20, "Romics", 2021),
("A648", false, 1000, 20, "Romics", 2021),
("A164", true, null, 20, "Romics", 2021),
("A365", true, null, 20, "Etna Comics", 2021),
("A446", true, null, 20, "Etna Comics", 2021),
("A576", false, 1000, 20, "Etna Comics", 2021),
("A393", false, 1000, 20, "Etna Comics", 2021),
("A865", true, null, 20, "Lucca Comics", 2021),
("A745", false, 1000, 20, "Lucca Comics", 2021),
("A336", true, null, 20, "Lucca Comics", 2021),
("A565", false, 1000, 20, "Lucca Comics", 2021),
("A242", false, 1000, 20, "Milan Games Week", 2021),
("A785", false, 1000, 20, "Milan Games Week", 2021),
("A764", true, null, 20, "Milan Games Week", 2021),
("A003", true, null, 20, "Milan Games Week", 2021),
("A459", false, 1000, 20, "Napoli Comicon", 2021),
("A085", true, null, 20, "Napoli Comicon", 2021),
("A400", true, null, 20, "Napoli Comicon", 2021),
("A451", false, 1000, 20, "Napoli Comicon", 2021),
("A350", true, null, 20, "Modena Nerd", 2021),
("A056", false, 1000, 20, "Modena Nerd", 2021),
("A392", true, null, 20, "Modena Nerd", 2021),
("A472", false, 1000, 20, "Modena Nerd", 2021),
("A452", true, null, 20, "GameCom Pordenone", 2021),
("A463", true, null, 20, "GameCom Pordenone", 2021),
("A046", false, 1000, 20, "GameCom Pordenone", 2021),
("A653", false, 1000, 20, "GameCom Pordenone", 2021),
("A754", false, 1000, 20, "RiminiComix", 2021),
("A457", true, null, 20, "RiminiComix", 2021),
("A275", false, 1000, 20, "RiminiComix", 2021),
("A543", true, null, 20, "RiminiComix", 2021),
("A355", true, null, 20, "TorinoComics", 2021),
("A515", false, 1000, 20, "TorinoComics", 2021),
("A458", true, null, 20, "TorinoComics", 2021),
("A361", false, 1000, 20, "TorinoComics", 2021),
("X346", true, null, 20, "Romics", 2019),
("X493", false, 2000, 20, "Romics", 2019),
("X648", false, 2000, 20, "Romics", 2019),
("X164", true, null, 20, "Romics", 2019),
("X365", true, null, 20, "Etna Comics", 2019),
("X446", true, null, 20, "Etna Comics", 2019),
("X576", false, 2000, 20, "Etna Comics", 2019),
("X393", false, 2000, 20, "Etna Comics", 2019),
("X865", true, null, 20, "Lucca Comics", 2019),
("X745", false, 2000, 20, "Lucca Comics", 2019),
("X336", true, null, 20, "Lucca Comics", 2019),
("X565", false, 2000, 20, "Lucca Comics", 2019),
("X242", false, 2000, 20, "Milan Games Week", 2019),
("X785", false, 2000, 20, "Milan Games Week", 2019),
("X764", true, null, 20, "Milan Games Week", 2019),
("X003", true, null, 20, "Milan Games Week", 2019),
("X459", false, 2000, 20, "Napoli Comicon", 2019),
("X085", true, null, 20, "Napoli Comicon", 2019),
("X400", true, null, 20, "Napoli Comicon", 2019),
("X451", false, 2000, 20, "Napoli Comicon", 2019),
("X350", true, null, 20, "Modena Nerd", 2019),
("X056", false, 2000, 20, "Modena Nerd", 2019),
("X392", true, null, 20, "Modena Nerd", 2019),
("X472", false, 2000, 20, "Modena Nerd", 2019),
("X452", true, null, 20, "GameCom Pordenone", 2019),
("X463", true, null, 20, "GameCom Pordenone", 2019),
("X046", false, 2000, 20, "GameCom Pordenone", 2019),
("X653", false, 2000, 20, "GameCom Pordenone", 2019),
("X754", false, 2000, 20, "RiminiComix", 2019),
("X457", true, null, 20, "RiminiComix", 2019),
("X275", false, 2000, 20, "RiminiComix", 2019),
("X543", true, null, 20, "RiminiComix", 2019),
("X355", true, null, 20, "TorinoComics", 2019),
("X515", false, 2000, 20, "TorinoComics", 2019),
("X458", true, null, 20, "TorinoComics", 2019),
("X361", false, 2000, 20, "TorinoComics", 2019);

insert into Articolo (numeroserie, nome, prezzo) values 
("49349-694", "maglietta", 789,29);
("55264-005", "maglietta", 594,69),
("48951-8113", "maglietta", 130,71),
("51672-4118", "maglietta", 970,53),
("0944-8402", "maglietta", 330,94),
("48951-1192", "maglietta", 493,59),
("0363-0168", "maglietta", 663,14),
("0615-1553", "maglietta", 1192,36),
("10014-007", "maglietta", 1132,80),
("24385-608", "maglietta", 766,43),
("20276-979", "gadjet", 96,52),
("45963-753", "gadjet", 736,63),
("53808-0685", "gadjet", 681,44),
("68428-079", "gadjet", 598,52),
("43406-0015", "gadjet", 1382,37),
("67692-811", "gadjet", 788,30),
("31645-170", "gadjet", 837,73),
("55289-329", "gadjet", 1347,98),
("55289-767", "gadjet", 1095,77),
("49738-202", "felpa", 896,81),
("58228-5600", "felpa", 763,53),
("49288-0783", "felpa", 445,93),
("54868-6176", "felpa", 1157,78),
("0440-1771", "felpa", 978,72),
("63868-144", "felpa", 19,32),
("16729-214", "felpa", 870,18),
("57955-0002", "videogame", 1277,81),
("49035-176", "videogame", 441,79),
("68788-9682", "videogame", 655,04),
("49349-721", "videogame", 503,09),
("0904-6360", "videogame", 816,86),
("49404-116", "videogame", 273,91),
("49349-028", "videogame", 1250,45),
("68828-088", "videogame", 1120,66),
("65582-100", "videogame", 700,01),
("55312-251", "videogame", 1285,69),
("16590-070", "videogame", 1209,51),
("53808-0347", "videogame", 343,37),
("54973-0601", "videogame", 1339,60),
("24236-360", "videogame", 265,41),
("68877-002", "alimento", 968,71),
("68828-116", "alimento", 850,22),
("49967-645", "alimento", 270,82),
("0281-0326", "alimento", 1347,30),
("75956-147", "alimento", 817,83),
("53828-001", "alimento", 537,74),
("52773-236", "alimento", 1413,87),
("59779-066", "alimento", 335,88),
("67510-1507", "alimento", 1480,24),
("0121-0678", "alimento", 761,44);


insert into Fiera (Nome, Anno, Città, CapienzaTotale) values
("Romics", 2022, "Roma", null),
("Etna Comics", 2022, "Catania", null),
("Lucca Comics", 2022, "Lucca", null),
("Milan Games Week", 2022, "Rho", null),
("Napoli Comicon", 2022, "Napoli", null),
("Modena Nerd", 2022, "Modena", null),
("GameCom Pordenone", 2022, "Pordenone", null),
("RiminiComix", 2022, "Rimini", null),
("TorinoComics", 2022, "Torino", null),
("Romics", 2021, "Roma", null),
("Etna Comics", 2021, "Catania", null),
("Lucca Comics", 2021, "Lucca", null),
("Milan Games Week", 2021, "Rho", null),
("Napoli Comicon", 2021, "Napoli", null),
("Modena Nerd", 2021, "Modena", null),
("GameCom Pordenone", 2021, "Pordenone", null),
("RiminiComix", 2021, "Rimini", null),
("TorinoComics", 2021, "Torino", null),
("Romics", 2020, "Roma", null),
("Etna Comics", 2020, "Catania", null),
("Lucca Comics", 2020, "Lucca", null),
("Milan Games Week", 2020, "Rho", null),
("Napoli Comicon", 2020, "Napoli", null),
("Modena Nerd", 2020, "Modena", null),
("GameCom Pordenone", 2020, "Pordenone", null),
("RiminiComix", 2020, "Rimini", null),
("TorinoComics", 2020, "Torino", null),
("Romics", 2019, "Roma", null),
("Etna Comics", 2019, "Catania", null),
("Lucca Comics", 2019, "Lucca", null),
("Milan Games Week", 2019, "Rho", null),
("Napoli Comicon", 2019, "Napoli", null),
("Modena Nerd", 2019, "Modena", null),
("GameCom Pordenone", 2019, "Pordenone", null),
("RiminiComix", 2019, "Rimini", null),
("TorinoComics", 2019, "Torino", null),
("Romics", 2018, "Roma", null),
("Etna Comics", 2018, "Catania", null),
("Lucca Comics", 2018, "Lucca", null),
("Milan Games Week", 2018, "Rho", null),
("Napoli Comicon", 2018, "Napoli", null),
("Modena Nerd", 2018, "Modena", null),
("GameCom Pordenone", 2018, "Pordenone", null),
("RiminiComix", 2018, "Rimini", null),
("TorinoComics", 2018, "Torino", null),
("Romics", 2017, "Roma", null),
("Etna Comics", 2017, "Catania", null),
("Lucca Comics", 2017, "Lucca", null),
("Milan Games Week", 2017, "Rho", null),
("Napoli Comicon", 2017, "Napoli", null),
("Modena Nerd", 2017, "Modena", null),
("GameCom Pordenone", 2017, "Pordenone", null),
("RiminiComix", 2017, "Rimini", null),
("TorinoComics", 2017, "Torino", null),
("Romics", 2016, "Roma", null),
("Etna Comics", 2016, "Catania", null),
("Lucca Comics", 2016, "Lucca", null),
("Milan Games Week", 2016, "Rho", null),
("Napoli Comicon", 2016, "Napoli", null),
("Modena Nerd", 2016, "Modena", null),
("GameCom Pordenone", 2016, "Pordenone", null),
("RiminiComix", 2016, "Rimini", null),
("TorinoComics", 2016, "Torino", null),
("Romics", 2015, "Roma", null),
("Etna Comics", 2015, "Catania", null),
("Lucca Comics", 2015, "Lucca", null),
("Milan Games Week", 2015, "Rho", null),
("Napoli Comicon", 2015, "Napoli", null),
("Modena Nerd", 2015, "Modena", null),
("GameCom Pordenone", 2015, "Pordenone", null),
("RiminiComix", 2015, "Rimini", null),
("TorinoComics", 2015, "Torino", null);

update Fiera f1
set CapienzaTotale = (
	select sum(a.CapienzaPersone)
	from Area a
	where f2.Nome = a.Fiera
	and f2.Anno = a.Anno
	group by f2.nome, f2.anno
)
from Fiera f2
where f1.nome = f2.nome
and f1.anno = f2.anno
