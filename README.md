# La Remise — Base de données

Projet réalisé dans le cadre du **Bloc 1 — Fondamentaux Développement Web, Tech & IA** (Ada Tech School), semaines 11 et 12.

## Contexte

**La Remise** est une ressourcerie associative : les objets dont les gens n'ont plus l'usage sont collectés, triés, réparés quand c'est possible, puis revendus à petit prix en boutique. Ce qui ne peut pas être sauvé part en filière de recyclage. L'association fonctionne avec deux salariées et une trentaine de bénévoles, et organise également des ateliers ouverts au public.

Aujourd'hui, l'activité est suivie dans un cahier papier et un tableur partagé. L'objectif de ce projet est de concevoir et d'implémenter une base de données relationnelle permettant de centraliser ce suivi : dépôts, objets, réparations, ventes, bénévoles, compétences et ateliers.

## Modèle de données

La conception complète (dictionnaire de données, décisions, schéma entité-association, passage au relationnel, arbre de dépendances) est disponible dans le dossier [`conception/`](./conception).

## Structure du projet

```
adatabase/
  ├── README.md
  ├── docker-compose.yml
  ├── conception/
  │   ├── dictionnaire.md
  │   ├── decisions.md
  │   ├── schema-ea.png
  │   ├── schema-relationnel.md
  │   ├── cardinalité.md
  │   └── arbre-dependances.png
  ├── migration_up.sql
  ├── migration_down.sql
  ├── seed.sql
  └── queries.sql
```


## Requêtes

Le fichier [`queries.sql`](./queries.sql) contient les 10 requêtes répondant aux besoins exprimés par l'association, entre autres :

- Nombre d'objets reçus et poids total sur une période donnée
- Objets actuellement en rayon, et depuis combien de temps
- Catégorie la plus vendue / la plus rentable
- Heures de bénévolat consacrées à la réparation
- Taux de réussite des réparations, par bénévole et globalement
- Personnes ayant fait plus de trois dépôts
- Poids total détourné de la déchetterie
- Taux de présence réelle aux ateliers
- Bénévoles ayant la compétence "électricité" disponibles pour animer un atelier
- Objets en rayon depuis plus de six mois

## Décisions de conception

Les ambiguïtés repérées dans l'entretien avec la coordinatrice (notamment la question des populations personnes / bénévoles / donateurs / acheteurs) ont été tranchées et justifiées dans [`conception/decisions.md`](./conception/decisions.md).

## Auteur

Projet réalisé dans le cadre de la formation Développeur·se Fullstack — Ada Tech School.