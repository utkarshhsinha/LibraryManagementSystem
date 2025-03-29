<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add a Book</title>
    <link rel="icon" type="image/x-icon" href="https://png.pngtree.com/png-vector/20230801/ourmid/pngtree-library-icon-with-a-window-and-books-vector-png-image_6821977.png">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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
        .form-label {
            font-weight: bold;
        }
    </style>

    <!-- jQuery (for AJAX) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="container">
        <h2 class="text-center mb-4">📚 Add a Book</h2>

        <!-- Book Form -->
        <form id="bookForm">
            <div class="mb-3">
                <label class="form-label">Title:</label>
                <input type="text" name="title" id="title" class="form-control" placeholder="Enter book title" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Author:</label>
                <input type="text" name="author" id="author" class="form-control" placeholder="Enter author name" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Genre:</label>
                <input type="text" name="genre" id="genre" class="form-control" placeholder="Enter genre (optional)">
            </div>

            <div class="mb-3">
                <label class="form-label">Availability:</label>
                <select name="availability" id="availability" class="form-select">
                    <option value="Available">Available</option>
                    <option value="Unavailable">Unavailable</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success w-100">📖 Add Book</button>
        </form>

        <!-- Message Box -->
        <div id="messageBox" class="mt-3"></div>

        <!-- Display entered data -->
        <div id="bookData" class="mt-4 p-3 border rounded bg-light" style="display: none;">
            <h5>📌 Book Entered:</h5>
            <p><strong>Title:</strong> <span id="displayTitle"></span></p>
            <p><strong>Author:</strong> <span id="displayAuthor"></span></p>
            <p><strong>Genre:</strong> <span id="displayGenre"></span></p>
            <p><strong>Availability:</strong> <span id="displayAvailability"></span></p>
        </div>

        <!-- View Books & Home Buttons -->
        <div class="d-grid gap-2 mt-3">
            <a href="viewBooks" class="btn btn-primary">📚 View All Books</a>
            <a href="index.jsp" class="btn btn-secondary">⬅ Back to Home</a>
        </div>
    </div>

    <!-- AJAX Form Submission -->
    <script>
        $(document).ready(function () {
            $("#bookForm").submit(function (event) {
                event.preventDefault();  // Prevent page reload
                
                $.ajax({
                    type: "POST",
                    url: "addBook",
                    data: $(this).serialize(),
                    success: function (response) {
                        $("#messageBox").html('<div class="alert alert-success">✅ Book added successfully!</div>');

                        // Update book details below the form
                        $("#displayTitle").text($("#title").val());
                        $("#displayAuthor").text($("#author").val());
                        $("#displayGenre").text($("#genre").val());
                        $("#displayAvailability").text($("#availability").val());

                        // Show entered data section
                        $("#bookData").show();

                        // Reset form fields
                        $("#bookForm")[0].reset();
                    },
                    error: function () {
                        $("#messageBox").html('<div class="alert alert-danger">❌ Error adding book. Try again.</div>');
                    }
                });
            });
        });
    </script>
</body>

</html>