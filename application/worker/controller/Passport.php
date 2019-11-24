<?php
/**
 * Created by Boume.
 * Date: 1/7 0007
 * Time: 21:25
 */

namespace app\worker\controller;

use app\common\controller\Common;
use think\captcha\Captcha;
use tool\Crypt;

class Passport extends Common
{
    public function in()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $validate = new \app\admin\validate\Passport();
//            if (!$validate->check($post)) $this->error($validate->getError());

            $agent = \app\worker\model\Worker::where('username', $post['username'])->find();
            if(empty($agent)) $this->error('工人信息不存在');
            $crypt = new Crypt();
//            if($agent->password!=$crypt->encrypt($post['password'],config('key'))) $this->error('密码错误');

            if($agent->lock==1) $this->error('账号被锁定：' . $agent->lock_msg);

//            if($agent->getData('build_admin')<time()) $this->error('账号已到期');

//            echo '<pre>';var_dump($agent);exit;
            session('Worker', [
                'id' => $agent->id,
                'username' => $agent->username,
                'addtime' => $agent->addtime,
                'name' => $agent->name,
                'phone' => $agent->phone,
                'email' => $agent->email,
                'address' => $agent->address,
                'photo' => $agent->photo,
                'edit_password_time' => $agent->getData('edit_password_time'),

            ]);

            $this->succ(1, '登录成功', [], url("worker/index/index"));
        } else {
            if(session('?Worker')) $this->redirect('worker/index/index');
            return $this->fetch();
        }
    }

    public function out()
    {
        session('Worker', null);
        $this->redirect('passport/in');
    }

    public function verify()
    {
        $config = [
            // 验证码字体大小
            //'fontSize' => 30,
            // 验证码位数
            'length' => 4,
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
}
