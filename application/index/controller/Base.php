<?php

namespace app\index\controller;

use think\Controller;
use think\facade\Cache;

class Base extends Controller
{
    protected $rate = 6.7;

    public function initialize()
    {
        parent::initialize();
        $this->assign('rate', $this->rate); //美金汇率
    }

    public function tpl()
    {
        $md5 = md5(json_encode(input('param.')).request()->domain());
        $html = Cache::tag('tpl')->remember($md5, function () {
            return $this->fetch();
        }, 10);
        return $html;
    }

}
