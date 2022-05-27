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
	foreign key(Persona) references Persona(CF) on update cascade on delete cascade,
	check(Validità>=Data)
);
alter table Persona
add foreign key(Biglietto) references Biglietto(Codice) on update cascade on delete cascade



-- inserts

insert into Biglietto (Codice, Data, Validità, Prezzo, Tipo, Persona) values
("N2Z9UC5RY1SF4AX1","2021-02-22","2021-03-01",25.99,"VIP","IT1P3E1LE0UANCS8"),
("29M555DKIPYI3VVZ","2017-09-21","2017-09-28",34.99,"Ridotto","CVL2Q3RY5H3SSG92"),
("NZI9ROWRXYU2DOKO","2015-02-13","2015-02-20",43.99,"VIP","3WTTXSSH0M8857XR"),
("IB82447WILWP0KFM","2019-01-24","2019-01-31",03.99,"VIP","3DBY560KZ64IZUEF"),
("HBCY4RA675SR4BFM","2018-07-18","2018-07-25",54.99,"Ridotto","T005229VTJ4B43VP"),
("2NNNZEWGEW4FXXCZ","2018-09-12","2018-09-19",87.99,"Ridotto","NP44TSCU8514VKNF"),
("QVXGVMSLYWYZDF23","2015-04-29","2015-05-06",22.99,"Intero","LC4IHBV1Z1V78S5J"),
("OGDPPGOPXLIHG42Y","2020-01-06","2020-01-13",40.99,"VIP","U8O77Z7CWP709LED"),
("P7E5NNLMH1WEBLVF","2019-12-23","2019-12-30",46.99,"Ridotto","SKGLW0S0947UBKQ4"),
("Q81070NVGZN1Z8GL","2017-10-29","2017-11-05",04.99,"Ridotto","Y8CWQH0QNKU0DRVN"),
("TYTWIBAQHVLM7FVS","2017-11-07","2017-11-14",81.99,"Ridotto","PLU4LODY0UFWMXSY"),
("A7AASAK6E5G8XYIY","2018-04-20","2018-04-27",19.99,"VIP","UCMXHQDSJN5JWNNV"),
("DXMT8G4PUEDTSIQB","2018-08-19","2018-08-26",57.99,"Intero","LNVT4YI0KXA8F26I"),
("6Q8JUGJKDIH3MWNU","2017-02-26","2017-03-05",83.99,"Intero","TUYG9VRM5OMQYHCY"),
("OFVF0MSUNPF5G6MY","2016-08-07","2016-08-14",51.99,"Intero","ZGF7FXW8JXF9870V"),
("OKEZ8DF172JYTMVM","2017-04-07","2017-04-14",53.99,"Ridotto","GFZ60VSCWB2VZ1NP"),
("BV491S21RSU0IIFV","2019-12-16","2019-12-23",18.99,"Ridotto","4WYFUJOHENIL0X9B"),
("QHSVK8JK0I8N8AV8","2016-12-28","2017-01-04",21.99,"Ridotto","A213AG94JSLE6JRZ"),
("V7R5DVWMT375OK9C","2015-02-26","2015-03-05",18.99,"Ridotto","6T9T6G2H402VT0JB"),
("4XE8O0XENVEBOOX5","2019-10-22","2019-10-29",93.99,"VIP","7SP99SR93MH9MPGY"),
("A8IGBZXHQTDNIF4H","2020-12-05","2020-12-12",20.99,"VIP","2BY781Z7BB7BHU7Q"),
("ROZB83F53TQFXT26","2020-03-14","2020-03-21",19.99,"VIP","KRVX98M6EHM5X046"),
("2HFR2EY6U8NTJRSR","2017-01-12","2017-01-19",84.99,"Intero","M65KD13UH6CMPK1R"),
("RS9EFS3ABMFR8OIX","2016-01-29","2016-02-05",09.99,"Intero","JXLQQ4RF46TKXT8V"),
("VLCRRGEFWUFJFAY6","2021-08-28","2021-09-04",96.99,"Ridotto","VN6B6VJZF6RZIQ7Z"),
("PZGOFJ513PF9C7V7","2018-06-08","2018-06-15",38.99,"Intero","J0XUMFC4B41QBKGM"),
("6JYL32KGJ0MSZQA6","2020-08-16","2020-08-23",19.99,"Ridotto","M70H8IRWFRPDWZOF"),
("ZFSX38NM17TMFZF8","2021-07-27","2021-08-03",37.99,"Ridotto","0DQASUILOM70Z8SL"),
("U2P6JJ7FGPE2VYEB","2016-06-12","2016-06-19",70.99,"Ridotto","U2TIU1KPGDAZQYMK"),
("HYHU1OTDVYCT7506","2021-03-24","2021-03-31",83.99,"VIP","B2NLRKIY98A2EVZK"),
("31D7NZ6BF194XI9Y","2017-04-12","2017-04-19",76.99,"Intero","RQTKLRBQ0R4QA8J4"),
("053BMHOKR9U0B1FR","2017-02-15","2017-02-22",52.99,"Intero","8G1YVU1UXDDA419R"),
("YNIGZB9CPQLSX0E3","2018-01-31","2018-02-07",71.99,"Ridotto","LSEM79I32FYSFN3Z"),
("QLQ6IKXWPL7OBV4G","2018-11-18","2018-11-25",81.99,"VIP","4BN93DN4O44DR6JA"),
("5HDG36RM4P51YKDQ","2019-09-29","2019-10-06",56.99,"Ridotto","YLK4VK14U4NQKZ42"),
("J548T332AJQR42EP","2016-11-08","2016-11-15",78.99,"VIP","YD924KV1MFMCQUPI"),
("WV09JTX3N0IIZ3RG","2017-12-10","2017-12-17",21.99,"Intero","WWN3NE3I4CO3NDUV"),
("HPG5Z17FON3OKNLD","2015-11-03","2015-11-10",04.99,"Ridotto","J8FUFURH9TYI4ZD0"),
("FDN4CL0OCV8YZ6GM","2021-01-28","2021-02-04",53.99,"Intero","2K5YSEOOWQIW08I3"),
("6L4D59CP3RQOM2XJ","2020-11-23","2020-11-30",18.99,"Intero","TFP24ELSN5LZQ6T3"),
("ISL60PVXJ8JNE5RW","2018-08-14","2018-08-21",63.99,"Intero","DSNWYILS4O9A1IK5"),
("AG62XMWNDWBNKVM1","2019-11-13","2019-11-20",12.99,"Intero","LTEP1FVPSIFXBYZT"),
("A8UGJU57X16DZ3NV","2021-05-26","2021-06-02",29.99,"VIP","UPQ5OMXZR8A002BQ"),
("BZ4F7RBDBM0D6XGG","2020-01-23","2020-01-30",92.99,"VIP","GZT69K9PZ7K18E65"),
("0XAZUT45732ZHGC0","2020-06-26","2020-07-03",00.99,"Intero","WI277AHZH4QXLDVB"),
("ZUIA73FL0ALVBDX3","2021-12-25","2022-01-01",37.99,"VIP","9PGF1BK12NA5GNKY"),
("YGINN0MAJXKXQBVR","2015-10-20","2015-10-27",73.99,"VIP","0GC676LC20EPXKYY"),
("6ISWODCR3TI8FOOX","2020-03-30","2020-04-06",99.99,"VIP","WJJYNFB61JBCG5QK"),
("L58K7HQN7TET1FXJ","2019-11-07","2019-11-14",78.99,"VIP","Y9GEAW9RT0SE1Z70"),
("D0UL23CXL5RB26I3","2020-02-22","2020-02-29",90.99,"Intero","AY0ON9H24F9H2YFM");

insert into area (codice, esterno, capienzapersone, capacitàstand, fiera, anno) values
("A346", true, null, null, "Romics", 2021),
("A493", false, 1000, 20, "Romics", 2021),
("A648", false, 1000, 20, "Romics", 2021),
("A164", true, null, null, "Romics", 2021),
("A365", true, null, null, "Etna Comics", 2021),
("A446", true, null, null, "Etna Comics", 2021),
("A576", false, 1000, 20, "Etna Comics", 2021),
("A393", false, 1000, 20, "Etna Comics", 2021),
("A865", true, null, null, "Lucca Comics", 2021),
("A745", false, 1000, 20, "Lucca Comics", 2021),
("A336", true, null, null, "Lucca Comics", 2021),
("A565", false, 1000, 20, "Lucca Comics", 2021),
("A242", false, 1000, 20, "Milan Games Week", 2021),
("A785", false, 1000, 20, "Milan Games Week", 2021),
("A764", true, null, null, "Milan Games Week", 2021),
("A003", true, null, null, "Milan Games Week", 2021),
("A459", false, 1000, 20, "Napoli Comicon", 2021),
("A085", true, null, null, "Napoli Comicon", 2021),
("A400", true, null, null, "Napoli Comicon", 2021),
("A451", false, 1000, 20, "Napoli Comicon", 2021),
("A350", true, null, null, "Modena Nerd", 2021),
("A056", false, 1000, 20, "Modena Nerd", 2021),
("A392", true, null, null, "Modena Nerd", 2021),
("A472", false, 1000, 20, "Modena Nerd", 2021),
("A452", true, null, null, "GameCom Pordenone", 2021),
("A463", true, null, null, "GameCom Pordenone", 2021),
("A046", false, 1000, 20, "GameCom Pordenone", 2021),
("A653", false, 1000, 20, "GameCom Pordenone", 2021),
("A754", false, 1000, 20, "RiminiComix", 2021),
("A457", true, null, null, "RiminiComix", 2021),
("A275", false, 1000, 20, "RiminiComix", 2021),
("A543", true, null, null, "RiminiComix", 2021),
("A355", true, null, null, "TorinoComics", 2021),
("A515", false, 1000, 20, "TorinoComics", 2021),
("A458", true, null, null, "TorinoComics", 2021),
("A361", false, 1000, 20, "TorinoComics", 2021),
("X346", true, null, null, "Romics", 2019),
("X493", false, 2000, 20, "Romics", 2019),
("X648", false, 2000, 20, "Romics", 2019),
("X164", true, null, null, "Romics", 2019),
("X365", true, null, null, "Etna Comics", 2019),
("X446", true, null, null, "Etna Comics", 2019),
("X576", false, 2000, 20, "Etna Comics", 2019),
("X393", false, 2000, 20, "Etna Comics", 2019),
("X865", true, null, null, "Lucca Comics", 2019),
("X745", false, 2000, 20, "Lucca Comics", 2019),
("X336", true, null, null, "Lucca Comics", 2019),
("X565", false, 2000, 20, "Lucca Comics", 2019),
("X242", false, 2000, 20, "Milan Games Week", 2019),
("X785", false, 2000, 20, "Milan Games Week", 2019),
("X764", true, null, null, "Milan Games Week", 2019),
("X003", true, null, null, "Milan Games Week", 2019),
("X459", false, 2000, 20, "Napoli Comicon", 2019),
("X085", true, null, null, "Napoli Comicon", 2019),
("X400", true, null, null, "Napoli Comicon", 2019),
("X451", false, 2000, 20, "Napoli Comicon", 2019),
("X350", true, null, null, "Modena Nerd", 2019),
("X056", false, 2000, 20, "Modena Nerd", 2019),
("X392", true, null, null, "Modena Nerd", 2019),
("X472", false, 2000, 20, "Modena Nerd", 2019),
("X452", true, null, null, "GameCom Pordenone", 2019),
("X463", true, null, null, "GameCom Pordenone", 2019),
("X046", false, 2000, 20, "GameCom Pordenone", 2019),
("X653", false, 2000, 20, "GameCom Pordenone", 2019),
("X754", false, 2000, 20, "RiminiComix", 2019),
("X457", true, null, null, "RiminiComix", 2019),
("X275", false, 2000, 20, "RiminiComix", 2019),
("X543", true, null, null, "RiminiComix", 2019),
("X355", true, null, null, "TorinoComics", 2019),
("X515", false, 2000, 20, "TorinoComics", 2019),
("X458", true, null, null, "TorinoComics", 2019),
("X361", false, 2000, 20, "TorinoComics", 2019);

insert into Articolo (numeroserie, nome, prezzo) values 
("49349-694", "maglietta", 14,99);
("55264-005", "maglietta", 14,99),
("48951-8113", "maglietta", 14,99),
("51672-4118", "maglietta", 14,99),
("0944-8402", "maglietta", 29,99),
("48951-1192", "maglietta", 29,99),
("0363-0168", "maglietta", 29,99),
("0615-1553", "maglietta", 29,99),
("10014-007", "maglietta", 29,99),
("24385-608", "maglietta", 29,99),
("20276-979", "gadget", 4,99),
("45963-753", "gadget", 9,99),
("53808-0685", "gadget", 14,99),
("68428-079", "gadget", 19,99),
("43406-0015", "gadget", 49,99),
("67692-811", "gadget", 9,99),
("31645-170", "gadget", 9,99),
("55289-329", "gadget", 4,98),
("55289-767", "gadget", 7,99),
("49738-202", "felpa", 44,99),
("58228-5600", "felpa", 44,99),
("49288-0783", "felpa", 59,99),
("54868-6176", "felpa", 49,99),
("0440-1771", "felpa", 34,99),
("63868-144", "felpa", 34,99),
("16729-214", "felpa", 39,99),
("57955-0002", "videogame", 49,99),
("49035-176", "videogame", 79,99),
("68788-9682", "videogame", 79,99),
("49349-721", "videogame", 79,99),
("0904-6360", "videogame", 79,99),
("49404-116", "videogame", 49,99),
("49349-028", "videogame", 49,99),
("68828-088", "videogame", 49,99),
("65582-100", "videogame", 79,99),
("55312-251", "videogame", 129,99),
("16590-070", "videogame", 79,99),
("53808-0347", "videogame", 79,99),
("54973-0601", "videogame", 29,99),
("24236-360", "videogame", 9,99),
("68877-002", "alimento", 9,99),
("68828-116", "alimento", 29,99),
("49967-645", "alimento", 19,99),
("0281-0326", "alimento", 4,99),
("75956-147", "alimento", 7,99),
("53828-001", "alimento", 6,99),
("52773-236", "alimento", 9,99),
("59779-066", "alimento", 12,99),
("67510-1507", "alimento", 14,99),
("0121-0678", "alimento", 19,99);


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
