<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:01
 */
namespace app\worker\model;
use think\Model;

class Worker extends Model
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

}
