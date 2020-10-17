<?php

if (!isset($_GET["action"])){
    highlight_file(__FILE__);
    die();
}

$action = $_GET["action"];

if (!file_exists("image")){
    mkdir("image");
}

if (!file_exists("zip")){
    mkdir("zip");
    mkdir("/tmp/zip");
}

switch($action){
    case "uploadImage":
        if ($_FILES['image']['size'] > 1024*512){
            die("image size exceeds 512k");
        }

        $imageinfo = getimagesize($_FILES['image']['tmp_name']);
        if ($imageinfo === FALSE){
            die("image format is broken");
        }

        if ($imageinfo[0] !== 250 && $imageinfo[1] !== 250){
            die("the width and height of image must be 250");
        }

        $ext = str_replace("/", ".", $imageinfo['mime']);
        $imageName = pathinfo($_FILES["image"]["name"])["filename"] . $ext;
        $imagePath = "/var/www/html/image/" . $imageName;
        move_uploaded_file($_FILES["image"]["tmp_name"], $imagePath);
        echo "upload success, image at $imagePath";
    break;
    case "uploadZip":
        // TODO
    break;
    case "extract":
        $zip_file = "zip/" . $_POST["file"];
        $zip_temp = "/tmp/zip/" . md5($_SERVER["REMOTE_ADDR"]."ezupload");
        if (!file_exists($zip_temp)){
            mkdir($zip_temp);
        }
        $zip = new \ZipArchive();
        if ($zip->open($zip_file) === TRUE) {
            $zip->extractTo($zip_temp);
            $zip->close();
            @unlink($zip_file);
            $pngs = glob("$zip_temp/*");

            foreach($pngs as $index=>$png){
                if (is_dir($png)){
                    continue;
                }
                $im = imagecreatefrompng($png);
                $size = 250;
                $im2 = imagecrop($im, ['x' => 0, 'y' => 0, 'width' => $size, 'height' => $size]);
                if ($im2 !== FALSE) {
                    $pngname = pathinfo($png)["basename"];
                    imagepng($im2, 'zip/croped-'.$pngname);
                    imagedestroy($im2);
                }
                imagedestroy($im);
            }
        }
    default:
        echo "welcome to ez-series!";
}