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
         $this->defaultLang = input('language','en-us');
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


        $lang = input('lang','cn');
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
			"content"=> "",
			"name"=> $this->language('OrlandoHouseproperty'),
            "maincolor"=> "#5D238A",
			"logo"=> "",
			"fxbanner"=> "",
			"agentbanner"=> "",
			"address"=> "11",
			"tel"=> "11111",
			"opentime"=> "",
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
			"advname"=> $this->language('Houseproperty'),
			"link"=>  "toNewHouse",
			"thumb"=>  "../../resource/images/num1.png",
			"displayorder"=>  "0",
			"enabled"=>  "1",
			"cateid"=>  "0",
			"innerurl"=>  "",
			"appid"=>  ""
         ],

            [
            "id"=> "34",
			"weid"=>"52",
			"advname"=> $this->language("Agent"),
			"link"=> "toAgentlist",
			"thumb"=> "../../resource/images/num2.png",
			"displayorder"=> "0",
			"enabled"=> "1",
			"cateid"=> "0",
			"innerurl"=> "",
			"appid"=>""
		],

            [
            "id"=> "41",
            "weid"=>"52",
            "advname"=> $this->language("Realestateinformation"),
            "link"=> "toArticle",
            "thumb"=> "../../resource/images/num3.png",
            "displayorder"=> "0",
            "enabled"=>"1",
            "cateid"=>"0",
            "innerurl"=>"",
            "appid"=>""
        ],
            [
                "id"=> "42",
                "weid"=>"52",
                "advname"=> $this->language("Landlordlogin"),
                "link"=> "toCommentlist",
                "thumb"=> "../../resource/images/num4.png",
                "displayorder"=> "0",
                "enabled"=>"1",
                "cateid"=>"0",
                "innerurl"=>"",
                "appid"=>""
            ]
        ];

        $navlist1 = [
            [
                "id"=>  "28",
                "weid"=>  "52",
                "advname"=> "美国开发商",
                "link"=>  "toNewHouse",
                "thumb"=>  "../../resource/images/num5.png",
                "displayorder"=>  "0",
                "enabled"=>  "1",
                "cateid"=>  "0",
                "innerurl"=>  "",
                "appid"=>  ""
            ],

            [
                "id"=> "34",
                "weid"=>"52",
                "advname"=> "美国房屋管理公司",
                "link"=> "toAgentlist",
                "thumb"=> "../../resource/images/num6.png",
                "displayorder"=> "0",
                "enabled"=> "1",
                "cateid"=> "0",
                "innerurl"=> "",
                "appid"=>""
            ],

            [
                "id"=> "41",
                "weid"=>"52",
                "advname"=> "度假屋装修",
                "link"=> "toArticle",
                "thumb"=> "../../resource/images/num7.png",
                "displayorder"=> "0",
                "enabled"=>"1",
                "cateid"=>"0",
                "innerurl"=>"",
                "appid"=>""
            ],
            [
                "id"=> "42",
                "weid"=>"52",
                "advname"=> "装修工人",
                "link"=> "toCommentlist",
                "thumb"=> "../../resource/images/num8.png",
                "displayorder"=> "0",
                "enabled"=>"1",
                "cateid"=>"0",
                "innerurl"=>"",
                "appid"=>""
            ]
        ];

        $data['navlist'] = $navlist;
        $data['navlist1'] = $navlist1;



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

        $data['city'] = [];

        //推荐
        $recommand= $list = db('cms_article')->where([['show','=',1]])
            ->order(['sort' => 'desc', 'id' => 'desc'])->limit(5)->field('id,title')->select();
        $data['recommand'] =$recommand;

        //资讯
        $data['category'] = [[
            "id"=> "1",
            "weid"=> "52",
            "name"=> "奥兰多房产资讯",
            "thumb"=> "",
        ], [
            "id"=> "2",
            "weid"=> "52",
            "name"=> "美国房产资讯",
            "thumb"=> "",
        ],
            [
                "id"=> "3",
                "weid"=> "52",
                "name"=> "佛州旅游",
                "thumb"=> "",
            ]
        ];


        $tag = '奥兰多房产资讯';

        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];

        $listArticle = db('cms_article')->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->limit(8)->select();

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
                "hits"=> $v['hits'],
                "status"=> "0",
                "thumb"=> $v['thumb']
            ];
        }

        //查看更多


        return $this->sd(0,'success',$data);
    }




    public function getarticle(){

        $page = input('page',1);
        $pid = input('pid',1);

        $pageSize = 5;
        if($pid==1){
            $tag = '奥兰多房产资讯';
        }else if($pid==2){
            $tag = '美国房产资讯';
        }else{
            $tag = '佛州旅游';
        }
        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];
        $start = ($page-1)*$pageSize;
        $data['banners'] = [];
        if($page==1){

            $tmp = db('cms_article')->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->limit($start,$pageSize)->select();

            $data = [];

            foreach($tmp as $v){
                $data['banners'][] = [

                    "id"=> $v['id'],
                    "weid"=> "52",
                    "advname"=> "B1",
                    "link"=> "",
                    "thumb"=> $v['thumb'],
                    "title" => $v['title'],
                    "displayorder"=> "0",
                    "enabled"=> "1",
                    "toway"=> "",
                    "appid"=> "",
                    "type"=> "0"
                ];
            }

        }

        $data['category'] = [[
            "id"=> "1",
            "weid"=> "52",
            "name"=> "奥兰多房产资讯",
            "thumb"=> "",
        ], [
            "id"=> "2",
            "weid"=> "52",
            "name"=> "美国房产资讯",
            "thumb"=> "",
        ],
            [
                "id"=> "3",
                "weid"=> "52",
                "name"=> "佛州旅游",
                "thumb"=> "",
            ]
        ];

        $data['intro'] = ['maincolor'=>'#5D238A'];
        $data['article'] = [];

        $page++;
        $start = ($page-1)*$pageSize;

        $listArticle = db('cms_article')->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->limit($start,$pageSize)->select();

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
                "hits"=> $v['hits'],
                "status"=> "0",
                "thumb"=> $v['thumb']
            ];
        }

        return $this->sd(0,'success',$data);

    }


    public function getsecondlist(){

        $data = [];
        $page = input('page',1);
        $pid = input('pid',1);

        $pageSize = input('pagesize',8);
        if($pid==1){
            $tag = '奥兰多房产资讯';
        }else if($pid==2){
            $tag = '美国房产资讯';
        }else{
            $tag = '佛州旅游';
        }
        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];
        $start = ($page-1)*$pageSize;

        $listArticle = db('cms_article')->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->limit($start,$pageSize)->select();

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
                "hits"=> $v['hits'],
                "status"=> "0",
                "thumb"=> $v['thumb']
            ];
        }

        return $this->sd(0,'success',$data);


    }



}