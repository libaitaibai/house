<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 9:01
 */

namespace app\landlord\model;

use think\Model;

class Agent extends Model
{
    // 设置json类型字段
    protected $json = ['lang'];
    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    protected $readonly = ['username', 'lock', 'lock_msg', 'build_page', 'build_client', 'build_admin'];

    public function getAddtimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function getEditPasswordTimeAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d H:i', $v);
    }

    public function getLangAttr($v)
    {
        return $v ? $v : [];
    }

    public function setBuildPageAttr($v)
    {
        return empty($v) ? '' : strtotime($v);
    }

    public function getBuildPageAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d', $v);
    }

    public function setBuildAdminAttr($v)
    {
        return empty($v) ? '' : strtotime($v);
    }

    public function getBuildAdminAttr($v)
    {
        return empty($v) ? '' : date('Y-m-d', $v);
    }

}
