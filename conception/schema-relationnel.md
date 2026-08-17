personne(_id_, nom, prenom, mail, téléphone, adherent)

depot(_id_, date, type_de_depot(enum))

objets(_id_etiquette_, etat(enum), statut, poids, prix, date_mise_en_rayon, #id_depot, #id_vente, #id_categorie)

categorie(_id_, nom)

benevoles(_id_, date_dadhésions, #id_personne)

competences(_id_, nom)

benevoles-competences(_#id_benevole_,_#id_compétence_)

ateliers(_id_, nom, date, durée, nb_de_place, #id_benevole)

participation(_#id_personne_,_#id_atelier_, date , présence)

reparations(_id_, temps, date, resultat, #id_benevole, #id_etiquette)

vente(_id_, mode_de_paiement, prix_payé)
