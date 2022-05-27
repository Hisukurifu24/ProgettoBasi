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

insert into Vendita(Stand, Articolo, Nome, Quantità) values

insert int Tematica(Stand, Tema, Data) values

insert into Visita(Persona, Fiera, Anno) values

insert into Collegamento(Area1, Area2) values
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),
("AAAA","BBBB"),

insert into Stand(ID, Nome, Area) values
("FA12KH0K","Y-find","A493"),
("UPVSPCZ7","Solarbreeze","A493"),
("71SOW586","Treeflex","A493"),
("PPDMRQCA","Daltfresh","A648"),
("MHJHAYTC","Daltfresh","A576"),
("ZHCUD89Q","Konklux","A648"),
("XBGQS84N","Sub-Ex","A576"),
("R8YBJ5X4","Mat Lam Tam","A576"),
("JM9XNZIT","Tresom","A576"),
("Z9B8K6O1","Asoka","A393"),
("P12X2WW7","Otcom","A393"),
("QQ0M3US4","Regrant","A393"),
("CAT50HHY","Sub-Ex","A393"),
("TSFEJ3PF","Fintone","A745"),
("XLI1TFVM","Ronstring","A745"),
("8ZDVDGMG","Solarbreeze","A745"),
("CM7J59XH","Pannier","A745"),
("8NIVVLYN","Matsoft","A565"),
("YHJ7H8DX","Fintone","A565"),
("NVU08NT8","Gembucket","A565"),
("LUGBI291","Sonair","A565"),
("1SAC7RKN","Ventosanzap","A242"),
("LE5A1XPT","Cookley","A242"),
("7QAKWUED","Zamit","A242"),
("ZIQ10XQ4","Bamity","A242"),
("X9JXYRZ9","Vagram","A785"),
("SOP5UOME","Tresom","A785"),
("H40HM4ZQ","Job","A785"),
("IOC8WFQ2","Cardguard","A785"),
("I67QU4OO","Zontrax","A459"),
("ZRW7GQ6E","Regrant","A459"),
("0R29N03D","Quo Lux","A459"),
("MPVHBH6T","Regrant","A459"),
("I7SWCZ5R","Zontrax","A451"),
("JKI5WC72","Greenlam","A451"),
("RX8TJ28X","Wrapsafe","A451"),
("6CK4VGHU","Viva","A451"),
("QA3HPU6R","Lotlux","A056"),
("KW6D1SC0","Duobam","A056"),
("UIRNU0EH","Asoka","A056"),
("UTTG9RO0","Cookley","A056"),
("VO6M3296","Andalax","A056"),
("LDMXLSKV","Prodder","A472"),
("Q6VVO2J6","Alphazap","A472"),
("0HKGKBRG","Flowdesk","A472"),
("LOTXNLMF","Matsoft","A046"),
("D9RY727Y","Aerified","A046"),
("BY7ZQN0B","Domainer","A046"),
("K1JYUE6L","Span","A515"),
("KP0ZUPS9","Trippledex","A515");


insert into Tema(Nome, DataUscita, Autore, Tipo) values
("Lotlux","2004-08-03","Heidi McGall","Film"),
("Zathin","2000-05-04","Audrye Aldritt","Fumetto"),
("Alpha","2016-12-07","Derrick Vigurs","Manga"),
("Fix San","1992-03-25","Wylie Fitzharris","Manga"),
("Tresom","1990-12-16","Katrina Hazart","Serie TV"),
("Greenlam","2005-07-20","Darrell McGlaud","Gioco"),
("Greenlam","2005-03-05","Lynn Bruyett","Gioco"),
("Lotlux","2000-12-13","Nathanael Stanbro","Serie TV"),
("Greenlam","2002-11-21","Bernadene Rowdell","Anime"),
("Aerified","2022-04-20","Haslett Bracher","Anime"),
("Viva","2007-11-22","Renado Grund","Serie TV"),
("Stronghold","1992-11-17","Arvin Grogor","Anime"),
("Temp","1995-05-21","Fionnula Shone","Anime"),
("Y-find","2005-05-14","Matthew Pinkard","Manga"),
("Latlux","2001-08-14","Agnella McMahon","Anime"),
("Stim","1997-04-10","Whitney Donati","Serie TV"),
("Bitchip","2003-04-11","Andriana Blumfield","Gioco"),
("Pannier","1996-10-10","Dotty Smither","Manga"),
("Stronghold","2008-03-27","Hortense Pippard","Serie TV"),
("Alpha","2012-07-06","Ardene Cuchey","Anime"),
("Lotlux","1999-07-29","Aigneis Baselio","Gioco"),
("Greenlam","2003-06-16","Anastassia Licas","Fumetto"),
("Overhold","1997-11-20","Ruby Magor","Gioco"),
("Trippledex","2000-01-04","Roanne Burkett","Film"),
("Flexidy","1995-08-22","Allayne McCard","Anime"),
("Holdlamis","2019-03-25","Johannah Mattam","Anime"),
("Domainer","2016-09-15","Sebastian Harfleet","Fumetto"),
("Duobam","1998-06-22","Maia Germon","Gioco"),
("Y-find","2001-07-26","Dreddy Axworthy","Gioco"),
("Pannier","2021-01-25","Ode Elsley","Serie TV"),
("Sub-Ex","1992-06-12","Anet Gawkroge","Gioco"),
("Sonair","1990-06-17","Lucius Guye","Manga"),
("Tin","2013-05-26","Florance Bardnam","Fumetto"),
("Gembucket","2011-12-10","Bria Cavolini","Film"),
("Bitwolf","2013-04-13","Tammie Gullifant","Fumetto"),
("Voltsillam","2016-08-03","Lucia Masding","Film"),
("Flowdesk","2011-09-18","Jeanne Gibard","Serie TV"),
("Voltsillam","2008-04-15","Robinet Gergher","Film"),
("Latlux","2017-03-06","Che Harriagn","Gioco"),
("Latlux","2007-03-23","Sheila-kathryn Rau","Film"),
("Redhold","2001-02-03","Gianni Izkoveski","Manga"),
("Viva","1998-04-05","Malissa MacFadin","Gioco"),
("Asoka","1999-10-20","Ethelbert Whitland","Film"),
("Zaam-Dox","2002-05-19","Blanca Wordington","Manga"),
("Holdlamis","2018-07-26","Parke Peteri","Film"),
("Asoka","2008-08-07","Gabbie Faughny","Serie TV"),
("Flowdesk","1997-01-24","Benyamin Tute","Anime"),
("Overhold","2001-09-10","Blair Fairham","Gioco"),
("It","2015-12-10","Mic Askwith","Fumetto"),
("Alpha","2016-02-21","Tanhya Churchard","Film");

insert into Persona(CF,Nome,Cognome,DataNascita,Stato,Città,Via,N_Civico,Mail,Telefono,Tipo,Giornale,Scuola,Personaggio,Settore,Stipendio,Staff,Biglietto) values
"1PLOWU4HNTADNS8P","Keane","Tillett","1978-01-25","Philippines","Caracal","Buell",97,"ktillett0@netlog.com",978043686586,"Bambino",null,null,null,null,null,null,"I036ZN549HVC37TK"
"ME0NM29OCYBQ71SJ","Moe","Sinden","1913-06-14","United Kingdom","Newport","Veith",3567,"msinden1@usatoday.com",648054716976,"Cosplayer",null,null,null,null,null,null,"DIRCTY44MAGMEVAJ"
"YGIMPJAX87RH14OL","Corry","Mattam","1988-07-17","Azerbaijan","Kyurdarmir","Loftsgordon",6762,"cmattam2@friendfeed.com",577401723519,"Giornalista",null,null,null,null,null,null,"ZTEN32HXFGXYD0PD"
"RDCW2M2299COL16J","Dwayne","McGarry","1931-02-07","Czech Republic","Sezemice","Cascade",70343,"dmcgarry3@goo.ne.jp",313005315943,"Studente",null,null,null,null,null,null,"WIVZM9KQC513JXVS"
"04CBIS9MCGXTWP9E","Erny","Heiner","1982-01-05","Poland","Czerwie?sk","Katie",20,"eheiner4@spotify.com",903419786851,"Bambino",null,null,null,null,null,null,"NNKC1TJT891DX2XV"
"ETUXZUHA4J9T63E5","Pearline","Maffy","2000-12-06","China","Baihe","5th",9724,"pmaffy5@yelp.com",923116712759,"Studente",null,null,null,null,null,null,"D04YFYIFFDL9AVM8"
"NU4VEIKYJWFB201T","Mel","Crossan","1913-09-07","Pakistan","?rifw?la","Morningstar",91,"mcrossan6@tmall.com",853047731502,"Cosplayer",null,null,null,null,null,null,"WO34AQBS01EGSR7R"
"1GD6805FQTVXDK1R","Blake","Mathou","1929-08-25","China","Majie","Eagle Crest",4,"bmathou7@toplist.cz",901398982332,"Giornalista",null,null,null,null,null,null,"8QUZCL6IDPSP5JGB"
"M5F34VUV5Z7Z8Z65","Beilul","Mealiffe","1938-04-12","Mexico","Adolfo Lopez Mateos","Novick",89,"bmealiffe8@opera.com",762632499207,null,null,null,null,null,null,null,"YNMWISMIPWBLEDH1"
"JQP0488FLPWYDCAP","Eadith","Shaw","1984-05-14","Haiti","Cornillon","5th",5,"eshaw9@wikispaces.com",219142519821,"Studente",null,null,null,null,null,null,"2P60NNQG2LF32Y0Y"
"P55AIR1YOHTF18AO","Norman","Ruddell","1924-02-05","Vietnam","Tr� My","Calypso",7188,"nruddella@reference.com",393755756502,"Bambino",null,null,null,null,null,null,"2M4H4P5B2ELA07VP"
"QM40X90VUMJYXR6H","Faun","Romao","1976-09-04","Russia","Koz�modem�yansk","Dunning",15,"fromaob@xing.com",933007575108,"Bambino",null,null,null,null,null,null,"J9NUPEJYIN2DODH2"
"N257JFP4D1VXZEEV","Shannan","Lethem","1914-05-19","Philippines","Barotac Viejo","Judy",70584,"slethemc@bloglines.com",210389385646,"Cosplayer",null,null,null,null,null,null,"ZQ499DFEZM76G27V"
"95TI9OK9OQRCUA8J","Halimeda","Stefanovic","1920-02-07","Brazil","Itaqui","Hansons",89929,"hstefanovicd@alibaba.com",265406330388,"Studente",null,null,null,null,null,null,"0YIEDOEEDC57I0UW"
"C2Q6JNE00W0LENH4","Eben","Baillie","1919-10-28","Indonesia","Radamata","Canary",31,"ebailliee@123-reg.co.uk",112895782632,"Cosplayer",null,null,null,null,null,null,"FS53ZMU35N8U1Y6A"
"JHBHZF6XR9DCR29K","Gipsy","Eubank","1999-03-29","Uruguay","San Jos� de Mayo","Everett",77,"geubankf@psu.edu",691771096122,"Giornalista",null,null,null,null,null,null,"93IBKCZUYZ1CNFZM"
"A9DNWXCYBX0S9OV8","Merralee","Fasey","1987-03-26","Indonesia","Cisewu","Scott",5,"mfaseyg@ifeng.com",560658984597,"Studente",null,null,null,null,null,null,"F0WOV5IPJG358H4O"
"9F4B5B5VM0891XIC","Sherie","Henbury","1931-12-12","China","Bishan","Victoria",878,"shenburyh@tripod.com",139943205904,"Bambino",null,null,null,null,null,null,"1PXX7S0HN06W9E8T"
"YIXHDIVYOD5KO0CV","Madonna","Skittreal","1956-05-23","China","Chengnan","Hoffman",20,"mskittreali@simplemachines.org",900184741962,"Studente",null,null,null,null,null,null,"MAPTAMUYMKXUQZEZ"
"RJRJF0MMFO8935R5","Alard","Patroni","1943-02-18","China","Baizhang","Carpenter",187,"apatronij@joomla.org",236622128210,null,null,null,null,null,null,null,"CYW33HTLAT8B43V6"
"3O7RFLAU966Q4Q7W","Grove","Swanson","1903-09-26","China","Chenjiaba","Morrow",13447,"gswansonk@pagesperso-orange.fr",694903047315,"Staff",null,null,null,null,null,null,"C463VHX3QF2AN3CD"
"MTY6GW0YERDNUU88","Amos","Hoston","1936-08-18","Liechtenstein","Balzers","Scoville",5290,"ahostonl@jimdo.com",648167703250,"Staff",null,null,null,null,null,null,"D5U997UA8UYSX3EN"
"6FOF69T42PFJC7EN","Dita","Champerlen","1960-05-12","Latvia","Ape","Crescent Oaks",681,"dchamperlenm@t.co",787724448059,"Bambino",null,null,null,null,null,null,"ZLCDOOYGP2N2RRTB"
"AI41DJRPZDHO6GSR","Frederick","Blackett","1965-05-23","Serbia","Banatsko Kara?or?evo","Reinke",13969,"fblackettn@time.com",515871789359,"Staff",null,null,null,null,null,null,"AON4F8JSCLJACUE4"
"JXJ0YW88O17SMGGL","Elna","Winscomb","1950-10-08","China","Jiangjing","West",35396,"ewinscombo@xing.com",332192877442,"Staff",null,null,null,null,null,null,"MN768GFZNTFKWFCR"
"B27MBPZP72U8FVG0","Nataline","Taylor","1919-03-24","Azerbaijan","Ganja","Mockingbird",56944,"ntaylorp@weather.com",561237315055,"Cosplayer",null,null,null,null,null,null,"KJWHCBNMGADNNEND"
"QWUZTU6OGMZ779JY","Murielle","Kordovani","1933-07-06","France","�pinal","Harbort",97,"mkordovaniq@xing.com",398499427051,"Giornalista",null,null,null,null,null,null,"RZEJ2HKXNZ75DIFB"
"EHRP7HPCYKAHIY4D","Bryan","Dedmam","1939-10-01","China","Qiandong","Eagle Crest",51251,"bdedmamr@fema.gov",399467508201,"Studente",null,null,null,null,null,null,"MO0K3BOBYO76FS60"
"N9KIS5I9UWLD7J6C","Timofei","Larkworthy","1987-01-02","China","Changning","Thackeray",97044,"tlarkworthys@ehow.com",301500296662,"Staff",null,null,null,null,null,null,"JP2NK3840VISY5E8"
"TK8VIR02110CB3ME","Shayla","Barlas","1966-10-14","Poland","Tuchomie","Hermina",3,"sbarlast@hostgator.com",570931772170,"Cosplayer",null,null,null,null,null,null,"UZ4D2ZY7NLV9DXI1"
"YDIMUKUYEXZ5W4L0","Abbie","Magill","1956-08-21","Ethiopia","H?gere Hiywet","Northridge",94738,"amagillu@cdbaby.com",252982158154,null,null,null,null,null,null,null,"SWV5VU9FX67F6MJE"
"YSIW7WKP2G2VY3NM","Clarita","Duchant","1938-06-09","Ukraine","Turbiv","Badeau",92701,"cduchantv@soundcloud.com",245360944383,"Cosplayer",null,null,null,null,null,null,"2IO5C3R50XBC3SR3"
"JQ4AL9I2U9MZXALH","Alaine","Applebee","1958-04-28","Cuba","Arroyo Naranjo","Mayer",134,"aapplebeew@purevolume.com",975675372544,"Studente",null,null,null,null,null,null,"GKT7EKCRK8N0QIKJ"
"TWHGWBSULGZ0G0T2","Frasquito","Shelley","1933-06-26","Japan","Kanaya","Mendota",5,"fshelleyx@delicious.com",880260806006,"Bambino",null,null,null,null,null,null,"73EH26IIHGFJU7HL"
"F58N0MDW25G0Z9ZC","Egor","Millin","1947-05-12","China","Tanqiao","Westerfield",0,"emilliny@sciencedirect.com",863051085457,"Giornalista",null,null,null,null,null,null,"FJZGOJQFSPFYJ9AM"
"9NRCLS504EGOE7UI","Cathlene","Give","1987-05-07","China","Xipu","Toban",524,"cgivez@privacy.gov.au",900676291118,"Cosplayer",null,null,null,null,null,null,"U4K5OKW9YAFTDWJ1"
"YTIN7H0T7Y8ZLPZO","Edgard","Oake","1945-08-30","Belgium","Bruxelles","Dottie",5453,"eoake10@parallels.com",629851441761,"Studente",null,null,null,null,null,null,"LF3T5WFYEM4MKHZ6"
"JHY53JNZI5GWLSP6","Bartholomeus","Hecks","1957-05-08","China","Yongfu","Monument",1124,"bhecks11@nbcnews.com",545607460119,"Bambino",null,null,null,null,null,null,"IWQNNQ3FYEP0U75X"
"SN73O1BULR1Y7EEW","Joyann","Dries","1954-12-18","South Korea","Reiko","Linden",973,"jdries12@bandcamp.com",30223365151,"Cosplayer",null,null,null,null,null,null,"M31W08FXJ7EBRILJ"
"50B0YP6REWT1V66Z","Loraine","Manus","1907-04-28","Macedonia","Kavadarci","Katie",3,"lmanus13@ibm.com",799380626458,"Giornalista",null,null,null,null,null,null,"2HRAJ8IKKX6X8CFY"
"SC2AY4FOTEVFD20N","Fabe","Brookes","1900-07-27","Indonesia","Sobeok","Maryland",736,"fbrookes14@google.de",837382980851,"Staff",null,null,null,null,null,null,"RT72OZJ9UBA44PDE"
"YOZBG8AQA6SYT8SR","Doy","Houliston","1903-11-13","Czech Republic","Lelekovice","Maple",451,"dhouliston15@flickr.com",977301755062,"Studente",null,null,null,null,null,null,"86B8HJKD4OUB72QW"
"QO07TPAISBF9B32M","Davon","Iglesias","1929-08-11","Peru","Acar�","3rd",93,"diglesias16@ucoz.com",827211428471,"Studente",null,null,null,null,null,null,"IXZTS546MURT8D5E"
"XIXN4UGRKAGUPKY8","Addy","Nuth","2000-11-10","Poland","Bodzech�w","Warbler",5655,"anuth17@auda.org.au",651504479126,"Bambino",null,null,null,null,null,null,"UEP6NCJZH2XYGMF3"
"N1MA8F4NF8K45EKT","Guenevere","Janiszewski","1961-03-02","Yemen","Al Bil?d","Springview",250,"gjaniszewski18@alibaba.com",307906159836,"Staff",null,null,null,null,null,null,"HZIDQK0UFZYKLVMO"
"LKVB84XEKLCXEHSZ","Sarine","Cubley","1988-06-22","Indonesia","Sumbergebang","Hovde",1,"scubley19@merriam-webster.com",629074048071,"Cosplayer",null,null,null,null,null,null,"JMH9YDTSNL12BBO4"
"GHPXU311WMWS3L68","Ryan","Chritchlow","1999-11-05","Ukraine","Zalesnoye","Washington",7704,"rchritchlow1a@psu.edu",699089725604,"Studente",null,null,null,null,null,null,"1KGK7JQW51VEZUXW"
"2F8Y5QGO71F9DT2I","Eduardo","Grcic","1947-09-02","China","Xiangyanglu","Jenna",3964,"egrcic1b@ebay.com",479608542480,"Bambino",null,null,null,null,null,null,"ADP3IBWJ29770OLU"
"6L0G6G5IFGTFYNOA","Frederigo","Churly","1920-12-31","Indonesia","Mertani","Oak Valley",527,"fchurly1c@bizjournals.com",777470646377,"Giornalista",null,null,null,null,null,null,"SAJDRVMVA2SOKPW8"
"GPT9HID4CIXFUIX3","Celina","Dawltrey","1976-01-27","France","Toulouse","Mifflin",36345,"cdawltrey1d@china.com.cn",907140130769,null,null,null,null,null,null,null,"OL3PGQ94A32UJOIK"

insert into Biglietto (Codice, Data, Validità, Prezzo, Tipo, Persona) values
("N2Z9UC5RY1SF4AX1","2021-02-22","2021-03-01",25.99,"VIP","1PLOWU4HNTADNS8P"),
("29M555DKIPYI3VVZ","2017-09-21","2017-09-28",34.99,"Ridotto","ME0NM29OCYBQ71SJ"),
("NZI9ROWRXYU2DOKO","2015-02-13","2015-02-20",43.99,"VIP","YGIMPJAX87RH14OL"),
("IB82447WILWP0KFM","2019-01-24","2019-01-31",03.99,"VIP","RDCW2M2299COL16J"),
("HBCY4RA675SR4BFM","2018-07-18","2018-07-25",54.99,"Ridotto","04CBIS9MCGXTWP9E"),
("2NNNZEWGEW4FXXCZ","2018-09-12","2018-09-19",87.99,"Ridotto","ETUXZUHA4J9T63E5"),
("QVXGVMSLYWYZDF23","2015-04-29","2015-05-06",22.99,"Intero","NU4VEIKYJWFB201T"),
("OGDPPGOPXLIHG42Y","2020-01-06","2020-01-13",40.99,"VIP","1GD6805FQTVXDK1R"),
("P7E5NNLMH1WEBLVF","2019-12-23","2019-12-30",46.99,"Ridotto","M5F34VUV5Z7Z8Z65"),
("Q81070NVGZN1Z8GL","2017-10-29","2017-11-05",04.99,"Ridotto","JQP0488FLPWYDCAP"),
("TYTWIBAQHVLM7FVS","2017-11-07","2017-11-14",81.99,"Ridotto","P55AIR1YOHTF18AO"),
("A7AASAK6E5G8XYIY","2018-04-20","2018-04-27",19.99,"VIP","QM40X90VUMJYXR6H"),
("DXMT8G4PUEDTSIQB","2018-08-19","2018-08-26",57.99,"Intero","N257JFP4D1VXZEEV"),
("6Q8JUGJKDIH3MWNU","2017-02-26","2017-03-05",83.99,"Intero","95TI9OK9OQRCUA8J"),
("OFVF0MSUNPF5G6MY","2016-08-07","2016-08-14",51.99,"Intero","C2Q6JNE00W0LENH4"),
("OKEZ8DF172JYTMVM","2017-04-07","2017-04-14",53.99,"Ridotto","JHBHZF6XR9DCR29K"),
("BV491S21RSU0IIFV","2019-12-16","2019-12-23",18.99,"Ridotto","A9DNWXCYBX0S9OV8"),
("QHSVK8JK0I8N8AV8","2016-12-28","2017-01-04",21.99,"Ridotto","9F4B5B5VM0891XIC"),
("V7R5DVWMT375OK9C","2015-02-26","2015-03-05",18.99,"Ridotto","YIXHDIVYOD5KO0CV"),
("4XE8O0XENVEBOOX5","2019-10-22","2019-10-29",93.99,"VIP","RJRJF0MMFO8935R5"),
("A8IGBZXHQTDNIF4H","2020-12-05","2020-12-12",20.99,"VIP","3O7RFLAU966Q4Q7W"),
("ROZB83F53TQFXT26","2020-03-14","2020-03-21",19.99,"VIP","MTY6GW0YERDNUU88"),
("2HFR2EY6U8NTJRSR","2017-01-12","2017-01-19",84.99,"Intero","6FOF69T42PFJC7EN"),
("RS9EFS3ABMFR8OIX","2016-01-29","2016-02-05",09.99,"Intero","AI41DJRPZDHO6GSR"),
("VLCRRGEFWUFJFAY6","2021-08-28","2021-09-04",96.99,"Ridotto","JXJ0YW88O17SMGGL"),
("PZGOFJ513PF9C7V7","2018-06-08","2018-06-15",38.99,"Intero","B27MBPZP72U8FVG0"),
("6JYL32KGJ0MSZQA6","2020-08-16","2020-08-23",19.99,"Ridotto","QWUZTU6OGMZ779JY"),
("ZFSX38NM17TMFZF8","2021-07-27","2021-08-03",37.99,"Ridotto","EHRP7HPCYKAHIY4D"),
("U2P6JJ7FGPE2VYEB","2016-06-12","2016-06-19",70.99,"Ridotto","N9KIS5I9UWLD7J6C"),
("HYHU1OTDVYCT7506","2021-03-24","2021-03-31",83.99,"VIP","TK8VIR02110CB3ME"),
("31D7NZ6BF194XI9Y","2017-04-12","2017-04-19",76.99,"Intero","YDIMUKUYEXZ5W4L0"),
("053BMHOKR9U0B1FR","2017-02-15","2017-02-22",52.99,"Intero","YSIW7WKP2G2VY3NM"),
("YNIGZB9CPQLSX0E3","2018-01-31","2018-02-07",71.99,"Ridotto","LSEM79I32FYSFN3Z"),
("QLQ6IKXWPL7OBV4G","2018-11-18","2018-11-25",81.99,"VIP","JQ4AL9I2U9MZXALH"),
("5HDG36RM4P51YKDQ","2019-09-29","2019-10-06",56.99,"Ridotto","TWHGWBSULGZ0G0T2"),
("J548T332AJQR42EP","2016-11-08","2016-11-15",78.99,"VIP","F58N0MDW25G0Z9ZC"),
("WV09JTX3N0IIZ3RG","2017-12-10","2017-12-17",21.99,"Intero","9NRCLS504EGOE7UI"),
("HPG5Z17FON3OKNLD","2015-11-03","2015-11-10",04.99,"Ridotto","YTIN7H0T7Y8ZLPZO"),
("FDN4CL0OCV8YZ6GM","2021-01-28","2021-02-04",53.99,"Intero","JHY53JNZI5GWLSP6"),
("6L4D59CP3RQOM2XJ","2020-11-23","2020-11-30",18.99,"Intero","SN73O1BULR1Y7EEW"),
("ISL60PVXJ8JNE5RW","2018-08-14","2018-08-21",63.99,"Intero","50B0YP6REWT1V66Z"),
("AG62XMWNDWBNKVM1","2019-11-13","2019-11-20",12.99,"Intero","SC2AY4FOTEVFD20N"),
("A8UGJU57X16DZ3NV","2021-05-26","2021-06-02",29.99,"VIP","YOZBG8AQA6SYT8SR"),
("BZ4F7RBDBM0D6XGG","2020-01-23","2020-01-30",92.99,"VIP","QO07TPAISBF9B32M"),
("0XAZUT45732ZHGC0","2020-06-26","2020-07-03",00.99,"Intero","XIXN4UGRKAGUPKY8"),
("ZUIA73FL0ALVBDX3","2021-12-25","2022-01-01",37.99,"VIP","LKVB84XEKLCXEHSZ"),
("YGINN0MAJXKXQBVR","2015-10-20","2015-10-27",73.99,"VIP","GHPXU311WMWS3L68"),
("6ISWODCR3TI8FOOX","2020-03-30","2020-04-06".99.99,"VIP","2F8Y5QGO71F9DT2I"),
("L58K7HQN7TET1FXJ","2019-11-07","2019-11-14",78.99,"VIP","6L0G6G5IFGTFYNOA"),
("D0UL23CXL5RB26I3","2020-02-22","2020-02-29",90.99,"Intero","GPT9HID4CIXFUIX3");

insert into Area (Codice, Esterno, CapienzaPersone, CapacitàStand, Fiera, Anno) values
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

insert into Articolo (NumeroSerie, Nome, Prezzo) values 
("49349-694", "maglietta", 14.99);
("55264-005", "maglietta", 14.99),
("48951-8113", "maglietta", 14.99),
("51672-4118", "maglietta", 14.99),
("0944-8402", "maglietta", 29.99),
("48951-1192", "maglietta", 29.99),
("0363-0168", "maglietta", 29.99),
("0615-1553", "maglietta", 29.99),
("10014-007", "maglietta", 29.99),
("24385-608", "maglietta", 29.99),
("20276-979", "gadget", 4.99),
("45963-753", "gadget", 9.99),
("53808-0685", "gadget", 14.99),
("68428-079", "gadget", 19.99),
("43406-0015", "gadget", 49.99),
("67692-811", "gadget", 9.99),
("31645-170", "gadget", 9.99),
("55289-329", "gadget", 4,98),
("55289-767", "gadget", 7.99),
("49738-202", "felpa", 44.99),
("58228-5600", "felpa", 44.99),
("49288-0783", "felpa", 59.99),
("54868-6176", "felpa", 49.99),
("0440-1771", "felpa", 34.99),
("63868-144", "felpa", 34.99),
("16729-214", "felpa", 39.99),
("57955-0002", "videogame", 49.99),
("49035-176", "videogame", 79.99),
("68788-9682", "videogame", 79.99),
("49349-721", "videogame", 79.99),
("0904-6360", "videogame", 79.99),
("49404-116", "videogame", 49.99),
("49349-028", "videogame", 49.99),
("68828-088", "videogame", 49.99),
("65582-100", "videogame", 79.99),
("55312-251", "videogame", 129.99),
("16590-070", "videogame", 79.99),
("53808-0347", "videogame", 79.99),
("54973-0601", "videogame", 29.99),
("24236-360", "videogame", 9.99),
("68877-002", "alimento", 9.99),
("68828-116", "alimento", 29.99),
("49967-645", "alimento", 19.99),
("0281-0326", "alimento", 4.99),
("75956-147", "alimento", 7.99),
("53828-001", "alimento", 6.99),
("52773-236", "alimento", 9.99),
("59779-066", "alimento", 12.99),
("67510-1507", "alimento", 14.99),
("0121-0678", "alimento", 19.99);


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
