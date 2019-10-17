<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\admin\controller;

class CmsHouse extends Base
{
    private $apiData;

    public function initialize()
    {
        parent::initialize();
        $this->apiData = [
            'types' => ['独栋别墅', '公寓', '联排别墅', '土地', '商业地产'],
            'purposes' => ['投资', '教育留学', '购房移民', '自住'],
            'tags' => ['度假/自住房', '房屋托管', '包租', '有优惠', '允许贷款首付低', '总价低'],
            'rooms' => ['1居', '2居', '3居', '4居', '5居', '5居以上'],
            'cattypes' => [
                ['id' => 1, 'name' => '新房'],
                ['id' => 2, 'name' => '二手房'],
                ['id' => 3, 'name' => '土地'],
            ],
        ];
    }

    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = input('param.limit', 20, 'intval');
            $where = [];
            $q = input('param.q', '', 'trim');
            if ($q) $where[] = ['title', 'like', '%' . $q . '%'];
            $db = new \app\admin\model\CmsHouse();
//            $list = $db->where($where)->where('is_down',1)->order(['sort'=>'desc','id'=>'desc'])->paginate($limit);
            $list = $db->where($where)->order(['sort'=>'desc','id'=>'desc'])->paginate($limit);
            $this->succ(1, '', [
                'total' => $list->total(),
                'list' => $list->items(),
                'apiData' => $this->apiData,
            ]);
        } else {
            return $this->vue();
        }
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $db = new \app\admin\model\CmsHouse();
            $post = input('post.');
            $post['addtime'] = time();
            $post['release'] = session('U.id');
            $db->allowField(true)->save($post);
            $this->succ(1, '添加成功');
        } elseif ($this->request->isAjax()) {
            $this->succ(1, '', [
                'apiData' => $this->apiData,
            ]);
        } else {
            return $this->vue();
        }
    }

    public function edit()
    {
        $db = new \app\admin\model\CmsHouse();
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
                'apiData' => $this->apiData,
                'dataForm' => $dataForm
            ]);
        } else {
            return $this->vue();
        }
    }

    public function del()
    {
        $db = new \app\admin\model\CmsHouse();
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

