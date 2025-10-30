<%@ page import="java.util.*, mypackage.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Récupération de la liste des tâches depuis la session
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Gestion de l'ajout d'une tâche
    String action = request.getParameter("action");
    if ("ajouter".equals(action)) {
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String dateStr = request.getParameter("date");
        Date dateEcheance = null;
        try {
            dateEcheance = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
        } catch(Exception e) {}
        tasks.add(new Task(titre, description, dateEcheance));
    }

    // Gestion de la suppression
    if ("supprimer".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < tasks.size()) {
            tasks.remove(index);
        }
    }

    // Gestion du marquage comme terminée
    if ("terminer".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < tasks.size()) {
            tasks.get(index).setTerminee(true);
        }
    }
%>

<html>
<head>
    <title>Mini Gestionnaire de Tâches</title>
    <meta charset="UTF-8">
</head>
<body>
<h1>Mini Gestionnaire de Tâches Collaboratif</h1>

<h2>Ajouter une tâche</h2>
<form method="post" action="Projet.jsp">
    <input type="hidden" name="action" value="ajouter"/>
    Titre : <input type="text" name="titre" required/><br/>
    Description : <input type="text" name="description" required/><br/>
    Date d'échéance : <input type="date" name="date"/><br/>
    <input type="submit" value="Ajouter"/>
</form>

<h2>Liste des tâches</h2>
<table border="1">
    <tr>
        <th>Titre</th>
        <th>Description</th>
        <th>Date d'échéance</th>
        <th>Terminé</th>
        <th>Actions</th>
    </tr>
<%
    for (int i = 0; i < tasks.size(); i++) {
        Task t = tasks.get(i);
%>
    <tr>
        <td><%= t.getTitre() %></td>
        <td><%= t.getDescription() %></td>
        <td><%= t.getDateEcheance() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(t.getDateEcheance()) : "" %></td>
        <td><%= t.isTerminee() ? "Oui" : "Non" %></td>
        <td>
            <form style="display:inline" method="post" action="Projet.jsp">
                <input type="hidden" name="action" value="supprimer"/>
                <input type="hidden" name="index" value="<%= i %>"/>
                <input type="submit" value="Supprimer"/>
            </form>
            <% if (!t.isTerminee()) { %>
            <form style="display:inline" method="post" action="Projet.jsp">
                <input type="hidden" name="action" value="terminer"/>
                <input type="hidden" name="index" value="<%= i %>"/>
                <input type="submit" value="Terminer"/>
            </form>
            <% } %>
        </td>
    </tr>
<% } %>
</table>

<p><a href="index.html">Retour à l'accueil</a></p>
</body>
</html>
