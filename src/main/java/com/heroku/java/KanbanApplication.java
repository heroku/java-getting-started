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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.CrossOrigin;

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
import com.heroku.java.SQLFormatter;

@SpringBootApplication
@RestController
public class KanbanApplication {
    private final DataSource dataSource;

    @Autowired
    public KanbanApplication(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
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
            task.setAssignee(resultSet.getObject("assignee", UUID.class));
            task.setStoryPoints(resultSet.getInt("story_points"));
            task.setStatus(Status.valueOf(resultSet.getString("status")));
            task.setRank(resultSet.getDouble("rank"));

            output.add(task);
        }

        connection.close();

        return ResponseEntity.ok(output);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @PostMapping(value = "/task", produces = "application/json", consumes = "application/json")
    public ResponseEntity<Task> createTask(@RequestBody Task task) throws SQLException {
        Connection connection = dataSource.getConnection();
        final var statement = connection.createStatement();
        UUID id = UUID.randomUUID();
        task.setId(id);
        String sql = "INSERT INTO task (id, title, description, due_date, assignee, story_points, status, rank) VALUES (" + SQLFormatter.formatUUID(id) + ", " + SQLFormatter.formatString(task.getTitle()) + ", " + SQLFormatter.formatString(task.getDescription()) + ", " + SQLFormatter.formatDate(task.getDueDate()) + ", " + SQLFormatter.formatUUID(task.getAssignee()) + ", " + task.getStoryPoints() + ", " + SQLFormatter.formatString(task.getStatus().toString()) + ", " + task.getRank() + ")";
        statement.executeUpdate(sql);
        connection.close();
        return ResponseEntity.ok(task);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @PutMapping(value = "/task/{id}", produces = "application/json", consumes = "application/json")
    public ResponseEntity<Task> updateTask(@PathVariable("id") UUID id, @RequestBody Task task) throws SQLException {
        Connection connection = dataSource.getConnection();
        final var statement = connection.createStatement();
        String sql = "UPDATE task SET title = " + SQLFormatter.formatString(task.getTitle()) + ", description = " + SQLFormatter.formatString(task.getDescription()) + ", due_date = " + SQLFormatter.formatDate(task.getDueDate()) + ", assignee = " + SQLFormatter.formatUUID(task.getAssignee()) + ", story_points = " + task.getStoryPoints() + ", status = " + SQLFormatter.formatString(task.getStatus().toString()) + ", rank = " + task.getRank() + " WHERE id = " + SQLFormatter.formatUUID(id);
        statement.executeUpdate(sql);
        connection.close();
        return ResponseEntity.ok(task);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @DeleteMapping(value = "/task/{id}")
    public ResponseEntity<Void> deleteTask(@PathVariable("id") UUID id) throws SQLException {
        Connection connection = dataSource.getConnection();
        final var statement = connection.createStatement();
        String sql = "DELETE FROM task WHERE id = " + SQLFormatter.formatUUID(id);
        statement.executeUpdate(sql);
        connection.close();
        return ResponseEntity.ok().build();
    }

    public static void main(String[] args) {
        SpringApplication.run(KanbanApplication.class, args);
    }
}
