<?php
/**
 * Created by PhpStorm.
 * User: liuyu
 * Date: 2019/10/13
 * Time: 8:57
 */

namespace app\api\controller;
use app\api\controller\Wxbase;

class Wxapi extends Wxbase{


    public function initialize(){

         $this->domain = request()->domain();
    }


    public function __call($method,$param){

        return $this->sd(4004,'fail');

    }


    public function index(){

        $action = input('do');
        if(!isset($action)){
            return $this->sd(4004,'fail');
        }
        $params = input('');
        return call_user_func_array([$this,$action],$params);

    }



    public function GetSysInit(){


        $data = [];

        $banners =  db('ads_data')->where(['aid'=>12,'show'=>1])->order(['sort'=>'desc','id'=>'desc'])->limit(10)->select();
        empty($banners) && $banners = [];

        if($banners){
            foreach($banners as $v){

                $data['banner'][] = [
                        "id"=> $v['id'],
                        "weid"=> "52",
                        "advname"=> "B1",
                        "link"=> $v['url'],
                        "thumb"=> $this->domain.$v['thumb'],
                        "displayorder"=> "0",
                        "enabled"=> "1",
                        "toway"=> "",
                        "appid"=> "",
                        "type"=> "0"

                ];
            }
        }

        //小程序主体信息
        $intro = [

            "id"=>"17",
			"uniacid"=> "52",
			"createtime"=> "1552096080",
			"content"=> "<p>11<\/p>",
			"name"=> "奥兰多房产",
            "maincolor"=> "",
			"logo"=> "",
			"fxbanner"=> "",
			"agentbanner"=> "",
			"address"=> "11",
			"tel"=> "11111",
			"opentime"=> "8:30-11:30  13:30-17:30",
			"lng"=> "1.000000",
			"lat"=> "1.000000",
			"qq"=> "1250123367",
			"email"=> "1250123367@qq.com",
			"city"=> "扬州",
			"ischeck"=> "0",
			"rate1"=> "0.20",
			"rate2"=> "0.80",
			"ischeck2"=> "0",
			"moban"=> "0",
			"ispay"=> "0",
			"isoldhouse"=> "0",
			"islethouse"=> "0",
			"isbuyhouse"=> "0",
			"issalehouse"=> "0",
			"isagentoldhouse"=> "0",
			"isagentlethouse"=> "0",
			"isgetuser"=> "0",
			"newlimit"=> "20",
			"oldlimit"=> "20",
			"letlimit"=> "20",
			"indexadv"=> "",
			"isagent"=> "0",
			"isright"=> "0",
			"description"=> ""


        ];
        $data['intro'] = $intro;


        $navlist = [
         [
           "id"=>  "28",
			"weid"=>  "52",
			"advname"=> "精品房源",
			"link"=>  "toNewHouse",
			"thumb"=>  "../../resource/images/t1.png",
			"displayorder"=>  "0",
			"enabled"=>  "1",
			"cateid"=>  "0",
			"innerurl"=>  "",
			"appid"=>  ""
         ],

            [
            "id"=> "34",
			"weid"=>"52",
			"advname"=> "经纪人",
			"link"=> "toAgentlist",
			"thumb"=> "../../resource/images/t4.png",
			"displayorder"=> "0",
			"enabled"=> "1",
			"cateid"=> "0",
			"innerurl"=> "",
			"appid"=>""
		],

            [
            "id"=> "41",
            "weid"=>"52",
            "advname"=> "房产资讯",
            "link"=> "toArticle",
            "thumb"=> "../../resource/images/t6.png",
            "displayorder"=> "0",
            "enabled"=>"1",
            "cateid"=>"0",
            "innerurl"=>"",
            "appid"=>""
        ],
            [
                "id"=> "42",
                "weid"=>"52",
                "advname"=> "用户评价",
                "link"=> "toCommentlist",
                "thumb"=> "../../resource/images/t8.png",
                "displayorder"=> "0",
                "enabled"=>"1",
                "cateid"=>"0",
                "innerurl"=>"",
                "appid"=>""
            ]
        ];

        $data['navlist'] = $navlist;


        //房源
        $newhouselist=db('cms_house')->where(['show'=>1,'release'=>0])->order(['sort'=>'desc','id'=>'desc'])->limit(3)->select();
        empty($newhouselist) && $newhouselist = [];
        if($newhouselist){

            foreach($newhouselist as $v){

                $data['newhouselist'][] = [

                "id"=> $v['id'],
                "uniacid"=> "52",
                "housename"=> $v['title'],
                "dmoney"=> "0.00",
                "companyname"=> $v['sub_title'],
                "houseprice"=> round($v['price']*$this->rate,1),
                "housetype"=> "1",
                "houseareaid"=> "66",
                "houseaddress"=>"广陵区运河西路沙施河畔",
                "housesaleaddress"=> "运河西路沙施河畔",
                "houserate"=>"1.57",
                "housegreenrate"=> "35%",
                "housecovered"=> "59081",
                "buildarea"=> "92757",
                "opensaletime"=>"2017年",
                "staytime"=> "2018年上半年",
                "productspecial"=> $v['tag'],
                "houseschool"=> "一小、二小、三小",
                "housebus"=> "可乘坐19、25、26、26(晚)、32、66、66(晚)",
                "housestatus"=> "1",
                "thumb"=> $this->domain.$v['thumb'],
                "isrecommand"=>"1",
                "sort"=>"0",
                "createtime"=> "1552114389",
                "content"=> "",
                "tel"=> "111111",
                "thumb_url"=> "",
                "lng"=> "1.000000",
                "lat"=> "1.000000",
                "uid"=> "0",
                "status"=> "0",
                "salearea"=> null,
                "fxmoney"=> "100",
                "safedate"=> null,
                "fxmoneydate"=> null,
                "doright"=> null,
                "cityid"=> "29",
                "bid"=> "38",
                "video"=> "",
                "areaname"=> $v['decoration'],
                "housetypename"=> $v['property']

            ];

            }

        }

        $data['lethouselist'] = [];
        $data['oldhouselist'] = [];
        $data['city'] = [];

        //推荐
        $recommand= $list = db('cms_article')->where([['show','=',1]])
            ->order(['sort' => 'desc', 'id' => 'desc'])->limit(5)->field('id,title')->select();
        $data['recommand'] =$recommand;

        $str = '{

		
		"agentlist": [{
			"id": "113",
			"name": "张三",
			"password": null,
			"thumb": "",
			"tel": "17839100008",
			"qq": "17839100008",
			"address": "碧水云天",
			"createtime": "1563809614",
			"uniacid": "52",
			"uid": "20522",
			"enabled": "1",
			"content": null,
			"sort": "0",
			"intro": "哈哈哈",
			"cityid": "29",
			"card": "",
			"bank": "",
			"bankaddress": "",
			"lethousenum": "10",
			"oldhousenum": "10",
			"endtime": "1566401614",
			"roleid": "34",
			"companyname": ""
		} ],
		
		"article": [{
			"id": "48",
			"title": "楼市新动向！两会上释放的房地产政策五大信号",
			"createtime": "2019-04-13",
			"thumb": "https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/SZtqE6dE0enQptX0MxqVe3peXOVvUm.png"
		}, {
			"id": "47",
			"title": "财政部公布2019年立法工作安排 未提及房地产税",
			"createtime": "2019-04-13",
			"thumb": "https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/XTMKArUrZyqjyMX9Mv2q6HUaHR6q6K.jpg"
		}, {
			"id": "46",
			"title": "前3月房企密集融资 融资成本明显降低",
			"createtime": "2019-04-13",
			"thumb": "https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/g48doObHgC11tGt4mG64D8gEAc62oE.png"
		}, {
			"id": "45",
			"title": "重磅!住建部发布新规!今天起你家的房子将有重大变化",
			"createtime": "2019-04-13",
			"thumb": "https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/CEeIk9OL3EZwZ07W098KeeKjJoozJ7.png"
		}, {
			"id": "44",
			"title": "2019楼市之火 已起燎原之势",
			"createtime": "2019-04-13",
			"thumb": "https:\/\/api.site100.cn\/attachment\/images\/52\/2019\/03\/XTMKArUrZyqjyMX9Mv2q6HUaHR6q6K.jpg"
		}]
}';


      $tmp = json_decode($str,true);
       $last = array_merge($tmp,$data);


       return $this->sd(0,'success',$last);
    }




    public function getarticle(){

        $page = input('page',1);
        $pid = input('pid',1);

        if($pid==1){
            $tag = '奥兰多房产资讯';
        }else if($pid==2){
            $tag = '美国房产资讯';
        }else{
            $tag = '佛州旅游';
        }
        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];
        $start = ($page-1)*10;
        $listArticle = db('cms_article')->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->limit($start,10)->select();

        $data = [];
        $data['category'] = [[
            "id"=> "1",
            "weid"=> "52",
            "name"=> "奥兰多房产资讯",
            "thumb"=> "",
            "parentid"=> "0",
            "isrecommand"=> "0",
            "description"=> "",
            "displayorder"=> "0",
            "enabled"=> "1",
            "model"=> "0"
        ], [
            "id"=> "2",
            "weid"=> "52",
            "name"=> "美国房产资讯",
            "thumb"=> "",
            "parentid"=> "0",
            "isrecommand"=> "0",
            "description"=> "",
            "displayorder"=> "0",
            "enabled"=> "1",
            "model"=> "0"
        ],
            [
                "id"=> "3",
                "weid"=> "52",
                "name"=> "佛州旅游",
                "thumb"=> "",
                "parentid"=> "0",
                "isrecommand"=> "0",
                "description"=> "",
                "displayorder"=> "0",
                "enabled"=> "1",
                "model"=> "0"
            ]
        ];

        $data['activeCategoryId'] = $pid;
        $data['intro'] = ['maincolor'=>''];
        $data['article'] = [];
        foreach($listArticle as $v){

            $data['article'][] = [

                "id"=> $v['id'],
                "uniacid"=> "52",
                "title"=> $v['title'],
                "createtime"=> date('Y-m-d',$v['addtime']),
                "content"=> "",
                "sort"=> "0",
                "pid"=> "12",
                "sid"=> "0",
                "hits"=> "0",
                "status"=> "0",
                "thumb"=> $v['thumb']
            ];
        }

        return $this->sd(0,'success',$data);

    }




    public function getbanner(){

        $tag = input('param.tag', '奥兰多房产资讯');
        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];
        $listArticle = db('cms_article')->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->paginate(4);

        $data = [];
        foreach($listArticle as $v){
            $data[] = [

                "id"=> $v['id'],
                "weid"=> "52",
                "advname"=> "B1",
                "link"=> "",
                "thumb"=> $v['thumb'],
                "displayorder"=> "0",
                "enabled"=> "1",
                "toway"=> "",
                "appid"=> "",
                "type"=> "0"
            ];
        }

        return $this->sd(0,'success',$data);
    }


    public function getsecondlist(){

        return $this->getarticle();

    }



}