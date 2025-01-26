$(document).ready(function() {
    main();
    console.log($("#data").attr("data-id"));

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
                window.location.href = 'movie/player/' + $('#poster-modal').attr('class');
            });

            $("#addToWatchListButton").click(async function() {
                userMovies = JSON.parse(await getUserMovies());
                console.log($('#poster-modal').attr('class'), userMovies, userMovies.find(userMovie => userMovie["id_movie"] == $('#poster-modal').attr('class'))["in_list"] == 0 ? 1 : 0);
                await in_list($('#poster-modal').attr('class'), userMovies, userMovies.find(userMovie => userMovie["id_movie"] == $('#poster-modal').attr('class'))["in_list"] == 0 ? 1 : 0);
                userMovies = JSON.parse(await getUserMovies());
                $('#addToWatchListButton').text(userMovies.find(userMovie => userMovie["id_movie"] == $('#poster-modal').attr('class'))["in_list"] == 0 ? 'Add to Watch List' : 'Remove from Watch List');
                load_my_list(userMovies, movies);
                $('h2').eq(2).show();
                if ($('#MyList .item').length === 0) {
                    $('h2').eq(2).hide();
                }
            });

            $(document).on('click', '.item', async function() {
                await checkUserMovie($(this).attr('id'));
                userMovies = JSON.parse(await getUserMovies());
                let id_movie = $(this).attr('id');
                movies.forEach(function(movie) {
                    if (movie["id_movie"] == id_movie) {
                        console.log(movie["id_movie"], id_movie);
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
        let flag = false;
        userMovies.forEach(function(userMovie) {
            movies.forEach(function(movie) {
                if (movie["id_movie"] == userMovie["id_movie"] && userMovie["is_finished"] == 0 && userMovie["is_started"] == 1) {
                    flag = true;
                    container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"><div class="progress-bar" style="width:' + (userMovie["time_code"] / userMovie["duration"]) * 100 + '%;"></div><span class="close-item close-continue">&times;</span></div>');
                }
            });
        });
        if (flag == false) {
            $('h2').eq(0).hide();
        }

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
            if (i > 9) {
                return;
            }
            container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"></div>');
        });
    }

    function load_my_list(userMovies, movies) {
        let container = $('#MyList');
        console.log(userMovies);
        container.empty();
        let flag = false;
        userMovies.forEach(function(userMovie) {
            movies.forEach(function(movie) {
                if (movie["id_movie"] == userMovie["id_movie"] && userMovie["in_list"] == 1) {
                    flag = true;
                    container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"><span class="close-item close-list">&times;</span></div>');
                }
            });
        });

        if (flag == false) {
            $('h2').eq(2).hide();
        }

        $('.close-list').click(function(event) {
            event.stopPropagation();
            let id_movie = $(this).parent().attr('id');
            $(this).parent().remove();
            in_list(id_movie, userMovies, 0);
            if ($('#MyList .item').length === 0) {
                $('h2').eq(2).hide();
            }
        });
    }

    async function load_recommendations() {
        let recommandedMovie = JSON.parse(await get_recommanded_movies());
        recommandedMovie = Object.values(recommandedMovie);
        let container = $('#Recommended');
        console.log(recommandedMovie);
        container.empty();
        let i = 0;
        let flag = false;
        recommandedMovie.forEach(function(movie) {
            flag = true;
            i++;
            if (i > 9) {
                return;
            }
            container.append('<div class="item" id="' + movie["id_movie"] + '"><img src="' + movie["poster_ref"] + '" alt="' + movie["title"] + '" title="' + movie["title"] + '"></div>');
        });
        if (flag == false) {
            $('h2').eq(3).hide();
        }
    }

    async function get_recommanded_movies() {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                type: 'POST',
                data: {
                    action: 'getUserRecommendations',
                    id_user: $("#data").attr("data-id"),
                    limit: 9
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
            url: '/pathe_rillette/dispatch/userMovieDispatch.php',
            type: 'POST',
            data: {
                action: 'update',
                id_movie: id_movie,
                id_user: $("#data").attr("data-id"),
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
                url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                type: 'POST',
                data: {
                    action: 'update',
                    id_movie: id_movie,
                    id_user: $("#data").attr("data-id"),
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
                url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                type: 'POST',
                data: {
                    action: 'update',
                    id_movie: id_movie,
                    id_user: $("#data").attr("data-id"),
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
                url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                type: 'POST',
                data: {
                    action: 'getUserMoviesByUser',
                    id_user: $("#data").attr("data-id")
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
                url: '/pathe_rillette/dispatch/movieDispatch.php',
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
                url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                type: 'POST',
                data: {
                    action: 'getUserMovie',
                    id_movie: id_movie,
                    id_user: $("#data").attr("data-id")
                },
                success: function(response) {
                    if (response == "null") {
                        $.ajax({
                            url: '/pathe_rillette/dispatch/userMovieDispatch.php',
                            type: 'POST',
                            data: {
                                action: 'add',
                                id_movie: id_movie,
                                id_user: $("#data").attr("data-id"),
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