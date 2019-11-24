<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 7:19
 */
namespace app\worker\model;
use think\Model;

class House extends Model
{
    // 设置json类型字段
    protected $json = ['imgs'];
    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '-' : date('Y-m-d H:i', $v);
    }

    public function Agent()
    {
        return $this->hasOne('Agent', 'id', 'agent_id');
    }

    public function Client()
    {
        return $this->hasOne('Client', 'id', 'client_id');
    }

}
