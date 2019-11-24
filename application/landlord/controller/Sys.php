<?php
/**
 * Created by Boume.
 * Date: 2019/1/23
 * Time: 10:07
 */

namespace app\landlord\controller;

use QL\QueryList;
use think\facade\Env;

class Sys extends Base
{
    public function upImg()
    {
        $file = request()->file('file');
        $info = $file->move(Env::get('root_path') . 'public/uploads');
        if ($info) {
            return json([
                'code' => 1,
                'msg' => '上传成功',
                'data' => [
                    'path' => '/uploads/' . str_replace('\\', '/', $info->getSaveName()),
                    'filed' => input('param.filed', ''),
                ]
            ]);
        } else {
            return json([
                'code' => 0,
                'msg' => $file->getError()
            ]);
        }
    }

    public function upEditorImg()
    {
        $files = request()->file('file');
        $img = [];
        foreach ($files as $file) {
            $info = $file->move(Env::get('root_path') . 'public/uploads');
            if ($info) {
                $img[] = '/uploads/' . str_replace('\\', '/', $info->getSaveName());
            }
        }
        return json([
            'errno' => 0,
            'data' => $img
        ]);
    }

    //获取微信文章
    public function getWechatArticle()
    {
        $url = input('param.url', '');
        if ($url == '') $this->error('URL地址不正确');
        $ql = QueryList::get($url);
        $data = [];
        $data['title'] = $ql->find('#activity-name')->text();
        $content = $ql->find('#js_content')->html();
        $data['content'] = preg_replace('/<img(.*?)data-src="(.*?)"(.*?)>/i', '<img style="max-width: 100%;" src="$2" />', $content);
        $data['content'] = preg_replace('/<iframe(.*?)data-src="(.*?)"(.*?)>/i', '<iframe style="max-width: 100%;width: 800px;height: 400px;" src="$2" />', $data['content']);
        $data['content'] = preg_replace('/width=(.*?)/i', '', $data['content']);
        $data['content'] = preg_replace('/height=(.*?)/i', '', $data['content']);

        preg_match_all('/var msg_cdn_url = "(.*?)";/', $ql->getHtml(), $tmp);
        empty($tmp[1][0]) ? $data['thumb'] = '' : $data['thumb'] = $tmp[1][0];
        $this->succ(1, '', $data);
    }
}
