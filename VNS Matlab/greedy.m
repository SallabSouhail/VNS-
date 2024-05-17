%% Description
%{
Titre : glouton
Paramètres d'entrée : a[matrice de localisation des villes], nl[nombre de lignes de la matrice "a"];
Paramètre de sortie : a1[nouvelle matrice de trajet];
%}

%% Fonction
function [a1] = greedy(a,nl)
[~,aux2]=sort(a(:,1));          % début de l'organisation de la matrice "a" / trouve l'ordre des termes 

for j=1:nl                      % réorganisation des termes
    b(j,:)=a(aux2(j,1),:);
end
x=b(:,2);                       % nomination des termes
y=b(:,3);
cont=1;

for j=1:nl                      % génération d'une matrice de distances entre toutes les villes
    for k=1:nl
        dist(j,k)=hypot(x(j,1)-x(k,1),y(j,1)-y(k,1));
        if dist(j,k)==0
            dist(j,k)=inf;
        end
    end
end
a1(1,:)=b(1,:);                  % premier terme de la matrice solution
dist(:,1)=inf;                   % annule la colonne 1
procura=1;                       % initialisation du terme de recherche
while cont<nl                    % recherche sur toutes les lignes
   [~,ind]=min(dist(procura,:)); % indice de la plus petite valeur de distance de la ligne 
    a1(cont+1,:)=b(ind,:);       % allocation du terme "cont+1" dans la matrice solution
    cont=cont+1;                 % incrémentation du compteur
    dist(:,ind)=inf;             % annulation de la ligne correspondant à l'indice recherché
    procura=ind;                 % recherche reçoit la ligne suivante à être sondée EX: (1,2)-(2,7)-(7,1)-(1,9)
end
a1(nl+1,:)=a1(1,:);              % le dernier terme reçoit le premier / fermeture du cycle
plot(a1(:,2),a1(:,3),'*');       % trace des points / villes

for j=2:length(a1)               % trace les chemins entre les villes
    line(a1(j-1:j,2),a1(j-1:j,3));
    pause(0.15)
end
end


