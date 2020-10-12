<?php


class PHPObjectInjection {
	protected $_file = "index.html";

	 /**
     * 删除文件
     * @param   string   $file   文件名
     */
    public function deleteFile($file){
        die('禁止删除文件');
    }


	public function __destruct(){
		echo file_get_contents($this->_file);
	}
}


// test with ftp://domain/

file_exists('phar://' . $argv[1] . '/suffix_is_even_ignored.asdf');

/*

file_exists( $argv[1]);
md5_file( $argv[1]);
filemtime( $argv[1]);
filesize( $argv[1]);

*/

