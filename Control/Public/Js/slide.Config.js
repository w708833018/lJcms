var config =
{
	dlID:"slide",//幻灯片的ID名称
	width:300,//幻灯片的宽度
	height:250,//幻灯片的高度
	isImgSize:"on",//表示图片可否拉伸,on为可拉伸off为不可拉伸
	stTitle:190,//幻灯片标题宽度
	isStTitle:"on",//是否允许自动调整标题的宽度
	isDtInnerTags:"a",//a表示标签使用链接（可点击跳转)，span表示标题不可点击只能使用。注：此属性只有a和span两个值，其他无效。
	isDtInnerTagsNewOpen:1,//0表示在本窗口打开，1表示打开新窗口
	stTitleBg:"000",//幻灯片标题背景颜色，16进制表示，不用写#号，可缩写，与CSS写法一致。
	stTitleOpacite:0.8,//幻灯片标题背景的透明度 值取范围：0.1~0.9之间
	isSlideTitle:"on",//是否开启幻灯标题效果，on为开启off为禁止
	isSlideMouseEffects:"off",//表示鼠标激活按钮后的切换效果是否开启。
	rightPitch:10,//页码右边距像素
	pitch:3,//页码空隙像素
	isPlay:"on",//是否自动播放，on为播放off为禁止
	Ms:5000,//幻灯切换毫秒数
	fadeInMs:1000,//渐显时间，注渐显毫秒数不能大于幻灯切换毫秒数。
	isSlideTitleMs:200,//幻灯标题效果时长豪秒数
	isOnMouse:2,//是否开启鼠标选则页码,0关闭,1鼠标点击,2鼠标移动
	hoverMs:230,//鼠标移上页码按钮时触发效果所需要的时间  注:当isOnMouse设置为2鼠标移动时,才起作用
	pageNumBg:"this" //当前页码选中的按钮类名
	
};