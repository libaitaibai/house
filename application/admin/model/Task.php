<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 7:19
 */

namespace app\admin\model;

use think\Model;

class Task extends Model
{
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

    public function Worker()
    {
        return $this->hasOne('Worker', 'id', 'worker_id');
    }
}