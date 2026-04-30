/** -- Création de la base de donnée de la bibliothèque -- **/
drop table if exists public.prets;
drop table if exists public.livres;
drop table if exists public.bibliotheque;

create table bibliotheque(
	id serial,
	nom VARCHAR(100),
	courriel VARCHAR(255),
	cle_api VARCHAR(30),
	password VARCHAR(100),
	primary key (id)
);


create table livres(
	id serial,
	bibliotheque_id INT,
	titre VARCHAR(100),
	auteur VARCHAR(100),
	isbn VARCHAR(20),
	date_ajout DATE,
	disponible BOOLEAN,
	foreign key (bibliotheque_id) references bibliotheque(id),
	primary key (id)
);

create table prets (
	id serial,
	livre_id INT,
	emprunteur VARCHAR(100),
	date_retour date,
	foreign key (livre_id) references livres(id),
	primary key (id)
);

/** -- Insertion des données -- **/
insert into bibliotheque (nom, courriel, cle_api, password)
values ('Bibliothèque Charles-Édouard-Mailhot', 'bibliotheque@victoriaville.ca', '4321', 'bcem'),
	   ('Bibliothèque Alcide-Fleury', 'bibliotheque@victoriaville.ca', '1234', 'baf');

insert into livres (bibliotheque_id, titre, auteur, isbn, date_ajout, disponible)
values (1, 'La maquette', 'Christine Lehoux', '11111111111111111111', '05-23-2025', false),
	   (2, 'La citrouille', 'Didier Mathieu', '22222222222222222222', '08-12-2026', true),
	   (1, 'Le tableau', 'Lucie Camiré', '33333333333333333333', '03-25-2013', true),
	   (2, 'Le crayon', 'Véronique Dery', '44444444444444444444', '02-10-2024', false);

insert into prets (livre_id, emprunteur, date_retour)
values (1, 'Simon Tousignant', '06-19-2025'),
	   (4, 'Christiane Lagacé', '12-12-2026');