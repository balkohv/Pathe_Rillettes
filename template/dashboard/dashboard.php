<?php
session_start();
if (!isset($_SESSION['id_user'])) {
    header('Location: /pathe_rillette/login');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/global.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <div id="data" data-id="<?php echo $_SESSION['id_user']; ?>"></div>
    <?php include '../navbar.html'; ?>
    <!-- nav bar -->
    <div class="content">
        <h2>Liked</h2>
        <div class="row" id="ContinueWatching">
            <!-- Movies will be displayed here -->
        </div>
        <h2>Popular on Pathe & Rillettes</h2>
        <div class="row" id="Popular">
            <!-- Movies will be displayed here -->
        </div>
        <h2>My list</h2>
        <div class="row" id="MyList">
            <!-- Movies will be displayed here -->
        </div>
        <h2>Recommended for You</h2>
        <div class="row" id="Recommended">
            <!-- Movies will be displayed here -->
        </div>
        <h2>All Movies</h2>
        <div class="row" id="AllMovies">
            <!-- Movies will be displayed here -->
        </div>
    </div>

    <!-- The Modal -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div id="content-movie">
                <h2 id="movieTitle"></h2>
                <p id="movieDescription"></p>
                <div id="reviews">
                    <h3 class="review-title">Reviews</h3>
                    <div class="review-content">
                        <div id="stars-notation">
                        </div>
                        <button id="addToWatchListButton"></button>
                    </div>
                </div>
                <button id="playButton">Like</button>
            </div>
            <div id="poster"></div>
        </div>
    </div>
</body>

</html>
<script src="/pathe_rillette/jquery-3.7.1.min.js"></script>
<script src="script.js"></script>