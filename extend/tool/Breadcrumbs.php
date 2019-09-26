<?php
/**
 * Created by Boume.
 * Date: 7/14 0014
 * Time: 9:11
 */
namespace tool;
class Breadcrumbs
{
    protected $MENU = [];
    protected $CHILD = [];

    public function getMenu($arr,$id)
    {
        if (array_key_exists($id, $arr)) {
            $this->MENU[] = $arr[$id];
            if ($arr[$id]['pid']) {
                $this->getMenu($arr, $arr[$id]['pid']);
            }
        }
        krsort($this->MENU);
        return $this->MENU;
    }

    //获取当前栏目下所有子栏目
    public function getChildIds($arr,$id)
    {
        foreach ($arr as $k=>$v) {
            if ($v['pid'] == $id) {
                $this->CHILD[] = $v['id'];
                $this->getChildIds($arr, $v['id']);
            }
        }
        return $this->CHILD;
    }
}