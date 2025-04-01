package com.ehotels;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/ehotels";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "password";

    public static Connection getConnection() throws SQLException {
        System.out.println("Attempting to connect to PostgreSQL...");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}