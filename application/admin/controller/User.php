<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\admin\controller;

use app\admin\model\Admin;
use app\admin\model\Role;
use tool\Crypt;

class User extends Base
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['username', 'like', '%' . $q . '%'];
            $db = new Admin();
            $list = $db->with('Role')->where($where)->paginate($limit);
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
            $db = new Admin();
            $post = input('post.');
            if ($db->where('username', $post['username'])->count()) $this->error('用户名已经存在');
            $Crypt = new Crypt();
            $post['password'] = $Crypt->encrypt($post['password'], config('key'));
            $post['addtime'] = $post['edit_password_time'] = time();
            $db->allowField(true)->save($post);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            $db = new Role();
            $roleList = $db->select();
            $this->succ(1, '', [
                'apiData' => [
                    'roleList' => $roleList,
                ]
            ]);
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new Admin();
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
            $roleDb = new Role();
            $roleList = $roleDb->select();
            $dataForm = $db->field('id,password,addtime,edit_password_time', true)->where('id', $id)->find()->getData();
            $this->succ(1, '', [
                'apiData' => [
                    'roleList' => $roleList,
                ],
                'dataForm' => $dataForm
            ]);
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new Admin();
        $id = input('param.id', 0, 'intval');
        $ids = input('param.ids', []);
        if (!empty($ids)) {
            $db->whereIn('id', $ids)->where('id', '>', 1)->delete();
        } else {
            if ($id > 1) $db->where('id', $id)->delete();
        }
        $this->succ(1, '删除成功');
    }

    public function lock()
    {
        $db = new Admin();
        $id = input('param.id', 0, 'intval');
        $ids = input('param.ids', []);
        $lock = input('param.lock', 0, 'intval');
        $lock_msg = input('param.lock_msg', '');
        if (!empty($ids)) {
            $db->whereIn('id', $ids)->where('id', '>', 1)->update([
                'lock' => $lock,
                'lock_msg' => $lock_msg
            ]);
        } else {
            if ($id > 1) $db->where('id', $id)->delete();
        }
        $this->succ(1, $lock ? '已锁定' : '已激活');
    }

}

