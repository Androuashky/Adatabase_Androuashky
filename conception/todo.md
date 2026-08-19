    ETAPES DU PROJET 

PHASE 1 — COMPRENDRE ET RECENSER
✅ Le dictionnaire de données : une ligne par donnée (Nom, Description, Type, Taille, Contraintes, Remarques).
✅ La liste de vos décisions : chaque ambiguïté repérée dans l'entretien, ce que vous avez tranché, et pourquoi. Trois lignes par décision suffisent.

PHASE 2 — LE SCHÉMA ENTITÉ-ASSOCIATION
✅ Entités, propriétés, identifiants soulignés, associations nommées par des verbes, cardinalités.
✅ Les phrases de lecture à voix haute de chaque cardinalité, écrites sous le schéma.
✅ Aucune clé étrangère. Vous connaissez la règle.

PHASE 3 — LE SCHÉMA RELATIONNEL
✅ Le résultat de R1, R2 et R3, en notation Table(champ, #cleEtrangere).
✅ En face de chaque relation, la règle qui l'a produite. C'est votre justification de conception, et elle sera demandée.
✅ L'arbre de dépendances de vos tables, dessiné.

PHASE 4 — LA BASE, POUR DE VRAI
✅ migration_up.sql : les types ENUM en tête, puis les CREATE TABLE dans l'ordre de l'arbre, avec toutes les contraintes (clés primaires dont les composées, clés étrangères, NOT NULL, UNIQUE, DEFAULT).
✅ migration_down.sql : l'inverse exact, avec IF EXISTS partout. Le test up → down → up doit passer sans une seule erreur.
✅ seed.sql : des données cohérentes et crédibles — au minimum 8 catégories, 10 personnes, 12 bénévoles, 40 objets à différents statuts, 15 réparations, 10 ventes, 4 ateliers et leurs inscriptions.
✅ queries.sql : les 10 questions de la section 04, une requête chacune, commentée.