<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\landlord\controller;

class House extends Base
{

    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];

            $client_id = input('param.client_id', 0, 'intval');
            if ($client_id) $where[] = ['client_id', '=', $client_id];

            $db = new \app\landlord\model\House();
            $list = $db->with(['Client' => function ($q) {
                $q->field('id,name,phone,email');
            }])->where($where)->where('client_id', $this->aid)->order(['id' => 'desc'])->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items(),
                'apiData' => [],
            ]);
        } else {
            return $this->vue();
        }
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $db = new \app\landlord\model\House();
            $post = input('post.');
            $post['addtime'] = time();
            $post['client_id'] = $this->aid;
            $db->allowField(true)->save($post);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            if (input('param.ac') == 'getClient') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'client' => $this->getClient($q),
                    ],
                ]);
            } else {
                $this->succ(1, '', [
                    'apiData' => [],
                ]);
            }
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new \app\landlord\model\House();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => $id,
                'client_id' => $this->aid,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            if (input('param.ac') == 'getClient') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'client' => $this->getClient($q),
                    ],
                ]);
            } else {
                $dataForm = $db->field('id,addtime', true)->where('id', $id)->where('client_id',$this->aid)->find();
                $this->succ(1, '', [
                    'apiData' => [
                        'agent' => $this->getClient('', $dataForm['agent_id']),
                    ],
                    'dataForm' => $dataForm,
                ]);
            }
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new \app\landlord\model\House();
        $id = input('param.id', 0, 'intval');
        $ids = input('param.ids', []);
        if (!empty($ids)) {
            $db->whereIn('id', $ids)->where('client_id',$this->aid)->delete();
        } else {
            $db->where('id', $id)->where('client_id',$this->aid)->delete();
        }
        $this->succ(1, '删除成功');
    }

    private function getClient($q, $id = 0)
    {
        $wdb = new \app\landlord\model\Agent();
        $worker = [];
        $q = input('param.q');
        if ($q) {
            $worker = $wdb->whereOr('name', 'like', '%' . $q . '%')
                ->whereOr('username', 'like', '%' . $q . '%')
                ->whereOr('phone', 'like', '%' . $q . '%')
                ->whereOr('email', 'like', '%' . $q . '%')
                ->field('id,name,phone')->select();
        } elseif ($id) {
            $worker = $wdb->where('id', $id)
                ->field('id,name,phone')->select();
        }
        return $worker;
    }
}

