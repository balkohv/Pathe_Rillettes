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
    <title>Pathe & rillettes player</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../../style/player.css">
</head>

<body>
    <!--normalement un player pour visionner le film s'affiche ici-->
</body>

</html>
<script src="../../jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            url: '/pathe_rillette/dispatch/movieDispatch.php',
            type: 'POST',
            data: {
                action: 'watch',
                id_movie: <?php echo $_GET['id'] ?>
            },
            success: function(response) {
                console.log(response);
            }
        });

        $.ajax({
            url: '/pathe_rillette/dispatch/movieDispatch.php',
            type: 'POST',
            data: {
                action: 'getMovieById',
                id_movie: <?php echo $_GET['id'] ?>
            },
            success: async function(response) {
                let last_time = null;
                console.log(response);
                const movie = JSON.parse(response);
                let user_movies = JSON.parse(await getUserMovies());
                await set_info(<?php echo $_GET['id'] ?>, user_movies);
                window.location.href = "http://localhost/pathe_rillette/dashboard";
            }
        });

        async function getUserMovies() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: '/pathe_rillette/dispatch/userMovieDispatch.php',
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

        async function set_info(id_movie, userMovies) {
            return new Promise((resolve, reject) => {
                let last_time_code = userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["time_code"];
                $.ajax({
                    url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                    type: 'POST',
                    data: {
                        action: 'update',
                        id_movie: id_movie,
                        id_user: <?php echo $_SESSION['id_user']; ?>,
                        is_started: 1,
                        is_finished: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["is_finished"],
                        in_list: userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["in_list"],
                        time_code: 10000,
                        duration: 5
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

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
    });
</script>