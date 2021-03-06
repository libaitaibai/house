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

// 核心中文语言包
return [
    // 系统错误提示
    'Undefined variable'                                        => '未定义变量',
    'Undefined index'                                           => '未定义数组索引',
    'Undefined offset'                                          => '未定义数组下标',
    'Parse error'                                               => '语法解析错误',
    'Type error'                                                => '类型错误',
    'Fatal error'                                               => '致命错误',
    'syntax error'                                              => '语法错误',

    // 框架核心错误提示
    'dispatch type not support'                                 => '不支持的调度类型',
    'method param miss'                                         => '方法参数错误',
    'method not exists'                                         => '方法不存在',
    'function not exists'                                       => '函数不存在',
    'file not exists'                                           => '文件不存在',
    'module not exists'                                         => '模块不存在',
    'controller not exists'                                     => '控制器不存在',
    'class not exists'                                          => '类不存在',
    'property not exists'                                       => '类的属性不存在',
    'template not exists'                                       => '模板文件不存在',
    'illegal controller name'                                   => '非法的控制器名称',
    'illegal action name'                                       => '非法的操作名称',
    'url suffix deny'                                           => '禁止的URL后缀访问',
    'Route Not Found'                                           => '当前访问路由未定义或不匹配',
    'Undefined db type'                                         => '未定义数据库类型',
    'variable type error'                                       => '变量类型错误',
    'PSR-4 error'                                               => 'PSR-4 规范错误',
    'not support total'                                         => '简洁模式下不能获取数据总数',
    'not support last'                                          => '简洁模式下不能获取最后一页',
    'error session handler'                                     => '错误的SESSION处理器类',
    'not allow php tag'                                         => '模板不允许使用PHP语法',
    'not support'                                               => '不支持',
    'redisd master'                                             => 'Redisd 主服务器错误',
    'redisd slave'                                              => 'Redisd 从服务器错误',
    'must run at sae'                                           => '必须在SAE运行',
    'memcache init error'                                       => '未开通Memcache服务，请在SAE管理平台初始化Memcache服务',
    'KVDB init error'                                           => '没有初始化KVDB，请在SAE管理平台初始化KVDB服务',
    'fields not exists'                                         => '数据表字段不存在',
    'where express error'                                       => '查询表达式错误',
    'order express error'                                       => '排序表达式错误',
    'no data to update'                                         => '没有任何数据需要更新',
    'miss data to insert'                                       => '缺少需要写入的数据',
    'not support data'                                          => '不支持的数据表达式',
    'miss complex primary data'                                 => '缺少复合主键数据',
    'miss update condition'                                     => '缺少更新条件',
    'model data Not Found'                                      => '模型数据不存在',
    'table data not Found'                                      => '表数据不存在',
    'delete without condition'                                  => '没有条件不会执行删除操作',
    'miss relation data'                                        => '缺少关联表数据',
    'tag attr must'                                             => '模板标签属性必须',
    'tag error'                                                 => '模板标签错误',
    'cache write error'                                         => '缓存写入失败',
    'sae mc write error'                                        => 'SAE mc 写入错误',
    'route name not exists'                                     => '路由标识不存在（或参数不够）',
    'invalid request'                                           => '非法请求',
    'bind attr has exists'                                      => '模型的属性已经存在',
    'relation data not exists'                                  => '关联数据不存在',
    'relation not support'                                      => '关联不支持',
    'chunk not support order'                                   => 'Chunk不支持调用order方法',
    'route pattern error'                                       => '路由变量规则定义错误',
    'route behavior will not support'                           => '路由行为废弃（使用中间件替代）',
    'closure not support cache(true)'                           => '使用闭包查询不支持cache(true)，请指定缓存Key',

    // 上传错误信息
    'unknown upload error'                                      => '未知上传错误！',
    'file write error'                                          => '文件写入失败！',
    'upload temp dir not found'                                 => '找不到临时文件夹！',
    'no file to uploaded'                                       => '没有文件被上传！',
    'only the portion of file is uploaded'                      => '文件只有部分被上传！',
    'upload File size exceeds the maximum value'                => '上传文件大小超过了最大值！',
    'upload write error'                                        => '文件上传保存错误！',
    'has the same filename: {:filename}'                        => '存在同名文件：{:filename}',
    'upload illegal files'                                      => '非法上传文件',
    'illegal image files'                                       => '非法图片文件',
    'extensions to upload is not allowed'                       => '上传文件后缀不允许',
    'mimetype to upload is not allowed'                         => '上传文件MIME类型不允许！',
    'filesize not match'                                        => '上传文件大小不符！',
    'directory {:path} creation failed'                         => '目录 {:path} 创建失败！',

    'The middleware must return Response instance'              => '中间件方法必须返回Response对象实例',
    'The queue was exhausted, with no response returned'        => '中间件队列为空',
    // Validate Error Message
    ':attribute require'                                        => ':attribute不能为空',
    ':attribute must'                                           => ':attribute必须',
    ':attribute must be numeric'                                => ':attribute必须是数字',
    ':attribute must be integer'                                => ':attribute必须是整数',
    ':attribute must be float'                                  => ':attribute必须是浮点数',
    ':attribute must be bool'                                   => ':attribute必须是布尔值',
    ':attribute not a valid email address'                      => ':attribute格式不符',
    ':attribute not a valid mobile'                             => ':attribute格式不符',
    ':attribute must be a array'                                => ':attribute必须是数组',
    ':attribute must be yes,on or 1'                            => ':attribute必须是yes、on或者1',
    ':attribute not a valid datetime'                           => ':attribute不是一个有效的日期或时间格式',
    ':attribute not a valid file'                               => ':attribute不是有效的上传文件',
    ':attribute not a valid image'                              => ':attribute不是有效的图像文件',
    ':attribute must be alpha'                                  => ':attribute只能是字母',
    ':attribute must be alpha-numeric'                          => ':attribute只能是字母和数字',
    ':attribute must be alpha-numeric, dash, underscore'        => ':attribute只能是字母、数字和下划线_及破折号-',
    ':attribute not a valid domain or ip'                       => ':attribute不是有效的域名或者IP',
    ':attribute must be chinese'                                => ':attribute只能是汉字',
    ':attribute must be chinese or alpha'                       => ':attribute只能是汉字、字母',
    ':attribute must be chinese,alpha-numeric'                  => ':attribute只能是汉字、字母和数字',
    ':attribute must be chinese,alpha-numeric,underscore, dash' => ':attribute只能是汉字、字母、数字和下划线_及破折号-',
    ':attribute not a valid url'                                => ':attribute不是有效的URL地址',
    ':attribute not a valid ip'                                 => ':attribute不是有效的IP地址',
    ':attribute must be dateFormat of :rule'                    => ':attribute必须使用日期格式 :rule',
    ':attribute must be in :rule'                               => ':attribute必须在 :rule 范围内',
    ':attribute be notin :rule'                                 => ':attribute不能在 :rule 范围内',
    ':attribute must between :1 - :2'                           => ':attribute只能在 :1 - :2 之间',
    ':attribute not between :1 - :2'                            => ':attribute不能在 :1 - :2 之间',
    'size of :attribute must be :rule'                          => ':attribute长度不符合要求 :rule',
    'max size of :attribute must be :rule'                      => ':attribute长度不能超过 :rule',
    'min size of :attribute must be :rule'                      => ':attribute长度不能小于 :rule',
    ':attribute cannot be less than :rule'                      => ':attribute日期不能小于 :rule',
    ':attribute cannot exceed :rule'                            => ':attribute日期不能超过 :rule',
    ':attribute not within :rule'                               => '不在有效期内 :rule',
    'access IP is not allowed'                                  => '不允许的IP访问',
    'access IP denied'                                          => '禁止的IP访问',
    ':attribute out of accord with :2'                          => ':attribute和确认字段:2不一致',
    ':attribute cannot be same with :2'                         => ':attribute和比较字段:2不能相同',
    ':attribute must greater than or equal :rule'               => ':attribute必须大于等于 :rule',
    ':attribute must greater than :rule'                        => ':attribute必须大于 :rule',
    ':attribute must less than or equal :rule'                  => ':attribute必须小于等于 :rule',
    ':attribute must less than :rule'                           => ':attribute必须小于 :rule',
    ':attribute must equal :rule'                               => ':attribute必须等于 :rule',
    ':attribute has exists'                                     => ':attribute已存在',
    ':attribute not conform to the rules'                       => ':attribute不符合指定规则',
    'invalid Request method'                                    => '无效的请求类型',
    'invalid token'                                             => '令牌数据无效',
    'not conform to the rules'                                  => '规则错误',

    'home'     => '首页',
    'SelectedHouses'    => '精选房源',
    'NewHousingSources' => '奥兰多新房源',
    'SecondhandhHousing' => '奥兰多二手房源',
    'Landinvestment' => '土地投资',
    'Estatemanager' => '房产经纪',
    'Housingmanagement' => '房屋管理',
    'Housedecoration' => '房屋装修',
    'DecorationofHolidayHouse' => '度假屋装修',
    'Decorator' => '装修工人',
    'Realestateinformation' => '房产资讯',
    'Lifeassistant' => '奥兰多生活助手',
    'Briefintroduction' => '奥兰多介绍',
    'StreetView' => '奥兰多街景',
    'AmericanDeveloper' => '美国开发商',
    'Aboutus' => '关于我们',
    'Contactus'=>'联系我们',
    'Reliable' => '靠谱',
    'Consultantsserveonetoonetomaximizeyourbenefits' => '顾问一对一服务最大化保障您的利益',
    'Reallistings' => '真实房源',
    'Licensedbrokersrecommendhousingsources' => '执照经纪人推荐房源',
    'Professionalteam' => '专业团队',
    'RealtimeConsultingLicensedBroker' => '实时咨询执照经纪人',
    'Realestatemanagement' => '房产管理',
    'Onestoptrusteeshipdoesnotbotherwiththetrivialityofrentingandsellinghouses' => '一站式托管不在为租房卖房琐事烦心',
    'Licensedbrokersselectcarefullyforyou' => '执照经纪人为您精挑细选',
    'tenthousand' => '万',
    'rise' => '起',
    'Increasesinthelastyear' => '最近一年涨幅',
    'Averagerentalincome' => '平均租金收益',
    'RecommendationBroker' => '推荐经纪人',
    'USLicensedBrokerSeniorHousingManagementExperttoprovideyouwithprofessionalservices' => '美国执照经纪人，资深房源管理专家，为您提供专业服务',
    'Checkoutmorehousingsources' => '查看更多房源',
    'Sweepaway' => '微信扫一扫',
    'CheckBrokers' => '查看经纪人',
    'LifetourismimmigrationeducationetcYouwanttoknowthereare' => '生活、旅游、移民、教育等你想知道的，这里都有',
    'Viewmoreinformation' => '查看更多资讯',
    'Userevaluation' => '用户评价',
    'Purchaseprocess' => '购房流程',
    'OnestopOverseasHomeEstateCompanyescortsyou' => '一站式海外置业为您保驾护航',
    'Cooperativebrand' => '合作品牌',
    "Realestatesearch" => '房产搜索',
    "Friendshiplink" => "友情链接",
    "More" => "更多",
    "Wechatapplet" => "微信小程序",
    "Pleaseenterthenameofthehouse" => "请输入房产名称",
    "all" => "全部",
    "ResetFilter" => "重置条件",
    "Downpaymentratio" => "首付比例",
    "Downpayments" => "首付",
    "Wechatscanner" => "微信扫码",
    "Focusonprojectdynamics" => "关注项目动态",
    "Agent" => "经纪人",
    "Licensenumber" => "执照号",
    "Telephone" => "电话",
    "mailbox" => "邮箱",
    "temperature" => "热度",
    "AmericanHousingManagementCompany" => "美国房屋管理公司",
    "Jobnumber" => "工号",
    "Goodat" => "擅长",
    "Monthlysupply" => "月供",
    "Projectaddress" => "项目地址",
    "Map" => "地图",
    "Mainunit" => "主力户型",
    "WechatAddingRealEstateBroker" => "微信添加房产经纪人",
    "Quicklylockinpreferentialactivitiesandinvestmentprograms" => "快人一步锁定优惠活动和投资方案",
    "WechatAddingBroker" => "微信添加经纪人",
    "ClickonCopyMicrosignal" => "点击复制微信号",
    "Landlordlogin" => "房东登录",
    "Navigation" => "导航",
    "currentlocation" => "当前位置",
    "Houseproperty" => "房产",
    "Landlordlogin" => "房东登录",
    "Recommendagoodroom" => "推荐好房",
    "screen" => "筛选",
    "clear" => "清除",
    "Determine" => "确定",
    "Housingpricesinthepastyear" => "近一年房价",
    "Read" => "阅读",
    "Totalprice" => "总价",
    "Basicinformation" => "基础信息",
    "Property" => "物业",
    "Renovation" => "装修",
    "Type" => "类型",
    "Propertyright" => "产权",
    "Handinhand" => "交房",
    "Apartment" => "户型",
    "address" => "地址",
    "detailedinformation" => "详细信息",
    "OrlandoHouseproperty"=>"奥兰多房产",
    "noData"=>"暂无数据",
    'NewHousingSourcess' => '奥兰多新房源',
    'SecondhandhHousings' => '奥兰多二手房源',
    'Landinvestments' => '奥兰多土地投资',
    'OrlandoRealestateinformation'=>'奥兰多房产资讯',
    'AmericanRealestateinformation'=>'美国房产资讯',
    'Travelinformation'=>'旅游资讯',
    'Contact'=>'联系方式',
    'Close'=>'关闭',
    'Longpresstoadd'=>'长按添加微信',
    'Recommend'=>'推荐',
    'Searchhousingsources'=>'搜索房源',
    'Invest' => '投资',
    'Educationabroad'=>'教育留学',
    'Housingemigration'=>'购房移民',
    'Selfresidence'=> '自住',
    'Totalhouseprice'=>'房屋总价',
    'Homepurchasepurpose' => '置业目的',
    'Propertytype'=>'物业类型',
    'Detachedvilla'=>'独栋别墅',
    'Townhouse'=>'联排别墅',
    'Land'=>'土地',
    'Commercialestate'=>'商业地产',
    'Housingtype'=>'房源类型',
    'Newhouse'=>'新房',
    'Secondhandhouse'=>'二手房',
    'Numberofbedrooms'=>'卧室数量',
    'Pulluptoloadmore'=>'上拉加载更多',
    'Loading'=>'加载中',
    'BetterHouse'=>'推荐好房',
    'Choosy'=>'执照经纪人为您精挑细选',
    'OrlRealestate'=>'奥兰多房产资讯',
    'UsaRealestate'=>'美国房产资讯',
    'Travelinfo'=>'旅游资讯'


























];
