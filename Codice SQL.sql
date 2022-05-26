cidrop table if exists Fiera;
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
("TorinoComics", 2015, "Torino", null),

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