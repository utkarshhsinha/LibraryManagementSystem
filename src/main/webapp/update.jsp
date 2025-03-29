<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h2 class="text-center">📖 Search & Update Book</h2>

    <%-- Display message --%>
    <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-info text-center"><%= request.getAttribute("message") %></div>
    <% } %>

    <%-- Search Form --%>
    <form action="updateBook" method="post" class="card p-4">
        <div class="mb-3">
            <label class="form-label">Search Book by ID or Title:</label>
            <input type="text" name="searchQuery" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">🔍 Search</button>
    </form>

    <%-- Show Search Results --%>
   <% if (request.getAttribute("searchResults") != null) { %>
    <h3 class="mt-4">Search Results:</h3>
    <ul class="list-group">
        <% for (com.library.model.Book book : (java.util.List<com.library.model.Book>) request.getAttribute("searchResults")) { %>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <div class="fs-5">
                    <strong>ID:</strong> <%= book.getId() %> | 
                    <strong>Title:</strong> <%= book.getTitle() %> | 
                    <strong>Author:</strong> <%= book.getAuthor() %>
                </div>
                <form action="updateBook" method="post">
                    <input type="hidden" name="bookId" value="<%= book.getId() %>">
                    <button type="submit" class="btn btn-warning btn-sm">✏ Update</button>
                </form>
            </li>
        <% } %>
    </ul>
<% } %>


    <%-- Conditionally Show Update Form or Updated Details --%>
    <% if (request.getAttribute("bookUpdated") != null) { 
        com.library.model.Book book = (com.library.model.Book) request.getAttribute("bookUpdated"); %>

        <%-- Show Updated Book Details --%>
        <h3 class="mt-4">📌 Book Details:</h3>
        <div class="alert alert-light border p-3">
            <p><strong>ID:</strong> <%= book.getId() %></p>
            <p><strong>Title:</strong> <%= book.getTitle() %></p>
            <p><strong>Author:</strong> <%= book.getAuthor() %></p>
            <p><strong>Genre:</strong> <%= book.getGenre() %></p>
            <p><strong>Availability:</strong> <%= book.getAvailability() %></p>
        </div>

    <% } else if (request.getAttribute("bookBeforeUpdate") != null) { 
        com.library.model.Book book = (com.library.model.Book) request.getAttribute("bookBeforeUpdate"); %>
        
        <%-- Show Update Form --%>
        <h3 class="mt-4">Update Book Details</h3>
        <form action="updateBook" method="post" class="card p-4">
            <input type="hidden" name="bookId" value="<%= book.getId() %>">
            
            <div class="mb-3">
                <label class="form-label">New Title:</label>
                <input type="text" name="title" class="form-control" value="<%= book.getTitle() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">New Author:</label>
                <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">New Genre:</label>
                <input type="text" name="genre" class="form-control" value="<%= book.getGenre() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">New Availability:</label>
                <select name="availability" class="form-control">
                    <option value="Available" <%= book.getAvailability().equals("Available") ? "selected" : "" %>>Available</option>
                    <option value="Not Available" <%= book.getAvailability().equals("Not Available") ? "selected" : "" %>>Not Available</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success w-100">✅ Update Book</button>
        </form>
    <% } %>

    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-secondary">⬅ Back to Home</a>
    </div>

</body>
</html>
