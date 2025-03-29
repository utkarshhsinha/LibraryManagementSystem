<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exit System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="https://png.pngtree.com/png-vector/20230801/ourmid/pngtree-library-icon-with-a-window-and-books-vector-png-image_6821977.png">
</head>
<body class="d-flex justify-content-center align-items-center vh-100">

    <div class="text-center">
        <h2>📙 Exit System</h2>
        <p>Are you sure you want to exit?</p>

        <button class="btn btn-secondary me-2" onclick="goBack()">🔙 No, Go Back</button>
        <button class="btn btn-dark" onclick="closeTab()">✅ Yes, Exit</button>
    </div>

    <script>
        function closeTab() {
            // Try closing the tab normally
            window.open('', '_self').close();

            // If closing fails, show an alert
            setTimeout(() => {
                alert("❌ Your browser prevented automatic closing. Please close the tab manually.");
            }, 500);
        }

        function goBack() {
            window.history.back(); // Go back to the previous page
        }
    </script>

</body>
</html>
