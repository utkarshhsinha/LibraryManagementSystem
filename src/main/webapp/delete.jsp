<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete a Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="container">
        <h2 class="text-center">🗑️ Delete a Book</h2>

        <!-- Book ID Input -->
        <form id="fetchForm" class="card p-4">
            <div class="mb-3">
                <label class="form-label">Enter Book ID/Title:</label>
                <input type="text" name="bookId" id="bookId" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">🔍 Fetch Book Details</button>
        </form>

        <!-- Message Box -->
        <div id="messageBox" class="mt-3"></div>

        <!-- Display Fetched Book Details -->
        <div id="bookDetails" class="mt-4 p-3 border rounded bg-light" style="display: none;">
            <h5>📌 Book Details:</h5>
            <p><strong>ID:</strong> <span id="fetchedId"></span></p>
            <p><strong>Title:</strong> <span id="fetchedTitle"></span></p>
            <p><strong>Author:</strong> <span id="fetchedAuthor"></span></p>
            <p><strong>Genre:</strong> <span id="fetchedGenre"></span></p>
            <p><strong>Availability:</strong> <span id="fetchedAvailability"></span></p>
            <button id="deleteBookBtn" class="btn btn-danger w-100">🗑 Delete Book</button>
        </div>

        <!-- Back Button -->
        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-secondary">⬅ Back to Home</a>
        </div>
    </div>

    <!-- AJAX Script -->
    <script>
        $(document).ready(function () {
            // Fetch book details
            $("#fetchForm").submit(function (event) {
                event.preventDefault();
                var bookId = $("#bookId").val();

                $.ajax({
                    type: "POST",
                    url: "DeleteBook",
                    data: { bookId: bookId, action: "fetch" },
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            $("#messageBox").html('<div class="alert alert-info">📌 Book details fetched.</div>');

                            $("#fetchedId").text(response.book.id);
                            $("#fetchedTitle").text(response.book.title);
                            $("#fetchedAuthor").text(response.book.author);
                            $("#fetchedGenre").text(response.book.genre);
                            $("#fetchedAvailability").text(response.book.availability);

                            $("#bookDetails").show();
                        } else {
                            $("#messageBox").html('<div class="alert alert-danger">❌ ' + response.message + '</div>');
                        }
                    },
                    error: function () {
                        $("#messageBox").html('<div class="alert alert-danger">❌ Error fetching book details.</div>');
                    }
                });
            });

            // Delete book
            $("#deleteBookBtn").click(function () {
                var bookId = $("#fetchedId").text();

                $.ajax({
                    type: "POST",
                    url: "DeleteBook",
                    data: { bookId: bookId, action: "delete" },
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            $("#messageBox").html('<div class="alert alert-success">✅ ' + response.message + '</div>');
                            $("#bookDetails").hide();
                        } else {
                            $("#messageBox").html('<div class="alert alert-danger">❌ ' + response.message + '</div>');
                        }
                    },
                    error: function () {
                        $("#messageBox").html('<div class="alert alert-danger">❌ Error deleting book.</div>');
                    }
                });
            });
        });
    </script>
</body>
</html>
