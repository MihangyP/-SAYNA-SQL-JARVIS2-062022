-- utilisation de la base de donnée jarvis_mihangy
USE jarvis_mihangy;
-- creation du view synthétisant les propriétaires, copropriétaires, utilisateurs, membre
create view
synthese_utilisateur_membre_copropriétaire_propriétaire_vw as
SELECT 
    id_u, nom_u, prenom_u,`id_co-pro`, id_pro
FROM
    copropriétaire,
    utilisateur,
    propriétaire,
    membre
WHERE
    copropriétaire.utilisateur_id_u = utilisateur.id_u
        OR propriétaire.utilisateur_id_u = utilisateur.id_u
        OR membre.utilisateur_id_u = utilisateur.id_u;

-- liste toutes les pièces d’un domicile
select * from domicile
left join contenir
on domicile.id_d= contenir.domicile_id_d
left join piece
on contenir.piece_idPiece= piece.idPiece