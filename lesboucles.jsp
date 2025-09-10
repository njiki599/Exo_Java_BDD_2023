<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% for (int i = 1; i <= cpt; i++) {
       for (int j = 1; j <= cpt; j++) { %>
           <%= "*" %>
   <% } %>
</br>
<% } %>
</p>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% for (int k = 1; k <= cpt; k++) {
       for (int l = 1; l <= k; l++) { %>
           <%= "*" %>
<% } %>
</br>
<% } %>
</p>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% for (int m = cpt; m >= 1; m--) {
       for (int n = 1; n <= m; n++) { %>
           <%= "*" %>
<% } %>
</br>
<% } %>
</p>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% for (int s = 1; s <= cpt; s++) {
       for (int espace = cpt - s; espace > 0; espace--) { %>
           &nbsp; 
<%     }
       for (int v = 1; v <= s; v++) { %>
           <%= "*" %> 
<% } %>
</br>
<% } %>
</p>
<h2>Exercice 5 : Triangle isocele</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% for (int x = 1; x <= cpt; x++) {
       for (int espace = cpt - x; espace > 0; espace--) { %>
           &nbsp; 
<%     }
       for (int y = 1; y <= x; y++) { %>
           <%= "*" %>
<%     } %>
</br>
<% } %>
</p>

<h2>Exercice 6 : Le demi losange</h2>
<p>Ecrire le code afin de produire un losange</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% // Partie haute
   for (int w = 1; w <= cpt; w++) {
       for (int espace = cpt - w; espace > 0; espace--) { %>
           &nbsp; 
<%     }
       for (int z = 1; z <= w; z++) { %>
           <%= "*" %>
<%     } %>
</br>
<% } 
   // Partie basse
   for (int w = cpt - 1; w >= 1; w--) {
       for (int espace = cpt - w; espace > 0; espace--) { %>
           &nbsp; 
<%     }
       for (int z = 1; z <= w; z++) { %>
           <%= "*" %> 
<%     } %>
</br>
<% } %>
</p>

<h2>Exercice 7 : La table de multiplication</h2>
<p>Ecrire le code afin de créser une table de multiplication</p>
<p>Exemple si l'utilisateur saisie le valeur <%= cpt %> :</p>
<p>
<% for (int p = 1; p <= 10; p++) { %>
    <%= cpt %> x <%= p %> = <%= (cpt * p) %>
</br>
<% } %>
</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
