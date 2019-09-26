<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:01
 */

namespace app\admin\model;

use think\Model;

class CmsAgent extends Model
{
    // 设置json类型字段
    protected $json = ['lang'];
    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function getLangAttr($v)
    {
        return $v ? $v : [];
    }

}