<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 20:46
 */
namespace app\admin\validate;
use think\Validate;

class Passport extends Validate
{
    protected $rule =   [
        'username'  => 'require',
        'password'   => 'require',
        'code' => 'require|captcha',
    ];

    protected $message = [
        'username.require' => '请填写用户名',
        'password.require' => '请填写密码',
        'code.require' => '请填写验证码',
        'code.captcha' => '验证码不正确',
    ];
}