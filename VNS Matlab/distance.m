%% Description
%{
Titre : distance
Param�tres d'entr�e : a[matrice de localisation des villes], nl[nombre de lignes de la matrice "a" avec un itin�raire complet];
Param�tre de sortie : dist[distance totale de l'itin�raire];
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
                          
