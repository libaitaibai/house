<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 7:19
 */

namespace app\admin\model;

use think\Model;

class CmsDecorator extends Model
{
    // 设置json类型字段
    protected $json = ['lang','tag'];
    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function getLangAttr($v)
    {
        return !empty($v) ? $v : [];
    }

    public function getTagAttr($v)
    {
        return !empty($v) ? $v : [];
    }

}