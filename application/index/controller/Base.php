<?php

namespace app\index\controller;

use think\Controller;
use think\facade\Cache;

class Base extends Controller
{
    protected $rate = 6.7;
    protected $lang = 'zh-cn';
    public function initialize()
    {
        parent::initialize();
        $this->assign('lang', input('lang','zh-cn')); //美金汇率
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


    protected function getLang(){

        if(input('lang')){
             $this->lang = trim(input('lang'));
        }
        
        return $this->lang;
    }


    protected function builderQuery($url,$param){

        if(empty($param)){
            return url($url);
        }
 
        $str = is_array($param)? http_build_query($param):$param;
         
        return url($url).'?'.$str;
    }



}
