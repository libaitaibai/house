<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/11
 * Time: 23:26
 */

namespace app\api\controller;

use app\admin\model\AdsData;
use app\admin\model\CmsAgent;
use app\admin\model\CmsArticle;
use app\admin\model\CmsDecorator;
use app\admin\model\CmsHouse;

class Applet extends Base
{
    public $http = 'http://';

    public function index()
    {
        $action = input('do');
        $data =[];
        switch ($action) {
            case 'GetSysInit':
                $data = $this->show();
                break;
            case 1:
                echo "i equals 1";
                break;
            case 2:
                echo "i equals 2";
                break;
        }
//        echo '<pre>';var_dump($action);exit;
        return $this->json($data);
    }

    /**
     * 首页展示信息
     * @return array
     */
    public function show()
    {
        //播放图片
        $list=db('ads_data')->where(['aid'=>12,'show'=>1])->order(['sort'=>'desc','id'=>'desc'])->limit(10)->select();
        array_walk($list,function(&$val){
            $val['thumb'] = $this->http.$_SERVER['HTTP_HOST'].$val['thumb'];
        });

        $data = [
            'banner'=>($list),
            'midadv'=>[],
            'midadv2'=>[],
            'bottomadv'=>[],
            'intro'=>[],
            'newhouselist'=>[],
            'oldhouselist'=>[],
            'agentlist'=>[],
            'lethouselist'=>[],
            'navlist'=>[],
            'cityinfo'=>[],
            'article'=>[],
        ];
        return $data;
    }
}
