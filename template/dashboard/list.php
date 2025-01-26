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
    <title>search result</title>
    <link rel="stylesheet" type="text/css" href="../../style/global.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <div id="data" data-id="<?php echo $_SESSION['id_user']; ?>"></div>
    <?php include '../navbar.html'; ?>
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
<script src="../../jquery-3.7.1.min.js"></script>
<script src="../../script.js"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            url: 'http://localhost:5000/recherche',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                requete: '<?php echo $_GET['search'] ?>'
            }),
            success: function(response) {
                let i = 0;
                let k = 0;
                var movies = response.resultats;
                var container_content = $('body');
                container_content.append('<div class="row" id="searchResult_' + k + '"></div>');
                var container = $('#searchResult_' + k);
                container.empty();
                movies.forEach(function(movie) {
                    console.log(movie);
                    i++;
                    if (i > 9) {
                        k++;
                        container_content.append('<div class="row" id="searchResult_' + k + '"></div>');
                        container = $('#searchResult_' + k);
                        i = 0;
                    }
                    container.append('<div class="item" id="' + movie["id"] + '"><img src="' + movie["poster"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"></div>');
                });
            }
        });
    });
</script>
</script>