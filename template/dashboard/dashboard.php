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
    <meta name="theme-color" content="#0b0b0f">
    <title>Dashboard - Pathe &amp; Rillettes</title>
    <link rel="stylesheet" type="text/css" href="style/global.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <div id="data" data-id="<?php echo (int)$_SESSION['id_user']; ?>"></div>
    <?php include '../navbar.html'; ?>

    <main class="content">
        <!-- L'ordre des h2 est utilisé par script.js (masquage des sections vides) -->
        <section class="rail">
            <h2>Continue Watching</h2>
            <div class="row" id="ContinueWatching"></div>
        </section>
        <section class="rail">
            <h2>Popular on Pathe &amp; Rillettes</h2>
            <div class="row" id="Popular"></div>
        </section>
        <section class="rail">
            <h2>My list</h2>
            <div class="row" id="MyList"></div>
        </section>
        <section class="rail">
            <h2>Recommended for You</h2>
            <div class="row" id="Recommended"></div>
        </section>
        <section class="rail">
            <h2>All Movies</h2>
            <div id="AllMovies" class="grid"></div>
        </section>
    </main>

    <!-- The Modal -->
    <div id="myModal" class="modal" role="dialog" aria-modal="true" aria-labelledby="movieTitle">
        <div class="modal-content">
            <span class="close" role="button" tabindex="0" aria-label="Close">&times;</span>
            <div id="content-movie">
                <h2 id="movieTitle"></h2>
                <p id="movieDescription"></p>
                <div id="reviews">
                    <h3 class="review-title">Reviews</h3>
                    <div class="review-content">
                        <div id="stars-notation"></div>
                        <button id="addToWatchListButton" type="button"></button>
                    </div>
                </div>
                <button id="playButton" type="button">Play</button>
            </div>
            <div id="poster"></div>
        </div>
    </div>

    <script src="/pathe_rillette/jquery-3.7.1.min.js"></script>
    <script src="script.js"></script>
</body>

</html>
