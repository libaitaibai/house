<?php
/**
 * Created by Boume.
 * Date: 1/17 0017
 * Time: 19:23
 */

namespace app\admin\controller;

use app\admin\model\House;
use app\admin\model\TaskData;
use app\admin\model\Worker;
use app\admin\model\Client;

class Task extends Base
{
    public function runing()
    {
        if ($this->request->isAjax()) {
            $db = new \app\admin\model\Task();
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
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
            $limit = input('param.limit', 20, 'intval');
            $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->where('status',0)->order('id', 'desc')->paginate($limit);
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
            $where = [];
            $limit = input('param.limit', 20, 'intval');

            $house_id = input('param.house_id', 0, 'intval');
            if($house_id) $where[] = ['house_id', '=', $house_id];

            $client_id = input('param.client_id', 0, 'intval');
            if($client_id) $where[] = ['client_id', '=', $client_id];

            $worker_id = input('param.worker_id', 0, 'intval');
            if($worker_id) $where[] = ['worker_id', '=', $worker_id];

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

    public function add()
    {
        if ($this->request->isPost()) {
            $post = input('post.');
            $post['addtime'] = time();
            $db = new \app\admin\model\Task();
            if (empty($post['house_id'])) $post['status'] = 0;
            if ($post['type'] == 1) $post['num'] = 0;
            if ($post['type'] == 2) $post['task_date'] = 0;
            if(isset($post['task_date'])){
                $dir = strpos($post['task_date'],'T');
                if($dir){
                    $post['task_date'] = substr($post['task_date'],0,strpos($post['task_date'],'T',$dir));
                }else{
                    $post['task_date'] = date('Y-m-d');
                }
            }

            //获取经纪人ID,客户ID
            if (!empty($post['house_id'])) {
                $houseDb = new House();
                $house = $houseDb->where('id', $post['house_id'])->find();
                if (!empty($house)) {
                    $post['agent_id'] = $house['agent_id'];
                    $post['client_id'] = $house['client_id'];
                }
            }

            if($post['worker_id']){
                $worker = (new Worker())->where('id', $post['worker_id'])->find();
                $body = '您有新的任务待领取!任务名称 : '.$post['title'].'.任务内容:'.$post['description'];
                $rst = \tool\Util::sendEmail($worker['name'].'#'.$worker['email'],['subject'=>'任务通知','body'=>$body]);
            }


            $db->allowField(true)->save($post);
            $this->succ(1, '任务添加成功');
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
            if(isset($post['task_date'])){
                $dir = strpos($post['task_date'],'T');
                if($dir){
                    $post['task_date'] = substr($post['task_date'],0,strpos($post['task_date'],'T',$dir));
                }else{
                    $post['task_date'] = date('Y-m-d');
                }
            }
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
                ->whereOr('name', 'like', '%' . $q . '%')
                ->whereOr('username', 'like', '%' . $q . '%')
                ->whereOr('phone', 'like', '%' . $q . '%')
                ->whereOr('email', 'like', '%' . $q . '%')
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

}
