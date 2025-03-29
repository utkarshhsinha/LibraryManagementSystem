package com.library.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/library"; // PostgreSQL database URL
    private static final String USER = "postgres";  // PostgreSQL username
    private static final String PASSWORD = "123"; // PostgreSQL password

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC Driver not found! Add the PostgreSQL JDBC JAR to your project.");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("[DEBUG] Database connection successful!");
        } catch (SQLException e) {
            System.err.println("[ERROR] Database connection failed! Check your URL, username, and password.");
            e.printStackTrace();
        }
        return conn;
    }
}
