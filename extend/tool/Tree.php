<?php
/**
 * Created by Boume.
 * Date: 3/21 0021
 * Time: 13:31
 */

namespace tool;
class Tree
{
    /**
     * 获得数组
     * @param $data
     * @param $title
     * @param string $fieldPri
     * @param string $fieldPid
     * @return array
     */
    public function getTree($data, $title, $fieldPri = 'id', $fieldPid = 'pid')
    {
        if (!is_array($data) || empty($data)) {
            return [];
        }
        $arr = $this->channelList($data, 0, '', $fieldPri, $fieldPid);
        $tmpArr = $arr;
        foreach ($arr as $k => $v) {
            $nexValue = next($tmpArr);
            $str = "";
            if ($v['_level'] > 2) {
                for ($i = 1; $i < $v['_level'] - 1; $i++) {
                    $str .= "│&nbsp;&nbsp;&nbsp;&nbsp;";
                }
            }
            if ($v['_level'] != 1) {
                $t = $title ? $v[$title] : '';
                if ($nexValue && $nexValue['_level'] >= $v['_level']) {
                    $arr[$k]['_' . $title] = $str . "├─ " . $v['_html'] . $t;
                } else {
                    $arr[$k]['_' . $title] = $str . "└─ " . $v['_html'] . $t;
                }
            } else {
                $arr[$k]['_' . $title] = $v[$title];
            }
        }
        $data = [];
        foreach ($arr as $d) {
            $data[] = $d;
        }
        return $data;
    }

    /**
     * 获得栏目列表
     *
     * @param array $arr      栏目数据
     * @param int $pid 操作的栏目
     * @param string $html 栏目名前字符
     * @param string $fieldPri 表主键
     * @param string $fieldPid 父id
     * @param int $level 等级
     *
     * @return array
     */
    public function channelList(
        $arr,
        $pid = 0,
        $html = "&nbsp;",
        $fieldPri = 'cid',
        $fieldPid = 'pid',
        $level = 1
    )
    {
        $pid = is_array($pid) ? $pid : [$pid];
        $data = [];
        foreach ($pid as $id) {
            $res = $this->_channelList(
                $arr,
                $id,
                $html,
                $fieldPri,
                $fieldPid,
                $level
            );
            foreach ($res as $k => $v) {
                $data[$k] = $v;
            }
        }
        if (empty($data)) {
            return $data;
        }
        foreach ($data as $n => $m) {
            if ($m['_level'] == 1) {
                continue;
            }
            $data[$n]['_first'] = false;
            $data[$n]['_end'] = false;
            if (!isset($data[$n - 1])
                || $data[$n - 1]['_level'] != $m['_level']
            ) {
                $data[$n]['_first'] = true;
            }
            if (isset($data[$n + 1])
                && $data[$n]['_level'] > $data[$n + 1]['_level']
            ) {
                $data[$n]['_end'] = true;
            }
        }
        //更新key为栏目主键
        $category = [];
        foreach ($data as $d) {
            $category[$d[$fieldPri]] = $d;
        }
        return $category;
    }

    //只供channelList方法使用
    private function _channelList(
        $data,
        $pid = 0,
        $html = "&nbsp;",
        $fieldPri = 'cid',
        $fieldPid = 'pid',
        $level = 1
    )
    {
        if (empty($data)) {
            return [];
        }
        $arr = [];
        foreach ($data as $v) {
            $id = $v[$fieldPri];
            if ($v[$fieldPid] == $pid) {
                $v['_level'] = $level;
                $v['_html'] = str_repeat($html, $level - 1);
                array_push($arr, $v);
                $tmp = $this->_channelList(
                    $data,
                    $id,
                    $html,
                    $fieldPri,
                    $fieldPid,
                    $level + 1
                );
                $arr = array_merge($arr, $tmp);
            }
        }
        return $arr;
    }

    /**
     * 将数据格式化成树形结构
     * @author Xuefen.Tong
     * @param array $items
     * @return array
     */
    function getTree9($items)
    {
        $tree = array(); //格式化好的树
        foreach ($items as $item)
            if (isset($items[$item['pid']]))
                $items[$item['pid']]['children'][] = &$items[$item['id']];
            else
                $tree[] = &$items[$item['id']];
        return $tree;
    }
}