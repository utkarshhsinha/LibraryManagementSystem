<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Library Management System</title>
    <link rel="icon" type="image/x-icon" href="https://png.pngtree.com/png-vector/20230801/ourmid/pngtree-library-icon-with-a-window-and-books-vector-png-image_6821977.png">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
        }
        .btn-lg {
            font-size: 22px;
            padding: 15px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
    </style>
</head>

<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="container text-center">

        <!-- Header -->
        <h1 class="mb-4">📚 Library Management System</h1>

        <!-- Navigation Buttons -->
        <div class="d-grid gap-3">

            <!-- Add a Book -->
            <a href="addBook.jsp" class="btn btn-primary btn-lg">➕ Add a Book</a>

            <!-- View All Books -->
            <a href="viewBooks" class="btn btn-success btn-lg">📖 View All Books</a>

            <!-- Search for a Book -->
            <a href="search.jsp" class="btn btn-info btn-lg">🔍 Search a Book</a>

            <!-- Update Book Details -->
            <a href="update.jsp" class="btn btn-warning btn-lg">✏ Update Book</a>

            <!-- Delete a Book -->
            <a href="delete.jsp" class="btn btn-danger btn-lg">🗑 Delete a Book</a>

            <!-- Exit System -->
            <a href="exit.jsp" class="btn btn-dark btn-lg">🚪 Exit System</a>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
