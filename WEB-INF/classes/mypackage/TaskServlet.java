
package mypackage;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class TaskServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

        if (tasks == null) {
            tasks = new ArrayList<>();
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String date = request.getParameter("dueDate");
            LocalDate dueDate = LocalDate.parse(date);
            tasks.add(new Task(title, description, dueDate));
        } 
        else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.remove(index);
        } 
        else if ("complete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.get(index).setCompleted(true);
        }

        session.setAttribute("tasks", tasks);
        response.sendRedirect("Projet.jsp");
    }
}
