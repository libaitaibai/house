<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:01
 */

namespace app\agent_admin\model;

use think\Model;

class CmsHouse extends Model
{
    // 设置json类型字段
    protected $json = ['type','purpose','tag','photo','room'];
    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function getTypeAttr($v)
    {
        return $v ? $v : [];
    }

    public function getPurposeAttr($v)
    {
        return $v ? $v : [];
    }

    public function getTagAttr($v)
    {
        return $v ? $v : [];
    }

    public function getPhotoAttr($v)
    {
        return $v ? $v : [];
    }

    public function getRoomAttr($v)
    {
        return $v ? $v : [];
    }

}