<?php
/**
 * Created by Boume.
 * Date: 1/7 0007
 * Time: 21:25
 */

namespace app\agent_admin\controller;

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

            $agent = \app\agent_admin\model\Agent::where('username', $post['username'])->find();
            if(empty($agent)) $this->error('经纪人不存在');
            $crypt = new Crypt();
//            if($agent->password!=$crypt->encrypt($post['password'],config('key'))) $this->error('密码错误');

            if($agent->lock==1) $this->error('账号被锁定：' . $agent->lock_msg);

//            if($agent->getData('build_admin')<time()) $this->error('账号已到期');


            session('Agent', [
                'id' => $agent->id,
                'name' => $agent->name,
                'username' => $agent->username,
                'name' => $agent->name,
                'phone' => $agent->phone,
                'email' => $agent->email,
                'license' => $agent->license,
                'addtime' => $agent->addtime,
                'address' => $agent->address,
                'build_page' => $agent->build_page,
                'build_client' => $agent->build_client,
                'build_admin' => $agent->build_admin,
                'edit_password_time' => $agent->getData('edit_password_time'),
                'phone' => $agent->phone,
            ]);

            $this->succ(1, '登录成功', [], url("agent_admin/index/index"));
        } else {
            if(session('?Agent')) $this->redirect('agent_admin/index/index');
            return $this->fetch();
        }
    }

    public function out()
    {
        session('Agent', null);
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
