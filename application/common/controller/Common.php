<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:00
 */

namespace app\common\controller;

use think\Controller;
use think\Response;
use think\exception\HttpResponseException;

class Common extends Controller
{
    public $M, $C, $A;

    public function initialize()
    {
        $this->M = strtolower($this->request->module());
        $this->C = strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . '_' . "$2", $this->request->controller()));
        $this->A = strtolower($this->request->action());
    }

    public function _empty()
    {
        die('error');
    }

    public function succ($code = 1, $msg = '', $data = [], $url = '', $wait = 3)
    {
        $type = $this->getResponseType();
        $result = [
            'code' => 1,
            'msg' => $msg,
            'data' => $data,
            'url' => $url,
            'wait' => $wait,
        ];
        $response = Response::create($result, $type);
        throw new HttpResponseException($response);
    }

    //生成vue异步组件
    public function vue($path = '')
    {
        $html = $this->fetch($path);
        preg_match_all("/<script.*?>(.*?)<\/script>/is", $html, $arr);
        if (!empty($arr[1]) && count($arr[1]) == 2) {
            $tpl = str_replace(["'", "\r\n"], ["\\'", ''], $arr[1][0]);
            $component = str_replace("__TEMPLATE__", trim($tpl), trim($arr[1][1]));
            return $component;
        } else {
            $this->assign('d', [
                'code' => 500,
                'msg' => '组件生成有误，请仔细检查'
            ]);
            return $this->vue('public/error');
        }
    }

}