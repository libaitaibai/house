<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\admin\controller;

use tool\Crypt;

class client extends Base
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['username', 'like', '%' . $q . '%'];
            $db = new \app\admin\model\Client();
            $list = $db->where($where)->order('id','desc')->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items()
            ]);
        } else {
            return $this->vue();
        }
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $db = new \app\admin\model\Client();
            $post = input('post.');
            if ($db->where('username', $post['username'])->count()) $this->error('用户名已经存在');
            $Crypt = new Crypt();
            $post['password'] = $Crypt->encrypt($post['password'], config('key'));
            $post['addtime'] = $post['edit_password_time'] = time();
            $db->allowField(true)->save($post);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            $this->succ(1, '', [
                'apiData' => []
            ]);
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new \app\admin\model\Client();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            if (!empty($post['password'])) {
                $Crypt = new Crypt();
                $post['password'] = $Crypt->encrypt($post['password'], config('key'));
                $post['edit_password_time'] = time();
            }
            $db->allowField(true)->save($post, [
                'id' => $id,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->field('id,password,addtime,edit_password_time', true)->where('id', $id)->find()->getData();
            $this->succ(1, '', [
                'apiData' => [],
                'dataForm' => $dataForm
            ]);
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new \app\admin\model\Client();
        $id = input('param.id', 0, 'intval');
        $ids = input('param.ids', []);
        if (!empty($ids)) {
            $db->whereIn('id', $ids)->delete();
        } else {
            $db->where('id', $id)->delete();
        }
        $this->succ(1, '删除成功');
    }

}

