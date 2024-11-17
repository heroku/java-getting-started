package com.heroku.java;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@SpringBootApplication
@Controller
@SessionAttributes("user")  // This ensures the user attribute is available across requests
public class GettingStartedApplication {

    private final DataSource dataSource;

    @Autowired
    public GettingStartedApplication(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Homepage: Show login form
    @GetMapping("/")
    public String index() {
        return "login"; // Show the login form
    }

    // Handle login form submission
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Model model) {
        try (Connection connection = dataSource.getConnection()) {
            // Query to check if user exists with matching username and password
            String sql = "SELECT * FROM \"user\" WHERE username = ? AND password_hash = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password); // In a real app, hash the password first
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // If user is found, set the user object in the session
                    model.addAttribute("user", username);  // Store the username in session
                    return "redirect:/dashboard"; // Redirect to dashboard after successful login
                } else {
                    model.addAttribute("error", "Invalid username or password");
                    return "login"; // If invalid credentials, show the login form again
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "Error occurred during login.");
            return "login"; // If an error occurs, show the login form
        }
    }

    // Dashboard: Only accessible if the user is logged in
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        // Check if the user is logged in by checking if the "user" attribute is in the session
        if (model.containsAttribute("user")) {
            return "dashboard"; // Show the dashboard if the user is authenticated
        } else {
            return "redirect:/"; // Redirect to login if the user is not logged in
        }
    }

    // Logout: Clear the session and redirect to the login page
    @RequestMapping("/logout")
    public String logout(Model model) {
        model.addAttribute("user", null); // Remove the user attribute from the session
        return "redirect:/"; // Redirect to the login page
    }

    public static void main(String[] args) {
        SpringApplication.run(GettingStartedApplication.class, args);
    }
}
