<?php
/**
 * Created by Boume.
 * Date: 1/7 0007
 * Time: 21:24
 */

namespace app\admin\controller;

use app\common\controller\Common;
use tool\Breadcrumbs;

class Base extends Common
{
    public $NODES = [];
    public $NODEID = 0;

    public function initialize()
    {
        parent::initialize();
        $this->inspect_auth();
        $this->breadcrumb();
    }

    //权限检测
    private function inspect_auth()
    {
        //判断是否登录
        if (session('?U') == false) $this->redirect('passport/in');
        //如果是index控制器跳过
        if ($this->M == 'admin' && $this->C == 'index') return true;
        $Node = new \app\admin\model\Node();
        $node = $Node->where([
            ['module', '=', $this->M],
            ['controller', '=', $this->C],
            ['action', '=', $this->A]
        ])->find();
        if (empty($node)) {
            $this->assign('d', [
                'code' => 500,
                'msg' => '节点不存在'
            ]);
            return $this->vue('public/error');
        }
        $this->NODEID = $node->id;

        //如果是创始人和超级管理员角色则跳过
        if (session('U.id') == 1 || session('U.role_id') == 1) return true;

        $Auth = new \app\admin\model\Auth();
        $auth = $Auth->where([
            ['rid', '=', session('U.role_id')],
            ['nid', '=', $node->id]
        ])->count();
        if ($auth == 0) {
            $this->assign('d', [
                'code' => 403,
                'msg' => '抱歉，你无权访问该页面'
            ]);
            return $this->vue('public/error');
        }
    }

    //面包屑
    private function breadcrumb()
    {
        $Node = new \app\admin\model\Node();
        $this->NODES = $Node->column('*', 'id');
        $BC = new Breadcrumbs();
        $data = $BC->getMenu($this->NODES, $this->NODEID);
        foreach ($data as $k => $v) {
            $data[$k]['url'] = '';
            if ($v['module'] && $v['controller'] && $v['action']) $data[$k]['url'] = url($v['module'] . '/' . $v['controller'] . '/' . $v['action']);
        }
        $this->assign('BREADCRUMB', $data);
        if (!empty($data)) $this->assign('NODE', end($data));
    }

    public function _empty()
    {
        return $this->vue('public/error');
    }

}
