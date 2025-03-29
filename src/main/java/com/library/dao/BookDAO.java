package com.library.dao;

import com.library.model.Book;
import com.library.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private static final String INSERT_BOOK = "INSERT INTO books (title, author, genre, availability) VALUES (?, ?, ?, ?)";
    private static final String GET_ALL_BOOKS = "SELECT * FROM books";
    private static final String SEARCH_BOOK = "SELECT * FROM books WHERE id = ? OR title LIKE ?";
    private static final String UPDATE_BOOK = "UPDATE books SET title=?, author=?, genre=?, availability=? WHERE id=?";
    private static final String DELETE_BOOK = "DELETE FROM books WHERE id=?";

    // ✅ Add a Book (Ensuring Transaction Commitment)
    public static boolean addBook(Book book) {
        String sql = "INSERT INTO books (title, author, genre, availability) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setString(3, book.getGenre());
            stmt.setString(4, book.getAvailability());

            System.out.println("[DEBUG] Executing SQL: " + stmt.toString());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("[SUCCESS] Book added successfully to the database!");
                return true;
            } else {
                System.out.println("[ERROR] No rows inserted.");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("[SQL ERROR] Error inserting book: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get All Books (Ensuring Connection Closes Correctly)
    public static List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(GET_ALL_BOOKS);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                books.add(new Book(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("genre"),
                        rs.getString("availability")
                ));
            }

            System.out.println("📌 BookDAO: Total books fetched = " + books.size());

        } catch (SQLException e) {
            System.err.println("❌ Error fetching books: " + e.getMessage());
            e.printStackTrace();
        }
        return books;
    }

    // ✅ Search a Book by ID or Title
    public static List<Book> searchBook(String query) {
        List<Book> books = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_BOOK)) {

            try {
                stmt.setInt(1, Integer.parseInt(query)); // Try treating query as an ID
            } catch (NumberFormatException e) {
                stmt.setInt(1, -1); // If it's not a number, set to an invalid ID
            }
            stmt.setString(2, "%" + query + "%"); // Search by title

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    books.add(new Book(rs.getInt("id"), rs.getString("title"), rs.getString("author"),
                            rs.getString("genre"), rs.getString("availability")));
                }
            }
        } catch (SQLException e) {
            System.err.println("❌ Error searching book: " + e.getMessage());
            e.printStackTrace();
        }
        return books;
    }

    // ✅ Update a Book
    
    public static boolean updateBook(int bookId, String title, String author, String genre, String availability) {
        boolean rowUpdated = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE books SET title=?, author=?, genre=?, availability=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(UPDATE_BOOK);
            stmt.setString(1, title);
            stmt.setString(2, author);
            stmt.setString(3, genre);
            stmt.setString(4, availability);
            stmt.setInt(5, bookId);

            int rowsAffected = stmt.executeUpdate();
            rowUpdated = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    // ✅ Delete a Book
        // ✅ Get a Book by ID
        public static Book getBookById(int bookId) {
            Book book = null;
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM books WHERE id = ?")) {

                stmt.setInt(1, bookId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    book = new Book(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getString("genre"),
                            rs.getString("availability")
                    );
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return book;
        }

        // ✅ Delete a Book
        public static boolean deleteBook(int bookId) {
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM books WHERE id = ?")) {

                stmt.setInt(1, bookId);
                int rowsDeleted = stmt.executeUpdate();

                return rowsDeleted > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }
}
