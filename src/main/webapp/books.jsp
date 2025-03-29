<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.library.model.Book" %>
<html>
<head>
    <title>View Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="container">
        <h2 class="text-center mb-4">📚 Available Books</h2>

        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books == null || books.isEmpty()) {
        %>
            <p class="text-center text-danger">❌ No books found.</p>
        <% } else { %>
            <p class="text-center">📌 Total books: <strong><%= books.size() %></strong></p>

            <table class="table table-bordered table-striped">
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

        <!-- Buttons -->
        <div class="d-grid gap-2 mt-4">
            
            <a href="index.jsp" class="btn btn-secondary btn-lg">🏠 Go Home</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
