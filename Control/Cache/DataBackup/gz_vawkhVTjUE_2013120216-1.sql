-- System SQL Backup
-- Time:2013-12-02 16:18:45
-- 

--
-- GuozhiEBuild Table `gz_about`
-- 
DROP TABLE IF EXISTS `gz_about`;
CREATE TABLE `gz_about` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_account`
-- 
DROP TABLE IF EXISTS `gz_account`;
CREATE TABLE `gz_account` (
  `id` int(18) unsigned NOT NULL auto_increment,
  `username` varchar(30) default NULL COMMENT '用户名',
  `userpass` varchar(32) default '' COMMENT '管理员密码',
  `group` tinyint(1) default '1' COMMENT '管理员等级（1为内容管理员，9为系统管理员）',
  `status` tinyint(1) default '1' COMMENT '访问页面地址',
  `logintimes` int(6) unsigned NOT NULL COMMENT '登录次数',
  `lastlogin` int(13) unsigned NOT NULL COMMENT '最后登录',
  `lastip` int(13) unsigned NOT NULL COMMENT '最后登录ip',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_block`
-- 
DROP TABLE IF EXISTS `gz_block`;
CREATE TABLE `gz_block` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pos` char(30) NOT NULL default '',
  `name` varchar(30) NOT NULL default '',
  `lang` tinyint(1) unsigned NOT NULL default '0',
  `content` text,
  PRIMARY KEY  (`id`),
  KEY `pos` (`pos`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_blog`
-- 
DROP TABLE IF EXISTS `gz_blog`;
CREATE TABLE `gz_blog` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_category`
-- 
DROP TABLE IF EXISTS `gz_category`;
CREATE TABLE `gz_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `catname` varchar(30) NOT NULL default '',
  `catdir` varchar(30) NOT NULL default '',
  `parentdir` varchar(50) NOT NULL default '',
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `moduleid` tinyint(2) unsigned NOT NULL default '0',
  `module` char(24) NOT NULL default '',
  `arrparentid` varchar(255) NOT NULL default '',
  `arrchildid` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `keywords` varchar(100) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `ismenu` tinyint(1) unsigned NOT NULL default '0',
  `newwindows` tinyint(1) default '0' COMMENT '是否在新窗口打开',
  `hits` int(10) unsigned NOT NULL default '0',
  `image` varchar(100) NOT NULL default '',
  `url` varchar(150) NOT NULL default '',
  `template_list` varchar(20) NOT NULL default '',
  `template_show` varchar(20) NOT NULL default '',
  `pagesize` tinyint(2) unsigned NOT NULL default '0',
  `readgroup` varchar(100) NOT NULL default '',
  `listtype` tinyint(1) unsigned NOT NULL default '0',
  `lang` tinyint(1) unsigned NOT NULL default '0',
  `langmark` varchar(20) default '',
  `postgroup` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_config`
-- 
DROP TABLE IF EXISTS `gz_config`;
CREATE TABLE `gz_config` (
  `id` int(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL COMMENT '名称',
  `value` varchar(250) default NULL COMMENT '配置内容',
  `title` varchar(25) default NULL COMMENT '标题',
  `lang` smallint(3) default '0' COMMENT '语言表示',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_contact`
-- 
DROP TABLE IF EXISTS `gz_contact`;
CREATE TABLE `gz_contact` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `phone` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `message` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_field`
-- 
DROP TABLE IF EXISTS `gz_field`;
CREATE TABLE `gz_field` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `moduleid` tinyint(3) unsigned NOT NULL default '0',
  `field` varchar(20) NOT NULL default '',
  `name` varchar(30) NOT NULL default '',
  `tips` varchar(150) NOT NULL default '',
  `required` tinyint(1) unsigned NOT NULL default '0',
  `minlength` int(10) unsigned NOT NULL default '0',
  `maxlength` int(10) unsigned NOT NULL default '0',
  `pattern` varchar(255) NOT NULL default '',
  `errormsg` varchar(255) NOT NULL default '',
  `class` varchar(20) NOT NULL default '',
  `type` varchar(20) NOT NULL default '',
  `setup` mediumtext NOT NULL,
  `ispost` tinyint(1) unsigned NOT NULL default '0',
  `unpostgroup` varchar(60) NOT NULL default '',
  `listorder` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_lang`
-- 
DROP TABLE IF EXISTS `gz_lang`;
CREATE TABLE `gz_lang` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `no_order` int(11) NOT NULL,
  `mark` varchar(50) NOT NULL,
  `flag` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `newwindows` int(1) NOT NULL,
  `template` varchar(50) NOT NULL default '/Template/',
  `weburl` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_link`
-- 
DROP TABLE IF EXISTS `gz_link`;
CREATE TABLE `gz_link` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `status` tinyint(1) unsigned NOT NULL default '1',
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `logo` varchar(80) NOT NULL default '',
  `siteurl` varchar(150) NOT NULL default '',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `linktype` tinyint(1) unsigned NOT NULL default '1',
  `siteinfo` mediumtext NOT NULL,
  `lang` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_map`
-- 
DROP TABLE IF EXISTS `gz_map`;
CREATE TABLE `gz_map` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_menu`
-- 
DROP TABLE IF EXISTS `gz_menu`;
CREATE TABLE `gz_menu` (
  `id` int(5) unsigned NOT NULL auto_increment,
  `title` varchar(30) NOT NULL default '' COMMENT '标题名称',
  `module` varchar(20) default NULL COMMENT '模型名称',
  `action` varchar(20) default 'index' COMMENT '动作',
  `url` varchar(20) default '' COMMENT '其它链接',
  `parent` int(5) default '0' COMMENT '父菜单',
  `status` tinyint(1) default '1' COMMENT '状态',
  `types` tinyint(1) default '1' COMMENT '菜单类型（1为管理后台，2为会员后台）',
  `listorder` int(3) default '0' COMMENT '排序',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_module`
-- 
DROP TABLE IF EXISTS `gz_module`;
CREATE TABLE `gz_module` (
  `id` int(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) default '' COMMENT '模型名称(数据表)',
  `title` varchar(50) default '' COMMENT '模型介绍标题',
  `infield` varchar(500) default '*' COMMENT '模型引用字段',
  `demo` varchar(500) default NULL COMMENT '模型简介',
  `status` tinyint(1) default '1' COMMENT '是否显示',
  `listorder` int(3) default '0' COMMENT '排序',
  `lgtypes` varchar(20) default '' COMMENT '内容大类',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_page`
-- 
DROP TABLE IF EXISTS `gz_page`;
CREATE TABLE `gz_page` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `catid` int(3) default '0' COMMENT '栏目',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_people`
-- 
DROP TABLE IF EXISTS `gz_people`;
CREATE TABLE `gz_people` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_posid`
-- 
DROP TABLE IF EXISTS `gz_posid`;
CREATE TABLE `gz_posid` (
  `id` tinyint(2) unsigned NOT NULL auto_increment,
  `name` varchar(40) NOT NULL default '',
  `listorder` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_product`
-- 
DROP TABLE IF EXISTS `gz_product`;
CREATE TABLE `gz_product` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_slide`
-- 
DROP TABLE IF EXISTS `gz_slide`;
CREATE TABLE `gz_slide` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `flashfile` varchar(150) NOT NULL default '',
  `xmlfile` varchar(150) NOT NULL default '',
  `tpl` varchar(150) NOT NULL default '',
  `width` smallint(5) unsigned NOT NULL default '0',
  `height` smallint(5) unsigned NOT NULL default '0',
  `num` tinyint(2) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `lang` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_slide_data`
-- 
DROP TABLE IF EXISTS `gz_slide_data`;
CREATE TABLE `gz_slide_data` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fid` tinyint(3) unsigned default '0',
  `title` varchar(30) NOT NULL default '',
  `small` varchar(150) NOT NULL default '',
  `pic` varchar(150) NOT NULL default '',
  `link` varchar(150) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `data` text,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `lang` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_video`
-- 
DROP TABLE IF EXISTS `gz_video`;
CREATE TABLE `gz_video` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '0',
  `createtime` int(11) unsigned NOT NULL default '0',
  `updatetime` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) default '1' COMMENT '状态',
  `lang` tinyint(3) default '1' COMMENT '语言版本',
  `title` varchar(150) default '' COMMENT '标题',
  `keyword` varchar(150) default NULL COMMENT '关键字',
  `description` varchar(250) default NULL COMMENT '页面描述',
  `image` varchar(250) default NULL COMMENT '页面图片',
  `url` varchar(250) default NULL COMMENT '页面路径',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_visit_data`
-- 
DROP TABLE IF EXISTS `gz_visit_data`;
CREATE TABLE `gz_visit_data` (
  `id` int(18) unsigned NOT NULL auto_increment,
  `ip` int(13) unsigned NOT NULL COMMENT '初次访问IP地址',
  `intime` int(13) unsigned NOT NULL COMMENT '初次入站时间',
  `lasttime` int(13) unsigned NOT NULL COMMENT '最后一次入站时间',
  `color` varchar(15) default NULL COMMENT '显示器色彩',
  `screensize` varchar(25) default NULL COMMENT '显示器分辨率',
  `pvnum` tinyint(4) default '1' COMMENT '页面刷新数',
  `timezone` varchar(15) default NULL COMMENT '来源时区',
  `language` varchar(15) default NULL COMMENT '留言器语言',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- GuozhiEBuild Table `gz_visit_pvdata`
-- 
DROP TABLE IF EXISTS `gz_visit_pvdata`;
CREATE TABLE `gz_visit_pvdata` (
  `id` int(18) unsigned NOT NULL auto_increment,
  `bid` int(15) default NULL COMMENT '关联编号',
  `isfirst` tinyint(1) default '0' COMMENT '是否第一次访问',
  `pageurl` varchar(255) default '' COMMENT '访问页面地址',
  `referer` varchar(255) default '' COMMENT '访问页面地址',
  `inpvtime` int(13) unsigned NOT NULL COMMENT '页面访问时间',
  `pvnum` tinyint(4) default '1' COMMENT '页面刷新次数',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `gz_about` VALUES ('1','0','1385949229','1385971756','1','1','History of C-flying','','','/Attache/201312/529be851350ad.png','/index.php?m=About&a=detail&id=1','1','Donec tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at, aliquet non nisi. Sed euismod tellus vitae nisi sodales commodo. Cras et tortor vitae metus tempor dapibus aliquam sit amet quam. Donec a odio elementum lorem');
INSERT INTO `gz_about` VALUES ('2','0','1385949273','1385971835','1','1','Our products','','','/Attache/201312/529be8b0b43c7.png','/index.php?m=About&a=detail&id=2','1','<p>\r\n	Ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at, aliquet non nisi. Sed euismod tellus vitae nisi sodales commodo.&nbsp;\r\n</p>\r\n<p>\r\n	Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla. Quisque vitae fringilla sapien.ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mi sed felis suscipit dictum.&nbsp;\r\n</p>');
INSERT INTO `gz_about` VALUES ('3','0','1385949366','1385971258','1','1','We promis a GOOD quality!','','','/Attache/201312/529be8f4d0e2e.png','/index.php?m=About&a=detail&id=3','1','<p>\r\n	Sed euismod tellus vitae nisi sodales commodo. Cras et tortor vitae metus tempor dapibus aliquam sit amet quam. Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla.\r\n</p>\r\n<p>\r\n	<span>Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla. Quisque vitae fringilla sapien.ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mi sed felis suscipit dictum. Nam malesuada elit id metus euismod auctor. Vivamus placerat auctor libero eu sollicitudin.</span>\r\n</p>');
INSERT INTO `gz_account` VALUES ('1','admin','7fef6171469e80d32c0559f88b377245','9','1','9','1385962749','2130706433');
INSERT INTO `gz_block` VALUES ('1','design','首页design','1','One of China’s most efficient manufacturers of flat glass.One of China’s most efficient manufacturers of flat glass.One of China’s most efficient manufacturers of flat glass.One of China’s most efficient manufacturers of flat glass.');
INSERT INTO `gz_block` VALUES ('2','producting','首页producting','1','One of China’s most efficient manufacturers of flat glass.One of China’s most efficient manufacturers of flat glass.One of China’s most efficient manufacturers of flat glass.One of China’s most efficient manufacturers of flat glass. ');
INSERT INTO `gz_block` VALUES ('3','firstwords','首页标语横栏','1','A Professional Group Engaged In The Manufacture And Sells Glasswork with good quality. <br>\r\nWe Expect To Have A Sincere Cooperation With You！');
INSERT INTO `gz_block` VALUES ('4','contact1','contact页面联系方式','1','<p style=\"font-weight: bold;\">Mr. Wang</p>\r\n						<p>Emaiil: mail@mail.com</p>\r\n						<p>Skype: Skype12345</p>\r\n						<p>QQ: 1234 5678</p>\r\n						<p>Phone: +86 531 1234 5678</p>');
INSERT INTO `gz_block` VALUES ('5','phone and email','页面底部phone和email','1','<p>Office Phone: <span>+86 531 1234 5678</span></p>\r\n				<p>Phone: <span>+86 1234 5678</span></p>\r\n				<p>Skype: <span>skypeskype</span></p>\r\n				<p>Email: <span>email@email.com</span></p>');
INSERT INTO `gz_blog` VALUES ('1','0','1385950928','1385952196','1','1','We have a NEW website!','','','/Attache/201312/529bef1622505.png','/index.php?m=Blog&a=detail&id=1','2','<p>\r\n	Donec tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at, aliquet non nisi. Sed euismod tellus vitae nisi sodales commodo. Cras et tortor vitae metus tempor dapibus aliquam sit amet quam. Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla. Quisque vitae fringilla sapien.ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mi sed felis suscipit dictum. Nam malesuada elit id metus euismod auctor. Vivamus placerat auctor libero eu sollicitudin.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `gz_blog` VALUES ('2','0','1385951002','1385952189','1','1','We have a NEW website!','','','/Attache/201312/529bef3566858.png','/index.php?m=Blog&a=detail&id=2','2','<p>\r\n	Cras et tortor vitae metus tempor dapibus aliquam sit amet quam. Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla. Quisque vitae fringilla sapien.ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mi sed felis suscipit dictum. Nam malesuada elit id metus euismod auctor. Vivamus placerat auctor libero eu sollicitudin.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `gz_category` VALUES ('1','ABOUT','ABOUT','','0','10','About','0','1','0','','','','0','1','0','0','./Attache/201312/529be7449ad15.png','/index.php?m=About&a=index&id=1','list','','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('2','BLOG','BLOG','','0','11','Blog','0','2','0','','','','1','1','0','0','','/index.php?m=Blog&a=index&id=2','list','show','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('3','FACTORY','FACTORY','','0','1','Page','0','3','0','','','','2','1','0','0','','/index.php?m=Page&a=index&id=3','','factory','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('4','PRODUCTS','PRODUCTS','','0','12','Product','0','4,5,6,7,8','0','','','','3','1','0','0','','/index.php?m=Product&a=index&id=4','index','show','0','','1','1','cn','');
INSERT INTO `gz_category` VALUES ('5','Borosilicate1','Borosilicate1','PRODUCTS/','4','12','Product','0,4','5','0','','','','0','1','0','0','','/index.php?m=Product&a=index&id=5','index','show','0','','1','1','cn','');
INSERT INTO `gz_category` VALUES ('6','Borosilicate2','Borosilicate2','PRODUCTS/','4','12','Product','0,4','6','0','','','','1','1','0','0','','/index.php?m=Product&a=index&id=6','list','show','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('7','Borosilicate3','Borosilicate3','PRODUCTS/','4','12','Product','0,4','7','0','','','','2','1','0','0','','/index.php?m=Product&a=index&id=7','list','show','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('8','Borosilicate4','Borosilicate4','PRODUCTS/','4','12','Product','0,4','8','0','','','','3','1','0','0','','/index.php?m=Product&a=index&id=8','list','show','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('9','CONTACT','CONTACT','','0','17','Contact','0','9','0','','','','4','1','0','0','','/index.php?m=Contact&a=index&id=9','list','','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('10','map','map','','0','14','map','0','10','0','','','','0','0','0','0','','/index.php?m=map&a=index&id=10','list','','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('12','people','people','','0','16','people','0','12','0','','','','0','0','0','0','','/index.php?m=people&a=index&id=12','','','0','','0','1','cn','');
INSERT INTO `gz_category` VALUES ('13','video','video','','0','18','video','0','13','0','','','','0','0','0','0','','/index.php?m=video&a=index&id=13','','','0','','0','1','cn','');
INSERT INTO `gz_config` VALUES ('1','site_name','龙吉网络','网站名称','1');
INSERT INTO `gz_config` VALUES ('2','site_url','http://longji.zhangye520.com','网站网址','1');
INSERT INTO `gz_config` VALUES ('3','logo','./Public/Images/logo.gif','网站LOGO','1');
INSERT INTO `gz_config` VALUES ('4','site_email','web@jnlongji.com','站点邮箱','1');
INSERT INTO `gz_config` VALUES ('5','seo_title','龙吉网络','网站标题','1');
INSERT INTO `gz_config` VALUES ('6','seo_keywords','网站建设','关键词','1');
INSERT INTO `gz_config` VALUES ('7','seo_description','济南最佳网站建设','网站简介','1');
INSERT INTO `gz_contact` VALUES ('2','0','1385964459','0','1','1','',NULL,NULL,NULL,NULL,'9','pdf','123456','123@123.com','dfsfsdfsd');
INSERT INTO `gz_contact` VALUES ('3','0','1385965947','0','1','1','',NULL,NULL,NULL,NULL,'9','lily','654321','123@123.com','ggfgfbh');
INSERT INTO `gz_contact` VALUES ('4','0','1385966124','0','1','1','',NULL,NULL,NULL,NULL,'9','catid','12345678','123@123.com','fgnhfgn');
INSERT INTO `gz_contact` VALUES ('6','0','1385970206','0','1','1','',NULL,NULL,NULL,NULL,'9','','','123@123.com','dsfdfs');
INSERT INTO `gz_field` VALUES ('1','9','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('3','9','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'1\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('4','10','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('5','10','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('6','11','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('7','11','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'1\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('8','1','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('9','1','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'1\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('10','12','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('11','12','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'1\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('17','14','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('18','14','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'1\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('19','16','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('20','16','content','content','','0','0','0','0','','','editor','array (\n  \'default\' => \'\',\n  \'height\' => \'280\',\n  \'enablesaveimage\' => \'1\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('21','17','catid','catid','','0','0','0','0','','','catid','','1','','0','1','0');
INSERT INTO `gz_field` VALUES ('22','17','name','name','','0','0','0','0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)','1','','0','1','0');
INSERT INTO `gz_field` VALUES ('23','17','phone','phone','','0','0','0','0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)','1','','0','1','0');
INSERT INTO `gz_field` VALUES ('24','17','email','email','','0','0','0','0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)','1','','0','1','0');
INSERT INTO `gz_field` VALUES ('25','17','message','message','','0','0','0','0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n)','1','','0','1','0');
INSERT INTO `gz_field` VALUES ('26','18','catid','catid','','0','0','0','0','','','catid','','0','','0','1','0');
INSERT INTO `gz_field` VALUES ('27','18','name','name','','0','0','0','0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)','0','','0','1','0');
INSERT INTO `gz_lang` VALUES ('1','中文','1','0','cn','','','0','./Control/Longji/Tpl/Home/','','');
INSERT INTO `gz_link` VALUES ('1','1','0','1385966503','your link 01','','http://www.baidu.com','0','0','','1');
INSERT INTO `gz_link` VALUES ('2','1','0','1385966515','your link 02','','http://www.baidu.com','0','0','','1');
INSERT INTO `gz_link` VALUES ('3','1','0','1385966542','your link 03','','http://www.baidu.com','0','0','','1');
INSERT INTO `gz_link` VALUES ('4','1','0','1385966556','your link 04','','http://www.baidu.com','0','0','','1');
INSERT INTO `gz_map` VALUES ('1','0','1385956212','1385956633','1','1','You are welcome to call us!','','','/Attache/201312/529c03aaae3ce.png','/index.php?m=map&a=detail&id=1','10','<p>\r\n	Ut vitae sapien nec sem lacinia euismod. Mauris quis mauris odio, a ultricies eros pharetra nisi facilisis. Fusce sagittis cursus risus, et hendrerit magna pellentesque vel. Mauris quis mauris odio, a ultricies eros pharetra nisi facilisis. Fusce sagittis cursus risus, et hendrerit magna pellentesque vel. Ut vitae sapien nec sem lacinia euismod. Mauris quis mauris odio, a ultricies eros pharetra nisi facilisis. Fusce sagittis cursus risus, et hendrerit magna pellentesque vel. Mauris quis mauris odio, a ultricies eros pharetra nisi facilisis. Fusce sagittis cursus risus, et hendrerit magna pellentesque vel.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `gz_menu` VALUES ('1','系统开发','Tool','index','','0','1','1','99');
INSERT INTO `gz_menu` VALUES ('2','开发配置','Tool','install','','1','1','1','90');
INSERT INTO `gz_menu` VALUES ('3','菜单管理','Menu','index','','1','1','1','2');
INSERT INTO `gz_menu` VALUES ('4','添加菜单','Menu','add','','3','1','1','1');
INSERT INTO `gz_menu` VALUES ('5','模型管理','Module','index','','1','1','1','1');
INSERT INTO `gz_menu` VALUES ('6','新增模型','Module','add','','5','1','1','1');
INSERT INTO `gz_menu` VALUES ('7','系统功能','System','index','','0','1','1','1');
INSERT INTO `gz_menu` VALUES ('8','栏目管理','Category','index','','7','1','1','2');
INSERT INTO `gz_menu` VALUES ('9','系统设置','System','config','','7','1','1','1');
INSERT INTO `gz_menu` VALUES ('10','数据统计','Visit','index','','0','1','1','98');
INSERT INTO `gz_menu` VALUES ('11','添加栏目','Category','add','','8','1','1','0');
INSERT INTO `gz_menu` VALUES ('12','留言询价','Page','index','','0','1','1','97');
INSERT INTO `gz_menu` VALUES ('13','内容管理','Content','index','','0','1','1','3');
INSERT INTO `gz_menu` VALUES ('14','统计概况','Visit','index','','10','1','1','1');
INSERT INTO `gz_menu` VALUES ('15','在线用户','Visit','online','','14','1','1','2');
INSERT INTO `gz_menu` VALUES ('16','来路地区','Visit','area','','10','1','1','3');
INSERT INTO `gz_menu` VALUES ('17','来路浏览器','Visit','browser','','10','1','1','4');
INSERT INTO `gz_menu` VALUES ('18','搜索引擎','Visit','soso','','10','1','1','5');
INSERT INTO `gz_menu` VALUES ('19','搜索关键字','Home/Visit','keyword','','10','1','1','6');
INSERT INTO `gz_menu` VALUES ('20','客户评论','Feedback','index','','12','1','1','0');
INSERT INTO `gz_menu` VALUES ('28','语言版本','Language','index','','1','1','1','1');
INSERT INTO `gz_menu` VALUES ('29','新增语言','Language','add','','28','1','1','0');
INSERT INTO `gz_menu` VALUES ('30','友情链接','Link','index','','7','1','1','3');
INSERT INTO `gz_menu` VALUES ('31','添加链接','Link','add','','30','1','1','0');
INSERT INTO `gz_menu` VALUES ('32','区块管理','Block','index','','7','1','1','4');
INSERT INTO `gz_menu` VALUES ('33','新增区块','Block','add','','32','1','1','0');
INSERT INTO `gz_menu` VALUES ('34','幻灯片管理','Slide','index','','7','1','1','5');
INSERT INTO `gz_menu` VALUES ('38','账号管理','Account','index','','1','1','1','5');
INSERT INTO `gz_menu` VALUES ('39','数据备份','Database','index','','7','1','1','6');
INSERT INTO `gz_menu` VALUES ('40','其它设置','System','oconfig','','9','1','1','0');
INSERT INTO `gz_menu` VALUES ('41','配置参数','System','configadd','','2','0','1','0');
INSERT INTO `gz_menu` VALUES ('88','About','about','index','moduleid=10','13','1','1','0');
INSERT INTO `gz_menu` VALUES ('89','添加信息','about','add','moduleid=10','88','1','1','0');
INSERT INTO `gz_menu` VALUES ('90','Blog','blog','index','moduleid=11','13','1','1','0');
INSERT INTO `gz_menu` VALUES ('91','添加信息','blog','add','moduleid=11','90','1','1','0');
INSERT INTO `gz_menu` VALUES ('92','Product','product','index','moduleid=12','13','1','1','0');
INSERT INTO `gz_menu` VALUES ('93','添加信息','product','add','moduleid=12','92','1','1','0');
INSERT INTO `gz_menu` VALUES ('97','map','map','index','moduleid=14','13','1','1','0');
INSERT INTO `gz_menu` VALUES ('98','添加信息','map','add','moduleid=14','97','1','1','0');
INSERT INTO `gz_menu` VALUES ('101','people','people','index','moduleid=16','13','1','1','0');
INSERT INTO `gz_menu` VALUES ('102','添加信息','people','add','moduleid=16','101','1','1','0');
INSERT INTO `gz_menu` VALUES ('103','Contact','Contact','index','moduleid=17','12','1','1','0');
INSERT INTO `gz_menu` VALUES ('104','添加信息','contact','add','moduleid=17','103','1','1','0');
INSERT INTO `gz_menu` VALUES ('105','video','video','index','moduleid=18','13','1','1','0');
INSERT INTO `gz_menu` VALUES ('106','添加信息','video','add','moduleid=18','105','1','1','0');
INSERT INTO `gz_module` VALUES ('1','Page','单页模型','*',NULL,'1','0','page');
INSERT INTO `gz_module` VALUES ('10','About','About','*','','1','0','content');
INSERT INTO `gz_module` VALUES ('11','Blog','Blog','*','','1','0','content');
INSERT INTO `gz_module` VALUES ('12','Product','Product','*','','1','0','content');
INSERT INTO `gz_module` VALUES ('14','map','map','*','','1','0','content');
INSERT INTO `gz_module` VALUES ('16','people','people','*','','1','0','content');
INSERT INTO `gz_module` VALUES ('17','Contact','Contact','*','','1','0','guestbook');
INSERT INTO `gz_module` VALUES ('18','video','video','*','','1','0','content');
INSERT INTO `gz_page` VALUES ('3','0','1385951850','1385951955','1','1','FACTORY','','','','3','/index.php?m=Page&a=detail&id=3','<p>\r\n	<img src=\"/Attache/201312/529bf28994331.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n	tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at, aliquet non nisi. Sed euismod tellus vitae nisi sodales commodo. Cras et tortor vitae metus tempor dapibus aliquam sit amet quam. Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla. Quisque vitae fringilla sapien.ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mi sed felis suscipit dictum. Nam malesuada elit id metus euismod auctor. Vivamus placerat auctor libero eu sollicitudin.\r\n</p>\r\n<p>\r\n	<img src=\"/Attache/201312/529bf2c083c8f.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n	Donec tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at, aliquet non nisi. Sed euismod tellus vitae nisi sodales commodo. Cras et tortor vitae metus tempor dapibus aliquam sit amet quam. Donec a odio elementum lorem tempus mattis vitae vitae ante. Mauris pharetra sodales nulla. Quisque vitae fringilla sapien.ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mi sed felis suscipit dictum. Nam malesuada elit id metus euismod auctor. Vivamus placerat auctor libero eu sollicitudin.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `gz_people` VALUES ('1','0','1385957052','1385959922','1','1','people1','','','','/index.php?m=people&a=detail&id=1','12','<strong>Mr. Shen</strong><br />\r\nEmaiil: mail@mail.com<br />\r\nSkype: Skype12345<br />\r\nQQ: 1234 5678<br />\r\nPhone: +86 531 1234 5678<br />');
INSERT INTO `gz_people` VALUES ('2','0','1385959829','1385959838','1','1','people2','','','','/index.php?m=people&a=detail&id=2','12','<strong>Mr. Wang</strong><strong></strong><br />\r\n<span>Emaiil: mail@mail.com</span><br />\r\n<span>Skype: Skype12345</span><br />\r\n<span>QQ: 1234 5678</span><br />\r\n<span>Phone: +86 531 1234 5678</span>');
INSERT INTO `gz_people` VALUES ('3','0','1385959841','1385960067','1','1','people3','','','','/index.php?m=people&a=detail&id=3','12','<strong>Mr. Zhang</strong><strong></strong><br />\r\n<span>Emaiil: mail@mail.com</span><br />\r\n<span>Skype: Skype12345</span><br />\r\n<span>QQ: 1234 5678</span><br />\r\n<span>Phone: +86 531 1234 5678</span>');
INSERT INTO `gz_people` VALUES ('4','0','1385959852','1385960059','1','1','people4','','','','/index.php?m=people&a=detail&id=4','12','<strong>Mr. Liu</strong><br />\r\n<span>Emaiil: mail@mail.com</span><br />\r\n<span>Skype: Skype12345</span><br />\r\n<span>QQ: 1234 5678</span><br />\r\n<span>Phone: +86 531 1234 5678</span>');
INSERT INTO `gz_product` VALUES ('1','0','1385952795','1385952845','1','1','Borosilicate glass tube','','','/Attache/201312/529bf6490a218.png','/index.php?m=Product&a=detail&id=1','5','tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.');
INSERT INTO `gz_product` VALUES ('2','0','1385952848','1385952873','1','1','Colored borosilicate glass tube','','','/Attache/201312/529bf667d94b6.png','/index.php?m=Product&a=detail&id=2','5','tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.');
INSERT INTO `gz_product` VALUES ('3','0','1385952877','1385953384','1','1','borosilicate glass rod','','','/Attache/201312/529bf6839a219.png','/index.php?m=Product&a=detail&id=3','5','tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.');
INSERT INTO `gz_product` VALUES ('4','0','1385953420','1385953444','1','1','Borosilicate glass tube','','','/Attache/201312/529bf8a207b3b.png','/index.php?m=Product&a=detail&id=4','6','tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.');
INSERT INTO `gz_product` VALUES ('5','0','1385953447','1385953463','1','1','borosilicate glass rod','','','/Attache/201312/529bf8b5a2d66.png','/index.php?m=Product&a=detail&id=5','6','tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.');
INSERT INTO `gz_product` VALUES ('6','0','1385971583','1385971621','1','1','Borosilicate glass tube','','','/Attache/201312/529c3fa3b4716.png','/index.php?m=Product&a=detail&id=6','7','<span style=\"font-family:monospace;font-size:medium;line-height:normal;\">tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.</span>');
INSERT INTO `gz_product` VALUES ('7','0','1385971624','1385971648','1','1','borosilicate glass rod','','','/Attache/201312/529c3fbe25970.png','/index.php?m=Product&a=detail&id=7','8','<span style=\"font-family:monospace;font-size:medium;line-height:normal;\">tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.</span>');
INSERT INTO `gz_product` VALUES ('8','0','1385971652','1385971708','1','1','Borosilicate glass tube','','','/Attache/201312/529c3ffabce8f.png','/index.php?m=Product&a=detail&id=8','8','<span style=\"font-family:monospace;font-size:medium;line-height:normal;\">tincidunt ipsum et nisl laoreet id mattis ante mollis. Aliquam in libero orci, vitae pharetra erat. Nunc lorem est, feugiat et dapibus at.</span>');
INSERT INTO `gz_slide` VALUES ('1','首页幻灯片','','','./Control/Longji/Tpl/Home/Slide_index.tpl','0','0','8','1','1');
INSERT INTO `gz_slide_data` VALUES ('1','1','one','','/Attache/201312/529bdfa57469b.png','','long long long Text with a link.','','0','1','1');
INSERT INTO `gz_slide_data` VALUES ('2','1','two','','/Attache/201312/529bdfdea4261.png','','long long long Text with a link.','','1','1','1');
INSERT INTO `gz_slide_data` VALUES ('3','1','three','','/Attache/201312/529bdffe71731.png','','Text with a link.','','2','1','1');
INSERT INTO `gz_slide_data` VALUES ('4','1','four','','/Attache/201312/529be03431963.png','','Text with a link.','','3','1','1');
INSERT INTO `gz_slide_data` VALUES ('5','1','five','','/Attache/201312/529be058a60d1.png','','long long long Text with a link.','','4','1','1');
INSERT INTO `gz_slide_data` VALUES ('6','1','six','','/Attache/201312/529be074c8a95.png','','Text with a link.','','5','1','1');
INSERT INTO `gz_slide_data` VALUES ('7','1','seven','','/Attache/201312/529be094996ff.png','','Text with a link.','','6','1','1');
INSERT INTO `gz_slide_data` VALUES ('8','1','eight','','/Attache/201312/529be0b2560d5.png','','Text with a link.','','7','1','1');
INSERT INTO `gz_video` VALUES ('1','0','1385967067','1385967090','1','1','video1','','','','/index.php?m=video&a=detail&id=1','13','clip.mp4');
INSERT INTO `gz_video` VALUES ('2','0','1385967092','1385967102','1','1','video2','','','','/index.php?m=video&a=detail&id=2','13','clip.mp4');
INSERT INTO `gz_video` VALUES ('3','0','1385967104','1385967114','1','1','video3','','','','/index.php?m=video&a=detail&id=3','13','clip.mp4');
INSERT INTO `gz_video` VALUES ('4','0','1385967117','1385967129','1','1','video4','','','','/index.php?m=video&a=detail&id=4','13','clip.mp4');
INSERT INTO `gz_video` VALUES ('5','0','1385967230','1385967241','1','1','video5','','','','/index.php?m=video&a=detail&id=5','13','clip.mp4');
INSERT INTO `gz_video` VALUES ('6','0','1385967244','1385967256','1','1','video6','','','','/index.php?m=video&a=detail&id=6','13','clip.mp4');