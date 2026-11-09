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
    <title>Upload a movie - Pathe &amp; Rillettes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/pathe_rillette/style/global.css">
</head>

<body>
    <?php include '../navbar.html'; ?>
    <main class="upload-container">
        <h1 class="page-title">Add a movie</h1>
        <form id="uploadForm" class="upload-form" enctype="multipart/form-data">
            <div class="file-upload">
                <div class="file-upload-placeholder">
                    <input class="file-upload-input" type="file" onchange="readURL(this);" accept="video/*" id="fileInput" name="movie" aria-label="Movie file" required>
                    <div class="drag-text">
                        <h3>Drag and drop a file or click here</h3>
                    </div>
                </div>
                <div class="file-upload-preview">
                    <i class="fa-solid fa-photo-film file-upload-image" aria-hidden="true"></i>
                    <div class="file-upload-remove">
                        <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded movie</span></button>
                    </div>
                </div>
            </div>
            <div class="button-upload-container">
                <input type="text" id="fileNameInput" name="movieName" placeholder="Movie Name (engl):" aria-label="Movie name" required>
                <button type="submit" class="button_upload">Upload</button>
                <button type="button" id="cancelUploadButton" class="button_upload">Cancel Upload</button>
            </div>
        </form>
        <div id="status" role="status" aria-live="polite"></div>
        <div class="progress-container">
            <div id="progress-container">
                <div id="progress-bar"></div>
            </div>
        </div>
    </main>

    <script src="/pathe_rillette/jquery-3.7.1.min.js"></script>
    <script>
        var xhr;

        document.getElementById('uploadForm').addEventListener('submit', function(event) {
            document.getElementById('status').innerText = '';
            event.preventDefault();
            var fileInput = document.getElementById('fileInput');
            var fileName = document.getElementById('fileNameInput');
            var file = fileInput.files[0];
            var formData = new FormData();
            formData.append('movie', file);
            formData.append('name', fileName.value);
            formData.append('action', "upload_movie");

            xhr = new XMLHttpRequest();
            xhr.open('POST', 'http://93.8.28.18:84/pathe_rillette/dispatch/movieDispatch.php', true);

            xhr.upload.onprogress = function(event) {
                if (event.lengthComputable) {
                    var percentComplete = (event.loaded / event.total) * 100;
                    document.getElementById('progress-bar').style.width = percentComplete + '%';
                }
            };

            xhr.onload = function() {
                document.getElementById('status').innerText = (xhr.responseText);
            };

            xhr.send(formData);
        });

        document.getElementById('cancelUploadButton').addEventListener('click', function() {
            if (xhr) {
                xhr.abort();
                document.getElementById('status').innerText = 'Upload canceled!';
                document.getElementById('progress-bar').style.width = '0%';
            }
        });


        function readURL(input) {
            if (input.files && input.files[0]) {
                document.querySelector('.file-upload-preview').style.display = 'block';
                document.querySelector('.file-upload-placeholder').style.display = 'none';
                document.querySelector('.image-title').innerText = input.files[0].name;
            } else {
                removeUpload();
            }
        }

        function removeUpload() {
            var $clone = $('.file-upload-input').val('').clone(true);
            $('.file-upload-input').replaceWith($clone);
            $('.file-upload-placeholder').show();
            $('.file-upload-preview').hide();
        }

        $('.file-upload-placeholder').bind('dragover', function() {
            $('.file-upload-placeholder').addClass('image-dropping');
        });
        $('.file-upload-placeholder').bind('dragleave', function() {
            $('.file-upload-placeholder').removeClass('image-dropping');
        });
    </script>
</body>

</html>
