<?php
/**
 * Created by Boume.
 * Date: 1/18 0018
 * Time: 9:53
 */

namespace app\admin\controller;

use tool\Tree;

class Node extends Base
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $db = new \app\admin\model\Node();
            $list = $db->order(['sort' => 'asc', 'id' => 'asc'])->column('*', 'id');
            $Tree = new Tree();
            $list = $Tree->getTree($list, 'name');
            $this->succ(1, '', [
                'list' => $list
            ]);
        } else {
            return $this->vue();
        }
    }

    public function add()
    {
        $db = new \app\admin\model\Node();
        if ($this->request->isPost()) {
            $post = input('post.');
            $post['pid'] = end($post['arrpid']);
            $db->allowField(true)->save($post);
            $db->sort = $db->id;
            $db->save();
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            $nodes = $db->order(['sort' => 'asc', 'id' => 'asc'])->column('id,name,pid,arrpid', 'id');
            $Tree = new Tree();
            $nodes = $Tree->getTree9($nodes);
            array_unshift($nodes, [
                'id' => 0,
                'name' => '根节点'
            ]);
            $this->succ(1, '', [
                'apiData' => [
                    'nodes' => $nodes
                ]
            ]);
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new \app\admin\model\Node();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            $post['pid'] = end($post['arrpid']);
            $db->allowField(true)->save($post, [
                'id' => $id,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $nodes = $db->order(['sort' => 'asc', 'id' => 'asc'])->column('id,name,pid,arrpid', 'id');
            $Tree = new Tree();
            $nodes = $Tree->getTree9($nodes);
            array_unshift($nodes, [
                'id' => 0,
                'name' => '根节点'
            ]);
            $dataForm = $db->where('id', $id)->find();
            $this->succ(1, '', [
                'apiData' => [
                    'nodes' => $nodes
                ],
                'dataForm' => $dataForm,
            ]);
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new \app\admin\model\Node();
        $id = input('param.id', 0, 'intval');
        if ($db->where('pid', $id)->count()) $this->error('请先删除子节点');
        $db->where('id', $id)->delete();
        $this->succ(1, '删除成功');
    }


}