<?php
/**
 * Created by Boume.
 * Date: 5/2 0002
 * Time: 8:01
 */
namespace app\admin\model;
use think\Model;

class LoginLog extends Model
{
    public function getTimeAttr($v)
    {
        if(empty($v)) return '-';
        return date('Y-m-d H:i:s', $v);
    }
}