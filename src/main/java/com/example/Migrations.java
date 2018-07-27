package com.example;

import org.flywaydb.core.Flyway;

public class Migrations {
    public static void main(String[] args) throws Exception {
        Flyway flyway = new Flyway();
        flyway.setDataSource(System.getenv("JDBC_DATABASE_URL"),
                             System.getenv("JDBC_DATABASE_USERNAME"),
                             System.getenv("JDBC_DATABASE_PASSWORD"));
        flyway.migrate();
    }
}