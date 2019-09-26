<?php
// 应用公共文件
function thumb($path, $w = 150, $h = 150)
{
    $info = explode('/', $path);
    if(empty($info[2])) return $path;
    $file = $info[2] . '/' . md5($path . $w . $h);
    $root_path = \think\facade\Env::get('root_path');
    $thumbPath = '/' . $info[1] . '/' . $file . '.jpg';
    if (file_exists($root_path . '/public' . $path)) {
        if (!file_exists($thumbPath)) {
            $image = \think\Image::open($root_path . '/public' . $path);
            $image->thumb($w, $h, \think\Image::THUMB_CENTER)->save($root_path . '/public/' . $info[1] . '/' . $file . '.jpg');
        }
        return $thumbPath;
    }
    return $path;
}