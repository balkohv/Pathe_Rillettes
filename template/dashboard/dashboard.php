<?php
session_start();
if (!isset($_SESSION['id_user'])) {
    header('Location: ../login.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="../../style/global.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <?php include '../navbar.html'; ?>
    <!-- nav bar -->
    <div class="content">
        <h2>Continue Watching</h2>
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
                <button id="playButton">Play</button>
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
        main();


        async function main() {
            try {
                let movies = JSON.parse(await getMovies()); // Attendre que les films soient chargés
                let userMovies = JSON.parse(await getUserMovies()); // Attendre que les films de l'utilisateur soient chargés
                load_continous_watching(userMovies, movies);
                load_my_list(userMovies, movies);
                load_recommendations(userMovies, movies);
                load_popular_movies(movies);
                let container = $('#AllMovies');
                container.empty();
                movies.forEach(function(movie) {
                    container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"></div>');
                });

                $('#playButton').click(async function() {
                    await is_started($('#poster-modal').attr('class'), userMovies, 1);
                    window.location.href = '../movie/player.php?id=' + $('#poster-modal').attr('class');
                });

                $("#addToWatchListButton").click(async function() {
                    userMovies = JSON.parse(await getUserMovies());
                    console.log($('#poster-modal').attr('class'), userMovies, userMovies.find(userMovie => userMovie["id_movie"] == $('#poster-modal').attr('class'))["in_list"] == 0 ? 1 : 0);
                    await in_list($('#poster-modal').attr('class'), userMovies, userMovies.find(userMovie => userMovie["id_movie"] == $('#poster-modal').attr('class'))["in_list"] == 0 ? 1 : 0);
                    userMovies = JSON.parse(await getUserMovies());
                    $('#addToWatchListButton').text(userMovies.find(userMovie => userMovie["id_movie"] == $('#poster-modal').attr('class'))["in_list"] == 0 ? 'Add to Watch List' : 'Remove from Watch List');
                    load_my_list(userMovies, movies);
                });

                $('.item').hover(function() {
                    $(this).append('<div class="overlay">Play</div>');
                }, function() {
                    $(this).find('.overlay').remove();
                });

                $(document).on('click', '.item', async function() {
                    await checkUserMovie($(this).attr('id'));
                    userMovies = JSON.parse(await getUserMovies());
                    let id_movie = $(this).attr('id');
                    movies.forEach(function(movie) {
                        if (movie["id_movie"] == id_movie) {
                            var movieTitle = movie["title"];
                            var movieDescription = movie["description"];
                            $('#poster').empty();
                            $('#stars-notation').empty();
                            for (let i = 0; i < 10; i++) {
                                if (i + 1 < parseFloat(movie["review"])) {
                                    $('#stars-notation').append('<span class="fa fa-star" style="color: gold;"></span>');
                                } else {
                                    $('#stars-notation').append('<span class="fa fa-star"></span>');
                                }
                            }
                            $('#movieTitle').text(movieTitle);
                            $('#movieDescription').text(movieDescription);
                            $('#myModal').css('display', 'block');
                            $('#poster').append('<img id="poster-modal" class="' + movie["id_movie"] + '" src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '">');
                            $('#addToWatchListButton').text(userMovies.find(userMovie => userMovie["id_movie"] == movie["id_movie"])["in_list"] == 0 ? 'Add to Watch List' : 'Remove from Watch List');
                        }
                    });
                });

                $('.close').click(function() {
                    $('#myModal').css('display', 'none');
                });

                $(window).click(function(event) {
                    if (event.target.id == 'myModal') {
                        $('#myModal').css('display', 'none');
                    }
                });
            } catch (error) {
                console.error("Erreur lors de l'exécution de main:", error);
            }
        }

        function load_continous_watching(userMovies, movies) {
            let container = $('#ContinueWatching');
            container.empty();
            userMovies.sort((a, b) => new Date(b.watch_date) - new Date(a.watch_date));
            console.log(userMovies);
            userMovies.forEach(function(userMovie) {
                movies.forEach(function(movie) {
                    if (movie["id_movie"] == userMovie["id_movie"] && userMovie["is_finished"] == 0 && userMovie["is_started"] == 1) {
                        container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"><div class="progress-bar" style="width:'+ (userMovie["time_code"] / userMovie["duration"]) * 100 +'%;"></div><span class="close-item close-continue">&times;</span></div>');
                    }
                });
            });

            $('.close-continue').click(function(event) {
                event.stopPropagation();
                let id_movie = $(this).parent().attr('id');
                console.log(id_movie);
                $(this).parent().remove();
                is_started(id_movie, userMovies, 0);

            });
        }

        function load_popular_movies(movies) {
            let container = $('#Popular');
            movies.sort((a, b) => {
                return parseInt(b.views) - parseInt(a.views);
            });
            container.empty();
            let i = 0;
            movies.forEach(function(movie) {
                i += 1;
                if (i > 10) {
                    return;
                }
                container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"></div>');
            });
        }

        function load_my_list(userMovies, movies) {
            let container = $('#MyList');
            console.log(userMovies);
            container.empty();
            userMovies.forEach(function(userMovie) {
                movies.forEach(function(movie) {
                    if (movie["id_movie"] == userMovie["id_movie"] && userMovie["in_list"] == 1) {
                        container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"><span class="close-item close-list">&times;</span></div>');
                    }
                });
            });

            $('.close-list').click(function(event) {
                event.stopPropagation();
                let id_movie = $(this).parent().attr('id');
                $(this).parent().remove();
                in_list(id_movie, userMovies, 0);
            });
        }

        async function load_recommendations() {
            let recommandedMovie = JSON.parse(await get_recommanded_movies());
            recommandedMovie= Object.values(recommandedMovie);
            let container = $('#Recommended');
            console.log(recommandedMovie);
            container.empty();
            recommandedMovie.forEach(function(movie) {
                container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"></div>');
            });
        }

        async function get_recommanded_movies() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '../../dispatch/userMovieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'getUserRecommendations',
                        id_user: <?php echo $_SESSION['id_user']; ?>,
                        limit: 10
                    },
                    success: function(response) {
                        resolve(response);
                    },
                    error: function(error) {
                        console.error('Erreur lors de la récupération des recommandations:', error);
                        reject(error);
                    }
                });
            });
        }

        function isfinished(id_movie, userMovies, is_finished) {
            console.log(id_movie, userMovies, is_finished);
            $.ajax({
                url: '../../dispatch/userMovieDispatch.php',
                type: 'POST',
                data: {
                    action: 'update',
                    id_movie: id_movie,
                    id_user: <?php echo $_SESSION['id_user']; ?>,
                    is_started: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["is_started"],
                    is_finished: is_finished,
                    in_list: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["in_list"],
                    time_code: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["time_code"],
                    duration: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["duration"]
                },
                success: function(response) {
                    console.log(response);
                },
                error: function(error) {
                    console.error('Erreur lors de la suppression du film:', error);
                }
            });
        }


        async function in_list(id_movie, userMovies, in_list) {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '../../dispatch/userMovieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'update',
                        id_movie: id_movie,
                        id_user: <?php echo $_SESSION['id_user']; ?>,
                        is_started: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["is_started"],
                        is_finished: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["is_finished"],
                        in_list: in_list,
                        time_code: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["time_code"],
                        duration: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["duration"]
                    },
                    success: function(response) {
                        resolve(response);
                    },
                    error: function(error) {
                        console.error(error);
                        reject(error);
                    }
                });
            });

        }

        async function is_started(id_movie, userMovies, is_started) {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '../../dispatch/userMovieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'update',
                        id_movie: id_movie,
                        id_user: <?php echo $_SESSION['id_user']; ?>,
                        is_started: is_started,
                        is_finished: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["is_finished"],
                        in_list: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["in_list"],
                        time_code: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["time_code"],
                        duration: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["duration"]
                    },
                    success: function(response) {
                        resolve(response);
                    },
                    error: function(error) {
                        console.error('Erreur lors de la suppression du film:', error);
                        reject(error);
                    }
                });
            });
        }

        function getUserMovies() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '../../dispatch/userMovieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'getUserMoviesByUser',
                        id_user: <?php echo $_SESSION['id_user']; ?>
                    },
                    success: function(response) {
                        resolve(response);
                    },
                    error: function(error) {
                        console.error('Erreur lors de la récupération des films de l\'utilisateur:', error);
                        reject(error);
                    }
                });
            });
        }

        function getMovies() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '../../dispatch/movieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'getMovies'
                    },
                    success: function(response) {
                        resolve(response);
                    },
                    error: function(error) {
                        console.error('Erreur lors de la récupération des films:', error);
                        reject(error);
                    }
                });
            });
        }

        async function checkUserMovie(id_movie) {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '../../dispatch/userMovieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'getUserMovie',
                        id_movie: id_movie,
                        id_user: <?php echo $_SESSION['id_user']; ?>
                    },
                    success: function(response) {
                        if (response == "null") {
                            $.ajax({
                                url: '../../dispatch/userMovieDispatch.php',
                                type: 'POST',
                                data: {
                                    action: 'add',
                                    id_movie: id_movie,
                                    id_user: <?php echo $_SESSION['id_user']; ?>,
                                },
                                success: function(response) {
                                    console.log(response);
                                    resolve(response);
                                },
                                error: function(error) {
                                    console.error('Erreur lors de l\'ajout du film:', error);
                                    reject(error);
                                }
                            });
                        } else {
                            resolve(response);
                        }
                    },
                    error: function(error) {
                        console.error('Erreur lors de la lecture du film:', error);
                        reject(error);
                    }
                });
            });
        }

    });
</script>