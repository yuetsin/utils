<?php

$zip_file = "./evil.php.zip";

echo $_SERVER["REMOTE_ADDR"];

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
