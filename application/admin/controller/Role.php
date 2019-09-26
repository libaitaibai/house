<?php
/**
 * Created by Boume.
 * Date: 1/17 0017
 * Time: 19:23
 */

namespace app\admin\controller;

use app\admin\model\Admin;
use app\admin\model\Auth;
use app\admin\model\Node;
use tool\Tree;

class Role extends Base
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $db = new \app\admin\model\Role();
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['name', 'like', '%' . $q . '%'];
            $limit = input('param.limit', 20, 'intval');
            $list = $db->withCount('Admin')->where($where)->paginate($limit);
            $this->succ(1, '', [
                'list' => $list->items()
            ]);
        } else {
            return $this->vue();
        }
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $db = new \app\admin\model\Role();
            if ($db->where('name', $post['name'])->count()) $this->error('角色名已存在');
            $db->allowField(true)->save($post);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            $this->succ(1, '', []);
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new \app\admin\model\Role();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            if ($db->where('name', $post['name'])->where('id', '<>', $id)->count()) $this->error('角色名已存在');
            $db->allowField(true)->save($post, [
                'id' => $id
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->where('id', $id)->find()->getData();
            $this->succ(1, '', [
                'dataForm' => $dataForm
            ]);
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new \app\admin\model\Role();
        $id = input('param.id', 0, 'intval');
        if (Admin::where('role_id', $id)->count()) $this->error('角色下还有用户无法删除');
        if ($id > 1) $db->where('id', $id)->delete();
        $this->succ(1, '删除成功');
    }

    public function auth()
    {
        $db = new Auth();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $db->where('rid', $id)->delete();
            $data = [];
            $nids = input('post.nids', []);
            foreach ($nids as $k => $v) {
                $data[] = [
                    'rid' => $id,
                    'nid' => $v
                ];
            }
            $db->allowField(true)->saveAll($data);
            $this->succ(1, '设置成功');
        } elseif ($this->request->isAjax()) {
            $list = Node::order(['sort' => 'asc', 'id' => 'asc'])->column('id,name,pid', 'id');
            $tree = new Tree();
            $dataForm = $tree->getTree9($list);
            $keys = $db->where('rid', $id)->column('nid');
            $this->succ(1, '', [
                'keys' => $keys,
                'dataForm' => $dataForm
            ]);
        } else {
            $this->assign('ROLE', Node::where('id', $id)->find());
            return $this->vue();
        }
    }

}