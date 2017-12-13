CREATE TABLE demande (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_creation TIMESTAMP,
    date_debut_traitement TIMESTAMP,
    date_fin_traitement TIMESTAMP,
    code_mvt_demandeur VARCHAR(7) NOT NULL,
    id_produit VARCHAR(20) NOT NULL,
    courriel VARCHAR(256) NOT NULL,
    environnement VARCHAR(128) NOT NULL,
    description VARCHAR(100) NOT NULL,
    statut VARCHAR(128),
    mode VARCHAR(100)
);