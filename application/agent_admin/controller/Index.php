<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\agent_admin\controller;

use app\admin\model\LoginLog;
use app\agent_admin\model\Agent;
use tool\Crypt;

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
        $db = new Agent();
        $aid = session('Agent.id');
        $info = $db->where('id', $aid)->find();
        return json([
            'info' => [
                ['key' => '姓名', 'value' => $info->name],
                ['key' => '电话', 'value' => $info->phone],
                ['key' => '邮箱', 'value' => $info->email],
                ['key' => '执照号', 'value' => $info->license],
                ['key' => '擅长语言', 'value' => implode(" / ", $info->lang)],
                ['key' => '地址', 'value' => $info->address],
                ['key' => '主页有效期至', 'value' => $info->build_page],
                ['key' => '可创建客户数', 'value' => $info->build_client],
                ['key' => '后台有效期至', 'value' => $info->build_admin],
            ],
            'data' => [
                'client' => db('client')->where('agent_id', $aid)->count(),
                'client_house' => db('house')->where('agent_id', $aid)->count(),
                'news' => db('cms_article')->where('release', 0)->count(),
                'agent_news' => db('cms_article')->where('release', $aid)->count(),
                'house' => db('cms_house')->where('release', 0)->count(),
                'agent_house' => db('cms_house')->where('release', $aid)->count(),
            ]
        ]);
    }

    //修改密码
    public function resetPwd()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $db = new Agent();
            $Crypt = new Crypt();
            $post['password'] = $Crypt->encrypt($post['password'], config('key'));
            $post['edit_password_time'] = time();
            $db->allowField(true)->save($post, [
                'id' => session('Agent.id')
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
        $db = new Agent();
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => session('Agent.id')
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->where('id', session('Agent.id'))->field('password,build_page,build_client,build_admin,lock,lock_msg,username', true)->find();
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