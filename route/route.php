<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

Route::get('manage', 'admin/index/index');

if(request()->subDomain()=='m'){
    //手机前端
    Route::rule('/','index/mobile/index');
    Route::rule('house_<jg?>_<zy?>_<wy?>_<lx?>_<ws?>','index/mobile/listHouse')->pattern(['jg'=>'.*']);
    Route::rule('house/:id','index/mobile/showHouse');
    Route::rule('agent/:id','index/mobile/showAgent');
    Route::rule('agent','index/mobile/listAgent');
    Route::rule('article_<tag?>','index/mobile/listArticle');
    Route::rule('article/:id','index/mobile/showArticle');
    Route::rule('developer','index/mobile/developerCompany');    //开发商
    Route::rule('butler','index/mobile/butlerCompany');  //管理公司
    Route::rule('decoration','index/mobile/decorationCompany');  //度假屋装修
    Route::rule('decorator/:id','index/mobile/showDecorator');  //装修工人
    Route::rule('decorator','index/mobile/listDecorator');  //装修工人
    Route::rule('about','index/mobile/page?id=36');  //关于我们
    Route::rule('contact','index/mobile/page?id=37');  //联系我们
    Route::rule('orlando', 'index/mobile/orlando_page?id=49');  //奥兰多介绍
    Route::rule('jiejing', 'index/mobile/orlando_page?id=50');  //奥兰多街景

    Route::rule("agents/index/:id",'index/magents/index');
}else{
    //前端
    Route::rule('/','index/index/index');
    Route::rule('house_<jg?>_<zy?>_<wy?>_<lx?>_<ws?>', 'index/index/listHouse')->pattern(['jg' => '.*']);
    Route::rule('house/:id', 'index/index/showHouse');
    Route::rule('agent/:id', 'index/index/showAgent');
    Route::rule('agent', 'index/index/listAgent');
    Route::rule('article_<tag?>', 'index/index/listArticle');
    Route::rule('article/:id', 'index/index/showArticle');
    Route::rule('developer', 'index/index/developerCompany');    //开发商
    Route::rule('butler', 'index/index/butlerCompany');  //管理公司
    Route::rule('decoration', 'index/index/decorationCompany');  //度假屋装修
    Route::rule('decorator/:id', 'index/index/showDecorator');  //装修工人
    Route::rule('decorator', 'index/index/listDecorator');  //装修工人
    Route::rule('about', 'index/index/page?id=36');  //关于我们
    Route::rule('contact', 'index/index/page?id=37');  //联系我们
    Route::rule('orlando', 'index/index/orlando_page?id=49');  //奥兰多介绍
    Route::rule('jiejing', 'index/index/orlando_page?id=50');  //奥兰多街景
}

//API
Route::rule('api/house', 'index/api/listHouse');  //ajax 加载房源


//接口
Route::rule('houseapi','api/applet/index');


return [];
