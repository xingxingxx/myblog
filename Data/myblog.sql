-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `bbs_config`;
CREATE TABLE `bbs_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `bbs_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1,	'WEB_SITE_TITLE',	1,	'网站标题',	1,	'',	'网站标题前台显示标题',	1378898976,	1379235274,	1,	'踢街啥商城',	1),
(2,	'WEB_SITE_DESCRIPTION',	2,	'网站描述',	1,	'',	'网站搜索引擎描述',	1378898976,	1379235841,	1,	'踢街啥商城',	3),
(3,	'WEB_SITE_KEYWORD',	2,	'网站关键字',	1,	'',	'网站搜索引擎关键字',	1378898976,	1381390100,	1,	'踢街啥商城',	2),
(4,	'WEB_SITE_CLOSE',	4,	'关闭站点',	1,	'0:关闭,1:开启',	'站点关闭后其他用户不能访问，管理员可以正常访问',	1378898976,	1379235296,	1,	'1',	4),
(9,	'CONFIG_TYPE_LIST',	3,	'配置类型列表',	4,	'',	'主要用于数据解析和页面表单的生成',	1378898976,	1379235348,	1,	'0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举',	2),
(10,	'WEB_SITE_ICP',	1,	'网站备案号',	1,	'',	'设置在网站底部显示的备案号，如“沪ICP备12007941号-2',	1378900335,	1379235859,	1,	'粤ipc备2004',	6),
(65,	'PAY_TYPE',	3,	'支付方式',	6,	'',	'设置支付方式',	1435914780,	1435915072,	1,	'1:余额支付\r\n2:支付宝\r\n3:微信支付',	4),
(13,	'COLOR_STYLE',	4,	'后台色系',	1,	'default_color:默认\r\nblue_color:紫罗兰',	'后台颜色风格',	1379122533,	1379235904,	1,	'default_color',	7),
(20,	'CONFIG_GROUP_LIST',	3,	'配置分组',	4,	'',	'配置分组',	1379228036,	1384418383,	1,	'1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:微信\r\n6:商城',	4),
(21,	'HOOKS_TYPE',	3,	'钩子的类型',	4,	'',	'类型 1-用于扩展显示内容，2-用于扩展业务处理',	1379313397,	1379313407,	1,	'1:视图\r\n2:控制器',	6),
(22,	'AUTH_CONFIG',	3,	'Auth配置',	4,	'',	'自定义Auth.class.php类配置',	1379409310,	1379409564,	1,	'AUTH_ON:1\r\nAUTH_TYPE:2',	8),
(64,	'ORDER_STATUS',	3,	'订单状态',	6,	'',	'用户订单状态配置，只能增加，不能修改或者删除，否则容易导致状态混乱！',	1435809547,	1436153148,	1,	'0:未支付\r\n1:已支付\r\n2:已取消\r\n3:已完成',	3),
(25,	'LIST_ROWS',	0,	'后台每页记录数',	2,	'',	'后台数据每页显示记录数',	1379503896,	1380427745,	1,	'10',	10),
(26,	'USER_ALLOW_REGISTER',	4,	'是否允许用户注册',	3,	'0:关闭注册\r\n1:允许注册',	'是否开放用户注册',	1379504487,	1434442418,	1,	'1',	1),
(27,	'CODEMIRROR_THEME',	4,	'预览插件的CodeMirror主题',	4,	'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight',	'详情见CodeMirror官网',	1379814385,	1384740813,	1,	'ambiance',	3),
(28,	'DATA_BACKUP_PATH',	1,	'数据库备份根路径',	4,	'',	'路径必须以 / 结尾',	1381482411,	1381482411,	1,	'./Data/',	5),
(29,	'DATA_BACKUP_PART_SIZE',	0,	'数据库备份卷大小',	4,	'',	'该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M',	1381482488,	1381729564,	1,	'20971520',	7),
(30,	'DATA_BACKUP_COMPRESS',	4,	'数据库备份文件是否启用压缩',	4,	'0:不压缩\r\n1:启用压缩',	'压缩备份文件需要PHP环境支持gzopen,gzwrite函数',	1381713345,	1381729544,	1,	'1',	9),
(31,	'DATA_BACKUP_COMPRESS_LEVEL',	4,	'数据库备份文件压缩级别',	4,	'1:普通\r\n4:一般\r\n9:最高',	'数据库备份文件的压缩级别，该配置在开启压缩时生效',	1381713408,	1381713408,	1,	'9',	10),
(32,	'DEVELOP_MODE',	4,	'开启开发者模式',	4,	'0:关闭\r\n1:开启',	'是否开启开发者模式',	1383105995,	1383291877,	1,	'1',	11),
(33,	'ALLOW_VISIT',	3,	'不受限控制器方法',	0,	'',	'',	1386644047,	1386644741,	1,	'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',	0),
(34,	'DENY_VISIT',	3,	'超管专限控制器方法',	0,	'',	'仅超级管理员可访问的控制器方法',	1386644141,	1386644659,	1,	'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',	0),
(63,	'GOODS_ATTR',	3,	'商品属性',	6,	'',	'商品的详细属性配置',	1434597729,	1434597729,	1,	'1:颜色\r\n2:尺寸\r\n3:尺码',	2),
(36,	'ADMIN_ALLOW_IP',	2,	'后台允许访问IP',	4,	'',	'多个用逗号分隔，如果不配置表示不限制IP访问',	1387165454,	1387165553,	1,	'',	12),
(37,	'SHOW_PAGE_TRACE',	4,	'是否显示页面Trace',	4,	'0:关闭\r\n1:开启',	'是否显示页面Trace信息',	1387165685,	1387165685,	1,	'1',	1),
(45,	'WEB_SITE_TEL',	1,	'24小时服务热线',	1,	'',	'网站前台400电话',	1425887478,	1425887542,	1,	'0755-22969023',	5),
(46,	'WEB_SITE_ADDRESS',	1,	'公司地址',	1,	'',	'网站底部公司地址',	1425980001,	1425980292,	1,	'深圳市罗湖区南湖街道建设路南方证券大厦A座12层',	4),
(62,	'GOODS_TYPE',	3,	'商品类型',	6,	'',	'商品的3种购买方式',	1434523226,	1434523226,	1,	'1:普通商品\r\n2:限时抢购\r\n3:消费卡专区',	0);

DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rtid` int(10) unsigned NOT NULL,
  `ruid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `reply_time` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `rtid` (`rtid`),
  KEY `ruid` (`ruid`),
  CONSTRAINT `bbs_reply_ibfk_1` FOREIGN KEY (`rtid`) REFERENCES `bbs_topic` (`tid`),
  CONSTRAINT `bbs_reply_ibfk_2` FOREIGN KEY (`ruid`) REFERENCES `bbs_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bbs_section`;
CREATE TABLE `bbs_section` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `master_id` int(10) unsigned NOT NULL,
  `sign` varchar(255) NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `topic_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `bbs_section_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `bbs_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bbs_section` (`sid`, `name`, `master_id`, `sign`, `click`, `topic_count`) VALUES
(1,	'互联网新闻',	38,	'搜集最新互联网资讯',	133,	3153);

DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tsid` int(10) unsigned NOT NULL,
  `tuid` int(10) unsigned NOT NULL,
  `reply_count` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `thumb_img` char(38) NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tid`),
  KEY `tuid` (`tuid`),
  KEY `tsid` (`tsid`),
  CONSTRAINT `bbs_topic_ibfk_1` FOREIGN KEY (`tuid`) REFERENCES `bbs_user` (`uid`),
  CONSTRAINT `bbs_topic_ibfk_2` FOREIGN KEY (`tsid`) REFERENCES `bbs_section` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bbs_topic` (`tid`, `tsid`, `tuid`, `reply_count`, `title`, `content`, `thumb_img`, `create_time`, `click`, `update_time`, `status`) VALUES
(1,	1,	39,	34,	'腾讯已将微信开发公司逼到绝境',	'  <div class=\"shop_article_con\">\r\n	                        	自上个世纪90年代3D打印技术出现到现今， 3D打印技术以其惊人的发展速度震惊全球。看看下面这些“脑洞大开”的3D打印成果，你是否也会惊呼：有了3D打印，一切皆有可能！\r\n	                        </div>\r\n                        \r\n                        <div class=\"shop_article_con\">\r\n<!--                              <img src=\"../images/shop07.jpg\" width=\"737\" height=\"503\";/> -->\r\n       						\r\n       						\r\n                               <p class=\"MsoNormal\">\r\n	<b>【机械篇】<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b> </b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>1.</b><b>汽车<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b> </b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images3.3deazer.com/articles/2015/11/1447212704804.jpg@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	近日，由美国<span>Local Motors</span>公司设计制造的全球首款<span>3D</span>打印电动汽车“<span>Strati</span>”开始销售，<span>5.3</span>万美元就可以开回家。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	这款汽车从打印到组装仅需时<span>44</span>小时，整个车身上有<span>40</span>个零部件靠打印而成。汽车由电池提供动力，最高时速约<span>64</span>公里，充电一次可行驶<span>190</span>至<span>240</span>公里。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>2.</b><b>海军舰艇<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images2.3deazer.com/articles/2015/11/1447212782411.jpg@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	2014年<span>7</span>月<span>1</span>日，美国海军宣布正在实验利用<span>3D</span>打印技术快速制造舰艇零部件，并希望借此提升执行任务速度并降低成本。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>3.</b><b>火箭喷射器<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images2.3deazer.com/articles/2015/11/1447212795969.jpg@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	2014年<span>8</span>月<span>31</span>日，美国航空航天局（<span>NASA</span>）宣布用<span>3D</span>打印机成功制成了一个火箭喷射器。经测试，该火箭喷射器可以耐住火箭发射时产生的<span>3315</span>摄氏度的高温，并可以产生<span>20,000</span>磅的强劲推力。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>【医疗篇】<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b> </b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>1.</b><b>肝脏模型<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images2.3deazer.com/articles/2015/11/1447212808163.png@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	如图所示，这个肝脏模型是日本筑波大学和大日本印刷公司科研团队根据患者的<span>CT</span>数据于<span>2014</span>年<span>7</span>月用<span>3D</span>打印机制作出来的。整个肝脏的形状、内部血管及肿瘤位置都一目了然。医生可以根据模型进行术前研讨、也便于向患者说明治疗方法。该科研团队表示，他们还将推进对胰脏等器官模型制作技术的研发。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>2.</b><b>心脏模型<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images2.3deazer.com/articles/2015/11/1447212819701.png@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	这是水晶心？不是的，这是美国纽约长老会医院的埃米尔·巴查博士<span>(Dr.Emile Bacha)</span>根据一名<span>2</span>岁先天性心脏病患者的<span>MRI</span>数据打印出的<span>3D</span>心脏模型。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	根据这个模型，巴查医生在手术之前和他的团队一起对手术进行分析、判断及术前练习。使得原本需要做<span>3-4</span>次才能修复的心脏手术一次性成功，将患者的痛苦和手术风险降到最低。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>3.</b><b>血管<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images4.3deazer.com/articles/2015/11/1447212895591.jpg@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	你造吗？<span>3D</span>打印机已经可以打印出活体血管了？没错。虽然道德范畴里还没有被界定，但美国哈佛大学科研团队<span>2014</span>年已经打印出了<span>3D</span>仿真血管，中国也于<span>2015</span>年<span>10</span>月研发出<span>2</span>分钟即可打出<span>10</span>厘米长血管的<span>3D</span>生物血管打印机。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	该打印机将含种子细胞（干细胞、已分化细胞等）、生长因子和营养成分的“生物墨汁”结合其他材料层层“打印”出具有生物活性的仿真血管壁，然后经过培育处理，形成有生理功能的组织结构。听了这个后，你是不是会惊叹，那未来岂不是可以打印出活体人体器官？甚至活体人？简直不能再疯狂了<span>!</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>4.</b><b>脊椎<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images3.3deazer.com/articles/2015/11/1447212908901.png@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	2014年<span>8</span>月，北京大学研究团队成功地为一名<span>12</span>岁男孩植入了<span>3D</span>打印脊椎，这属全球首例。该植入骨髓可以跟现有骨骼非常好地结合，还能缩短病人的康复时间。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>【建筑篇】<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b> </b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>1.</b><b>房子：<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images3.3deazer.com/articles/2015/11/1447212924528.jpg@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	2015年<span>7</span>月<span>17</span>日上午，由<span>3D</span>打印的模块新材料别墅现身西安，建造方在三个小时就完成了别墅的搭建。据建造方介绍，这座精装别墅，只要摆上家具就能拎包入住。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>2.</b><b>雕塑<span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:center;\">\r\n	<img src=\"http://images1.3deazer.com/articles/2015/11/1447212935043.png@!water\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	日本大冢<span>OMI</span>陶业有限公司利用<span>3D</span>技术将现保存于和歌县高野山金刚峰寺的弘法大师的木雕像以陶制复制品的形式完美再现。这一作品的质感和触感不仅与实物几乎一模一样，而且还能够长久保存。<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n',	'',	1433154918,	0,	1433154918,	1),
(2,	1,	38,	2,	'腾讯已将微信开发公司逼到绝境',	'　许久之前，铁哥一直觉得微信可能是目前互联网企业中最可能开放的产品，眼看各家基于微信的第三方开发公司如火如荼做起来，不少公司也拿到了不少投资。如是下去，微信很可能会成为开发者的天堂，微信提供接口以及流量入口，开发者可据此开发出各色产品，商家可以从开发模式中增强自己品牌感以及带来可观销量，利益共享。铁哥甚至觉得移动电商的未来一定会在微信，就冲着他的开放。可是现在铁哥必须自己打脸，为之前的幼稚想法感到汗颜。\r\n　　4月16号之前异常低调的营销QQ突然一反常态高调，“营销QQ”微信版今天正式上线，新版本增强了“营销QQ”客户端对微信公众号的后台管理，企业可同步管理QQ端与微信公众号的客户，可调用形象展示、用户沟通、营销互动、在线销售、跟踪分析等多项功能，其中关于部分产品的介绍与某第三方开发公司介绍居然都一模一样。换句话说，第三方开发平台的所有产品微信都要涉及，再具体说，微信第三方公司的死期已到。\r\n　　基于微信的开发之所以如此火爆，除了微信本身使用人群以及产品等方面优势外，第三方公司真正功不可没。这些公司一方面仔细研究微信种种政策，对于微信任何政策都能快速理解并反映，一方面又在不断教育企业主使用微信开放平台。腾讯自身精力有限，教育市场的重任都交给了开发公司。目前使用微信开发模式的，大多数也都是第三方公司拉来的客户。在用户教育以及培养方面，第三方平台为微信做出了卓越贡献，本以为微信会知恩图报给予这些公司更多的有待，谁承想会是如此下场，令人心寒。\r\n　　铁哥之前与某开发公司团队沟通，问及是否会担心腾讯自己开发。大家均表示乐观态度，认为腾讯已是巨无霸不可能与第三方公司抢食，另外第三方公司其实也是替腾讯打工，将来微信电商起来，仅微信支付的费用就很可观。目前看，腾讯是不可能满足于小小的微信支付费用的。今天铁哥电话几位第三方开发团队，基本是哀声一片，有企业已经表示要直接与腾讯官方合作，不少团队都在考虑离开微信或者转型，但复出如此大心血就这样离开怎可甘心。\r\n　　此次挤兑第三方公司是以营销QQ为切入点，依靠QQ强大使用人群与营销QQ在客服方面的明显优势。第三方公司无论怎么努力其客服体系都无法与营销QQ相比，从用户习惯以及数据的分析以及客服团队的管理等层面都难以超越，于是不得不在其开发平台植入营销QQ的客服系统。此次升级营销QQ系统就直接将营销QQ与各种微信开发模板捆绑销售，买营销QQ的服务可增值获得微信开发各种模板，由此，第三方公司价值感存在感降到零点。\r\n　　铁哥一直在说是腾讯封闭，未指微信，此次逼死开发公司罪也不在微信。而是负责营销QQ是腾讯企业产品部门，非微信本意。微信火了之后腾讯各个部门都想利用微信赚一笔，各个产品都在打着微信的注意。张小龙或许可以扛得住微信平台本身的一些营销的压力，注重用户体验与效果，但对兄弟部门就无能为力了。微信更像是腾讯内部的一块唐僧人，哪个部门吃了就等于拿到了移动互联网门票，完成2014年业绩自然也不是问题。接下来张小龙能否抵挡得住内部的过分消费，对微信关乎生死。\r\n　　铁哥不禁想到腾讯的另一款依附微信的鸡肋产品——微信云。该产品除了使第三方开发公司拿到一张所谓的腾讯认证开发公司的名片外几乎未有任何意义，没见对认证公司有额外权限也未见对开发公司进行有效管理，当然也未见举办行业的聚会分享，这些都没有。因为微信云的本意是“开发公司将数据迁移在腾讯云服务之上”，绕了这么大弯子只是为了卖腾讯云服务器。再看他的运营团队，腾讯云团队，一切尽在不言中。最吊诡的是，微信云团队还在不断扩招认证入驻公司，并要在五月进一步扩张，随后营销QQ就宣布了新政策，显然这两个团队事先是无沟通协商的。腾讯内部管理混乱，已呈群雄逐鹿之势。\r\n　　不少微信第三方开发公司已经拿到了投资，现在看来投资人这笔钱八成是要泡汤了。腾讯内部以微信为核心，各部门各自为政抢占市场也已经到了不要脸不计后果的地步。第三方公司被腾讯逼死不重要，但如果微信被腾讯如此活活玩死那就好玩了。\r\n　　张小龙一定顶住。',	'',	1433154918,	0,	1433154918,	1),
(3,	1,	38,	32,	'腾讯已将微信开发公司逼到绝境',	'　许久之前，铁哥一直觉得微信可能是目前互联网企业中最可能开放的产品，眼看各家基于微信的第三方开发公司如火如荼做起来，不少公司也拿到了不少投资。如是下去，微信很可能会成为开发者的天堂，微信提供接口以及流量入口，开发者可据此开发出各色产品，商家可以从开发模式中增强自己品牌感以及带来可观销量，利益共享。铁哥甚至觉得移动电商的未来一定会在微信，就冲着他的开放。可是现在铁哥必须自己打脸，为之前的幼稚想法感到汗颜。\r\n　　4月16号之前异常低调的营销QQ突然一反常态高调，“营销QQ”微信版今天正式上线，新版本增强了“营销QQ”客户端对微信公众号的后台管理，企业可同步管理QQ端与微信公众号的客户，可调用形象展示、用户沟通、营销互动、在线销售、跟踪分析等多项功能，其中关于部分产品的介绍与某第三方开发公司介绍居然都一模一样。换句话说，第三方开发平台的所有产品微信都要涉及，再具体说，微信第三方公司的死期已到。\r\n　　基于微信的开发之所以如此火爆，除了微信本身使用人群以及产品等方面优势外，第三方公司真正功不可没。这些公司一方面仔细研究微信种种政策，对于微信任何政策都能快速理解并反映，一方面又在不断教育企业主使用微信开放平台。腾讯自身精力有限，教育市场的重任都交给了开发公司。目前使用微信开发模式的，大多数也都是第三方公司拉来的客户。在用户教育以及培养方面，第三方平台为微信做出了卓越贡献，本以为微信会知恩图报给予这些公司更多的有待，谁承想会是如此下场，令人心寒。\r\n　　铁哥之前与某开发公司团队沟通，问及是否会担心腾讯自己开发。大家均表示乐观态度，认为腾讯已是巨无霸不可能与第三方公司抢食，另外第三方公司其实也是替腾讯打工，将来微信电商起来，仅微信支付的费用就很可观。目前看，腾讯是不可能满足于小小的微信支付费用的。今天铁哥电话几位第三方开发团队，基本是哀声一片，有企业已经表示要直接与腾讯官方合作，不少团队都在考虑离开微信或者转型，但复出如此大心血就这样离开怎可甘心。\r\n　　此次挤兑第三方公司是以营销QQ为切入点，依靠QQ强大使用人群与营销QQ在客服方面的明显优势。第三方公司无论怎么努力其客服体系都无法与营销QQ相比，从用户习惯以及数据的分析以及客服团队的管理等层面都难以超越，于是不得不在其开发平台植入营销QQ的客服系统。此次升级营销QQ系统就直接将营销QQ与各种微信开发模板捆绑销售，买营销QQ的服务可增值获得微信开发各种模板，由此，第三方公司价值感存在感降到零点。\r\n　　铁哥一直在说是腾讯封闭，未指微信，此次逼死开发公司罪也不在微信。而是负责营销QQ是腾讯企业产品部门，非微信本意。微信火了之后腾讯各个部门都想利用微信赚一笔，各个产品都在打着微信的注意。张小龙或许可以扛得住微信平台本身的一些营销的压力，注重用户体验与效果，但对兄弟部门就无能为力了。微信更像是腾讯内部的一块唐僧人，哪个部门吃了就等于拿到了移动互联网门票，完成2014年业绩自然也不是问题。接下来张小龙能否抵挡得住内部的过分消费，对微信关乎生死。\r\n　　铁哥不禁想到腾讯的另一款依附微信的鸡肋产品——微信云。该产品除了使第三方开发公司拿到一张所谓的腾讯认证开发公司的名片外几乎未有任何意义，没见对认证公司有额外权限也未见对开发公司进行有效管理，当然也未见举办行业的聚会分享，这些都没有。因为微信云的本意是“开发公司将数据迁移在腾讯云服务之上”，绕了这么大弯子只是为了卖腾讯云服务器。再看他的运营团队，腾讯云团队，一切尽在不言中。最吊诡的是，微信云团队还在不断扩招认证入驻公司，并要在五月进一步扩张，随后营销QQ就宣布了新政策，显然这两个团队事先是无沟通协商的。腾讯内部管理混乱，已呈群雄逐鹿之势。\r\n　　不少微信第三方开发公司已经拿到了投资，现在看来投资人这笔钱八成是要泡汤了。腾讯内部以微信为核心，各部门各自为政抢占市场也已经到了不要脸不计后果的地步。第三方公司被腾讯逼死不重要，但如果微信被腾讯如此活活玩死那就好玩了。\r\n　　张小龙一定顶住。',	'',	1433154918,	0,	1433154918,	1);

DROP TABLE IF EXISTS `bbs_user`;
CREATE TABLE `bbs_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sex` bit(1) NOT NULL DEFAULT b'0',
  `sign` varchar(255) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `last_login_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `reg_ip` int(10) unsigned NOT NULL,
  `last_login_ip` int(10) unsigned NOT NULL,
  `login` int(10) unsigned NOT NULL DEFAULT '0',
  `token` char(32) NOT NULL,
  `avatar` char(35) NOT NULL,
  `avatar_min` char(39) NOT NULL,
  `birthday` int(10) unsigned NOT NULL,
  `qq` char(10) NOT NULL,
  `mobile` char(11) NOT NULL,
  `province` mediumint(8) unsigned NOT NULL,
  `city` mediumint(8) unsigned NOT NULL,
  `district` mediumint(8) unsigned NOT NULL,
  `community` mediumint(8) unsigned NOT NULL,
  `address` varchar(80) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bbs_user` (`uid`, `username`, `password`, `email`, `sex`, `sign`, `reg_time`, `last_login_time`, `status`, `reg_ip`, `last_login_ip`, `login`, `token`, `avatar`, `avatar_min`, `birthday`, `qq`, `mobile`, `province`, `city`, `district`, `community`, `address`) VALUES
(38,	'xingxingxx',	'6d465b01bcfb39bc2bd64d7e92bafafa',	'xx9815@qq.com',	CONV('0', 2, 10) + 0,	'',	1432805079,	1447670475,	1,	2130706433,	0,	39,	'bfe5f7dca520c2822e54fc7731a6b7b0',	'',	'',	0,	'',	'',	0,	0,	0,	0,	''),
(39,	'123456',	'6d465b01bcfb39bc2bd64d7e92bafafa',	'xx9815@qq.com2',	CONV('0', 2, 10) + 0,	'',	1433150947,	0,	0,	2130706433,	0,	0,	'07e124ee09ad062044492e1a6a04d8d0',	'',	'',	0,	'',	'',	0,	0,	0,	0,	''),
(40,	'123456545',	'2fece116f2c6786d904bb30e0c395307',	'xx9815@qq.com1',	CONV('0', 2, 10) + 0,	'',	1433153669,	0,	0,	2130706433,	0,	0,	'e3382cbf4faed31b294c66e9325fe731',	'',	'',	0,	'',	'',	0,	0,	0,	0,	''),
(41,	'1234564',	'8f497128c97e4b00f58c70752541d088',	'xx9815@qq.com5',	CONV('0', 2, 10) + 0,	'',	1433154511,	0,	0,	2130706433,	0,	0,	'e635e5c17650e4dcc5a9eacd207a5d3d',	'',	'',	0,	'',	'',	0,	0,	0,	0,	''),
(42,	'12345645',	'bc2616950c84e95fd87a069a3d383fe4',	'xx9815@qq.com54',	CONV('0', 2, 10) + 0,	'',	1433154672,	0,	0,	2130706433,	0,	0,	'252e871973ce5479ea4e7c689e0a21a7',	'',	'',	0,	'',	'',	0,	0,	0,	0,	''),
(43,	'12345654',	'06d82f493ce875a60d056e36e6242bfa',	'xx9815@qq.com22',	CONV('0', 2, 10) + 0,	'',	1433154918,	0,	0,	2130706433,	0,	0,	'163727e13256b7232878be81d857d9cd',	'',	'',	0,	'',	'',	0,	0,	0,	0,	'');

-- 2015-11-19 01:23:54
