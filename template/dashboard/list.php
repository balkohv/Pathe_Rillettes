<?php
session_start();
if (!isset($_SESSION['id_user'])) {
    header('Location: /pathe_rillette/login');
    exit;
}
$search = isset($_GET['search']) ? (string)$_GET['search'] : '';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#0b0b0f">
    <title>Search - Pathe &amp; Rillettes</title>
    <link rel="stylesheet" type="text/css" href="../../style/global.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <div id="data" data-id="<?php echo (int)$_SESSION['id_user']; ?>"></div>
    <?php include '../navbar.html'; ?>

    <main class="content">
        <h1 class="page-title">Results for &laquo;&nbsp;<?php echo htmlspecialchars($search); ?>&nbsp;&raquo;</h1>
        <div id="searchResults" class="grid"></div>
    </main>

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

    <script src="../../jquery-3.7.1.min.js"></script>
    <script src="../../script.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: '../../dispatch/movieDispatch.php',
                type: 'POST',
                data: {
                    action: 'search',
                    search: <?php echo json_encode($search); ?>
                },
                success: function(response) {
                    var movies = JSON.parse(response);
                    var $results = $('#searchResults');
                    if (movies.length === 0) {
                        $results.append('<p class="empty">No movie found.</p>');
                        return;
                    }
                    var $row = $results;
                    movies.forEach(function(movie) {
                        var $item = $('<div class="item"></div>').attr('id', movie["id_movie"]);
                        $('<img>').attr({
                            src: movie["poster_ref"],
                            alt: movie["title"],
                            title: movie["title"],
                            loading: 'lazy'
                        }).appendTo($item);
                        $row.append($item);
                    });
                }
            });
        });
    </script>
</body>

</html>
