<?php
/**
 * Created by PhpStorm.
 * User: liuyu
 * Date: 2019/10/13
 * Time: 10:04
 */
namespace app\api\controller;
use think\Container;
use think\Controller;
use think\facade\Cache;

class Wxbase extends Controller{


    protected $domain;
    protected $rate = 6.7;
    protected $defaultLang = 'zh-cn';


    public function sd($code=0,$msg="",$data=[]){

        return json([
            'errno'=>$code,
            'message'=> $msg,
            'data'=>$data

        ]);

    }

    public function language($name)
    {
        return lang($name,[],$this->defaultLang);
    }








}