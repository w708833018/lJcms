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

-- ----------------------------
-- Records of gz_account
-- ----------------------------
INSERT INTO `gz_account` VALUES ('1', 'admin', '7fef6171469e80d32c0559f88b377245', '9', '1', '7', '1378773804', '2147483647');

-- ----------------------------
-- Table structure for `gz_block`
-- ----------------------------
DROP TABLE IF EXISTS `gz_block`;
CREATE TABLE `gz_block` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pos` char(30) NOT NULL default '',
  `name` varchar(30) NOT NULL default '',
  `lang` tinyint(1) unsigned NOT NULL default '0',
  `content` text,
  PRIMARY KEY  (`id`),
  KEY `pos` (`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `gz_category`
-- ----------------------------
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `gz_config`
-- ----------------------------
DROP TABLE IF EXISTS `gz_config`;
CREATE TABLE `gz_config` (
  `id` int(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL COMMENT '名称',
  `value` varchar(250) default NULL COMMENT '配置内容',
  `title` varchar(25) default NULL COMMENT '标题',
  `lang` smallint(3) default '0' COMMENT '语言表示',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_config
-- ----------------------------
INSERT INTO `gz_config` VALUES ('1', 'site_name', '龙吉网络', '网站名称', '1');
INSERT INTO `gz_config` VALUES ('2', 'site_url', 'http://longji.zhangye520.com', '网站网址', '1');
INSERT INTO `gz_config` VALUES ('3', 'logo', './Public/Images/logo.gif', '网站LOGO', '1');
INSERT INTO `gz_config` VALUES ('4', 'site_email', 'web@jnlongji.com', '站点邮箱', '1');
INSERT INTO `gz_config` VALUES ('5', 'seo_title', '龙吉网络', '网站标题', '1');
INSERT INTO `gz_config` VALUES ('6', 'seo_keywords', '网站建设', '关键词', '1');
INSERT INTO `gz_config` VALUES ('7', 'seo_description', '济南最佳网站建设', '网站简介', '1');

-- ----------------------------
-- Table structure for `gz_field`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `gz_lang`
-- ----------------------------
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

-- ----------------------------
-- Records of gz_lang
-- ----------------------------
INSERT INTO `gz_lang` VALUES ('1', '中文', '1', '0', 'cn', '', '', '0', './Control/Longji/Tpl/Home/', '', '');

-- ----------------------------
-- Table structure for `gz_link`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

INSERT INTO `gz_menu` VALUES ('1', '系统开发', 'Tool', 'index', '', '0', '1', '1', '99');
INSERT INTO `gz_menu` VALUES ('2', '开发配置', 'Tool', 'install', '', '1', '1', '1', '90');
INSERT INTO `gz_menu` VALUES ('3', '菜单管理', 'Menu', 'index', '', '1', '1', '1', '2');
INSERT INTO `gz_menu` VALUES ('4', '添加菜单', 'Menu', 'add', '', '3', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('5', '模型管理', 'Module', 'index', '', '1', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('6', '新增模型', 'Module', 'add', '', '5', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('7', '系统功能', 'System', 'index', '', '0', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('8', '栏目管理', 'Category', 'index', '', '7', '1', '1', '2');
INSERT INTO `gz_menu` VALUES ('9', '系统设置', 'System', 'config', '', '7', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('10', '数据统计', 'Visit', 'index', '', '0', '1', '1', '98');
INSERT INTO `gz_menu` VALUES ('11', '添加栏目', 'Category', 'add', '', '8', '1', '1', '0');
INSERT INTO `gz_menu` VALUES ('12', '留言询价', 'Page', 'index', '', '0', '1', '1', '97');
INSERT INTO `gz_menu` VALUES ('13', '内容管理', 'Content', 'index', '', '0', '1', '1', '3');
INSERT INTO `gz_menu` VALUES ('14', '统计概况', 'Visit', 'index', '', '10', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('15', '在线用户', 'Visit', 'online', '', '14', '1', '1', '2');
INSERT INTO `gz_menu` VALUES ('16', '来路地区', 'Visit', 'area', '', '10', '1', '1', '3');
INSERT INTO `gz_menu` VALUES ('17', '来路浏览器', 'Visit', 'browser', '', '10', '1', '1', '4');
INSERT INTO `gz_menu` VALUES ('18', '搜索引擎', 'Visit', 'soso', '', '10', '1', '1', '5');
INSERT INTO `gz_menu` VALUES ('19', '搜索关键字', 'Home/Visit', 'keyword', '', '10', '1', '1', '6');
INSERT INTO `gz_menu` VALUES ('20', '客户评论', 'Feedback', 'index', '', '12', '1', '1', '0');
INSERT INTO `gz_menu` VALUES ('28', '语言版本', 'Language', 'index', '', '1', '1', '1', '1');
INSERT INTO `gz_menu` VALUES ('29', '新增语言', 'Language', 'add', '', '28', '1', '1', '0');
INSERT INTO `gz_menu` VALUES ('30', '友情链接', 'Link', 'index', '', '7', '1', '1', '3');
INSERT INTO `gz_menu` VALUES ('31', '添加链接', 'Link', 'add', '', '30', '1', '1', '0');
INSERT INTO `gz_menu` VALUES ('32', '区块管理', 'Block', 'index', '', '7', '1', '1', '4');
INSERT INTO `gz_menu` VALUES ('33', '新增区块', 'Block', 'add', '', '32', '1', '1', '0');
INSERT INTO `gz_menu` VALUES ('34', '幻灯片管理', 'Slide', 'index', '', '7', '1', '1', '5');
INSERT INTO `gz_menu` VALUES ('38', '账号管理', 'Account', 'index', '', '1', '1', '1', '5');
INSERT INTO `gz_menu` VALUES ('39', '数据备份', 'Database', 'index', '', '7', '1', '1', '6');
INSERT INTO `gz_menu` VALUES ('40', '其它设置', 'System', 'oconfig', '', '9', '1', '1', '0');
INSERT INTO `gz_menu` VALUES ('41', '配置参数', 'System', 'configadd', '', '2', '0', '1', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `gz_module` VALUES ('1', 'Page', '单页模型', '*', null, '1', '0', 'page');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gz_posid`;
CREATE TABLE `gz_posid` (
  `id` tinyint(2) unsigned NOT NULL auto_increment,
  `name` varchar(40) NOT NULL default '',
  `listorder` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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

