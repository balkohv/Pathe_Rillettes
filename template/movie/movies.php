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
    <title>Upload Movie</title>
    <link rel="stylesheet" type="text/css" href="../../style/global.css">
</head>

<body>

    <?php include '../navbar.html'; ?>
    <h1>Upload Movie</h1>
    <form id="uploadForm" enctype="multipart/form-data">
        <input type="file" id="fileInput" name="movie" accept="video/x-matroska,video/*" required>
        <label for="fileNameInput">Movie Name (engl):</label>
        <input type="text" id="fileNameInput" name="movieName" placeholder="Movie Name" required>
        <button type="submit" class="button_upload">Upload</button>
        <button type="button" id="cancelUploadButton" class="button_upload">Cancel Upload</button>
        <button type="button" id="cancelSelectButton" class="button_upload">Cancel Select</button>
    </form>
    <div id="progress-container">
        <div id="progress-bar"></div>
    </div>
    <div id="status"></div>

    <script>
        var xhr;

        document.getElementById('uploadForm').addEventListener('submit', function(event) {
            event.preventDefault();
            var fileInput = document.getElementById('fileInput');
            var fileName = document.getElementById('fileNameInput');
            var file = fileInput.files[0];
            var formData = new FormData();
            formData.append('movie', file);
            formData.append('name', fileName.value);
            formData.append('action', "upload_movie");

            xhr = new XMLHttpRequest();
            xhr.open('POST', '../../dispatch/movieDispatch.php', true);

            xhr.upload.onprogress = function(event) {
                if (event.lengthComputable) {
                    var percentComplete = (event.loaded / event.total) * 100;
                    document.getElementById('progress-bar').style.width = percentComplete + '%';
                }
            };

            xhr.onload = function() {
                if (xhr.status == 200) {
                    document.getElementById('status').innerText = 'Upload complete!';
                } else {
                    document.getElementById('status').innerText = 'Upload failed!';
                }
                console.log(xhr.responseText);
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

        document.getElementById('cancelSelectButton').addEventListener('click', function() {
            document.getElementById('fileInput').value = '';
            document.getElementById('status').innerText = 'File selection canceled!';
        });
    </script>
</body>

</html>