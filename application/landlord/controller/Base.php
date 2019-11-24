<?php
/**
 * Created by Boume.
 * Date: 1/7 0007
 * Time: 21:24
 */

namespace app\landlord\controller;

use app\common\controller\Common;

class Base extends Common
{

    public $aid;

    public function initialize()
    {
        parent::initialize();
        $this->inspect_auth();
        $this->aid = session('Client.id');
    }

    //权限检测
    private function inspect_auth()
    {
        //判断是否登录
        if (session('?Client') == false) $this->redirect('passport/in');
    }

    public function _empty()
    {
        return $this->vue('public/error');
    }

}
