package com.heroku.java;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.ArrayList;
import java.util.UUID;
import java.sql.SQLException;

import com.heroku.java.kanban.Task;

import com.heroku.java.kanban.KanbanUser;
import com.heroku.java.concerto.ConcertoService;
import com.heroku.java.kanban.KanbanService;

@SpringBootApplication
@RestController
public class Application {
    private final KanbanService kanbanService;
    private final ConcertoService concertoService;

    @Autowired
    public Application(KanbanService kanbanService, ConcertoService concertoService) {
        this.kanbanService = kanbanService;
        this.concertoService = concertoService;
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @GetMapping(value = "/tasks", produces = "application/json")
    public ResponseEntity<ArrayList<Task>> getTasks() throws SQLException {
        final ArrayList<Task> output = kanbanService.getTasks();
        return ResponseEntity.ok(output);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @PostMapping(value = "/task", produces = "application/json", consumes = "application/json")
    public ResponseEntity<Task> createTask(@RequestBody Task task) throws SQLException {
        final Task updatedTask = kanbanService.createTask(task);
        return ResponseEntity.ok(updatedTask);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @PutMapping(value = "/task/{id}", produces = "application/json", consumes = "application/json")
    public ResponseEntity<Task> updateTask(@PathVariable("id") UUID id, @RequestBody Task task) throws SQLException {
        final Task updatedTask = kanbanService.updateTask(id, task);
        return ResponseEntity.ok(updatedTask);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @DeleteMapping(value = "/task/{id}")
    public ResponseEntity<Void> deleteTask(@PathVariable("id") UUID id) throws SQLException {
        kanbanService.deleteTask(id);
        return ResponseEntity.ok().build();
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @GetMapping(value = "/kanban-users", produces = "application/json")
    public ResponseEntity<ArrayList<KanbanUser>> getKanbanUsers() throws SQLException {
        final ArrayList<KanbanUser> users = kanbanService.getKanbanUsers();
        return ResponseEntity.ok(users);
    }

    @CrossOrigin(origins = {"http://localhost:5173", "https://priyanjoli-mukherjee.github.io"})
    @PostMapping(value = "/concerto-data", produces = "application/json")
    public ResponseEntity<Void> createConcertoData(@RequestBody String password) throws SQLException {
        concertoService.generateData(password);
        return ResponseEntity.ok().build();
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
