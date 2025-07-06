package com.heroku.java;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;
import java.util.Date;
import java.sql.SQLException;

import org.jscience.physics.amount.Amount;
import org.jscience.physics.model.RelativisticModel;
import javax.measure.unit.SI;

import com.heroku.java.Task;
import com.heroku.java.Status;

@SpringBootApplication
@RestController
public class KanbanApplication {
    private final DataSource dataSource;

    @Autowired
    public KanbanApplication(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @GetMapping(value = "/tasks", produces = "application/json")
    public ResponseEntity<ArrayList<Task>> getTasks() throws SQLException {
        Connection connection = dataSource.getConnection();
        final var statement = connection.createStatement();
        final var resultSet = statement.executeQuery("SELECT * FROM task");
        final ArrayList<Task> output = new ArrayList<>();

        while (resultSet.next()) {
            final Task task = new Task();
            task.setId(resultSet.getObject("id", UUID.class));
            task.setTitle(resultSet.getString("title"));
            task.setDescription(resultSet.getString("description"));
            task.setDueDate(resultSet.getDate("due_date"));
            task.setAssignee(resultSet.getObject("id", UUID.class));
            task.setStoryPoints(resultSet.getInt("story_points"));
            task.setStatus(Status.valueOf(resultSet.getString("status")));
            task.setRank(resultSet.getDouble("rank"));

            output.add(task);
        }

        return ResponseEntity.ok(output);
    }

    public String formatString(String str) {
        if (str == null) {
            return "NULL";
        }
        return "'" + str + "'";
    }

    public String formatDate(Date date) {
        if (date == null) {
            return "NULL";
        }
        return formatString(String.format("%tY-%tm-%td", date, date, date));
    }

    public String formatUUID(UUID id) {
        if (id == null) {
            return "NULL";
        }
        return formatString(id.toString());
    }

    @PostMapping(value = "/task", produces = "application/json", consumes = "application/json")
    public ResponseEntity<Task> createTask(@RequestBody Task task) throws SQLException {
        Connection connection = dataSource.getConnection();
        final var statement = connection.createStatement();
        UUID id = UUID.randomUUID();
        task.setId(id);
        String sql = "INSERT INTO task (id, title, description, due_date, assignee, story_points, status, rank) VALUES (" + formatUUID(id) + ", " + formatString(task.getTitle()) + ", " + formatString(task.getDescription()) + ", " + formatDate(task.getDueDate()) + ", " + formatUUID(task.getAssignee()) + ", " + task.getStoryPoints() + ", " + formatString(task.getStatus().toString()) + ", " + task.getRank() + ")";
        statement.executeUpdate(sql);
        return ResponseEntity.ok(task);
    }

    public static void main(String[] args) {
        SpringApplication.run(KanbanApplication.class, args);
    }
}
