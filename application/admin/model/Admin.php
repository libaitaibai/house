<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:01
 */
namespace app\admin\model;
use think\Model;

class Admin extends Model
{
    protected $readonly = ['username'];

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '-' : date('Y-m-d H:i', $v);
    }

    public function getEditPasswordTimeAttr($v)
    {
        return empty($v) ? '-' : date('Y-m-d H:i', $v);
    }

    public function getLockMsgAttr($v)
    {
        return empty($v) ? '-' : $v;
    }

    public function getNameAttr($v)
    {
        return empty($v) ? '-' : $v;
    }

    public function getMobileAttr($v)
    {
        return empty($v) ? '-' : $v;
    }

    public function Role()
    {
        return $this->hasOne('Role', 'id', 'role_id')->field('name as role_name,id,lock,lock_msg')->bind('role_name');
    }
}