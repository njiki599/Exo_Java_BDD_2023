
<%@ page import="java.util.*, mypackage.Task" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mini Gestionnaire de Tâches</title>
</head>
<body>
    <h1>Mini Gestionnaire de Tâches Collaboratif</h1>

    <h2>Ajouter une tâche</h2>
    <form action="TaskServlet" method="post">
        <input type="hidden" name="action" value="add">
        Titre : <input type="text" name="title" required><br>
        Description : <input type="text" name="description" required><br>
        Date d’échéance : <input type="date" name="dueDate" required><br>
        <input type="submit" value="Ajouter">
    </form>

    <h2>Liste des tâches</h2>
    <%
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
        if (tasks == null || tasks.isEmpty()) {
    %>
        <p>Aucune tâche pour le moment.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="5">
            <tr><th>Titre</th><th>Description</th><th>Échéance</th><th>État</th><th>Actions</th></tr>
            <%
                for (int i = 0; i < tasks.size(); i++) {
                    Task t = tasks.get(i);
            %>
                <tr>
                    <td><%= t.getTitle() %></td>
                    <td><%= t.getDescription() %></td>
                    <td><%= t.getDueDate() %></td>
                    <td><%= t.isCompleted() ? "Terminée" : "En cours" %></td>
                    <td>
                        <% if (!t.isCompleted()) { %>
                            <form action="TaskServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="complete">
                                <input type="hidden" name="index" value="<%= i %>">
                                <input type="submit" value="Terminer">
                            </form>
                        <% } %>
                        <form action="TaskServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="index" value="<%= i %>">
                            <input type="submit" value="Supprimer">
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <p><a href="index.html">Retour à l’accueil</a></p>
</body>
</html>
