<?php
/**
 * Created by Boume.
 * Date: 1/8 0008
 * Time: 22:26
 */

namespace app\agent_admin\controller;

use app\agent_admin\model\Agent;

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
            $db = new \app\agent_admin\model\CmsHouse();
            $list = $db->where($where)->where('release', $this->aid)->order(['sort' => 'desc', 'id' => 'desc'])->paginate($limit);
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
            $db = new \app\agent_admin\model\CmsHouse();
            $post = input('post.');
            $post['addtime'] = time();
            $post['release'] = $this->aid;
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
        $db = new \app\agent_admin\model\CmsHouse();
        $id = input('param.id', 0, 'intval');
        if ($this->request->isPost()) {
            $post = input('post.');
            $db->allowField(true)->save($post, [
                'id' => $id,
                'release' => $this->aid,
            ]);
            $this->succ(1, '修改成功');
        } elseif ($this->request->isAjax()) {
            $dataForm = $db->field('id,addtime', true)->where('id', $id)->where('release', $this->aid)->find();
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
        $db = new \app\agent_admin\model\CmsHouse();
        $id = input('param.id', 0, 'intval');
        $ids = input('param.ids', []);
        if (!empty($ids)) {
            $db->whereIn('id', $ids)->where('release', $this->aid)->delete();
        } else {
            $db->where('id', $id)->where('release', $this->aid)->delete();
        }
        $this->succ(1, '删除成功');
    }


    public function sendmail()
    {
        $ids = input('param.ids', []);
        $mail = input('param.mail', []);
        $db = new \app\agent_admin\model\CmsHouse();

        $data = $db->whereIn('id', $ids)->where('release', $this->aid)->select()->toArray();
        $Agent = Agent::find(['id'=>$this->aid]);

        $body = '您专注的房子有更新欢迎查看 '."<br>";
        foreach ($data as $val){
            $body .= $val['title']."<br>";
        }
        $body .= "来自 {$Agent['name']} 手机号 : {$Agent['phone']} 联系邮箱 :{$Agent['email']}";
        $rst = \tool\Util::sendEmail('尊敬的客户'.'#'.$mail,['subject'=>'房产通知','body'=>$body]);
        $this->succ(1, '发送成功!');
    }
}

