<?php
/**
 * Created by PhpStorm.
 * User: liuyu
 * Date: 2019/10/13
 * Time: 10:04
 */
namespace app\api\controller;
use think\Controller;


class Wxbase extends Controller{


    public function SD($code=200,$msg="",$data=[]){

        return json([
            'code'=>$code,
            'msg'=> $msg,
            'data'=>$data

        ]);

    }





}