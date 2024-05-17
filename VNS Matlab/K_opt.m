%% Description
%{
Titre : K-opt
Paramètres d'entrée : a[matrice de localisation des villes], nl[nombre de lignes de la matrice "a" avec un itinéraire complet], k[changement k]
Paramètre de sortie : b[nouvelle matrice de trajet];
%}

%% Fonction
function [b]=K_opt(a,nl,k)
k1=2*k;                             % paramètre pour la génération du vecteur de changement
b=a;                                % sauvegarde de la matrice a
aux=zeros(1,k1);                    % création du vecteur de stockage des positions de changement

while length(unique(aux))~=k1       % condition pour éviter la répétition des éléments à échanger
    rng('shuffle');                 % paramètre pour changer l'aléatoire
    aux=randi([2,nl-1],1,k1);       % génération aléatoire des échanges
end

for j=1:k                           % échange des positions
     aux1=b(aux(1,j*2),:);          % Information sur la ville dans la position j*2
     aux2=b(aux(1,j),:);
     b(aux(1,j),:)=aux1;
     b(aux(1,j*2),:)=aux2;
end
end

