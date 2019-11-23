<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\landlord\controller;

use app\admin\model\LoginLog;
use app\landlord\model\Agent;
use tool\Crypt;
use app\landlord\model\Client;
class Index extends Base
{
    //首页落地页
    public function index()
    {
        return $this->fetch('./index');
    }

    //仪表板
    public function dashboard()
    {

        return $this->vue();
    }

    //获取用户信息
    public function getUinfo()
    {
        $db = new Client();
        $aid = session('Client.id');
        $info = $db->where('id', $aid)->find();
        return json([
            'info' => [
                ['key' => '姓名', 'value' => $info->name],
                ['key' => '电话', 'value' => $info->phone],
                ['key' => '邮箱', 'value' => $info->email],
                ['key' => '地址', 'value' => $info->address],
                ['key' => '创建时间', 'value' => $info->addtime],
            ],
            'data' => [
                'news' => db('cms_article')->where('release', 0)->count(),
                'agent_news' => db('cms_article')->where('release', $aid)->count(),
                'house' => db('cms_house')->where('release', 0)->count(),
                'agent_house' => db('house')->where('client_id', $aid)->count(),
            ]
        ]);
    }

    //修改密码
    public function resetPwd()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $db = new Client();
            $Crypt = new Crypt();
            $post['password'] = $Crypt->encrypt($post['password'], config('key'));
            $post['edit_password_time'] = time();
            $db->allowField(true)->save($post, [
                'id' => session('Client.id')
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $this->succ(1, '', []);
        } else {
            $this->assign('POSTION', '修改密码');
            return $this->vue();
        }
    }

    //个人资料
    public function myInfo()
    {
        $db = new Client();
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => session('Client.id')
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->where('id', session('Client.id'))->field('password,build_page,build_client,build_admin,lock,lock_msg,username', true)->find();
            $this->succ(1, '', [
                'dataForm' => $dataForm,
                'apiData' => [
                    'lang' => ['中文', '英语', '法语', '日语', '德语', '俄语'],
                ],
            ]);
        } else {
            $this->assign('POSTION', '修改密码');
            return $this->vue();
        }
    }

}
