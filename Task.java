
package mypackage;

import java.io.Serializable;
import java.time.LocalDate;

public class Task implements Serializable {
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

    public void setCompleted(boolean completed) { this.completed = completed; }
}
