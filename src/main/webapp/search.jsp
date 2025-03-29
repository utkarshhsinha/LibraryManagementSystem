<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.library.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h2 class="text-center">🔍 Search Book</h2>

    <!-- ✅ Corrected form action to use searchBook servlet -->
    <form action="searchBook" method="get" class="card p-4">
        <div class="mb-3">
            <label class="form-label">Enter Book Title:</label>
            <input type="text" name="query" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-info w-100">🔍 Search</button>
    </form>

    <%
        // Retrieve search results from servlet
        List<Book> books = (List<Book>) request.getAttribute("books");
        if (books != null) {
    %>

    <div class="mt-4">
        <h3>📚 Search Results:</h3>
        <% if (books.isEmpty()) { %>
            <p class="text-danger">❌ No books found for your search.</p>
        <% } else { %>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Genre</th>
                        <th>Availability</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Book book : books) { %>
                        <tr>
                            <td><%= book.getId() %></td>
                            <td><%= book.getTitle() %></td>
                            <td><%= book.getAuthor() %></td>
                            <td><%= book.getGenre() %></td>
                            <td><%= book.getAvailability() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <% } %>

    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-secondary">⬅ Back to Home</a>
    </div>

</body>
</html>
