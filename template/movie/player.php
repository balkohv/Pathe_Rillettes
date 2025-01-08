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
    <a href="/pathe_rillette/dashboard" class="back-arrow fa-solid fa-arrow-left"></a>
    <div class="video-container">
        <video id="videoPlayer" src="" autoplay muted controls></video>
    </div>
</body>

</html>
<script src="../../jquery-3.7.1.min.js"></script>
<script>
    const video = document.getElementById('videoPlayer');
    const playPauseButton = document.querySelector('.play-pause');


    setTimeout(function() {
        video.muted = false;
    }, 500);
    video.addEventListener('mousemove', function() {
        $('.back-arrow').fadeIn(100);
        setTimeout(function() {
            $('.back-arrow').fadeOut();
        }, 5000);

    });

    function togglePlayPause() {
        if (video.paused) {
            video.play();
            playPauseButton.textContent = 'Pause';
        } else {
            video.pause();
            playPauseButton.textContent = 'Play';
        }
    }

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
                let last_time=null;
                console.log(response);
                const movie = JSON.parse(response);
                video.src = '../' + movie["ref"];
                let user_movies = JSON.parse(await getUserMovies());
                video.currentTime = user_movies.find(userMovie => userMovie["id_movie"] == <?php echo $_GET['id'] ?>)["time_code"];
                video.addEventListener('timeupdate', async function() {
                    if (Math.floor(video.currentTime) % 20 === 0 && Math.floor(video.currentTime) != last_time) {
                        last_time = Math.floor(video.currentTime);
                        await set_info(<?php echo $_GET['id'] ?>, user_movies);
                    }
                });
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
                let last_time_code=userMovies.find(userMovie => userMovie["id_movie"] == id_movie)["time_code"];
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
                        time_code: last_time_code<=Math.floor(video.currentTime)?Math.floor(video.currentTime):last_time_code,
                        duration: Math.floor(video.duration)
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