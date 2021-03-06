<?php
/**
 * Created by Boume.
 * Date: 1/17 0017
 * Time: 19:23
 */

namespace app\worker\controller;

use app\admin\model\House;
use app\admin\model\TaskData;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Task extends Base
{
    public function runing()
    {
        if ($this->request->isAjax()) {
            $db = new \app\admin\model\Task();
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $where[] = ['worker_id', '=', session('Worker.id')];
            $limit = input('param.limit', 20, 'intval');
            $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->where('status',1)->order('id', 'desc')->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items()
            ]);
        } else {
            return $this->vue();
        }
    }

    public function stop()
    {
        if ($this->request->isAjax()) {
            $db = new \app\admin\model\Task();
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $where[] = ['worker_id', '=', session('Worker.id')];
            $limit = input('param.limit', 20, 'intval');
            $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->where('status',9)->order('id', 'desc')->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items()
            ]);
        } else {
            return $this->vue();
        }
    }

    public function wait()
    {
        if ($this->request->isAjax()) {
            $db = new \app\admin\model\Task();
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $where[] = ['worker_id', '=', session('Worker.id')];
            $limit = input('param.limit', 20, 'intval');
            $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->where('status',0)->order('id', 'desc')->paginate($limit);
//            echo '<pre>';var_dump($list);exit;

            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items()
            ]);
        } else {
            return $this->vue();
        }
    }

    public function tongji()
    {
        if ($this->request->isAjax()) {
            $db = new TaskData();
            $client_id = session('Worker.id');

            $where = [];
            $limit = input('param.limit', 20, 'intval');

            $house_id = input('param.house_id', 0, 'intval');
            if($house_id) $where[] = ['house_id', '=', $house_id];

            $worker_id = input('param.worker_id', 0, 'intval');
            if($worker_id) $where[] = ['worker_id', '=', $worker_id];

            if($client_id) $where[] = ['client_id', '=', $client_id];
            $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->order('id', 'desc')->paginate($limit);
            $tongji = $db->where($where)->sum('price');
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items(),
                'tongji' => $tongji,
            ]);
        } else {
            return $this->vue();
        }
    }

    public function detail()
    {
        $id = input('param.id', 0, 'intval');
        if ($this->request->isAjax()) {
            $db = new TaskData();
            $dataForm = $db->with(['House'=>function($q){
                $q->field('id,title,address');
            },'Agent'=>function($q){
                $q->field('id,name,phone,email');
            },'Client'=>function($q){
                $q->field('id,name,phone,email');
            },'Worker'=>function($q){
                $q->field('id,name,phone,email');
            }])->where('id', $id)->find();
            $this->succ(1, '', [
                'dataForm' => $dataForm,
            ]);
        } else {
            return $this->vue();
        }
    }

    public function startwork()
    {
        if ($this->request->isAjax()) {
            $id = input('param.id', 0, 'intval');
            $Task = new \app\admin\model\Task();
            $where[] = ['id', '=', $id];
            $list = $Task->with(['Agent', 'Client', 'Worker'])->where($where)->field('title')->order('id', 'desc')->select()->toArray();
            $title = $list[0]['title'];
            $db = new \app\admin\model\TaskData();
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $where[] = ['worker_id', '=', session('Worker.id')];
            $where[] = ['task_id', '=', $id];
            $limit = input('param.limit', 20, 'intval');
            $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->order('id', 'desc')->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'titlename' => ['name'=>$title,'id'=>$id],
                'list' => $list->items(),
            ]);
        } else {
            return $this->vue();
        }
    }

    public function addact()
    {

        if ($this->request->isPost()) {
            $data = input();
            $task_id = input('task_id', 0, 'intval');
            $Task = new \app\admin\model\Task();
            $where[] = ['id', '=', $task_id];
            $list = $Task->where($where)->order('id', 'desc')->select()->toArray();

            $task = $list[0];
            //单次任务标记已完成
            if($task['type'] == 1){
                $Task->allowField(true)->save(['status'=>9],[
                    'id' => $task_id,
                ]);
            }

            $data['photos'] = json_encode($data['imgs']);
            $data = array_merge($data,$task);
            $data['addtime'] = time();
            unset($data['id']);

            $db = new \app\admin\model\TaskData();
            $db->allowField(true)->save($data);
            $this->succ(1, '任务添加成功');

        } else {
            return $this->vue();
        }
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $post['addtime'] = time();
            $db = new \app\admin\model\Task();
            if (empty($post['house_id'])) $post['status'] = 0;
            if ($post['type'] == 1) $post['num'] = 0;
            if ($post['type'] == 2) $post['task_date'] = 0;

            //获取经纪人ID,客户ID
            if (!empty($post['house_id'])) {
                $houseDb = new House();
                $house = $houseDb->where('id', $post['house_id'])->find();
                if (!empty($house)) {
                    $post['agent_id'] = $house['agent_id'];
                    $post['client_id'] = $house['client_id'];
                }
            }

            $db->allowField(true)->save($post);
            $this->succ(1, '任务添加成功');
        } elseif ($this->request->isAjax()) {
//            echo '<pre>';var_dump(input('param.ac'));exit;
            if (input('param.ac') == 'getClient') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'clientHouse' => $this->getClient($q),
                    ],
                ]);
            } elseif (input('param.ac') == 'getWorker') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'worker' => $this->getWorker($q),
                    ],
                ]);
            } else {
                $this->succ(1, '', [
                    'apiData' => [
                        'clientHouse' => [],
                    ],
                ]);
            }
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $id = input('param.id', 0, 'intval');
        $db = new \app\admin\model\Task();
        if ($this->request->isPost()) {
            $post = input('post.');
            if (empty($post['house_id'])) $post['status'] = 0;
            if ($post['type'] == 1) $post['num'] = 0;
            if ($post['type'] == 2) $post['task_date'] = 0;

            //获取经纪人ID,客户ID
            if (!empty($post['house_id'])) {
                $houseDb = new House();
                $house = $houseDb->where('id', $post['house_id'])->find();
                if (!empty($house)) {
                    $post['agent_id'] = $house['agent_id'];
                    $post['client_id'] = $house['client_id'];
                }
            }

            $db->allowField(true)->save($post,[
                'id' => $id,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            if (input('param.ac') == 'getClient') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'clientHouse' => $this->getClient($q),
                    ],
                ]);
            } elseif (input('param.ac') == 'getWorker') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'worker' => $this->getWorker($q),
                    ],
                ]);
            } else {
                $dataForm = $db->field('id,addtime', true)->where('id', $id)->find();
                $this->succ(1, '', [
                    'dataForm' => $dataForm,
                    'apiData' => [
                        'clientHouse' => $this->getClient('', $dataForm['client_id']),
                        'worker' => $this->getWorker('', $dataForm['worker_id']),
                    ],
                ]);
            }
        } else {
            return $this->vue();
        }
    }




    private function getClient($q = '', $id = 0)
    {
        $cdb = new \app\admin\model\Client();
        $clientHouse = [];
        if ($q) {
            $clientHouse = $cdb->with(['House' => function ($query) {
                $query->field('id,title,client_id');
            }])
                ->where('id', '=', session('Worker.id'))
                ->field('id,name,phone')->select();
        } elseif ($id) {
            $clientHouse = $cdb->with(['House' => function ($query) {
                $query->field('id,title,client_id');
            }])
                ->where('id', $id)
                ->field('id,name,phone')->select();
        }
        return $clientHouse;
    }

    private function getWorker($q, $id = 0)
    {
        $wdb = new \app\admin\model\Worker();
        $worker = [];
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

    public function deltaskdata()
    {
        $db = new \app\admin\model\TaskData();
        $id = input('param.id', 0, 'intval');
        $ids = input('param.ids', []);
        if (!empty($ids)) {
            $db->whereIn('id', $ids)->delete();
        } else {
            $db->where('id', $id)->delete();
        }
        $this->succ(1, '删除成功');
    }

    public function editact()
    {
        $id = input('param.data_id', 0, 'intval');
        $db = new \app\admin\model\TaskData();
        if ($this->request->isPost()) {
            $post = input('post.');
            $post['photos'] = json_encode($post['imgs']);

            $db->allowField(true)->save($post,[
                'id' => $id,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            if (input('param.ac') == 'getClient') {
                $q = input('param.q', '');
                $this->succ(1, '', [
                    'apiData' => [
                        'clientHouse' => $this->getClient($q),
                    ],
                ]);
            } else {
                $dataForm = $db->field('id,addtime', true)->where('id', $id)->find();
                $dataForm['imgs'] = $dataForm['photos'];
                $this->succ(1, '', [
                    'dataForm' => $dataForm,
                ]);
            }
        } else {
            return $this->vue();
        }
    }

}
