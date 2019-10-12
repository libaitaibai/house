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
    public function index()
    {
        $list=db('ads_data')->where(['aid'=>12,'show'=>1])->order(['sort'=>'desc','id'=>'desc'])->limit(10)->select();
        $list[0]['thumb'] = "http://www.happy.com/uploads/20190216/6b456af2c8142c6b4192ab7e43888c24.jpg";
        $list[1]['thumb'] = "http://www.happy.com/uploads/20190216/6881f0247739f5882eda3590c0ac0bd8.jpg";
//        echo'<pre>';var_dump($list);exit;
//        $list='[{"id":"16","weid":"52","advname":"B1","link":"","thumb":"https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/eMqmMDu4DdtM768zttTl4z6TUMdWt4.jpg","displayorder":"0","enabled":"1","toway":"","appid":"","type":"0"},{"id":"17","weid":"52","advname":"B2","link":"","thumb":"https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/hmm0hFLO4av4a2OM33S92qyAF4cC5h.jpg","displayorder":"0","enabled":"1","toway":"","appid":"","type":"0"},{"id":"18","weid":"52","advname":"B3","link":"","thumb":"https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/C0J3c9I9A64q6dgl3bai0qALnCrLjQ.jpg","displayorder":"0","enabled":"1","toway":"","appid":"","type":"0"}]';
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
        return $this->json($data);
    }
}
