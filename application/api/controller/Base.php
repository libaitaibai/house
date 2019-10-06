<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/1
 * Time: 18:55
 */

namespace app\api\controller;
use think\Container;
use think\Controller;
use think\facade\Cache;

class Base extends Controller
{
    protected $rate = 6.7;

    public function initialize()
    {
        parent::initialize();
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

    /**
     * 获得语言包信息
     * @return mixed
     */
    public function lang()
    {
        return Container::get('lang')->get();
    }

    /**
     * 返回json
     */
    public  function json($data,$code=200,$msg='')
    {
        return json([
            'code' => $code,
            'data' => $data,
            'msg'  => $msg
        ]);
    }

}
