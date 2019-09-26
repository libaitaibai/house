<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:05
 */
namespace app\admin\model;
use think\Model;

class Role extends Model
{
    public function getDescriptionAttr($v)
    {
        return empty($v) ? '-' : $v;
    }

    public function getLockMsgAttr($v)
    {
        return empty($v) ? '-' : $v;
    }

    public function Admin()
    {
        return $this->hasMany('Admin', 'role_id', 'id')->field('id,username');
    }
}