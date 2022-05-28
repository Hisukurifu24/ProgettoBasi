#include <stdio.h>
#include <iostream>
#include <string>
#include "dependencies/include/libpq-fe.h"

using std::cout;
using std::endl;
using std::string;
using std::cin;

PGconn* connect(const char* host, const char* user, const char* db, const char* pass, const char* port) {
	char conninfo[256];
	sprintf(conninfo, "user=%s password=%s dbname=\'%s\' hostaddr=%s port=%s",
		user, pass, db, host, port);

	PGconn* conn = PQconnectdb(conninfo);

	if (PQstatus(conn) != CONNECTION_OK) {
		std::cerr << "Errore di connessione" << endl << PQerrorMessage(conn);
		PQfinish(conn);
		exit(1);
	}

	return conn;
}
PGresult* execute(PGconn* conn, const char* query) {
	PGresult* res = PQexec(conn, query);
	if (PQresultStatus(res) != PGRES_TUPLES_OK) {
		cout << " Risultati inconsistenti!" << PQerrorMessage(conn) << endl;
		PQclear(res);
		exit(1);
	}

	return res;
}

void printLine(int campi, int* maxChar) {
	for (int j = 0; j < campi; ++j) {
		cout << '+';
		for (int k = 0; k < maxChar[j] + 2; ++k)
			cout << '-';
	}
	cout << "+\n";
}
void printQuery(PGresult* res) {
	// Preparazione dati
	const int tuple = PQntuples(res), campi = PQnfields(res);
	string v[tuple + 1][campi];

	for (int i = 0; i < campi; ++i) {
		string s = PQfname(res, i);
		v[0][i] = s;
	}
	for (int i = 0; i < tuple; ++i)
		for (int j = 0; j < campi; ++j) {
			if (string(PQgetvalue(res, i, j)) == "t" || string(PQgetvalue(res, i, j)) == "f")
				if (string(PQgetvalue(res, i, j)) == "t")
					v[i + 1][j] = "si";
				else
					v[i + 1][j] = "no";
			else
				v[i + 1][j] = PQgetvalue(res, i, j);
		}

	int maxChar[campi];
	for (int i = 0; i < campi; ++i)
		maxChar[i] = 0;

	for (int i = 0; i < campi; ++i) {
		for (int j = 0; j < tuple + 1; ++j) {
			int size = v[j][i].size();
			maxChar[i] = size > maxChar[i] ? size : maxChar[i];
		}
	}

	// Stampa effettiva delle tuple
	printLine(campi, maxChar);
	for (int j = 0; j < campi; ++j) {
		cout << "| ";
		cout << v[0][j];
		for (int k = 0; k < maxChar[j] - v[0][j].size() + 1; ++k)
			cout << ' ';
		if (j == campi - 1)
			cout << "|";
	}
	cout << endl;
	printLine(campi, maxChar);

	for (int i = 1; i < tuple + 1; ++i) {
		for (int j = 0; j < campi; ++j) {
			cout << "| ";
			cout << v[i][j];
			for (int k = 0; k < maxChar[j] - v[i][j].size() + 1; ++k)
				cout << ' ';
			if (j == campi - 1)
				cout << "|";
		}
		cout << endl;
	}
	printLine(campi, maxChar);
}

char* chooseFiera(PGconn* conn) {
	const char* query = "select row_number() over(order by fiera.nome) as numero, Fiera.nome from fiera group by Fiera.nome";
	PGresult* res = execute(conn, query);
	printQuery(res);

	const int tuple = PQntuples(res), campi = PQnfields(res);
	int val;
	cout << "Inserisci il numero della Fiera scelta: ";
	cin >> val;
	while (val <= 0 || val > tuple) {
		cout << "Valore non valido\n";
		cout << "Inserisci il numero della Fiera scelta: ";
		cin >> val;
	}
	return PQgetvalue(res, val - 1, 1);
}
char* chooseAnno(PGconn* conn) {
	const char* query = "select row_number() over(order by fiera.anno desc) as numero, Fiera.Anno from fiera group by Fiera.anno";
	PGresult* res = execute(conn, query);
	printQuery(res);

	const int tuple = PQntuples(res), campi = PQnfields(res);
	int val;
	cout << "Inserisci il numero dell'anno scelto: ";
	cin >> val;
	while (val <= 0 || val > tuple) {
		cout << "Valore non valido\n";
		cout << "Inserisci il numero dell'anno scelto: ";
		cin >> val;
	}
	return PQgetvalue(res, val - 1, 1);
}
char* chooseTema(PGconn* conn) {
	const char* query = "select row_number() over(order by tema.nome) as numero, Tema.Nome from Tema group by tema.nome";
	PGresult* res = execute(conn, query);
	printQuery(res);

	const int tuple = PQntuples(res), campi = PQnfields(res);
	int val;
	cout << "Inserisci il numero del tema scelto: ";
	cin >> val;
	while (val <= 0 || val > tuple) {
		cout << "Valore non valido\n";
		cout << "Inserisci il numero del tema scelto: ";
		cin >> val;
	}
	return PQgetvalue(res, val - 1, 1);
}


int main(int argc, char const* argv []) {
	cout << "Nome del database: ";
	char dbname[50];
	cin >> dbname;
	cout << "Password: ";
	char pass[50];
	cin >> pass;
	PGconn* conn = connect("127.0.0.1", "postgres", dbname, pass, "5432");

	const char* query[6] ={
		"select nome, cognome, tipo \
		from Persona, Visita \
		where Persona.cf = Visita.persona and \
			Visita.fiera = '%s' and \
			Visita.anno = %s and \
			Persona.tipo != 'Staff';",

		"select Visita.Fiera, Visita.Anno, count(nome) as Partecipanti \
		from Persona, Visita \
		where Persona.CF = Visita.Persona AND \
			Visita.Fiera = '%s' AND Visita.Anno = %s \
		group by Visita.Fiera, Visita.Anno;",

		"select Stand.id, Stand.nome, sum(Quantità) \
		from Stand, Vendita, Articolo \
		where Stand.id = Vendita.stand and Articolo.prezzo > 5 \
		group by Stand.id;",

		"select Stand.id, Stand.nome, sum(Quantità) \
		from Stand, Vendita \
		where Stand.id = Vendita.stand \
		group by Stand.id \
		having sum(Quantità) > 5;",

		"select Stand.nome, Tematica.tema, Area.codice \
		from Area, Stand, Tematica, Tema \
		where Stand.area = Area.codice and Area.esterno = false and \
			Tematica.stand = Stand.id and Tematica.tema = '%s' and \
			Area.fiera = '%s' and Area.anno = %s \
		group by Stand.nome, Tematica.tema, Area.codice \
		order by Stand.nome;",
	};

	while (true) {
		cout << endl;
		cout << "1. Trova le persone che hanno visitato una determinata Fiera (solo visitatori)\n";
		cout << "2. Conta quante persone hanno partecipato ad una determinata Fiera (anche staff)\n";
		cout << "3. Trova quanti articoli ha venduto ogni stand con prezzo maggiore di 5€\n";
		cout << "4. Trova quali stand hanno venduto piu' di 5 articoli\n";
		cout << "5. Mostra gli stand che appartengono ad un padiglione di una determinata fiera e che hanno una certa tematica\n";

		cout << "Query da eseguire (0 per uscire): ";
		int q = 0;
		cin >> q;
		while (q < 0 || q > 5) {
			cout << "Le query vanno da 1 a 5...\n";
			cout << "Query da eseguire (0 per uscire): ";
			cin >> q;
		}
		if (q == 0) break;
		char queryTemp[1500];
		const char* fiera;
		const char* anno;
		const char* tema;
		switch (q) {
		case 1:
			fiera = chooseFiera(conn);
			anno = chooseAnno(conn);
			sprintf(queryTemp, query[0], fiera, anno);
			printQuery(execute(conn, queryTemp));
			break;
		case 2:
			fiera = chooseFiera(conn);
			anno = chooseAnno(conn);
			sprintf(queryTemp, query[1], fiera, anno);
			printQuery(execute(conn, queryTemp));
			break;
		case 3:
			sprintf(queryTemp, query[2]);
			printQuery(execute(conn, queryTemp));
			break;
		case 4:
			sprintf(queryTemp, query[3]);
			printQuery(execute(conn, queryTemp));
			break;
		case 5:
			fiera = chooseFiera(conn);
			anno = chooseAnno(conn);
			tema = chooseTema(conn);
			sprintf(queryTemp, query[4], tema, fiera, anno);
			printQuery(execute(conn, queryTemp));
			break;
		default:
			printQuery(execute(conn, query[q - 1]));
			break;
		}
		system("pause");
	}

	PQfinish(conn);
}
