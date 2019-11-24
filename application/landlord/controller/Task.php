<?php
/**
 * Created by Boume.
 * Date: 1/17 0017
 * Time: 19:23
 */

namespace app\landlord\controller;

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
            $where[] = ['client_id', '=', session('Client.id')];
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
            $where[] = ['client_id', '=', session('Client.id')];
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
            $where[] = ['client_id', '=', session('Client.id')];
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
            $client_id = session('Client.id');

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
                ->where('id', '=', session('Client.id'))
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

    public function email()
    {
        if ($this->request->isPost()) {
            $cdb = new \app\admin\model\Client();
            $Client = $cdb->where([['id','=',session('Client.id')]])->find();
            $body = "客户 :{$Client['name']} 手机号 : {$Client['phone']} 邮箱 : {$Client['email']} ".'<br>';
            $body .= "有一下建议和意见".'<br>';
            $body .= input('content');
            $mail = "info@usahousecenter.com";
            $rst = \tool\Util::sendEmail('客户'.'#'.$mail,['subject'=>'意见与建议','body'=>$body]);
            $this->succ(1, '发送成功!非常感谢你的意见!');
        }else{
            return $this->vue();
        }
    }
}
