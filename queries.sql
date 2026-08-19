-- Combien d'objets avons-nous reçus le mois dernier, et quel poids total ?

SELECT count(*), SUM(objets.poids_kg)
FROM objets
JOIN depots ON depots.id = objets.depots_id
WHERE depots.date >= '2026-07-01'

-- Quels objets sont actuellement en rayon, et depuis combien de temps ?

SELECT id_etiquette, CURRENT_DATE - date_mise_en_rayon::DATE AS "il y a (jours)"
FROM objets
WHERE objets.date_mise_en_rayon IS NOT NULL

-- Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?

SELECT categories.nom, COUNT(*), SUM(ventes.prix_payé)
FROM objets
JOIN categories ON categories.id = objets.categories_id
JOIN ventes ON ventes.id = objets.ventes_id
GROUP BY categories.nom

-- Combien d'heures de bénévolat ont été consacrées à la réparation cette année ?

SELECT SUM(durée)
FROM reparations

-- Quel est le taux de réussite des réparations, par bénévole et globalement ?
SELECT personnes.nom, COUNT(*) FILTER (WHERE résultat = 'réussie') * 100 / COUNT(*) AS "taux de reussite %"
FROM reparations
JOIN benevoles ON benevoles.id = reparations.benevoles_id
JOIN personnes ON personnes.id = benevoles.personnes_id
GROUP BY personnes.nom


SELECT COUNT(*) FILTER (WHERE résultat = 'réussie') * 100 / COUNT(*) AS "taux de reussite %"
FROM reparations


-- Quelles personnes nous ont fait plus de trois dépôts ?

SELECT personnes.nom, count(*)
FROM depots
JOIN personnes ON personnes.id = depots.personnes_id
GROUP BY personnes.nom
HAVING COUNT(*)>= 3

-- Quel poids total avons-nous détourné de la déchetterie (tout ce qui n est pas recyclé) ?

SELECT SUM(poids_kg) AS "poids objets sauvé"
FROM objets
WHERE status <> 'recyclé'

-- Quel est le taux de présence réelle sur nos ateliers ?

SELECT ateliers.nom, ROUND(SUM(presence)::decimal /count(participations) * 100,1) AS "taux de présence"
FROM participations
JOIN ateliers ON ateliers.id = participations.ateliers_id
GROUP BY ateliers.nom

-- Quels bénévoles ont la compétence « électricité » et sont disponibles pour animer un atelier ? (ps: dsl dans ma base de donnée j'ai mis électronique)

SELECT personnes.nom, personnes.prénom
FROM benevoles_competences
JOIN competences ON competences.id = benevoles_competences.competences_id
JOIN benevoles ON benevoles.id = benevoles_competences.benevoles_id
JOIN personnes ON personnes.id= benevoles.personnes_id
WHERE competences.nom = 'Électronique'

-- Quels objets sont en rayon depuis plus de six mois et devraient être sortis ?

SELECT objets.id_etiquette, AGE(CURRENT_DATE, date_mise_en_rayon) AS "6mois_ou_+"
FROM objets
WHERE date_mise_en_rayon < CURRENT_DATE - INTERVAL '6 months'