<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/19
 * Time: 12:06
 */

namespace app\index\controller;

use app\admin\model\AdsData;
use app\admin\model\Agent as AgentModel;
use app\admin\model\CmsArticle;
use app\admin\model\CmsDecorator;
use app\admin\model\CmsHouse;

class agent extends Base
{
    public $agentid ;

    public static $article = [
        1=>'奥兰多房产资讯',

        2=>'房产资讯',
        3=>'旅游信息',

        4=>'生活资讯',
        5=>'移民资讯',
        6=>'教育资讯',
    ];

    public function initialize()
    {
        parent::initialize();
        $this->agentid = input('param.id', 0, 'intval');

        $db = new AgentModel();

        $agentData =  $this->agentid  ? $db->where('id', $this->agentid )->find():$db->find();
//        echo '<pre>';var_dump($agentData);exit;

        $this->assign('agentData', $agentData);

    }

    public function index()
    {

        $houseDb= new CmsHouse();
        $houselist=$houseDb->where(['show'=>1,'release'=>$this->agentid ])->order(['sort'=>'desc','id'=>'desc'])->limit(6)->select();

        $cmsArticleDb= new CmsArticle();
        $cmsArticleDb=$cmsArticleDb->where(['show'=>1,'release'=>$this->agentid ])->order(['sort'=>'desc','id'=>'desc'])->limit(7)->select();
//        echo '<pre>';var_dump($cmsArticleDb);exit;

        $this->assign('cmsArticleDb', $cmsArticleDb);
        $this->assign('houselist', $houselist);
        return $this->tpl();
    }

    /**
     * 房产咨讯
     */
    public function article()
    {
        $db = new CmsArticle();
        $where = [];
        $tag = input('param.article', 0);
        $tag = isset(self::$article[$tag]) ? self::$article[$tag]:'';
        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];
        $listArticle = $db->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->paginate(10);

        $this->assign('listArticle', $listArticle);
        $this->assign('potation', $tag ?$tag:'全部');

        return $this->tpl();
    }

    /**
     * 房产咨讯
     */
    public function articleone()
    {

        $articleid = input('param.articleid', 0, 'intval');
        $db = new CmsArticle();
        $d = $db->where('id', $articleid)->find();
        if (empty($d)) $this->error('文章不存在');

        $d->hits += 1;
        $d->save();

        $this->assign('articleone', $d);

        return $this->tpl();
    }

    /**
     * 房源
     */
    public function house()
    {
        $filter = [
            'jg'=>[
                'key' => 'jg',
                'name' => '房屋总价',
                'child' => [1=>'50万以下', 2=>'50-100万',3=> '100-200万',4=> '200-300万',5=> '300-500万',6=> '500-700万',7=> '700-1000万',8=> '1000万以上'],
            ],
            'zy'=>[
                'key' => 'zy',
                'name' => '置业目的',
                'child' => [1=>'投资', 2=>'教育留学', 3=>'购房移民', 4=>'自住'],
            ],
            'wy'=>[
                'key' => 'wy',
                'name' => '物业类型',
                'child' => [1=>'独栋别墅', 2=>'公寓', 3=>'联排别墅', 4=>'土地', 5=>'商业地产'],
            ],
            'lx'=>[
                'key' => 'lx',
                'name' => '房源类型',
                'child' => [1=>'新房', 2=>'二手房', 3=>'土地'],
            ],
            'ws'=>[
                'key' => 'ws',
                'name' => '卧室数量',
                'child' => [1=>'1居', 2=>'2居', 3=>'3居', 4=>'4居',5=> '5居', 6=>'5居以上'],
            ],
        ];

        $newjg2 = [1=>'50万以下', 2=>'50-100万',3=> '100-200万',4=> '200-300万',5=> '300-500万',6=> '500-700万',7=> '700-1000万',8=> '1000万以上'];
        $newzy2 = [1=>'投资', 2=>'教育留学', 3=>'购房移民', 4=>'自住'];
        $newwy2 = [1=>'独栋别墅', 2=>'公寓', 3=>'联排别墅', 4=>'土地', 5=>'商业地产'];
        $newlx2 = [1=>'新房', 2=>'二手房', 3=>'土地'];
        $newws2 = [1=>'1居', 2=>'2居', 3=>'3居', 4=>'4居',5=> '5居', 6=>'5居以上'];

        $this->assign('filter', $filter);
        $param = input('param.');
        $urlParam = [];
        foreach ($filter as $k => $v) {
            $key = $v['key'];
            $urlParam[$key] = '';
            if (!empty($param[$key])) $urlParam[$key] = $param[$key];
        }

        $this->assign('urlParam', $urlParam);

        $where = [];
        $jg = input('param.jg', '');
        if ($jg) {
            if ($newjg2[$jg] == '50万以下') $where[] = ['price', '<', floor(50 / $this->rate)];
            if ($newjg2[$jg] == '50-100万') $where[] = ['price', 'BETWEEN', [floor(50 / $this->rate), floor(100 / $this->rate)]];
            if ($newjg2[$jg] == '100-200万') $where[] = ['price', 'BETWEEN', [floor(100 / $this->rate), floor(200 / $this->rate)]];
            if ($newjg2[$jg] == '200-300万') $where[] = ['price', 'BETWEEN', [floor(200 / $this->rate), floor(300 / $this->rate)]];
            if ($newjg2[$jg] == '300-500万') $where[] = ['price', 'BETWEEN', [floor(300 / $this->rate), floor(500 / $this->rate)]];
            if ($newjg2[$jg] == '500-700万') $where[] = ['price', 'BETWEEN', [floor(500 / $this->rate), floor(700 / $this->rate)]];
            if ($newjg2[$jg] == '700-1000万') $where[] = ['price', 'BETWEEN', [floor(700 / $this->rate), floor(1000 / $this->rate)]];
            if ($newjg2[$jg] == '1000万以上') $where[] = ['price', '>', floor(1000 / $this->rate)];
        }
        $zy = input('param.zy', '');
        if ($zy) $where[] = ['purpose', 'like', '%"' . $newzy2[$zy] . '"%'];
        $wy = input('param.wy', '');
        if ($wy) $where[] = ['type', 'like', '%"' . $newwy2[$wy] . '"%'];
        $lx = input('param.lx', '');
        if ($lx) {
            if ($newlx2[$lx] == '新房') $where[] = ['cattype', '=', 1];
            if ($newlx2[$lx] == '二手房') $where[] = ['cattype', '=', 2];
            if ($newlx2[$lx] == '土地') $where[] = ['cattype', '=', 3];
        }
        $ws = input('param.ws', '');
        if ($ws) $where[] = ['room', 'like', '%"' . $newws2[$ws] . '"%'];
        $q = input('param.q', '');
        if ($q) $where[] = ['title', 'like', '%' . $q . '%'];

        $db = new CmsHouse();
        if (!empty($param['page'])) unset($param['page']);
        $listHouse = $db->where($where)->where('show',1)->order(['sort' => 'desc', 'id' => 'desc'])->paginate(10, false, [
            'path' => url('index/index/listHouse', $param),
        ]);


        $this->assign('listHouse', $listHouse);

        return $this->tpl();
    }

    /**
     * 单个房源信息
     */
    public function houseone()
    {
        $houseid = input('param.houseid', 0, 'intval');
        $db = new CmsHouse();
        $d = $db->where('id', $houseid)->find();
        if (empty($d)) $this->error('房源不存在');
        $this->assign('houseone', $d);

        return $this->tpl();

    }

    public function person()
    {
        return $this->tpl();
    }
}
