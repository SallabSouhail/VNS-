%% Description
%{
Titre : K-opt
Param�tres d'entr�e : a[matrice de localisation des villes], nl[nombre de lignes de la matrice "a" avec un itin�raire complet], k[changement k]
Param�tre de sortie : b[nouvelle matrice de trajet];
%}

%% Fonction
function [b]=K_opt(a,nl,k)
k1=2*k;                             % param�tre pour la g�n�ration du vecteur de changement
b=a;                                % sauvegarde de la matrice a
aux=zeros(1,k1);                    % cr�ation du vecteur de stockage des positions de changement

while length(unique(aux))~=k1       % condition pour �viter la r�p�tition des �l�ments � �changer
    rng('shuffle');                 % param�tre pour changer l'al�atoire
    aux=randi([2,nl-1],1,k1);       % g�n�ration al�atoire des �changes
end

for j=1:k                           % �change des positions
     aux1=b(aux(1,j*2),:);          % Information sur la ville dans la position j*2
     aux2=b(aux(1,j),:);
     b(aux(1,j),:)=aux1;
     b(aux(1,j*2),:)=aux2;
end
end

