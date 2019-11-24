<?php

namespace app\index\controller;

use app\admin\model\AdsData;
use app\admin\model\CmsAgent;
use app\admin\model\CmsArticle;
use app\admin\model\CmsDecorator;
use app\admin\model\CmsHouse;
use app\admin\model\Agent;

class Magents extends Base
{

    public $SEO, $articleTag;
    protected $domain='';
    protected $aid = 0;

    public function initialize()
    {
        parent::initialize();
        $this->SEO = [
            'title' => '奥兰多房产-奥兰多度假屋-奥兰多经纪-房屋管理装修公司-美国房产服务平台',
            'page-title' => '美国房产服务平台',
            'keywords' => '奥兰多房产,奥兰多房地产,奥兰多房地产经纪,奥兰多度假屋,奥兰多房屋管理公司,奥兰多装修公司,美国房产,佛罗里达房产,奥兰多房产,奥兰多管理公司,佛罗里达地产,佛罗里达经纪,美国房产服务平台',
            'description' => '我们是专为海外房东设立的奥兰多房地产服务平台，主推奥兰多房产，奥兰多度假屋、奥兰多经纪、美国房产等服务，为投资人提供一条龙的专业化服务，解决海外购房的一切难题。根据不同的投资需求，我们将为投资人筛选对接合适的持牌地产经纪、贷款经纪及房屋管理公司。除了奥兰多房屋买卖和出租管理以外，我们还会实时更新当地专业化的装修公司资讯，让您的房屋免除后顾之忧，轻松当美国房东！',
        ];
        $this->getLang();
        $this->getAgent();
        $this->getNav();
        $this->getRecommand();
        $this->getFooter();
        
        $this->domain = request()->domain();
        $this->articleTag = [lang('OrlandoRealestateinformation'), lang('AmericanRealestateinformation'), lang('Travelinformation')];
        $this->assign('articleTag', $this->articleTag);

    }


    private function getAgent(){

        $aid = intval(input('aid',2));
        
        //获取经纪人
        $db = new Agent();
        $agent = $db->where('id', $aid)->find();

        //显示404页面
        //if (empty($agent)) $this->error('经纪人不存在');
        $this->aid = $aid;
        $this->assign('agent',$agent);
        $this->assign('agent_id',$aid);

    }

    //底部footer
    protected function getFooter(){

        $contact_list=db('ads_data')->where(['aid'=>13,'show'=>1])->order(['sort'=>'desc','id'=>'desc'])->limit(1)->select();
        $wechat_info =  $list=db('ads_data')->where(['aid'=>15,'show'=>1])->order(['sort'=>'desc','id'=>'desc'])->limit(1)->select();
     
        $links = [
            ['title'=>lang('home'),'url'=>'/'],
            ['title'=>lang('Aboutus'),'url'=>'/about.html'],
            ['title'=>lang('Contactus'),'url'=>'/contact.html'],
            ['title'=>lang('Landlordlogin'),'url'=>'/']
        ];
        //底部友情链接 
        //$links=db('ads_data')->where('aid',11)->where('show',1)->select();
        $this->assign('ylink',$links);
        $this->assign('contact_list',$contact_list);
        $this->assign('wechat_info',$wechat_info);

    }


    public function getNav(){

        $param = ['lang'=>$this->lang,'aid'=>$this->aid];
        $Houseproperty_url = $this->builderQuery('index/magents/listHouse',$param);
        $Agent_url = $this->builderQuery('index/magents/listArticle',$param);
        $Realestateinformation = $this->builderQuery('index/magents/listArticle',$param);
        $Landlordlogin = 'javascript:void(0)';

        $this->assign('Houseproperty_url',$Houseproperty_url);
        $this->assign('Agent_url',$Agent_url);
        $this->assign('Realestateinformation_url',$Realestateinformation);
        $this->assign('Landlordlogin_url',$Landlordlogin);
    }

    public function getRecommand(){
        $param = ['lang'=>$this->lang,'aid'=>$this->aid];
        $recommands = db('cms_article')->where(['show'=>1])->order(['sort' => 'desc', 'id' => 'desc'])->limit(5)->select();
        foreach($recommands as &$v){
            $v['url'] = $this->builderQuery('index/magents/showArticle',array_merge($param,['id'=>$v['id']]));
        }
        $is_recommand = 0;
        if($this->lang!='zh-cn'){
            $is_recommand = 1;
        }
        $this->assign('is_recommand',$is_recommand);
        $this->assign('recommands',$recommands);
    }

    public function index()
    {



        $langs = [
            'Recommendagoodroom'=>lang("Recommendagoodroom"),
            'Licensedbrokersselectcarefullyforyou'=>lang('Licensedbrokersselectcarefullyforyou'),
            'rise'=>lang('rise'),
            'tenthousand'=>lang('tenthousand'),
            'Checkoutmorehousingsources'=>lang('Checkoutmorehousingsources')
 
         ];

         $param = ['lang'=>$this->lang,'aid'=>$this->aid];
    
         $urls = [
             'list_house_url'=>$this->builderQuery('index/magents/listHouse',$param)
         ];

         $houseDb= new \app\admin\model\CmsHouse();
         $house_list=$houseDb->where(['show'=>1,'release'=>0])->order(['sort'=>'desc','id'=>'desc'])->limit(10)->select();
         foreach($house_list as &$v){
             $tmp_param = array_merge($param,['id'=>$v['id']]);
             $v['show_house_url'] = $this->builderQuery('index/magents/showHouse',$tmp_param);
         }

         //tab键切换
         $tab_data = [];
         $tab=[lang('OrlandoRealestateinformation'), lang('AmericanRealestateinformation'), lang('Travelinformation')];
         foreach($tab as $k=>$name){
                $list = db('cms_article')->where([
                    ['tag', 'like', '%"'.$name.'"%'],
                    ['show','=',1]
                ])->order(['sort' => 'desc', 'id' => 'desc'])->limit(10)->select();
                
                foreach($list as $kk=>&$vv){
                       $tmp_param = array_merge($param,['id'=>$v['id']]);
                       $vv['show_article_url'] = $this->builderQuery('index/magents/showArticle',$tmp_param);
                }
                $tab_data[$k] = [
                      'name'=>$tab[$k],
                      'url'=> $this->builderQuery('index/magents/listArticle',array_merge($param,['tag'=>$tab[$k]])),
                      'list'=>$list
                ];
         }

        //首页banner
        $ads=db('ads_data')->where(['aid'=>12,'show'=>1])->order(['sort'=>'desc','id'=>'desc'])->limit(10)->select();

        $this->assign('ads', $ads);

        $this->assign('SEO', $this->SEO);
        $this->assign('house_list',$house_list);
        $this->assign('langs',$langs);
        $this->assign('urls',$urls);
        $this->assign('tab_data',$tab_data);

        return $this->tpl();
    }

    //房源列表
    public function listHouse()
    {
        $filter = [
            [
                'key' => 'jg',
                'name' => lang('Totalhouseprice'),
                'child' => ['50万以下', '50-100万', '100-200万', '200-300万', '300-500万', '500-700万', '700-1000万', '1000万以上']
            ],
            [
                'key' => 'zy',
                'name' => lang('Homepurchasepurpose'),
                'child' => [lang("Invest"), lang('Educationabroad'), lang('Housingemigration'), lang('自住')]
            ],
            [
                'key' => 'wy',
                'name' => lang('Propertytype'),
                'child' => [lang('Detachedvilla'), lang('Apartment'), lang('Townhouse'), lang('land'), lang('Commercialestate')]
            ],
            [
                'key' => 'lx',
                'name' => '房源类型',
                'child' => ['新房', '二手房', '土地']
            ],
            [
                'key' => 'ws',
                'name' => '卧室数量',
                'child' => ['1居', '2居', '3居', '4居', '5居', '5居以上']
            ],
        ];
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
            if ($jg == '50万以下') $where[] = ['price', '<', floor(50 / $this->rate)];
            if ($jg == '50-100万') $where[] = ['price', 'BETWEEN', [floor(50 / $this->rate), floor(100 / $this->rate)]];
            if ($jg == '100-200万') $where[] = ['price', 'BETWEEN', [floor(100 / $this->rate), floor(200 / $this->rate)]];
            if ($jg == '200-300万') $where[] = ['price', 'BETWEEN', [floor(200 / $this->rate), floor(300 / $this->rate)]];
            if ($jg == '300-500万') $where[] = ['price', 'BETWEEN', [floor(300 / $this->rate), floor(500 / $this->rate)]];
            if ($jg == '500-700万') $where[] = ['price', 'BETWEEN', [floor(500 / $this->rate), floor(700 / $this->rate)]];
            if ($jg == '700-1000万') $where[] = ['price', 'BETWEEN', [floor(700 / $this->rate), floor(1000 / $this->rate)]];
            if ($jg == '1000万以上') $where[] = ['price', '>', floor(1000 / $this->rate)];
        }
        $zy = input('param.zy', '');
        if ($zy) $where[] = ['purpose', 'like', '%"' . $zy . '"%'];
        $wy = input('param.wy', '');
        if ($wy) $where[] = ['type', 'like', '%"' . $wy . '"%'];
        $lx = input('param.lx', '');
        if ($lx) {
            if ($lx == '新房') $where[] = ['cattype', '=', 1];
            if ($lx == '二手房') $where[] = ['cattype', '=', 2];
            if ($lx == '土地') $where[] = ['cattype', '=', 3];
        }
        $ws = input('param.ws', '');
        if ($ws) $where[] = ['room', 'like', '%"' . $ws . '"%'];
        $q = input('param.q', '');
        if ($q) $where[] = ['title', 'like', '%' . $q . '%'];

        $db = new CmsHouse();
        if (!empty($param['page'])) unset($param['page']);
        $listHouse = $db->where($where)->where('show',1)->order(['sort' => 'desc', 'id' => 'desc'])->paginate(10, false, [
            'path' => url('index/index/listHouse', $param),
        ]);
        $this->assign('listHouse', $listHouse);
        $this->assign('ac', 'house');

        $this->SEO['title'] = '奥兰多精选房源-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        return $this->tpl();
    }

    //房源查看
    public function showHouse()
    {
        $id = input('param.id', 0, 'intval');
        $db = new CmsHouse();
        $d = $db->where('id', $id)->find();
        if (empty($d)) $this->error('房源不存在');
        $this->assign('d', $d);
        $this->assign('ac', 'house');

        $this->SEO['title'] = $d['title'] . '-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '奥兰多房地产');
        return $this->tpl();
    }

    //经纪人列表
    public function listAgent()
    {
        $db = new CmsAgent();
        $listAgent = $db->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->paginate(9);
        $this->assign('listAgent', $listAgent);
        $this->assign('ac', 'agent');

        $this->SEO['title'] = '奥兰多房产经纪人-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '奥兰多房产经纪人');
        return $this->tpl();
    }

    //经纪人内容
    public function showAgent()
    {

        $id = input('param.id', 0, 'intval');
        $db = new CmsAgent();
        $d = $db->where('id', $id)->find();
        if (empty($d)) $this->error('经纪人不存在');
        $this->assign('d', $d);
        $this->assign('ac', 'agent');

        $this->SEO['title'] = $d['title'] . '-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '奥兰多房产经纪人');
        return $this->tpl();
    }


    //文章列表
    public function listArticle()
    {
        $db = new CmsArticle();
        $where = [];
        $tag = input('param.tag', '');
        if ($tag) $where[] = ['tag', 'like', '%"' . $tag . '"%'];
        $listArticle = $db->where($where)->where('show', 1)->order(['sort' => 'desc', 'id' => 'desc'])->paginate(10);
        $this->assign('listArticle', $listArticle);
        $this->assign('ac', 'article');

        if ($tag) {
            $this->SEO['title'] = $tag . '-' . $this->SEO['page-title'];
        } else {
            $this->SEO['title'] = '奥兰多房产资讯-' . $this->SEO['page-title'];
        }
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '奥兰多房产资讯');
        return $this->tpl();
    }

    //文章内容
    public function showArticle()
    {
        $id = input('param.id', 0, 'intval');
        $db = new CmsArticle();
        $d = $db->where('id', $id)->find();
        if (empty($d)) $this->error('文章不存在');
        $this->assign('d', $d);

        $this->assign('ac', 'article');

        $d->hits += 1;
        $d->save();

        $this->SEO['title'] = $d['title'] . '-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '奥兰多房产资讯');
        return $this->tpl();
    }

    //美国开发商
    public function developerCompany()
    {
        $this->assign('ac', 'help');
        $this->SEO['title'] = '美国房地产开发商-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '美国房地产开发商');
        return $this->tpl();
    }

    //美国开发商
    public function butlerCompany()
    {
        $this->assign('ac', 'help');
        $this->SEO['title'] = '美国房屋管理公司-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '美国房屋管理公司');
        return $this->tpl();
    }

    //装修公司
    public function decorationCompany()
    {
        $this->assign('ac', 'help');
        $this->SEO['title'] = '美国度假屋装修公司-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '美国度假屋装修公司');
        return $this->tpl();
    }

    //装修工人
    public function listDecorator()
    {
        $db = new CmsDecorator();
        $listDecorator = $db->where(['show' => 1])->order(['sort' => 'desc', 'id' => 'desc'])->paginate(9);
        $this->assign('listDecorator', $listDecorator);

        $this->assign('ac', 'help');
        $this->SEO['title'] = '美国装修工人-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '美国装修工人');
        return $this->tpl();
    }

    //装修工人
    public function showDecorator()
    {
        $id = input('param.id', 0, 'intval');
        $db = new CmsDecorator();
        $d = $db->where('id', $id)->find();
        if (empty($d)) $this->error('装修工人不存在');
        $this->assign('d', $d);

        $this->assign('ac', 'help');
        $this->SEO['title'] = $d['title'] . '-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', '美国装修工人');
        return $this->tpl();
    }

    //单页
    public function page()
    {
        $id = input('param.id', 0, 'intval');
        $db = new AdsData();
        $d = $db->where('id', $id)->find();
        if(empty($d)) $this->error('单页不存在');
        $this->assign('d', $d);

        $this->assign('ac', 'page');
        $this->SEO['title'] = $d['title'] . '-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        $this->assign('pageName', $d['title']);
        return $this->tpl();
    }

    //奥兰多介绍
    public function orlando()
    {
        $id = 49;
        $db = new AdsData();
        $d = $db->where('id', $id)->find();
        if(empty($d)) $this->error('单页不存在');
        $this->assign('d', $d);

        $this->assign('ac', 'help');
        $this->SEO['title'] = $d['title'] . '-' . $this->SEO['page-title'];
        $this->assign('SEO', $this->SEO);
        return $this->tpl();
    }
}
