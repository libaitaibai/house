<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 7:18
 */

namespace app\admin\model;

use think\Model;

class Node extends Model
{
    public function setArrpidAttr($v)
    {
        return implode(',', $v);
    }

    public function getArrpidAttr($v)
    {
        $data = explode(',', $v);
        foreach ($data as $k => $v) {
            $data[$k] = (int)$v;
        }
        return $data;
    }
}