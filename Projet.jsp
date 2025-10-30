
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
    body {font-family: "Segoe UI", Arial, sans-serif; background: linear-gradient(135deg, #f6f8fc, #e8efff); margin: 0;padding: 0;}
    header {background-color: #3366cc; color: white; padding: 20px 40px; text-align: center; box-shadow: 0 2px 6px rgba(0,0,0,0.1);}
    h1 { margin: 0; font-size: 28px;}
    main {max-width: 900px; margin: 30px auto; background: white; padding: 30px 40px; border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1);}
    h2 { color: #3366cc; border-bottom: 2px solid #3366cc; padding-bottom: 5px;}
    form {margin: 15px 0;}
    label {font-weight: bold; color: #444; }
    input[type="text"],
    input[type="date"],
    textarea {width: 100%; padding: 10px; margin-top: 5px; border-radius: 6px; border: 1px solid #ccc; box-sizing: border-box; font-size: 14px;}
    input[type="submit"], button { background-color: #3366cc; color: white; border: none; border-radius: 6px; padding: 8px 15px; font-size: 14px; cursor: pointer; transition: background 0.3s;}
    input[type="submit"]:hover,
    button:hover { background-color: #254c99;}
    table { width: 100%; border-collapse: collapse; margin-top: 25px; background-color: #fafafa; }
    th, td { text-align: left; padding: 10px; border-bottom: 1px solid #ddd;}
    th { background-color: #3366cc; color: white; }
    tr:hover { background-color: #f1f5ff;}
    .completed { text-decoration: line-through; color: #777;}
    .actions form { display: inline;}
    footer { text-align: center; color: #666; padding: 20px; font-size: 13px;}
    .no-task {background: #eef4ff; padding: 15px; border-radius: 6px; border-left: 5px solid #3366cc; color: #333; margin-top: 15px;}
    .btn-complete { background-color: #28a745;}
    .btn-complete:hover { background-color: #218838; }
    .btn-delete { background-color: #dc3545; }
    .btn-delete:hover { background-color: #b02a37;}
    .top-links { text-align: right; margin-bottom: 10px;}
    .top-links a { color: #3366cc; text-decoration: none; font-weight: bold;}
    .top-links a:hover { text-decoration: underline; }
</style>
</head>
<body>
<div class="card">
    <h1>Mini Gestionnaire de Tâches Collaboratif</h1>

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
