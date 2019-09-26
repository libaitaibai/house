<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 7:19
 */
namespace app\admin\model;
use think\Model;

class AdsData extends Model
{
    // 设置json类型字段
    protected $json = ['imgs'];
    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    public function getImgsAttr($v)
    {
        return $v ? $v : [];
    }
    public function Ads()
    {
        return $this->hasOne('Ads', 'id', 'aid');
    }
}