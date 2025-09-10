<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimu 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Division de la chaîne de chiffres séparés par des espaces --%>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
    <%int[] tab = new int[tableauDeChiffres.length]; %>
        <%for (int i = 0; i < tableauDeChiffres.length; i++) { %>
            <%tab[i] = Integer.parseInt(tableauDeChiffres[i]); %>
       <% } %>
<p>Le tableau contient <%= tab.length %> valeurs :</p>
<p>
    <% for (int i = 0; i < tab.length; i++) { %>
           <% out.println("Valeur " + (i+1) + " : " + tab[i]); %>
       <% } %>
</p>


<h2>Exercice 1 : Le carré de la première valeur</h2>
<p>Ecrire un programme afin d'afficher le carré de la première valeur</p>
<p>Le carré de <%= tab[0] %> est : <%= (tab[0] * tab[0]) %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<p>Ecrire un programme afin d'afficher la somme des deux premières valeurs</p>
<p>Somme = <%= (tab[0] + tab[1]) %></p>




<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
