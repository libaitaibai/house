<?php
/**
 * Created by Boume.
 * Date: 2019/4/13
 * Time: 8:39
 */

namespace app\common\command;

use GuzzleHttp\Client;
use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;
use think\facade\Env;

class Handle extends Command
{
    protected function configure()
    {
        $this->setName('handle')
            ->setDescription('采集realtor数据');
    }

    protected function execute(Input $input, Output $output)
    {
        $this->downImg($output);
    }

    protected function downImg($output)
    {
        $info = db('cms_house')->where('is_down', 0)->find();
        $url = 'https://www.realtor.com/property-overview/' . $info['from_id'];
        $dir = Env::get('root_path') . 'public/mls/' . $info['from_id'] . '/';
        if (!is_dir($dir)) {
            mkdir($dir, 0777, true);
            chmod($dir, 0777);
        }

        //获取json数据
        $client = new Client([
            'http_errors' => false,
            'verify' => false,
        ]);
        $res = $client->request('GET', $url);
        $resData = json_decode((string)$res->getBody(), true);
        $output->writeln("正在处理" . $info['from_id'] . ' 共 ' . count($resData['property']['photos']) . ' 张图片');
        $data = [];
        $data['realtor'] = $resData['property'];
        foreach ($resData['property']['photos'] as $k => $v) {
            $client = new Client([
                'http_errors' => false,
                'verify' => false,
            ]);
            $img = str_replace('w640_h480', 'w1020_h770', $v['url']);
            $client->request('GET', $img, [
                'save_to' => $dir . md5($img) . '.jpg',
            ]);
            $output->writeln('  ├─ 第' . ($k + 1) . '张图片下载成功');
            $data['photo'][] = [
                'uid' => microtime(true) * 1000,
                'url' => '/mls/' . $info['from_id'] . '/' . md5($img) . '.jpg',
            ];
        }

        $types = [
            'condo' => ['公寓', '联排别墅'],
            'single_family' => ['独栋别墅'],
            'multi_family' => ['多家庭房屋'],
            'mobile' => ['移动房屋'],
            'land' => ['土地'],
        ];

        if (empty($data['realtor']['lot_size'])) $data['realtor']['lot_size'] = $data['realtor']['sqft'];

        $data['title'] = '奥兰多房产 | ' . $data['realtor']['beds'] . '卧' . $data['realtor']['baths'] . '卫 ' . floor($data['realtor']['sqft'] * 0.092903) . '平方米';
        $data['sub_title'] = floor($data['realtor']['sqft'] * 0.092903) . '平方米 占地' . round($data['realtor']['lot_size'] * 0.092903, 1) . '平方米';
        $data['thumb'] = $data['photo'][0]['url'];
        $data['price'] = round($data['realtor']['price'] / 10000, 2);
        $data['rent'] = '8.3%';
        $data['gain'] = '8.9%';
        $data['payment'] = '20%';
        if (!empty($data['realtor']['type'])) {
            if ($data['realtor']['type'] == 'land') {
                $data['cattype'] = 3;
                $data['title'] = '美国奥兰多土地投资 | 占地' . $data['realtor']['lot_size_display'] . '英亩 ' . floor($data['realtor']['lot_size'] * 0.092903) . '平方米';
                $data['sub_title'] = '';
            }
            $data['type'] = empty($types[$data['realtor']['type']]) ? [] : $types[$data['realtor']['type']];
        } else {
            $data['type'] = [];
        }
        $data['purpose'] = ['投资'];
        $data['tag'] = [];
        $data['decoration'] = '';
        $data['property'] = '永久产权';
        $data['builddate'] = $data['realtor']['year_built'];
        $data['address'] = $data['realtor']['full_address_display'];
        $data['huxing'] = $data['realtor']['beds'] . '卧' . $data['realtor']['baths'] . '卫';
        $data['room'] = [$data['realtor']['beds'] . '居'];
        //百度翻译
        $client = new Client([
            'http_errors' => false,
            'verify' => false,
        ]);
        $fyRes = $client->request('GET', 'https://fanyi.baidu.com/transapi?from=auto&to=zh&query=' . urlencode($data['realtor']['description']));
        $fyData = json_decode((string)$fyRes->getBody(), true);
        $content = $data['realtor']['description'];
        if (!empty($fyData['data'][0]['dst'])) $content = $fyData['data'][0]['dst'];
        $data['content'] = $content;
        $data['addtime'] = time();
        $data['is_down'] = 1;
        $data['show'] = 1;

        //翻译
        foreach ($data['realtor']['features'] as $k => $v) {
            foreach ($v as $kk=>$vv) {
                if ($kk != 'photos') {
                    $client = new Client([
                        'http_errors' => false,
                        'verify' => false,
                    ]);
                    $fyRes = $client->request('GET', 'https://fanyi.baidu.com/transapi?from=auto&to=zh&query=' . urlencode($kk));
                    $fyData = json_decode((string)$fyRes->getBody(), true);
                    if (!empty($fyData['data'][0]['dst'])) $kk = $fyData['data'][0]['dst'];
                    $data['realtor']['features_zh'][$k][$kk] = [];
                    foreach ($vv as $kkk => $vvv) {
                        $client = new Client([
                            'http_errors' => false,
                            'verify' => false,
                        ]);
                        $fyRes = $client->request('GET', 'https://fanyi.baidu.com/transapi?from=auto&to=zh&query=' . urlencode($vvv));
                        $fyData = json_decode((string)$fyRes->getBody(), true);
                        if (!empty($fyData['data'][0]['dst'])) $vvv = $fyData['data'][0]['dst'];
                        $data['realtor']['features_zh'][$k][$kk][$kkk] = $vvv;
                    }
                }
            }
        }

        foreach ($data as $k => $v) {
            if (is_array($v)) $data[$k] = json_encode($v, JSON_UNESCAPED_UNICODE);
        }
        db('cms_house')->strict(false)->where('id', $info['id'])->update($data);
//        $this->downImg($output);
    }

}