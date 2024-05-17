%% Description
%{
Titre : distance
Paramètres d'entrée : a[matrice de localisation des villes], nl[nombre de lignes de la matrice "a" avec un itinéraire complet];
Paramètre de sortie : dist[distance totale de l'itinéraire];
%}

%% Fonction
function [dist]=distance(a,nl)
dist=0;                                                 % initialisation de la distance
x=a(:,2);                                               % renommer les variables horizontales
y=a(:,3);                                               % renommer les variables verticales
for j=1:nl-1
    dist=dist+hypot(x(j+1,1)-x(j,1),y(j+1,1)-y(j,1));   % calcul de la distance totale
end
end
                          
