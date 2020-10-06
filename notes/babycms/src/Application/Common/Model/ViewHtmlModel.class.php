<?php
namespace Common\Model;
use Common\Model\BaseModel;
/**
 * ModelName
 */
class ViewHtmlModel extends BaseModel{
	protected $_file = "index.html";

	 /**
     * 删除文件
     * @param   string   $file   文件名
     */
    public function deleteFile($file){
        die('禁止删除文件');
    }


	public function __toString(){
		echo file_get_contents($this->_file);
	}
}