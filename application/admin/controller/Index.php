<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\admin\controller;

use app\admin\model\Admin;
use app\admin\model\Auth;
use app\admin\model\LoginLog;
use app\admin\model\Node;
use tool\Crypt;
use tool\Tree;

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

    //获取菜单
    public function getMenu()
    {
        $lists = Node::where('show', '1')->order('sort asc')->column('*', 'id');
        if (session('U.id') > 1 || session('U.role_id') > 1) {
            $nids = Auth::where('rid', session('U.role_id'))->column('nid');
            foreach ($lists as $k => $v) {
                if (!in_array($k, $nids)) unset($lists[$k]);
            }
        }
        $urls = [];
        foreach ($lists as $k => $v) {
            $lists[$k]['url'] = '';
            if ($v['module'] && $v['controller'] && $v['action']) {
                $urls[] = $lists[$k]['url'] = url($v['module'] . '/' . $v['controller'] . '/' . $v['action']);
            }
        }
        $Tree = new Tree();
        $menu = $Tree->getTree9($lists);
        echo 'var _menu=' . json_encode($menu) . ";\r\n";
        echo 'var _urls=' . json_encode($urls) . ";\r\n";
        return;
    }

    //修改密码
    public function resetPwd()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $db = new Admin();
            $Crypt = new Crypt();
            $post['password'] = $Crypt->encrypt($post['password'], config('key'));
            $db->allowField(true)->save($post, [
                'id' => session('U.id')
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $this->succ(1, '', []);
        } else {
            return $this->vue();
        }
    }

    //登录日志
    public function log()
    {
        if ($this->request->isAjax()) {
            $db = new LoginLog();
            $where = [];
            $limit = input('param.limit', 20, 'intval');
            $daterange = input('param.daterange', []);
            if(is_array($daterange) && count($daterange)){
                $daterange[0] = strtotime($daterange[0]);
                $daterange[1] = strtotime($daterange[1]);
                $where[] = ['time', 'between', $daterange];
            }
            $list = $db->where($where)->order('id', 'desc')->paginate($limit);

            $this->succ(1, '', [
                'list' => $list->items(),
                'total' => $list->total(),
            ]);
        } else {
            return $this->vue();
        }
    }

}