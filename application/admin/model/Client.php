<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:01
 */
namespace app\admin\model;
use think\Model;

class Client extends Model
{
    protected $readonly = ['username'];

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function getEditPasswordTimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function House()
    {
        return $this->hasMany('House', 'client_id', 'id');
    }

}