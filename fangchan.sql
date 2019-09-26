-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 年 09 月 24 日 13:25
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `fangchan`
--

-- --------------------------------------------------------

--
-- 表的结构 `boume_admin`
--

CREATE TABLE IF NOT EXISTS `boume_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int(10) DEFAULT '0' COMMENT '角色ID',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `edit_password_time` int(10) DEFAULT NULL COMMENT '密码修改时间',
  `lock` tinyint(1) DEFAULT '0' COMMENT '锁定',
  `lock_msg` varchar(255) DEFAULT NULL COMMENT '锁定原因',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `boume_admin`
--

INSERT INTO `boume_admin` (`id`, `username`, `password`, `role_id`, `name`, `mobile`, `addtime`, `edit_password_time`, `lock`, `lock_msg`) VALUES
(1, 'admin', '/MYU9VZ1YBmcCcba6GHWiw==', 1, '系统创始人', '18070935901', 1525049997, 1533729161, 0, ''),
(2, 'boume', 'vph4JOziAop3sZpLRoxUQw==', 1, '系统维护员', '18070935901', 1547724184, 1547724184, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `boume_ads`
--

CREATE TABLE IF NOT EXISTS `boume_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `boume_ads`
--

INSERT INTO `boume_ads` (`id`, `name`, `description`, `sort`) VALUES
(1, '首页banner', NULL, 0),
(2, '用户评价', NULL, 0),
(3, '合作品牌', NULL, 0),
(4, '底部信息', NULL, 0),
(5, '底部二维码', NULL, 0),
(6, '友情链接', NULL, 0),
(7, '底部版权', NULL, 0),
(8, '美国房地产开发商', NULL, 0),
(9, '美国房屋管理公司', NULL, 0),
(10, '美国度假屋装修公司', NULL, 0),
(11, '关于我们 单页', NULL, 0),
(12, '手机首页banner', NULL, 0),
(13, '手机底部联系信息', NULL, 0),
(14, '手机拨打电话', NULL, 0),
(15, '手机版微信客服', NULL, 0),
(16, '奥兰多生活助手', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `boume_ads_data`
--

CREATE TABLE IF NOT EXISTS `boume_ads_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `code` mediumtext,
  `thumb` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `sort` int(10) DEFAULT '0',
  `imgs` mediumtext,
  `show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `boume_ads_data`
--

INSERT INTO `boume_ads_data` (`id`, `aid`, `title`, `url`, `code`, `thumb`, `content`, `sort`, `imgs`, `show`) VALUES
(1, 1, '奥兰多置业', NULL, NULL, '/uploads/20190212/02ff892f8b85894af8780e3a7e50fb34.jpg', NULL, 0, '[]', 1),
(2, 1, '奥兰多介绍', NULL, NULL, '/uploads/20190212/ae2c74830b434467b5c25a8bdff4b4f9.jpg', NULL, 0, '[]', 1),
(3, 2, '常女士', NULL, NULL, '/uploads/20190212/63007170f23032255bd1ac2c903bf2f2.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">因为是首次海外投资，很多细节都不清楚，非常感谢顾问赵子建的细心的讲解和周到的服务，让我在奥兰多成功买到了第一套房，如果不是听了小赵的建议，光汇率差我就要损失很多钱，非常感谢！</premicrosoft><br></p>', 0, '[]', 1),
(4, 2, '张女士', NULL, NULL, '/uploads/20190212/bd4bb6328a287b965a8eca4612f58b8c.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">听朋友提到奥兰多市场最近不错，同时朋友推荐了这个平台<spanconsolas'';">。很专业。给了很多建议，并根据我的预算和需求给推荐了<spanconsolas'';">项目同时还有独家优惠，很感谢。</spanconsolas'';"></spanconsolas'';"></premicrosoft><br></p>', 0, '[]', 1),
(5, 2, '赖先生', NULL, NULL, '/uploads/20190212/ba194809c90b6a9b2adba33ad5eea378.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">我一直看好奥兰多的未来发展，想做些投资，身边也有不少朋友在奥兰多投资了房产，置业顾问小苏非常专业，每个过程服务的非常耐心仔细，售后还有专人负责一直跟进，整个购房体验非常棒！</premicrosoft><br></p>', 0, '[]', 1),
(16, 3, 'ParkSquareHomes', 'http://parksquarehomes.cn/', '', '/uploads/20190317/73dd7b76c727e9a8804ddb4c96a67914.png', NULL, 0, '[]', 1),
(6, 2, '曾先生', NULL, NULL, '/uploads/20190212/ec34bf186d7c2f4c4b03ee717ef7026e.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">奥兰多的房产是我一直在关注的，看到网站新上线的项目非常好，就立即预订了，之后的选房购房流程都非常顺利快捷，给人一种很专业很可靠的感觉。感谢平台能提供这么好的海外置业服务！</premicrosoft><br></p>', 0, '[]', 1),
(7, 2, '周女士', NULL, NULL, '/uploads/20190212/8d488142659d1621d12dab51bb3fc37e.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">非常感谢顾问的专业耐心推荐，特别是石顾问，因为我比较挑剔，石顾问从交通，建筑商，户型图，项目前景，预期收益等均进行详细介绍，让我对于整个项目有了深入了解，非常贴心</premicrosoft><br></p>', 0, '[]', 1),
(8, 2, '张女士', NULL, NULL, '/uploads/20190212/792205031cb3f6f9df34dc0897923f88.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">非常感谢置业顾问石力专业的推荐，让我买了奥兰多的房产，很细心的给我讲解国家的人口，土地，和房产投资环境，同时详细告知我购买流程，如何付款，总之非常贴心！</premicrosoft><br></p>', 0, '[]', 1),
(9, 2, '金霞', NULL, NULL, '/uploads/20190212/f2d1252d2963a3ea7967a136b39a52fd.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">置业顾问张女士介绍的很详细，为服务点个赞，作为购房者，良心商家（之前购买了两套，忘记复购的奖励，但在付完首付后，还是提醒客人，给到了复购的返现）</premicrosoft><br></p>', 0, '[]', 1),
(10, 2, '董先生', NULL, NULL, '/uploads/20190212/6930c9f16b339734b10c7e61a89e53f6.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">感谢置业顾问周小姐的热心服务，买了奥兰多房产，中间因故换了两次房，周小姐不厌其烦，终于换到了我满意的房型，任劳任怨，没有一句怨言，对此非常感动！</premicrosoft><br></p>', 0, '[]', 1),
(11, 2, '苏先生', NULL, NULL, '/uploads/20190212/c5393b805394b3921c229098c6bcf2fb.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">去过实际考察非常满意，感谢专业顾问帮助我跟开发商对接所有的事宜，这是一次非常顺心以及简单的购房体验。对于买房之前我没有想象过会这么简单，到后期的这些流程看得出来，是非常用心，细心完善每一步。希望越来越好，也让我们购买海外房产的客人们享受到更多更优质的服务。</premicrosoft><br></p>', 0, '[]', 1),
(12, 2, '杨先生', NULL, NULL, '/uploads/20190212/c9dc28bb94a35b66354e1db66f73d33a.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">很感谢顾问给我一步步引导，耐心讲解项目细节和支付等问题，还有售后小姑娘的细心指导支付，赞！</premicrosoft><br></p>', 0, NULL, 1),
(13, 2, '李先生', NULL, NULL, '/uploads/20190212/8c5f883a579fed8fcc21870f7f5636eb.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">非常感谢小胡的推荐，让我投资了非常满意的楼盘，而且提供一站式服务，后期也非常省心，第一次海外投资经历还是很愉快的。</premicrosoft><br></p>', 0, NULL, 1),
(14, 2, '陈先生', NULL, NULL, '/uploads/20190212/cf61ddf1ebb19aa3a0eeffb6393ea44e.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">非常专业，同时置业顾问小胡对于楼盘的分析和介绍也很到位，所以让我很快可以做决定，非常感谢</premicrosoft><br></p>', 0, NULL, 1),
(15, 2, '王先生', NULL, NULL, '/uploads/20190212/431e073ca41bd7a7c16a036cb0598aaa.jpg', '<p><premicrosoft yahei="" ui'';font-size:13.5pt;"="">前期确实对海外房产市场一无所知，顾问确实专业和耐心，项目刚刚买完<spanconsolas'';">3个月，美元走强加上项目增值，已经赚了一笔很可观的收益了，很靠谱的团队。</spanconsolas'';"></premicrosoft><br></p>', 0, NULL, 1),
(17, 3, 'D.R.Horton', 'http://www.horton.com/', '', '/uploads/20190313/c19bcf6367591dae7df00bf5a7e8d851.png', NULL, 0, NULL, 1),
(18, 3, 'Lennar', 'http://www.lennar.com/', '', '/uploads/20190313/9a0a1b16de142485f6f4950451f30d50.png', NULL, 0, NULL, 1),
(19, 3, 'Pulte Homes', 'http://www.pulte.com/', '', '/uploads/20190313/acf89d83891add1c0c8251e962a969a7.png', NULL, 0, NULL, 1),
(20, 3, 'KB Home', 'https://www.kbhome.com/', '', '/uploads/20190313/85b5619cc21a83e67e54e859c9b082d2.png', NULL, 0, NULL, 1),
(21, 3, 'Meritage Homes Corporation', 'https://www.meritagehomes.com/', '', '/uploads/20190313/35bf0b146ab00dacc799505e19805821.png', NULL, 0, NULL, 1),
(22, 4, '底部信息', NULL, '<div class="footer-contact-row">\n	<div><span class="iconfont icon-youluPC_common_phone"></span></div>\n	<div class="contact-main">\n		<div class="contact-phone">美国电话 （+1）3216660992</div>\n		<div>全国统一服务热线 （工作日 6:00 - 22:00）</div>\n	</div>\n</div>\n<div class="footer-contact-row">\n	<div><span class="iconfont icon-youluPC_common_mail"></span></div>\n	<div class="contact-main">\n		<div>邮箱 info@usahousecenter.com</div>\n	</div>\n</div>\n<div class="footer-contact-row">\n	<div><span class="iconfont icon-wechat"></span></div>\n	<div class="contact-main">\n		<div>微信号 <a>pdl100</a></div>\n	</div>\n</div>', NULL, NULL, 0, '[]', 1),
(24, 5, '添加微信客服', NULL, NULL, '/uploads/20190313/c85ef4e3b3fd25eb7cdc60a863019f89.png', NULL, 0, '[]', 1),
(25, 5, '小程序', NULL, NULL, '/uploads/20190212/39b07a4741a3cc48b27c6a13c469c545.jpg', NULL, 0, '[]', 1),
(26, 6, '奥兰多城市官网', 'http://www.orlando.com/', '', NULL, NULL, 0, '[]', 1),
(27, 6, '佛罗里达州旅游局', 'http://www.visitflorida.com.cn/', NULL, NULL, NULL, 0, '[]', 1),
(28, 7, '底部版权', NULL, '版权所属 奥兰多房产服务平台   开发者 Pandora Property Group LLC', NULL, NULL, 0, '[]', 1),
(30, 8, 'D.R.Horton', 'http://www.horton.com/', '', '/uploads/20190313/c19bcf6367591dae7df00bf5a7e8d851.png', '', 0, '[]', 1),
(31, 8, 'Lennar', 'http://www.lennar.com/', '', '/uploads/20190313/9a0a1b16de142485f6f4950451f30d50.png', '', 0, '[]', 1),
(32, 8, 'Pulte Homes', 'http://www.pulte.com/', '', '/uploads/20190313/acf89d83891add1c0c8251e962a969a7.png', '', 0, '[]', 1),
(33, 8, 'KB Home', 'https://www.kbhome.com/', '', '/uploads/20190313/85b5619cc21a83e67e54e859c9b082d2.png', '', 0, '[]', 1),
(34, 8, 'Meritage Homes Corporation', 'https://www.meritagehomes.com/', '', '/uploads/20190313/35bf0b146ab00dacc799505e19805821.png', '', 0, '[]', 1),
(35, 8, 'ParkSquareHomes', 'http://parksquarehomes.cn/', '', '/uploads/20190317/88737bbd3d7925b48d792489c1709f06.png', '', 0, '[]', 1),
(36, 11, '关于我们', NULL, NULL, NULL, '<p>我们是专为海外房东、地产经纪及本地房屋维护管理公司而设立的奥兰多房地产服务平台，为海外置业提供一个城市信息公开化、集中的资讯平台。根据不同的投资需求，我们将为投资人筛选对接合适的持牌地产经纪、贷款经纪及房屋维护管理公司。我们还会实时同步更新美国权威房产平台Zillow的精选房源和本地专业化的装修公司资讯，让经纪人更有效率地为投资者服务，让投资人的房屋免除后顾之忧，轻松当美国房东！<br><br>本着共享资源的初衷，平台大部分信息来源于网络，如经纪个人或管理公司不愿在平台上展示自身资讯，请联系本平台删除。</p>', 0, '[]', 1),
(37, 11, '联系我们', NULL, NULL, NULL, '<p>美国电话（+1）3216660992<br>邮箱 info@usahousecenter.com&nbsp;<br>微信号 pdl100</p>', 0, '[]', 1),
(43, 6, '奥兰多迪士尼世界', 'https://disneyworld.disney.go.com/', NULL, NULL, NULL, 0, NULL, 1),
(44, 6, '奥兰多环球影城', 'http://www.universalorlando.com', NULL, NULL, NULL, 0, NULL, 1),
(45, 6, '奥兰多海洋世界', 'https://seaworld.com/orlando/', NULL, NULL, NULL, 0, NULL, 1),
(46, 6, '奥兰多乐高乐园', 'https://www.legoland.com/florida/', NULL, NULL, NULL, 0, NULL, 1),
(47, 6, '奥兰多周末资讯', 'https://www.orlandoweekly.com/', NULL, NULL, NULL, 0, NULL, 1),
(48, 6, '奥兰多经济发展委员会', 'https://orlando.org/', NULL, NULL, NULL, 0, NULL, 1),
(49, 16, '奥兰多介绍', NULL, NULL, NULL, '<p>奥兰多（Orlando）是位于美国佛罗里达州中部的一座城市，也是橙县的县治所在，根据美国人口调查局2006年统计，共有人口220,186（2006年）。奥兰多位于中佛罗里达州，是世界上最好的休闲城市之一。湖泊众多，干净的街道、友善的居民及温暖的气候为健行、露营、水上活动、蜜月及家庭旅行的最佳去处。</p><p>城市地标为 依奥拿湖 Lake Eola， 而奥兰多市市长为 Buddy Dyer。<br>走在奥兰多具有历史性的 Lock Haven 区内，奥兰多自然中心《Orlando Science Center》显眼的铝质圆顶印入眼帘，该自然中心提供个年龄层儿童互动性的展览。在Lock Haven 区内还有奥兰多艺术博物馆《Orlando Museum of Art》、橙县历史博物馆《Orange County Historical Museum》及附近的哈利 花园《Harry P. Leu Gardens》。在奥兰多还有老少咸宜的主题乐园，如华德迪士尼世界《Walt Disney World》、爱普卡中心《Epcot Center》、环球影城《Universal Studio》、冒险岛乐园《Islands of Adventure》, 海洋世界《Sea World》及无数的旅馆，造就了它的观光地位。<br>由华纳兄弟与环球影城公司合作兴建的“哈利波特的魔法世界”，位在两大电影制片商在奥兰多面积达七百八十七英亩的主题公园园址，霍格华兹城堡与人工白雪覆盖的霍格华兹村，将哈利波特书中的魔法世界真实呈现。预定二零零九年完工，造价数十亿美元。</p><p>奥兰多从前的名字是杰尼根 (Jernigan) ，是甘霖堡 (Fort Gatlin) 旁边的一个简陋的聚居地，甘霖堡是跟塞米诺族印第安人 (Seminole)作战时的一个美军基地。第二次塞米诺战争结束后，外地人开始迁居此处，并以在伊奥拉湖阵亡的士兵奥兰多．里夫斯 (Orlando Reeves) 的名字小城命名。<br>20世纪初，奥兰多发展成一个欣欣向荣的农业城市，著名的“橘子皮城市”。柑橘种植业的成功，带动了当地的铁路和房地的发展，但是1950年代后期，奥兰多又得到另一个无尽的财源，那就是太空时代的开始。格伦马丁公司 (Glenn Martin Company)，即如今的马丽埃塔国防系统公司 (Martin Marietta Defence Systems) 开始制造导弹，以及位于佛罗里达东海岸的卡尼亚韦拉尔和甘乃迪太空中心的建立，该地区带来了丰厚的收入和大量的就业机会。<br>1971年迪士尼乐园建成以后，该区成了一个主题公园大都市。不过，吸引游客的不只是这些主题公园。奥兰多还不声不响的建成了自己的高技术走廊，佛罗里达州的硅谷。总之，你不得不承认，曾经落后的奥兰多利用旅游业和高技术业，取代柑橘种植业的做法，的确是明智之举。这个“明日社区”已经证明了自己的先见之明，并且已然获得今日的成就。</p><h2>人口</h2><p>2005 人口普查统计数字 居于佛罗里达州境内 2000 2005 增加百分比<br>亚裔总人口 266,256 371,385 39%<br>* 印度 70,740 95,043 34%<br>* 华裔 46,368 55,508 20%<br>* 菲律宾 54,310 80,660 48%<br>* 日本 10,897 14,624 34%<br>* 韩国 19,139 21,975 14%<br>* 越南 33,190 55,555 67%<br>* 其余亚洲国家 31,612 48,020 50%<br>资料来源: 2005 American Community Survey</p><p><br></p><h2>旅游</h2><p>* 华特迪士尼世界度假区 Walt Disney World Resort<br>* 环球影城 Universal Orlando Resort<br>* 海洋世界主题公园 Sea World<br>* Orange County Convention Center</p><p><br></p><h2>文化</h2><p>* 中佛州中美协会 (Chinese American Association of Central Florida (CAACF))中佛州中美协会为一非营利组织于1969年在奥兰多成立。中美协会于1980年先后成立中华学校及舞蹈社, 以推广中文教育及宣扬中华文化为使命<br>* 长青社 (The Evergreen Club)<br>* 佛州光明寺 (Guang Ming Temple)<br>媒体<br>电视台 TV<br>* Channel 2 　* Channel 6 　* Channel 9<br>报刊 Newspaper<br>* Orlando Sentinel<br>亚裔杂志 Asian Magazine<br>* 亚洲风行　Asia Trend Magazine：一本以全英文刊印的月刊，每月15号出版, 于奥兰多市及天柏市等近百多个地点免费派发, 地点包括: 亚裔超市，餐馆, 银行, 书局,环球影城工裔职员部, 和狄斯耐乐园亚裔员部。杂志内容以报道亚洲最新流行文化、新闻、奥兰多市亚裔商业活动、亚裔社区活动、亚裔美食推介、健康资讯,及每月亚裔社区最新活动月历等。每月出版8,000本, 包括亚洲风行网上电子杂志版本　Asia Trend Magazine online version。2005年9月创刊至今,每月读者人数超过15,000,广受中外籍人士欢迎。<br>华文报刊 Chinese Newspaper<br>* 佛州大众报 - United Chinese News of Florida为佛州最受读者欢迎的华文报刊, 每星期四出版, 免费派发于各大小华裔超市, 餐馆, 教会与佛光山。佛州大众报内容除报道每星期发生美国境内主要新闻外, 同时间十分关注迈阿密市与中佛州奥兰多市华裔社区新闻。近年积极开拓中佛州奥兰多市华裔社区资讯。最新增设报刊网页供读者回顾曾刊出之文章, 及查询华裔社区资讯服务。</p><p><br></p><h2>交通</h2><p>奥兰多国际机场 (MCO) 位于城市的东南角，是佛罗里达中部最大的机场。这有几乎所有大型航空公司的班机，也有包机和折扣航线。如果你要去佛罗里达州的套票，终点站无可避免是奥兰多。套票包括各个主题公园、酒店和航空机票特联合服务。如果想要从机场直接乘车去迪士尼乐园，可以从417号高速公路转到536号高速公路。<br>美国铁路客运公司 (Amtrak) 有客运从奥兰多直达迈阿密、盖恩斯维尔和北方城市。美国铁路客运公司的车站位于奥兰多市中心以南1.6公里。</p>', 0, NULL, 1),
(38, 12, 'banner1', 'http://www.baidu.com', NULL, '/uploads/20190216/6881f0247739f5882eda3590c0ac0bd8.jpg', NULL, 0, NULL, 1),
(39, 12, 'banner2', NULL, NULL, '/uploads/20190216/6b456af2c8142c6b4192ab7e43888c24.jpg', NULL, 0, NULL, 1),
(40, 13, '联系信息', NULL, '<p onclick="location.href=''tel:18070935901''">美国电话：(+1)3216660992</p>\n<p>微信客服：pdl100</p>\n<p onclick="location.href=''mailto:info@usahousecenter.com''">联系邮箱：info@usahousecenter.com</p>', NULL, NULL, 0, '[]', 1),
(41, 14, '电话号码', 'tel://+13216660992', '', NULL, NULL, 0, '[]', 1),
(42, 15, '微信号『 pdl100』', NULL, 'pdl100', '/uploads/20190320/7d8a8f9ddd1835b28cdb9d50183e39b2.png', NULL, 0, '[]', 1),
(50, 16, '奥兰多街景', NULL, NULL, NULL, '<p><iframe src="https://www.google.com/maps/embed?pb=!4v1552469207935!6m8!1m7!1s4FT7nlIBLC9v8aEorgefuA!2m2!1d28.54026677171019!2d-81.37902569714875!3f34!4f10!5f0.8160813932612223" width="100%" height="800" frameborder="0" style="border-width: 0px; border-style: initial;" allowfullscreen=""></iframe></p><p><br></p>', 0, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `boume_agent`
--

CREATE TABLE IF NOT EXISTS `boume_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lock` tinyint(1) DEFAULT '0' COMMENT '锁定',
  `lock_msg` varchar(255) DEFAULT NULL COMMENT '锁定原因',
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL COMMENT '执照号',
  `lang` varchar(255) DEFAULT NULL COMMENT '语言',
  `introduction` mediumtext COMMENT '简介',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `edit_password_time` int(10) DEFAULT NULL COMMENT '密码修改时间',
  `address` varchar(255) DEFAULT NULL,
  `build_page` int(10) DEFAULT '0' COMMENT '创建主页到期日期',
  `build_client` int(10) DEFAULT '0' COMMENT '创建客户数量',
  `build_admin` int(10) DEFAULT '0' COMMENT '后台有效期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `boume_agent`
--

INSERT INTO `boume_agent` (`id`, `username`, `password`, `lock`, `lock_msg`, `name`, `photo`, `phone`, `email`, `license`, `lang`, `introduction`, `addtime`, `edit_password_time`, `address`, `build_page`, `build_client`, `build_admin`) VALUES
(2, 'agent001', 'mAqkU1IcYLoW/4ptQffbWQ==', 0, '', '经纪人姓名', '/uploads/20190306/d12eaabb47360a2bf8f58e162cc47ae0.jpg', '18070935901', 'boume@qq.com', '123456', '["中文","英语"]', '<p><img src="http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/pcmoren_wu_org.png" alt="[污]" data-w-e="1"><img src="http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png" alt="[舔屏]" data-w-e="1"><br></p>', 1970, 1970, '广西西乡塘', 1557504000, 0, 1557504000);

-- --------------------------------------------------------

--
-- 表的结构 `boume_auth`
--

CREATE TABLE IF NOT EXISTS `boume_auth` (
  `rid` int(10) DEFAULT NULL,
  `nid` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `boume_auth`
--

INSERT INTO `boume_auth` (`rid`, `nid`) VALUES
(2, 18),
(2, 17),
(2, 16),
(2, 15),
(2, 14),
(2, 13),
(2, 12),
(2, 11),
(2, 10),
(2, 9),
(2, 8),
(2, 7),
(2, 6),
(2, 5),
(2, 4),
(2, 3),
(2, 2),
(2, 1),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24);

-- --------------------------------------------------------

--
-- 表的结构 `boume_client`
--

CREATE TABLE IF NOT EXISTS `boume_client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `edit_password_time` int(10) DEFAULT NULL COMMENT '密码修改时间',
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `lock` tinyint(1) DEFAULT '0' COMMENT '锁定',
  `lock_msg` varchar(255) DEFAULT NULL COMMENT '锁定原因',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `boume_client`
--

INSERT INTO `boume_client` (`id`, `agent_id`, `username`, `password`, `addtime`, `edit_password_time`, `name`, `phone`, `email`, `address`, `photo`, `lock`, `lock_msg`) VALUES
(2, 2, 'client001', 'IXRucy/yG9WbL0tXAcayyA==', 1549767154, 1549767154, '客户姓名', '18070935901', 'boume@qq.com', '广西南宁西乡塘', '/uploads/20190210/fc67afb7d7333597650f1de9b1da55e0.png', 0, NULL),
(3, 2, 'client002', 'IXRucy/yG9WbL0tXAcayyA==', 1549767154, 1549767154, '客户姓名2', '18070935901', 'boume@qq.com', '广西南宁西乡塘', '/uploads/20190210/fc67afb7d7333597650f1de9b1da55e0.png', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `boume_cms_agent`
--

CREATE TABLE IF NOT EXISTS `boume_cms_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL COMMENT '执照号',
  `lang` varchar(255) DEFAULT NULL COMMENT '语言',
  `introduction` mediumtext COMMENT '简介',
  `addtime` int(10) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  `show` tinyint(1) DEFAULT '1',
  `qr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `boume_cms_agent`
--

INSERT INTO `boume_cms_agent` (`id`, `title`, `description`, `thumb`, `name`, `phone`, `email`, `license`, `lang`, `introduction`, `addtime`, `sort`, `show`, `qr`) VALUES
(2, '金牌经纪人宋平', '2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。', '/uploads/20190212/05591c66cc428e0585c5db998567672b.jpg', '宋平', '18070935901', 'boume@qq.com', '123456', '["中文","英语"]', '<p><span font-size:="" helvetica="" microsoft="">2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，毕业后回国从事平行进口汽车行业. &nbsp;熟悉中美两国贸易经济状况. 常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。以专业的知识和热情的服务为广大朋友解决旅游留学，海外置业等需求。商业，房屋买卖，法拍屋，翻修屋投资，出租管理，精通英文，普通话，广东话。</span><br font-size:="" helvetica="" microsoft=""></p>', 1549794366, 15, 1, '/uploads/20190212/63a416632242310bd0aeb95950a5608b.jpg'),
(3, '金牌经纪人宋平', '2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。', '/uploads/20190212/05591c66cc428e0585c5db998567672b.jpg', '宋平', '18070935901', 'boume@qq.com', '123456', '["中文","英语"]', '<p><span font-size:="" helvetica="" microsoft="">2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，毕业后回国从事平行进口汽车行业. &nbsp;熟悉中美两国贸易经济状况. 常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。以专业的知识和热情的服务为广大朋友解决旅游留学，海外置业等需求。商业，房屋买卖，法拍屋，翻修屋投资，出租管理，精通英文，普通话，广东话。</span><br font-size:="" helvetica="" microsoft=""></p>', 1549794366, 15, 1, '/uploads/20190212/63a416632242310bd0aeb95950a5608b.jpg'),
(4, '金牌经纪人宋平', '2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。', '/uploads/20190212/05591c66cc428e0585c5db998567672b.jpg', '宋平', '18070935901', 'boume@qq.com', '123456', '["中文","英语"]', '<p><span font-size:="" helvetica="" microsoft="">2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，毕业后回国从事平行进口汽车行业. &nbsp;熟悉中美两国贸易经济状况. 常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。以专业的知识和热情的服务为广大朋友解决旅游留学，海外置业等需求。商业，房屋买卖，法拍屋，翻修屋投资，出租管理，精通英文，普通话，广东话。</span><br font-size:="" helvetica="" microsoft=""></p>', 1549794366, 15, 1, '/uploads/20190212/63a416632242310bd0aeb95950a5608b.jpg'),
(5, '金牌经纪人宋平', '2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。', '/uploads/20190212/05591c66cc428e0585c5db998567672b.jpg', '宋平', '18070935901', 'boume@qq.com', '123456', '["中文","英语"]', '<p><span font-size:="" helvetica="" microsoft="">2008年毕业于天津财经大学和圣地亚哥州立大学国际贸易专业，毕业后回国从事平行进口汽车行业. &nbsp;熟悉中美两国贸易经济状况. 常年往返于北京，天津，深圳和奥兰多，深入了解国内地产和佛州地产动向及走势。以专业的知识和热情的服务为广大朋友解决旅游留学，海外置业等需求。商业，房屋买卖，法拍屋，翻修屋投资，出租管理，精通英文，普通话，广东话。</span><br font-size:="" helvetica="" microsoft=""></p>', 1549794366, 15, 1, '/uploads/20190212/63a416632242310bd0aeb95950a5608b.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `boume_cms_article`
--

CREATE TABLE IF NOT EXISTS `boume_cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `addtime` int(10) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  `show` tinyint(1) DEFAULT '1',
  `hits` int(10) DEFAULT '0',
  `release` int(10) DEFAULT '0' COMMENT '发布ID',
  `logo` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2516 ;

--
-- 转存表中的数据 `boume_cms_article`
--

INSERT INTO `boume_cms_article` (`id`, `title`, `description`, `thumb`, `tag`, `url`, `content`, `addtime`, `sort`, `show`, `hits`, `release`, `logo`, `form`) VALUES
(1, '中国资本纷纷”豪掷“海外房地产市场，奥兰多房地产', '随着国内房地产市场持续低迷这让一些中国房地产企业转向海外投资房地产，仅年初，国内三大房地产公司豪掷百亿元人民币投向海外房地产。日前，国内某知名房地产公司又斥资2.65亿欧元收购了西班牙马德里地标建筑西班牙大厦的海外房地产计划。', 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwEiclR6X6qUiaQwhF4SJBoO0rWf1XKgUOhviaicOjicxzm4lYFHpIYRibrE8J4AzFdD4Te8OKPCkE5aiabA/0', '["奥兰多房产资讯"]', NULL, '<p><br></p>\n<p><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 30px;  background-color: rgb(254, 255, 255); font-family: 宋体;">  <img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwEiclR6X6qUiaQwhF4SJBoO0h0dDNnHWibeekfXozuqcu7OQr2DmJujAUk7YavrmdvrQ9qHXOkXnYDw/0"></span></p>\n<p><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 30px;  background-color: rgb(254, 255, 255); font-family: 宋体;">  </span><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); line-height: 30px;  background-color: rgb(254, 255, 255); font-family: 宋体;">随着国内房地产市场持续低迷这让一些中国房地产企业转向<strong style="margin: 0px; padding: 0px; ">海外投资房地产</strong>，仅年初，国内三大房地产公司豪掷百亿元人民币投向海外房地产。日前，国内某知名房地产公司又斥资2.65亿欧元收购了西班牙马德里地标建筑西班牙大厦的<span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); ">海外房地产</span>计划。<br style="margin: 0px; padding: 0px; "> 　　从仲量联行的研究数据来看，为应对国内经济和房地产市场增速放缓的局面，中国开发商正积极寻求海外投资机会。2013年中国海外商业房地产投资总额达76亿美元，同比增长124%;而2012年和2011年，投资额分别为33亿美元和29亿美元。<br style="margin: 0px; padding: 0px; "> 　　而在2014年，海外房地产投资额继续增长，在今年第一季度国内房地产投资者对外住宅开发投资额同比飙升80%，从6亿美元的基础上增至11亿美元，这些资金纷纷投向英国、澳大利亚和美国等国家。<br style="margin: 0px; padding: 0px; "> 　　同时，仲量联行国际资本集团中国区总监夏飏飏表示，预计资金充足的中国机构投资者对海外房地产市场的投资兴趣及其活动将继续增长，2014全年中国机构投资者的海外商业房地产投资总额可突破100亿美元大关。<br style="margin: 0px; padding: 0px; "> 　　而在中国开发商积极投资海外市场的同时，海外房地产市场也在谋求引入更多的中国资本加入，以刺激当地的经济发展。其中一些海外地区更是选择与中国开发商联手合作。<br style="margin: 0px; padding: 0px; "> 　　据了解，以曼彻斯特机场集团首席执行官Charlie Cornish为首的代表团，近日分别访问了天津、北京、上海和深圳，向有意将其业务扩展至英国的潜在中国投资移民者介绍曼彻斯特空港城这一“英国最大改造项目”的投资机会。<br style="margin: 0px; padding: 0px; "> 　　2013年10月份，北京建工集团宣布成为曼彻斯特空港城项目的合作方，持有20%权益，将与建筑公司Carillion和大曼彻斯特养老基金共同开发该项目。曼彻斯特空港城项目投资规模达8亿英镑，将在曼彻斯特机场开发500万平方英尺的商业区。</span></p>', 1552528594, 0, 1, 0, 0, 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwEiclR6X6qUiaQwhF4SJBoO075E2IeC61nwpqw0njbgOAky5mW32r4iadiapBBX9KgdsOt4oFqw1Oapg/0', '奥兰多房地产投资'),
(2, '美国房地产投资，为什么首选佛罗里达奥兰多?', '佛罗里达是美国人口第四大州，无州所得税，其温暖的气候和优美的风景一直是理想的度假和退休天堂。奥兰多是全球最大', 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8Qx7jU98kf6ibgeT8hIzUWGkDkyhu1RX8U8eIoUneJ8gUgeiaP0GKfufHdDjV1SHGVMicV1WeDOYXBoiaQ/0', '["奥兰多房产资讯"]', NULL, '<p style=""><br></p>\n<p style="">佛罗里达是美国人口第四大州，无州所得税，其温暖的气候和优美的风景一直是理想的度假和退休天堂。奥兰多是全球最大旅游城市之一，奥兰多国际机场吞吐量排名全美第13，世界第29，每年接待游客5600多万人，奥兰多有世界主题公园旅游之都的昵称，有世界上最大的迪斯尼公园主题公园群体，其中包括Magic Kingdom,Animal Kingdom,Hollywood Studio 和Epcot Center，还有Universal Studio, Islands ofAdventure 和 Sea World。另外还有很多人都不知道的 Discovery Cove， Wet n Wild，Typhoon Lagoon, Blizzard Beach Water Park, 以及由 Sea World 的主人刚刚建成的大型全新水上公园Aquatica 。没有几个人能数清奥兰多还有多少像Disney Quest， Gator Land, Believe It or Not,Arabian Nights, MedievalTimes这样的各式各样中小型娱乐项目，如果再加上位于 CapeCanaveral 的 Kennedy Space Center，位于 Tampa 的Busch Garden 和位于 Winter Heaven 的 LEGOLAND，即使你不休息，也需要至少半个月的时间才能走马看花的逛一圈。同时，各个主体公园还在园内不断地新增游玩项目。奥兰多的地理位置优越，往东驱车1个多小时可到大西洋，往西1个多小时可到墨西哥湾，很少有飓风；城市全年平均气温25度，一年当中有300天以上是晴天，气候宜人。奥兰多经济得益于全球公认的旅游业。其他同样强劲的创新行业包括奥兰多的航空航天和国防工业、建模、模拟和训练、生命科学和生物技术、数字媒体等。</p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwR1AO2J3AX4rPfT4mP2HhIYnicC6Vdxia5V95tOJMVAVIKKJ6cmvdfbyDUyN15Gl1m9ZV24H5D4iccg/0"> </p>\n<p style="">  随着美国次贷危机的爆发，奥兰多的房价跌了三分之二之多，成为次贷危机的重灾区之一，目前部分物业售价低于建筑成本价，机会是跌出来的，以这样低价位购买的投资房，不论是长期出租还是短期出租，绝大多数现金投资回报在4-8%之间，给投资者提供了绝无仅有的投资良机。有统计显示，从2012年开始, 奥兰多的房地产价格已经走出低谷，开始上扬，大量的外来资金进入，一些银行的法拍屋开始出现多方争抢，最终高于要价售出。</p>\n<br>\n<p style=""><br></p>\n<p><br></p>\n<p><br></p>\n<p><br></p>\n<p><br></p>', 1552528657, 0, 1, 0, 0, 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwEiclR6X6qUiaQwhF4SJBoO075E2IeC61nwpqw0njbgOAky5mW32r4iadiapBBX9KgdsOt4oFqw1Oapg/0', '奥兰多房地产投资'),
(3, 'Sawgrass Bay社区新房推荐', 'Citrus Highlands是一个非常美丽且适合长期出租的小区，森林湖泊环抱，街道干净整洁，居民平均收入', 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMicOMknshQq0JJ7Ad9vCmLib4KetGYhSgiblib7wU0uVpVu656JsLnCq6qA/0', '["奥兰多房产资讯"]', NULL, '<p style="padding: 0px; margin-top: 0px; margin-bottom: 8px; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; white-space: normal; background-color: rgb(249, 252, 254); font-size: 18px; font-weight: bold; text-indent: 50px; line-height: 30px;">Citrus Highlands是一个非常美丽且适合长期出租的小区，森林湖泊环抱，街道干净整洁，居民平均收入较高。</p>\n<p><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMCUqJw8pMLI2xtia0HXfcl3Q6VPb7AB3wibOTGrQj4gQv5vJT7NTibBxcg/0"></p>\n<p><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMQL6lNZXJnbhBAyib6JB4vKNv87lVia8Iz5e9EGAQfe5zSocbvELfQ2ibA/0"></p>\n<p></p>\n<p><br></p>\n<p></p>\n<p style="padding: 0px; margin-top: 0px; margin-bottom: 8px; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; white-space: normal; background-color: rgb(249, 252, 254); font-size: 18px; font-weight: bold; text-indent: 50px; line-height: 30px;">一期均是豪华房车(RV)独栋，已经售罄，二期是普通双车库独栋，正在预售中，附件是户型图和价格信息，这个小区门口就是一个中型购物中心(Publix Shopping Center)，步行几分钟便可以到达，购物方便，另外距离24小时营业的沃尔玛，邮局，餐馆，银行，加油站，各种便利店和图书馆等不到5分钟车程。距离迪斯尼公园20分钟车程，小区管理费每年$350，房屋保险费每年$800，房地产税每年$2000-2300. 每月租金$1100-1400.</p>\n<p><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfM9pyDZqWFH9E17ZIrf3XMOWgw6E9aqMwluBxia7iax1MnKNyL7qKsJo6w/0"></p>\n<p><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMJ7ia8ODTTVxucic6pYDkoz325nzawyticl4eqA4uV8AQHbrXln2qGH4aQ/0"></p>\n<p><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMWxXCDX7ZImC2qmMzc37XzmkfYAq4IrAwecMib8ic70ibpSTCCwKmoI0hA/0"></p>\n<p><br></p>', 1552528744, 0, 1, 0, 0, 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwEiclR6X6qUiaQwhF4SJBoO075E2IeC61nwpqw0njbgOAky5mW32r4iadiapBBX9KgdsOt4oFqw1Oapg/0', '奥兰多房地产投资'),
(4, '佛罗里达州奥兰多新房推荐2601平方英尺经典户型', 'Citrus Highlands是一个非常美丽且适合长期出租的小区，森林湖泊环抱，街道干净整洁，居民平均收入', 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QzDyia6Via68ON5G2xXJZ5XA6o6sX59czWTw3bq0r6PN4p2rxdZb4VJlCbCrTibRh9r0rLJp0dcL0bpg/0', '["奥兰多房产资讯"]', NULL, '<p style=""><span style="max-width: 100%; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; font-size: 18px; font-weight: bold; line-height: 30px; text-indent: 50px; background-color: rgb(249, 252, 254); word-wrap: break-word !important; box-sizing: border-box !important;">Citrus Highlands是一个非常美丽且适合长期出租的小区，森林湖泊环抱，街道干净整洁，居民平均收入较高。</span></p>\n<p style=""><span style="max-width: 100%; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; font-size: 18px; font-weight: bold; line-height: 30px; text-indent: 50px; background-color: rgb(249, 252, 254); word-wrap: break-word !important; box-sizing: border-box !important;"><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QzDyia6Via68ON5G2xXJZ5XA6vR4qaqcNGuQZbZDJnOkuZlIylr3vKichWnZibo3afHEXxzwLkzZVCwtg/0" /></span></p>\n<p style=""><span style="max-width: 100%; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; font-size: 18px; font-weight: bold; line-height: 30px; text-indent: 50px; background-color: rgb(249, 252, 254); word-wrap: break-word !important; box-sizing: border-box !important;"></span></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMmK42bwKseluoLw1F4wQNG5cibc2jJlKytOjpZ5FXyaqiardnpBcvB2vA/0" /></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QzDyia6Via68ON5G2xXJZ5XA655pTtpvdsSsRSTice9fUB23fsBtnI8xiabr6LaHMU3oedug0mt1b0LLw/0" /></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfM9KBBrotPmEc9H9ZcT9qZlyfdtSHJeZ4kclEKVfuL7MhPx8G7gibjuKw/0" /></p>\n<p style=""><span style="max-width: 100%; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; font-size: 18px; font-weight: bold; line-height: 30px; text-indent: 50px; background-color: rgb(249, 252, 254); word-wrap: break-word !important; box-sizing: border-box !important;"><br style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"></span><span style="max-width: 100%; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; font-size: 18px; font-weight: bold; line-height: 30px; text-indent: 50px; background-color: rgb(249, 252, 254); word-wrap: break-word !important; box-sizing: border-box !important;">一期均是豪华房车(RV)独栋，已经售罄，二期是普通双车库独栋，正在预售中，附件是户型图和价格信息，这个小区门口就是一个中型购物中心(Publix Shopping Center)，步行几分钟便可以到达，购物方便，另外距离24小时营业的沃尔玛，邮局，餐馆，银行，加油站，各种便利店和图书馆等不到5分钟车程。距离迪斯尼公园20分钟车程，小区管理费每年$350，房屋保险费每年$800，房地产税每年$2000-2300. 每月租金$1100-1400.</span></p>\n<p style=""><span style="max-width: 100%; font-family: Arial, SimHei, 宋体, SimSun, Helvetica, tahoma, verdana, sans-serif, 华文细黑, STXihei; font-size: 18px; font-weight: bold; line-height: 30px; text-indent: 50px; background-color: rgb(249, 252, 254); word-wrap: break-word !important; box-sizing: border-box !important;"></span></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMqyUaibRNqJ2bhpY3sHRrciarzrp3tOiaO1huqxUia47uc5l8JbjmUBhxFw/0" /></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMX55R1omfE5kBiabia7G1uSPDVRaic3oy1DvcTjtbCXUOOL8zjqog67N5Q/0" /></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMC2apG8oW3fd8OuS9zGja47AOalXNbGuhd0ZficQAlMQRqXKd3cVTkPw/0" /></p>\n<p style=""><br style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"></p>\n<p style=""><img style="max-width: 100%;" src="http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QxfhmK4iccMUq8Lc0TuMibsfMlxQ0HpRyX1BwxhebtaSrtA0j5cxhrPaQsnFZhLClDdsDIA7MV9qYPw/0" /></p>\n<p><br></p>', 1552529062, 0, 1, 0, 0, 'http://mmbiz.qpic.cn/mmbiz/UT4Q4fMn8QwEiclR6X6qUiaQwhF4SJBoO075E2IeC61nwpqw0njbgOAky5mW32r4iadiapBBX9KgdsOt4oFqw1Oapg/0', '奥兰多房地产投资');

-- --------------------------------------------------------

--
-- 表的结构 `boume_cms_decorator`
--

CREATE TABLE IF NOT EXISTS `boume_cms_decorator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `workcardnumber` varchar(255) DEFAULT NULL COMMENT '工卡号',
  `tag` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `introduction` mediumtext,
  `addtime` int(10) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  `show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `boume_cms_decorator`
--

INSERT INTO `boume_cms_decorator` (`id`, `title`, `thumb`, `name`, `phone`, `email`, `workcardnumber`, `tag`, `lang`, `introduction`, `addtime`, `sort`, `show`) VALUES
(1, '明星工人张业明', '/uploads/20190210/26368eb0030ac80be9d43052fc607da1.jpg', '张业明', '18070935901', 'boume@qq.com', 'N001', '["瓦工","电工"]', '["中文","英语"]', '<p>个人成长经历：<br></p><p>　　老家在安徽安庆，木工出身的张业明工长一接触装饰行业便热爱上了这个行业，2006年进入北京工长俱乐部伴随俱乐部共同成长，在这里结识了诸多好友与兄弟，在这里学到了装修服务的精髓，张业明工长会更佳努力的为每一位用户提供每一位的用心家装。</p><p><br></p><p><img src="http://www.gzjlb.com/attachs/photo/201710/20171028_CBB7F45A4E6DB3603E66072BAD12666D.png?PID129" alt="" style="max-width:100%;"></p><p><br>团队故事：<br>　　---对团队要求“用心做事 真诚做人”<br>　　张业明工长说：我手下团队的每一位成员都十分优秀，大部分都是装修世家有着丰富的施工经验，但是我戒骄戒躁，每一步都是脚踏实地，勤勤恳恳的为用户提供放心服务，希望能为更多用户提供一个满意的家。<br><br>与业主的故事：<br>　　---用真诚打动每一个人<br>　　2009的炎日夏日，张业明工长接到了一家和平里小区老房改造工程，业主对水电改造十分重视，为了确保工程的每一项问题，张业明工长每天坚持着给业主发送当日的施工进度照片并电话告诉他施工进度让他有所了解，施工完成后业主十分满意，对张业明工长的服务态度与真诚所打动，他说以后还会推荐更多用户来指定张业明工长去装修。<br><br>&nbsp;<br><br>家庭生活：<br>　　---辛苦换来美好的明天<br>　　小编了解到，他的爱人带着孩子，后来张业明工长又老年得有一子这在高兴的同时也为并就清贫的家添加了一份负担，但是他明白家是他的避风港，他会时刻坚守着这片温馨的港湾，通过不断的努力获得更多人的认可，在家装事业上做出属于自己的成绩。<br><br>小编总结：<br><br>　　如此敬业的工长只有北京工长俱乐部有，想找一个让你随时能掌控施工进度，做到家装时人在公司也能心里有数就找张业明工长吧。&nbsp;&nbsp;<br></p>', 1549071958, 9, 1),
(2, '明星工人张业明', '/uploads/20190210/26368eb0030ac80be9d43052fc607da1.jpg', '张业明', '18070935901', 'boume@qq.com', 'N001', '["瓦工","电工"]', '["中文","英语"]', '<p>个人成长经历：<br></p><p>　　老家在安徽安庆，木工出身的张业明工长一接触装饰行业便热爱上了这个行业，2006年进入北京工长俱乐部伴随俱乐部共同成长，在这里结识了诸多好友与兄弟，在这里学到了装修服务的精髓，张业明工长会更佳努力的为每一位用户提供每一位的用心家装。</p><p><br></p><p><img src="http://www.gzjlb.com/attachs/photo/201710/20171028_CBB7F45A4E6DB3603E66072BAD12666D.png?PID129" alt="" style="max-width:100%;"></p><p><br>团队故事：<br>　　---对团队要求“用心做事 真诚做人”<br>　　张业明工长说：我手下团队的每一位成员都十分优秀，大部分都是装修世家有着丰富的施工经验，但是我戒骄戒躁，每一步都是脚踏实地，勤勤恳恳的为用户提供放心服务，希望能为更多用户提供一个满意的家。<br><br>与业主的故事：<br>　　---用真诚打动每一个人<br>　　2009的炎日夏日，张业明工长接到了一家和平里小区老房改造工程，业主对水电改造十分重视，为了确保工程的每一项问题，张业明工长每天坚持着给业主发送当日的施工进度照片并电话告诉他施工进度让他有所了解，施工完成后业主十分满意，对张业明工长的服务态度与真诚所打动，他说以后还会推荐更多用户来指定张业明工长去装修。<br><br>&nbsp;<br><br>家庭生活：<br>　　---辛苦换来美好的明天<br>　　小编了解到，他的爱人带着孩子，后来张业明工长又老年得有一子这在高兴的同时也为并就清贫的家添加了一份负担，但是他明白家是他的避风港，他会时刻坚守着这片温馨的港湾，通过不断的努力获得更多人的认可，在家装事业上做出属于自己的成绩。<br><br>小编总结：<br><br>　　如此敬业的工长只有北京工长俱乐部有，想找一个让你随时能掌控施工进度，做到家装时人在公司也能心里有数就找张业明工长吧。&nbsp;&nbsp;<br></p>', 1549071958, 9, 1),
(3, '明星工人张业明', '/uploads/20190210/26368eb0030ac80be9d43052fc607da1.jpg', '张业明', '18070935901', 'boume@qq.com', 'N001', '["瓦工","电工"]', '["中文","英语"]', '<p>个人成长经历：<br></p><p>　　老家在安徽安庆，木工出身的张业明工长一接触装饰行业便热爱上了这个行业，2006年进入北京工长俱乐部伴随俱乐部共同成长，在这里结识了诸多好友与兄弟，在这里学到了装修服务的精髓，张业明工长会更佳努力的为每一位用户提供每一位的用心家装。</p><p><br></p><p><img src="http://www.gzjlb.com/attachs/photo/201710/20171028_CBB7F45A4E6DB3603E66072BAD12666D.png?PID129" alt="" style="max-width:100%;"></p><p><br>团队故事：<br>　　---对团队要求“用心做事 真诚做人”<br>　　张业明工长说：我手下团队的每一位成员都十分优秀，大部分都是装修世家有着丰富的施工经验，但是我戒骄戒躁，每一步都是脚踏实地，勤勤恳恳的为用户提供放心服务，希望能为更多用户提供一个满意的家。<br><br>与业主的故事：<br>　　---用真诚打动每一个人<br>　　2009的炎日夏日，张业明工长接到了一家和平里小区老房改造工程，业主对水电改造十分重视，为了确保工程的每一项问题，张业明工长每天坚持着给业主发送当日的施工进度照片并电话告诉他施工进度让他有所了解，施工完成后业主十分满意，对张业明工长的服务态度与真诚所打动，他说以后还会推荐更多用户来指定张业明工长去装修。<br><br>&nbsp;<br><br>家庭生活：<br>　　---辛苦换来美好的明天<br>　　小编了解到，他的爱人带着孩子，后来张业明工长又老年得有一子这在高兴的同时也为并就清贫的家添加了一份负担，但是他明白家是他的避风港，他会时刻坚守着这片温馨的港湾，通过不断的努力获得更多人的认可，在家装事业上做出属于自己的成绩。<br><br>小编总结：<br><br>　　如此敬业的工长只有北京工长俱乐部有，想找一个让你随时能掌控施工进度，做到家装时人在公司也能心里有数就找张业明工长吧。&nbsp;&nbsp;<br></p>', 1549071958, 9, 1),
(4, '明星工人张业明', '/uploads/20190210/26368eb0030ac80be9d43052fc607da1.jpg', '张业明', '18070935901', 'boume@qq.com', 'N001', '["瓦工","电工"]', '["中文","英语"]', '<p>个人成长经历：<br></p><p>　　老家在安徽安庆，木工出身的张业明工长一接触装饰行业便热爱上了这个行业，2006年进入北京工长俱乐部伴随俱乐部共同成长，在这里结识了诸多好友与兄弟，在这里学到了装修服务的精髓，张业明工长会更佳努力的为每一位用户提供每一位的用心家装。</p><p><br></p><p><img src="http://www.gzjlb.com/attachs/photo/201710/20171028_CBB7F45A4E6DB3603E66072BAD12666D.png?PID129" alt="" style="max-width:100%;"></p><p><br>团队故事：<br>　　---对团队要求“用心做事 真诚做人”<br>　　张业明工长说：我手下团队的每一位成员都十分优秀，大部分都是装修世家有着丰富的施工经验，但是我戒骄戒躁，每一步都是脚踏实地，勤勤恳恳的为用户提供放心服务，希望能为更多用户提供一个满意的家。<br><br>与业主的故事：<br>　　---用真诚打动每一个人<br>　　2009的炎日夏日，张业明工长接到了一家和平里小区老房改造工程，业主对水电改造十分重视，为了确保工程的每一项问题，张业明工长每天坚持着给业主发送当日的施工进度照片并电话告诉他施工进度让他有所了解，施工完成后业主十分满意，对张业明工长的服务态度与真诚所打动，他说以后还会推荐更多用户来指定张业明工长去装修。<br><br>&nbsp;<br><br>家庭生活：<br>　　---辛苦换来美好的明天<br>　　小编了解到，他的爱人带着孩子，后来张业明工长又老年得有一子这在高兴的同时也为并就清贫的家添加了一份负担，但是他明白家是他的避风港，他会时刻坚守着这片温馨的港湾，通过不断的努力获得更多人的认可，在家装事业上做出属于自己的成绩。<br><br>小编总结：<br><br>　　如此敬业的工长只有北京工长俱乐部有，想找一个让你随时能掌控施工进度，做到家装时人在公司也能心里有数就找张业明工长吧。&nbsp;&nbsp;<br></p>', 1549071958, 9, 1),
(5, '明星工人张业明', '/uploads/20190210/26368eb0030ac80be9d43052fc607da1.jpg', '张业明', '18070935901', 'boume@qq.com', 'N001', '["瓦工","电工"]', '["中文","英语"]', '<p>个人成长经历：<br></p><p>　　老家在安徽安庆，木工出身的张业明工长一接触装饰行业便热爱上了这个行业，2006年进入北京工长俱乐部伴随俱乐部共同成长，在这里结识了诸多好友与兄弟，在这里学到了装修服务的精髓，张业明工长会更佳努力的为每一位用户提供每一位的用心家装。</p><p><br></p><p><img src="http://www.gzjlb.com/attachs/photo/201710/20171028_CBB7F45A4E6DB3603E66072BAD12666D.png?PID129" alt="" style="max-width:100%;"></p><p><br>团队故事：<br>　　---对团队要求“用心做事 真诚做人”<br>　　张业明工长说：我手下团队的每一位成员都十分优秀，大部分都是装修世家有着丰富的施工经验，但是我戒骄戒躁，每一步都是脚踏实地，勤勤恳恳的为用户提供放心服务，希望能为更多用户提供一个满意的家。<br><br>与业主的故事：<br>　　---用真诚打动每一个人<br>　　2009的炎日夏日，张业明工长接到了一家和平里小区老房改造工程，业主对水电改造十分重视，为了确保工程的每一项问题，张业明工长每天坚持着给业主发送当日的施工进度照片并电话告诉他施工进度让他有所了解，施工完成后业主十分满意，对张业明工长的服务态度与真诚所打动，他说以后还会推荐更多用户来指定张业明工长去装修。<br><br>&nbsp;<br><br>家庭生活：<br>　　---辛苦换来美好的明天<br>　　小编了解到，他的爱人带着孩子，后来张业明工长又老年得有一子这在高兴的同时也为并就清贫的家添加了一份负担，但是他明白家是他的避风港，他会时刻坚守着这片温馨的港湾，通过不断的努力获得更多人的认可，在家装事业上做出属于自己的成绩。<br><br>小编总结：<br><br>　　如此敬业的工长只有北京工长俱乐部有，想找一个让你随时能掌控施工进度，做到家装时人在公司也能心里有数就找张业明工长吧。&nbsp;&nbsp;<br></p>', 1549071958, 9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `boume_cms_house`
--

CREATE TABLE IF NOT EXISTS `boume_cms_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cattype` int(10) DEFAULT '1' COMMENT '房屋类型1新房2二手房3土地',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `thumb` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL COMMENT '价格万美元',
  `hprice` int(255) DEFAULT NULL,
  `rent` varchar(255) DEFAULT NULL COMMENT '年租金百分比',
  `gain` varchar(255) DEFAULT NULL COMMENT '房价涨幅百分比',
  `payment` varchar(255) DEFAULT NULL COMMENT '首付比例',
  `yuegong` varchar(255) DEFAULT NULL COMMENT '月供金额美元',
  `type` varchar(255) DEFAULT NULL COMMENT '物业类型',
  `purpose` varchar(255) DEFAULT NULL COMMENT '置业目的',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `decoration` varchar(255) DEFAULT NULL COMMENT '装修情况',
  `property` varchar(255) DEFAULT NULL COMMENT '产权',
  `builddate` varchar(255) DEFAULT NULL COMMENT '交房日期',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `huxing` varchar(255) DEFAULT NULL COMMENT '户型',
  `room` varchar(255) DEFAULT NULL COMMENT '卧室数量',
  `vr` varchar(255) DEFAULT NULL COMMENT 'VR地址',
  `video` varchar(255) DEFAULT NULL COMMENT '视频',
  `photo` mediumtext COMMENT '照片',
  `content` mediumtext COMMENT '内容',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `sort` int(10) DEFAULT '0' COMMENT '权重',
  `show` tinyint(1) DEFAULT '1',
  `release` int(10) DEFAULT '0' COMMENT '发布id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `boume_cms_house`
--

INSERT INTO `boume_cms_house` (`id`, `cattype`, `title`, `sub_title`, `thumb`, `price`, `hprice`, `rent`, `gain`, `payment`, `yuegong`, `type`, `purpose`, `tag`, `decoration`, `property`, `builddate`, `address`, `huxing`, `room`, `vr`, `video`, `photo`, `content`, `addtime`, `sort`, `show`, `release`) VALUES
(1, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p><iframe height="480" width="820" src="http://share.utovr.com/021302833416.html" frameborder="0" allowfullscreen=""></iframe></p><p><br></p><p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 20, 1, 0),
(2, 2, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(3, 3, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(4, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(5, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(6, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(7, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(8, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(9, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(10, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(11, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(12, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0);
INSERT INTO `boume_cms_house` (`id`, `cattype`, `title`, `sub_title`, `thumb`, `price`, `hprice`, `rent`, `gain`, `payment`, `yuegong`, `type`, `purpose`, `tag`, `decoration`, `property`, `builddate`, `address`, `huxing`, `room`, `vr`, `video`, `photo`, `content`, `addtime`, `sort`, `show`, `release`) VALUES
(13, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(14, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(15, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(16, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(17, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(18, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(19, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(20, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(21, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0),
(22, 1, '佛州冬季花园夏之湖Summerlake Estate Homes', '占地面积：2023平米 0 5英亩◎使用面积：342平米', '/uploads/20190212/f8ac9b21fac42b515d1818136a76ae67.jpg', 55, 70, '8', '16', '30', '1285', '["独栋别墅","联排别墅"]', '["投资","自住"]', '["度假\\/自住房","允许贷款首付低"]', '精装修', '永久产权', '2015-07', '8001 Pond Apple Drive. Winter Garden FL 34787', '3-5卧室 2-3.5卫浴', '["2居","3居","4居","5居"]', '', '<iframe frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=c08343fbksb" allowFullScreen="true"></iframe>', '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。<br><br>夜晚降临的时候，迪士尼世界的魔法烟火点亮夜空，那美景让人放佛感觉置身于魔幻世界一般。<br><br>如果您计划购置房产的第一要素是为了孩子上学，那么这里更是您的不二之选。社区附近坐落着数所超过8分的小学，初中，高中，校车接送，安全安心，100%符合 了“把家安在学校旁”的购房理念。<br><br><span style="font-weight: bold;">社区 配套</span><br>社区还拥有一个漂亮的会所，社区游泳池，健身房，游戏房，私人船只下水道，篮球场，网球场，儿童游乐区，14-英尺宽散步和慢跑小径，居民可以一年四季享受适合所有年龄的娱乐活动。</p>', 1548943757, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `boume_house`
--

CREATE TABLE IF NOT EXISTS `boume_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `imgs` mediumtext,
  `content` mediumtext,
  `address` varchar(255) DEFAULT NULL,
  `client_id` int(10) DEFAULT '0',
  `agent_id` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `boume_house`
--

INSERT INTO `boume_house` (`id`, `title`, `thumb`, `imgs`, `content`, `address`, `client_id`, `agent_id`, `addtime`) VALUES
(1, '这是测试名字1', NULL, '[]', NULL, NULL, 2, 2, 1551757995),
(2, '测试名字2', NULL, '[]', NULL, NULL, 2, 2, 1551757995),
(3, '房产名称3', '/uploads/20190305/437e3654aca2ee8fde1fa6a003453341.jpg', '[{"status":"success","name":"1.png","size":68345,"percentage":100,"uid":1551759104413,"raw":{"uid":1551759104413},"url":"\\/uploads\\/20190305\\/3ee95c29e9da5497aaf442dbeae031db.png","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190305\\/3ee95c29e9da5497aaf442dbeae031db.png","filed":""}}},{"status":"success","name":"2.png","size":131936,"percentage":100,"uid":1551759104414,"raw":{"uid":1551759104414},"url":"\\/uploads\\/20190305\\/38f1c109eb2828472d6557832a8eb9c4.png","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190305\\/38f1c109eb2828472d6557832a8eb9c4.png","filed":""}}}]', '<p>夏之湖(Summerlake)是一个完善型社区，位于佛罗里达州奥兰多地区的冬季花园(Winter Garden)和温德米尔(Windermere), 迪斯尼公园向北3英里处，距离迪斯尼公园仅仅只有5分钟车程，交通购物方便，向北开车4分钟有Publix中型购物中心, 开车9分钟便可到达大型的购物中心Winter Garden Village,社区西面紧邻高速公路429出口。<br>夏之湖(Summerlake)社区环境优美，树林鳞次栉比，两个美丽的天然湖泊汉考克湖（Lake Hancock）和Lake Speer更增加了社区的自然魅力，其中汉考克湖（Lake Hancock）又被称为“滑水天堂”，湖面设有专业的滑水通道和跳板，自行车道和步行道蜿蜒交织在美丽的双湖湖畔，无论是热爱运动或是喜欢宁静，这里都是非常不错的选择。&nbsp;&nbsp;<br></p>', '8001 Pond Apple Drive. Winter Garden FL 34787', 2, 2, 1551757995);

-- --------------------------------------------------------

--
-- 表的结构 `boume_login_log`
--

CREATE TABLE IF NOT EXISTS `boume_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) DEFAULT NULL COMMENT '后台用户ID',
  `time` int(10) DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(100) DEFAULT NULL COMMENT '登录IP',
  `region` varchar(255) DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=76 ;

--
-- 转存表中的数据 `boume_login_log`
--

INSERT INTO `boume_login_log` (`id`, `admin_id`, `time`, `ip`, `region`) VALUES
(15, 1, 1546997707, '127.0.0.1', NULL),
(16, 1, 1547023183, '127.0.0.1', NULL),
(17, 1, 1547126941, '127.0.0.1', NULL),
(18, 1, 1547176018, '127.0.0.1', NULL),
(19, 1, 1547176187, '127.0.0.1', NULL),
(20, 1, 1547433538, '127.0.0.1', NULL),
(21, 1, 1547517636, '127.0.0.1', NULL),
(22, 1, 1547517865, '127.0.0.1', NULL),
(23, 1, 1547517999, '127.0.0.1', NULL),
(24, 1, 1547644580, '127.0.0.1', NULL),
(25, 1, 1547644780, '127.0.0.1', NULL),
(26, 1, 1547644999, '127.0.0.1', NULL),
(27, 1, 1547723800, '127.0.0.1', NULL),
(28, 1, 1549444434, '127.0.0.1', NULL),
(29, 1, 1549629778, '127.0.0.1', NULL),
(30, 1, 1549710268, '127.0.0.1', NULL),
(31, 1, 1549710921, '127.0.0.1', NULL),
(32, 1, 1549710921, '127.0.0.1', ''),
(33, 1, 1549710921, '127.0.0.1', ''),
(34, 1, 1549710921, '127.0.0.1', ''),
(35, 1, 1549710921, '127.0.0.1', ''),
(36, 1, 1549710921, '127.0.0.1', ''),
(37, 1, 1549710921, '127.0.0.1', ''),
(38, 1, 1549710921, '127.0.0.1', ''),
(39, 1, 1549710921, '127.0.0.1', ''),
(40, 1, 1549710921, '127.0.0.1', ''),
(41, 1, 1549710921, '127.0.0.1', ''),
(42, 1, 1549710921, '127.0.0.1', ''),
(43, 1, 1549710921, '127.0.0.1', ''),
(44, 1, 1549710921, '127.0.0.1', ''),
(45, 1, 1549710921, '127.0.0.1', ''),
(46, 1, 1549710921, '127.0.0.1', ''),
(47, 1, 1549710921, '127.0.0.1', ''),
(48, 1, 1549710921, '127.0.0.1', ''),
(49, 1, 1549710921, '127.0.0.1', ''),
(50, 1, 1549710921, '127.0.0.1', ''),
(51, 1, 1549760566, '127.0.0.1', NULL),
(52, 1, 1549761554, '127.0.0.1', NULL),
(53, 1, 1550024589, '127.0.0.1', NULL),
(54, 1, 1550648855, '127.0.0.1', NULL),
(55, 1, 1551585959, '127.0.0.1', NULL),
(56, 1, 1551838510, '127.0.0.1', NULL),
(57, 1, 1552441382, '127.0.0.1', NULL),
(58, 1, 1552534129, '116.8.37.53', NULL),
(59, 1, 1552535501, '116.8.37.53', NULL),
(60, 1, 1552557520, '116.8.37.53', NULL),
(61, 1, 1552622282, '124.227.42.29', NULL),
(62, 1, 1552623717, '124.227.42.29', NULL),
(63, 1, 1552627642, '124.227.42.29', NULL),
(64, 1, 1552789886, '124.227.42.29', NULL),
(65, 1, 1552791563, '124.227.42.29', NULL),
(66, 1, 1552883677, '124.227.42.29', NULL),
(67, 1, 1552891917, '124.227.42.29', NULL),
(68, 1, 1552893327, '124.227.42.29', NULL),
(69, 1, 1552896465, '124.227.42.29', NULL),
(70, 1, 1552980163, '124.227.42.29', NULL),
(71, 1, 1552981810, '124.227.42.29', NULL),
(72, 1, 1553038163, '124.227.42.29', NULL),
(73, 1, 1553043470, '124.227.42.29', NULL),
(74, 1, 1553068435, '124.227.42.29', NULL),
(75, 1, 1553149853, '124.227.42.29', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `boume_node`
--

CREATE TABLE IF NOT EXISTS `boume_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `module` varchar(255) DEFAULT NULL COMMENT '模块',
  `controller` varchar(255) DEFAULT NULL COMMENT '控制器',
  `action` varchar(255) DEFAULT NULL COMMENT '操作',
  `show` tinyint(1) DEFAULT '1' COMMENT '显示',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `pid` int(10) DEFAULT '0' COMMENT '上级',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `arrpid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=67 ;

--
-- 转存表中的数据 `boume_node`
--

INSERT INTO `boume_node` (`id`, `name`, `module`, `controller`, `action`, `show`, `sort`, `pid`, `icon`, `arrpid`) VALUES
(1, '权限管理', 'admin', '', '', 1, 1, 0, 'fas fa-shield-alt', '0'),
(2, '用户管理', 'admin', 'user', 'index', 1, 2, 1, '', '1'),
(3, '添加用户', 'admin', 'user', 'add', 1, 3, 2, '', '1,2'),
(4, '修改用户', 'admin', 'user', 'edit', 1, 4, 2, '', '1,2'),
(5, '删除用户', 'admin', 'user', 'del', 1, 5, 2, '', '1,2'),
(6, '锁定/激活', 'admin', 'user', 'lock', 1, 6, 2, '', '1,2'),
(7, '角色管理', 'admin', 'role', 'index', 1, 7, 1, '', '1'),
(8, '添加角色', 'admin', 'role', 'add', 1, 8, 7, '', '1,7'),
(9, '修改角色', 'admin', 'role', 'edit', 1, 9, 7, '', '1,7'),
(10, '删除角色', 'admin', 'role', 'del', 1, 10, 7, '', '1,7'),
(11, '角色权限', 'admin', 'role', 'auth', 1, 11, 7, '', '1,7'),
(12, '节点管理', 'admin', 'node', 'index', 1, 12, 1, '', '1'),
(13, '添加节点', 'admin', 'node', 'add', 1, 13, 12, '', '1,12'),
(14, '修改节点', 'admin', 'node', 'edit', 1, 14, 12, '', '1,12'),
(15, '删除节点', 'admin', 'node', 'del', 1, 15, 12, '', '1,12'),
(16, '模块', 'admin', NULL, NULL, 1, 16, 0, 'fas fa-th-large', '0'),
(17, '广告位', 'admin', 'ads', 'index', 1, 17, 16, NULL, '16'),
(18, '添加广告位', 'admin', 'ads', 'add', 1, 18, 17, NULL, '16,17'),
(19, '修改广告位', 'admin', 'ads', 'edit', 1, 19, 17, NULL, '16,17'),
(20, '删除广告位', 'admin', 'ads', 'del', 1, 20, 17, NULL, '16,17'),
(21, '广告管理', 'admin', 'ads', 'lists', 1, 21, 17, NULL, '16,17'),
(22, '添加广告', 'admin', 'ads', 'lists_add', 1, 22, 21, NULL, '16,17,21'),
(23, '修改广告', 'admin', 'ads', 'lists_edit', 1, 23, 21, NULL, '16,17,21'),
(24, '删除广告', 'admin', 'ads', 'lists_del', 1, 24, 21, NULL, '16,17,21'),
(25, '前台用户', 'admin', NULL, NULL, 1, 25, 0, 'fas fa-sitemap', '0'),
(26, '工人管理', 'admin', 'worker', 'index', 1, 26, 25, NULL, '25'),
(27, '添加工人', 'admin', 'worker', 'add', 1, 27, 26, NULL, '25,26'),
(28, '修改工人', 'admin', 'worker', 'edit', 1, 28, 26, '', '25,26'),
(29, '删除工人', 'admin', 'worker', 'del', 1, 29, 26, '', '25,26'),
(30, '客户管理', 'admin', 'client', 'index', 1, 30, 25, NULL, '25'),
(31, '添加客户', 'admin', 'client', 'add', 1, 31, 30, NULL, '25,30'),
(32, '修改客户', 'admin', 'client', 'edit', 1, 32, 30, '', '25,30'),
(33, '删除客户', 'admin', 'client', 'del', 1, 33, 30, '', '25,30'),
(34, '经纪人管理', 'admin', 'agent', 'index', 1, 34, 25, NULL, '25'),
(35, '添加经纪人', 'admin', 'agent', 'add', 1, 35, 34, NULL, '25,34'),
(36, '修改经纪人', 'admin', 'agent', 'edit', 1, 36, 34, '', '25,34'),
(37, '删除经纪人', 'admin', 'agent', 'del', 1, 37, 34, '', '25,34'),
(38, '内容管理', 'admin', NULL, NULL, 1, 38, 0, 'fas fa-list-ul', '0'),
(39, '经纪人', 'admin', 'cms_agent', 'index', 1, 39, 38, NULL, '38'),
(40, '添加经纪人', 'admin', 'cms_agent', 'add', 1, 40, 39, NULL, '38,39'),
(41, '修改经纪人', 'admin', 'cms_agent', 'edit', 1, 41, 39, '', '38,39'),
(42, '删除经纪人', 'admin', 'cms_agent', 'del', 1, 42, 39, '', '38,39'),
(43, '房源信息', 'admin', 'cms_house', 'index', 1, 43, 38, NULL, '38'),
(44, '添加房源', 'admin', 'cms_house', 'add', 1, 44, 43, NULL, '38,43'),
(45, '修改房源', 'admin', 'cms_house', 'edit', 1, 45, 43, '', '38,43'),
(46, '删除房源', 'admin', 'cms_house', 'del', 1, 46, 43, '', '38,43'),
(47, '装修人员', 'admin', 'cms_decorator', 'index', 1, 47, 38, NULL, '38'),
(48, '添加装修人员', 'admin', 'cms_decorator', 'add', 1, 48, 47, NULL, '38,47'),
(49, '修改装修人员', 'admin', 'cms_decorator', 'edit', 1, 49, 47, '', '38,47'),
(50, '删除装修人员', 'admin', 'cms_decorator', 'del', 1, 50, 47, '', '38,47'),
(51, '资讯文章', 'admin', 'cms_article', 'index', 1, 51, 38, NULL, '38'),
(52, '添加文章', 'admin', 'cms_article', 'add', 1, 52, 51, NULL, '38,51'),
(53, '修改文章', 'admin', 'cms_article', 'edit', 1, 53, 51, '', '38,51'),
(54, '删除文章', 'admin', 'cms_article', 'del', 1, 54, 51, '', '38,51'),
(55, '任务管理', 'admin', 'task', '', 1, 55, 0, 'fas fa-calendar-check', '0'),
(58, '添加任务', 'admin', 'task', 'add', 0, 58, 55, NULL, '55'),
(56, '进行中的', 'admin', 'task', 'runing', 1, 56, 55, NULL, '55'),
(57, '已停止的', 'admin', 'task', 'stop', 1, 57, 55, NULL, '55'),
(59, '编辑任务', 'admin', 'task', 'edit', 0, 59, 55, NULL, '55'),
(60, '任务统计', 'admin', 'task', 'tongji', 1, 60, 55, NULL, '55'),
(61, '待处理', 'admin', 'task', 'wait', 1, 61, 55, NULL, '55'),
(62, '查看详情', 'admin', 'task', 'detail', 0, 62, 55, NULL, '55'),
(63, '客户房产', 'admin', 'house', 'index', 1, 63, 16, NULL, '16'),
(64, '添加房产', 'admin', 'house', 'add', 1, 64, 63, NULL, '16,63'),
(65, '修改房产', 'admin', 'house', 'edit', 1, 65, 63, NULL, '16,63'),
(66, '删除房产', 'admin', 'house', 'del', 1, 66, 63, NULL, '16,63');

-- --------------------------------------------------------

--
-- 表的结构 `boume_role`
--

CREATE TABLE IF NOT EXISTS `boume_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `lock` tinyint(1) DEFAULT '0' COMMENT '锁定',
  `lock_msg` varchar(255) DEFAULT NULL COMMENT '锁定原因',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `boume_role`
--

INSERT INTO `boume_role` (`id`, `name`, `description`, `lock`, `lock_msg`) VALUES
(1, '系统管理员', '拥有系统最高权限', 0, ''),
(2, '系统运营', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `boume_task`
--

CREATE TABLE IF NOT EXISTS `boume_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) DEFAULT '0' COMMENT '客户ID',
  `agent_id` int(11) DEFAULT '0' COMMENT '经纪人id',
  `house_id` int(10) DEFAULT '0' COMMENT '关联房屋',
  `worker_id` int(10) DEFAULT '0' COMMENT '分配工人ID',
  `title` varchar(255) DEFAULT NULL COMMENT '任务标题',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `price` int(10) DEFAULT '0' COMMENT '每次价格',
  `type` tinyint(1) DEFAULT '1' COMMENT '1单一任务2持续性任务',
  `status` int(10) DEFAULT '0' COMMENT '0等待开始1运行中9已结束',
  `addtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `task_date` int(10) DEFAULT '0' COMMENT '单一任务日期安排',
  `num` int(10) DEFAULT '1' COMMENT '持续性任务每月数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `boume_task`
--

INSERT INTO `boume_task` (`id`, `client_id`, `agent_id`, `house_id`, `worker_id`, `title`, `description`, `price`, `type`, `status`, `addtime`, `task_date`, `num`) VALUES
(1, 0, 0, 0, 0, '除草', '注意边角落', 100, 2, 0, 1550813683, 0, 2),
(2, 3, 2, 3, 2, '每月5~15号清洗游泳池', '如果需要钥匙的话联系周先生', 100, 2, 0, 1551661278, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `boume_task_data`
--

CREATE TABLE IF NOT EXISTS `boume_task_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `house_id` int(10) DEFAULT '0',
  `agent_id` int(10) DEFAULT '0',
  `worker_id` int(10) DEFAULT '0',
  `client_id` int(10) DEFAULT '0',
  `task_id` int(10) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1单一任务2持续性任务',
  `photos` mediumtext COMMENT '工作照片',
  `content` mediumtext,
  `addtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `boume_task_data`
--

INSERT INTO `boume_task_data` (`id`, `house_id`, `agent_id`, `worker_id`, `client_id`, `task_id`, `title`, `description`, `price`, `type`, `photos`, `content`, `addtime`) VALUES
(1, 3, 2, 2, 2, 1, '每月5~15号清洗游泳池', '如果需要钥匙的话联系周先生', 100, 2, '[{"status":"success","name":"20170919114718214_2.jpg","size":308052,"percentage":100,"uid":1549941687166,"raw":{"uid":1549941687166},"url":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/4a9dee3971fc9604296312ca5b07c1dc.jpg","filed":""}}},{"status":"success","name":"20170919114718648.jpg","size":275262,"percentage":100,"uid":1549941687167,"raw":{"uid":1549941687167},"url":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/32b78f5ece6f6355f132d4a70c13c132.jpg","filed":""}}},{"status":"success","name":"20170919114719317.jpg","size":333463,"percentage":100,"uid":1549941687169,"raw":{"uid":1549941687169},"url":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/38eb50fe26ee8aa8ee61edd7501ba999.jpg","filed":""}}},{"status":"success","name":"20170919114719712.jpg","size":300599,"percentage":100,"uid":1549941687171,"raw":{"uid":1549941687171},"url":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/24602cd1a1923aa6afeb5cc664b16263.jpg","filed":""}}},{"status":"success","name":"20170919114719816.jpg","size":314469,"percentage":100,"uid":1549941687173,"raw":{"uid":1549941687173},"url":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","response":{"code":1,"msg":"上传成功","data":{"path":"\\/uploads\\/20190212\\/2a1dfb14bd8ea4e2263ee78c5364456d.jpg","filed":""}}}]', '已经处理完成', 1548943757);

-- --------------------------------------------------------

--
-- 表的结构 `boume_worker`
--

CREATE TABLE IF NOT EXISTS `boume_worker` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '工人姓名',
  `photo` varchar(255) DEFAULT NULL COMMENT '工人形象照片',
  `phone` varchar(255) DEFAULT NULL COMMENT '工人联系电话',
  `email` varchar(255) DEFAULT NULL COMMENT '工人邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '工人地址',
  `lock` tinyint(1) DEFAULT '0' COMMENT '锁定',
  `lock_msg` varchar(255) DEFAULT NULL COMMENT '锁定原因',
  `addtime` int(10) DEFAULT NULL,
  `edit_password_time` int(10) DEFAULT NULL COMMENT '密码修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `boume_worker`
--

INSERT INTO `boume_worker` (`id`, `username`, `password`, `name`, `photo`, `phone`, `email`, `address`, `lock`, `lock_msg`, `addtime`, `edit_password_time`) VALUES
(2, 'worker001', 'IXRucy/yG9WbL0tXAcayyA==', '工人姓名', '/uploads/20190210/55f58409d7aa25eb92b4bf11558e5435.png', '18070935901', 'boume@qq.com', '广西南宁西乡塘', 0, '', 1549765495, 1549766488);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
