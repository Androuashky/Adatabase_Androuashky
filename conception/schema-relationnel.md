personne(_id_, nom, prenom, mail, téléphone, adherent)

depot(_id_, date, type_de_depot(enum))

competences(_id_, nom)

categorie(_id_, nom)

vente(_id_, mode_de_paiement, prix_payé)

benevoles(_id_, date_dadhésions, #id_personne) R2

benevoles-competences(_#id_benevole_,_#id_compétence_) R3

ateliers(_id_, nom, date, durée, nb_de_place, #id_benevole) R2

participation(_#id_personne_,_#id_atelier_, date , présence) R3

objets(_id_etiquette_, etat(enum), statut, poids, prix, date_mise_en_rayon, #id_depot, #id_vente, #id_categorie) R2

reparations(_id_, temps, date, resultat, #id_benevole, #id_etiquette) R2

