<?php
namespace app\index\controller;

use think\Controller;

class Error404 extends Controller
{
    public function initialize()
    {
        echo 'aaa';
    }

    public function _empty()
    {
        echo 'aaa';
//        return $this->fetch();
    }
}