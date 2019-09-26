<?php
/**
 * Created by Boume.
 * Date: 4/30 0030
 * Time: 7:19
 */
namespace app\admin\model;
use think\Model;

class Ads extends Model
{
    public function AdsData()
    {
        return $this->hasMany('AdsData', 'aid', 'id');
    }
}