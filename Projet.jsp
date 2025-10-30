
<%@ page import="java.util.*, java.time.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // --- Classe interne représentant une tâche ---
    class Task {
        private String title;
        private String description;
        private LocalDate dueDate;
        private boolean completed;

        public Task(String title, String description, LocalDate dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
            this.completed = false;
        }

        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public LocalDate getDueDate() { return dueDate; }
        public boolean isCompleted() { return completed; }
        public void setCompleted(boolean c) { this.completed = c; }
    }

    // --- Liste des tâches stockée en session ---
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // --- Actions du formulaire ---
    String action = request.getParameter("action");

    if ("add".equals(action)) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dateStr = request.getParameter("dueDate");
        LocalDate dueDate = null;
        if (dateStr != null && !dateStr.isEmpty()) {
            try { dueDate = LocalDate.parse(dateStr); } catch (Exception e) {}
        }
        if (title != null && !title.trim().isEmpty()) {
            tasks.add(new Task(title, description, dueDate));
        }
    } else if ("delete".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < tasks.size()) tasks.remove(index);
    } else if ("complete".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < tasks.size()) tasks.get(index).setCompleted(true);
    }
%>

<html>
<head>
<meta charset="UTF-8">
<title>Mini Gestionnaire de Tâches</title>
<style>
    body { font-family: Arial; background: #f9f9f9; padding: 40px; }
    h1 { color: #333; }
    table { border-collapse: collapse; width: 100%; margin-top: 20px; background: #fff; }
    th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
    th { background-color: #eee; }
    .completed { text-decoration: line-through; color: gray; }
    form { margin: 0; display: inline; }
    .card { background:white; padding:20px; border-radius:10px; box-shadow:0 0 5px #ccc; }
</style>
</head>
<body>
<div class="card">
    <h1>🧩 Mini Gestionnaire de Tâches Collaboratif</h1>

    <!-- Formulaire d'ajout -->
    <h2>Ajouter une tâche</h2>
    <form method="post">
        <input type="hidden" name="action" value="add">
        <label>Titre :</label><br>
        <input type="text" name="title" required><br><br>

        <label>Description :</label><br>
        <textarea name="description" rows="3" cols="40" required></textarea><br><br>

        <label>Date d’échéance :</label><br>
        <input type="date" name="dueDate"><br><br>

        <input type="submit" value="Ajouter la tâche">
    </form>

    <!-- Liste des tâches -->
    <h2>Mes Tâches</h2>
    <%
        if (tasks.isEmpty()) {
    %>
        <p>Aucune tâche pour le moment.</p>
    <%
        } else {
    %>
        <table>
            <tr><th>#</th><th>Titre</th><th>Description</th><th>Échéance</th><th>Statut</th><th>Actions</th></tr>
            <%
                for (int i = 0; i < tasks.size(); i++) {
                    Task t = tasks.get(i);
            %>
            <tr>
                <td><%= i+1 %></td>
                <td class="<%= t.isCompleted() ? "completed" : "" %>"><%= t.getTitle() %></td>
                <td class="<%= t.isCompleted() ? "completed" : "" %>"><%= t.getDescription() %></td>
                <td><%= (t.getDueDate() != null) ? t.getDueDate() : "-" %></td>
                <td><%= t.isCompleted() ? "Terminée" : "En cours" %></td>
                <td>
                    <% if (!t.isCompleted()) { %>
                        <form method="post">
                            <input type="hidden" name="action" value="complete">
                            <input type="hidden" name="index" value="<%= i %>">
                            <input type="submit" value="✔ Terminer">
                        </form>
                    <% } %>
                    <form method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="submit" value="🗑 Supprimer">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    <%
        }
    %>

    <p><a href="index.html">🏠 Retour à l'accueil</a></p>
</div>
</body>
</html>
