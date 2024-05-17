%% Description
%{
Titre : VNS (Variable Neighborhood Search)
Param�tres d'entr�e : instance avec la localisation des villes;
Param�tre de sortie : plus court chemin;
%}


%% Pr�paration
clc                                             % nettoie l'invite de commande
clear all                                      % efface toutes les variables stock�es
close all                                       % ferme toutes les figures

%% Lecture des donn�es
%a=load('a280.txt');                            % charge les donn�es du fichier texte dans la variable "a"
%a=load('pr76.txt');                             
%a=load('att48.txt');
%a=load('dantzig42.txt');
%a=load('bayg29.txt');
a=load('burma14.txt');

[nl,~]=size(a);                                 % nombre de lignes
nl2=nl+1;                                       % ajoute une ligne de plus pour fermer un cycle
nl_aux=randperm(nl)';                           % effectue un m�lange sur le nombre de lignes
a(:,:)=a(nl_aux,:);                             % charge le nouveau vecteur "a" m�lang�

%% Trac� des villes
plot(a(:,2),a(:,3),'*');                        % trace les villes
line(a(:,2),a(:,3));                            % trace le chemin entre les villes

%% Initialisation des variables
dist_atual=inf;                                 % initialise la distance comme infinie
cond=0;                                         % initialise la condition pour la m�thode VNS
k=2;                                            % variable initiale pour la m�thode k-opt
cont=1;                                         % initialise le compteur
arret=1;                                       % initialise la condition d'arr�t de la m�thode VNS

%% Solution initiale
[a] = greedy(a,nl);                             % construction de la solution initiale / m�thode gloutonne
 a(nl2,:)=a(1,:);                               % ajoute la derni�re ligne / fermeture du cycle
 pause(1.0);                                    % pause pour afficher le r�sultat de la m�thode gloutonne

%% M�thode RVNS
while cond==0
[b]=K_opt(a,nl2,k);
[dist]=distance(b,nl2);
    if cont==3
        k=3;
    else if cont==4
            k=4;
        else if cont==5
                cont=2;
            end
        end
    end

    if dist<dist_atual
        dist_atual=dist;
        a=b;
        plot(b(:,2),b(:,3),'*');                        
        line(b(:,2),b(:,3));
        cont=1;
        arret=1;
        pause(0.001);
    end
    if arret>5000
        cond=1;
    end
    
    cont=cont+1;
    arret=arret+1
end

%% Affichage de la solution optimale et de son co�t
disp('Solution optimale :');
disp(a(:,1)); % Affichage de l'ordre des villes dans la solution optimale
disp(['le Co�t de cette solution consid�r�e comme optimale : ', num2str(dist_atual)]); % Affichage du co�t de la solution optimale
