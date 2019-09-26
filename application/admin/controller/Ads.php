<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\admin\controller;

use app\admin\model\AdsData;

class Ads extends Base
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['name', 'like', '%' . $q . '%'];
            $db = new \app\admin\model\Ads();
            $list = $db->withCount('AdsData')->where($where)->order(['sort' => 'desc', 'id' => 'asc'])->paginate($limit);
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
            $db = new \app\admin\model\Ads();
            $post = input('post.');
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
        $db = new \app\admin\model\Ads();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => $id,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->where('id', $id)->find()->getData();
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
        $db = new \app\admin\model\Ads();
        $id = input('param.id', 0, 'intval');
        if(AdsData::where('aid',$id)->count()) $this->error('广告位不为空');
        $db->where('id', $id)->delete();
        $this->succ(1, '删除成功');
    }

    public function lists()
    {
        $id = input('param.aid', 0, 'intval');
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $aid = input('param.aid', 0, 'intval');
            if($aid) $where[] = ['aid', '=', $aid];
            $db = new AdsData();
            $list = $db->with(['Ads'])->where($where)->order(['sort' => 'desc', 'id' => 'asc'])->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items()
            ]);
        } else {
            $this->assign('ADS', \app\admin\model\Ads::where('id', $id)->find());
            return $this->vue();
        }
    }

    public function lists_add()
    {
        $aid = input('param.aid', 0, 'intval');
        if ($this->request->isPost()) {
            if (\app\admin\model\Ads::where('id', $aid)->count() == 0) $this->error('广告位不存在');
            $db = new AdsData();
            $param = input('param.');
            $db->allowField(true)->save($param);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            if (\app\admin\model\Ads::where('id', $aid)->count() == 0) $this->error('广告位不存在');
            $this->succ(1, '', [
                'apiData' => []
            ]);
        } else {
            return $this->vue();
        }
    }

    public function lists_edit()
    {
        $id = input('param.id', 0, 'intval');
        $db = new AdsData();
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => $id
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->where('id', $id)->find();
            $this->succ(1, '', [
                'apiData' => [],
                'dataForm' => $dataForm,
            ]);
        } else {
            return $this->vue();
        }
    }

    public function lists_del()
    {
        $db = new AdsData();
        $id = input('param.id', 0, 'intval');
        $db->where('id', $id)->delete();
        $this->succ(1, '删除成功');
    }

}

