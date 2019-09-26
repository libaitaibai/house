<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\admin\controller;

class CmsArticle extends Base
{
    private $tag;

    public function initialize()
    {
        parent::initialize();
        $this->tag = ['奥兰多房产资讯', '美国房产资讯', '佛州旅游'];
    }

    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $db = new \app\admin\model\CmsArticle();
            $list = $db->where($where)->order(['sort'=>'desc','id'=>'desc'])->paginate($limit);
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
            $db = new \app\admin\model\CmsArticle();
            $post = input('post.');
            $post['addtime'] = time();
            $post['hits'] = mt_rand(99, 999);
            $db->allowField(true)->save($post);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            $this->succ(1, '', [
                'apiData' => [
                    'tag' => $this->tag
                ]
            ]);
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new \app\admin\model\CmsArticle();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => $id,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->field('id,addtime', true)->where('id', $id)->find();
            $this->succ(1, '', [
                'apiData' => [
                    'tag' => $this->tag
                ],
                'dataForm' => $dataForm
            ]);
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new \app\admin\model\CmsArticle();
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

