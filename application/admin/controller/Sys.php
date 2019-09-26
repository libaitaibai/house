<?php
/**
 * Created by Boume.
 * Date: 2019/1/23
 * Time: 10:07
 */

namespace app\admin\controller;

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
        $data['form'] = $ql->find('.profile_nickname')->text();
        $content = $ql->find('#js_content')->html();
        $data['content'] = preg_replace('/<img(.*?)data-src="(.*?)"(.*?)>/i', '<img style="max-width: 100%;" src="$2" />', $content);
        $data['content'] = preg_replace('/<iframe(.*?)data-src="(.*?)"(.*?)>/i', '<iframe style="max-width: 100%;width: 800px;height: 400px;" src="$2" />', $data['content']);
        $data['content'] = preg_replace('/width=(.*?)/i', '', $data['content']);
        $data['content'] = preg_replace('/height=(.*?)/i', '', $data['content']);

        preg_match_all('/var msg_cdn_url = "(.*?)";/', $ql->getHtml(), $tmp);
        empty($tmp[1][0]) ? $data['thumb'] = '' : $data['thumb'] = $tmp[1][0];

        preg_match_all('/var round_head_img = "(.*?)";/', $ql->getHtml(), $tmp);
        empty($tmp[1][0]) ? $data['logo'] = '' : $data['logo'] = $tmp[1][0];

        preg_match_all('/var msg_desc = "(.*?)";/', $ql->getHtml(), $tmp);
        empty($tmp[1][0]) ? $data['description'] = '' : $data['description'] = $tmp[1][0];

        $tagArr = ['奥兰多房产平台', '奥兰多房地产网', '奥兰多房产投资', '奥兰多房地产投资', '奥兰多房地产信息', '奥兰多房产', '美国奥兰多房产投资置业', '奥兰多房产资讯', '麒麟美国房产', '奥兰多房产在线', '美国奥兰多房产我爱我家海外', '美国佛州房产在线'];
        if (in_array($data['form'], $tagArr)) {
            $data['tag'] = ['奥兰多房产资讯'];
        }

        $tagArr = ['Zillow'];
        if (in_array($data['form'], $tagArr)) {
            $data['tag'] = ['美国房产资讯'];
        }

        $tagArr = ['佛罗里达旅游局'];
        if (in_array($data['form'], $tagArr)) {
            $data['tag'] = ['佛州旅游'];
        }

        $this->succ(1, '', $data);
    }
}