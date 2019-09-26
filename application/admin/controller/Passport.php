<?php
/**
 * Created by Boume.
 * Date: 1/7 0007
 * Time: 21:25
 */

namespace app\admin\controller;

use app\admin\model\LoginLog;
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
            if (!$validate->check($post)) $this->error($validate->getError());

            $admin = \app\admin\model\Admin::where('username', $post['username'])->find();
            if(empty($admin)) $this->error('用户不存在');
            $crypt = new Crypt();
            if($admin->password!=$crypt->encrypt($post['password'],config('key'))) $this->error('密码错误');

            //判断用户组是否锁定
            if($admin->Role->lock==1) $this->error('角色组被锁定：' . $admin->Role->lock_msg);
            if($admin->lock==1) $this->error('用户被锁定：' . $admin->lock_msg);

            //获取用户IP并且入库
            $login_log = new LoginLog();
            $login_log->save([
                'admin_id' => $admin->id,
                'time' => time(),
                'ip' => $this->request->ip(),
            ]);

            session('U', [
                'id' => $admin->id,
                'name' => $admin->name,
                'username' => $admin->username,
                'addtime' => $admin->addtime,
                'edit_password_time' => $admin->getData('edit_password_time'),
                'mobile' => $admin->mobile,
                'role_id' => $admin->Role->id,
                'role_name' => $admin->Role->role_name,
            ]);

            $this->succ(1, '登录成功', [], url("admin/index/index"));
        } else {
            if(session('?U')) $this->redirect('admin/index/index');
            return $this->fetch();
        }
    }

    public function out()
    {
        session('U', null);
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