-- Active: 1786971724822@@127.0.0.1@5450@adatabase

CREATE TYPE  etat AS ENUM ('bon état','à réparer', 'hors service'); 
CREATE TYPE depot AS ENUM ('à domicile', 'en boutique');
CREATE TYPE stat AS ENUM ('arrivé', 'en réparation', 'en rayon','vendu', 'recyclé');
CREATE TYPE paiement AS ENUM ('carte', 'espece');
CREATE TYPE result AS ENUM ('réussie','échouée');

CREATE TABLE competences (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE personnes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prénom VARCHAR(50) NOT NULL,
    mail VARCHAR(250) UNIQUE NOT NULL,
    téléphone VARCHAR(20) UNIQUE,
    adherent BOOLEAN NOT NULL
)

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE ventes (
    id SERIAL PRIMARY KEY,
    mode_de_paiement paiement NOT NULL,
    prix_payé DECIMAL NOT NULL
)

CREATE TABLE benevoles (
    id SERIAL PRIMARY KEY,
    date_d_adhesions DATE NOT NULL,
    personnes_id INTEGER NOT NULL REFERENCES personnes(id)
)

CREATE TABLE depots (
    id SERIAL PRIMARY KEY,
    personnes_id INTEGER NOT NULL REFERENCES personnes(id),
    date TIMESTAMP NOT NULL,
    type_de_depot depot NOT NULL
)

CREATE TABLE benevoles_competences (
    benevoles_id INTEGER NOT NULL REFERENCES benevoles(id),
    competences_id INTEGER NOT NULL REFERENCES competences(id)
)

CREATE TABLE ateliers (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(250) NOT NULL,
    date DATE NOT NULL,
    durée INTERVAL NOT NULL,
    nb_de_place INTEGER NOT NULL 
)

CREATE TABLE participations (
    personnes_id INTEGER NOT NULL REFERENCES personnes(id),
    ateliers_id INTEGER NOT NULL REFERENCES ateliers(id),
    date DATE NOT NULL,
    presence INTEGER NOT NULL
)

CREATE TABLE objets (
    id_etiquette SERIAL PRIMARY KEY,
    etats etat NOT NULL,
    status stat NOT NULL,
    poids_kg DECIMAL NOT NULL,
    prix DECIMAL NOT NULL,
    date_mise_en_rayon TIMESTAMP,
    depots_id INTEGER NOT NULL REFERENCES depots(id),
    categories_id INTEGER NOT NULL REFERENCES categories(id),
    ventes_id INTEGER REFERENCES ventes(id)
)

CREATE TABLE reparations (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    durée INTERVAL NOT NULL,
    résultat result NOT NULL,
    benevoles_id INTEGER NOT NULL REFERENCES benevoles(id),
    objets_id INTEGER NOT NULL REFERENCES objets(id_etiquette)
)
