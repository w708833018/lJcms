
function Calendar( target, args ){
	
	//闭包
    var _self = this;
	
	//控件依附的对象
	this._target = (target instanceof jQuery) ? target : jQuery(target)
	
	//参数
	var _args = jQuery.extend({
		width  : 250 ,//日历宽度
		height : 200 , //日历高度
		split  : '-' ,
		weekText : '日,一,二,三,四,五,六' ,
		preMonthText : '<' ,
		nextMonthText : '>'
	} , args || {});	
		
	//日历对象
	var _dom;
	
	/**
	* 构造日历dom
	*/
	this.initDom = function(){
		var weekText = [];
		weekText = _args.weekText.split(',');
		 _dom = jQuery(
			'<div class="ws-calendar" >'+
				'<div class="clenTit"> </div>'+
				'<div class="clenHead">'+
					'<span class="week">' + weekText[0] + '</span>'+
					'<span class="week">' + weekText[1] + '</span>'+
					'<span class="week">' + weekText[2] + '</span>'+
					'<span class="week">' + weekText[3] + '</span>'+
					'<span class="week">' + weekText[4] + '</span>'+
					'<span class="week">' + weekText[5] + '</span>'+
					'<span class="week">' + weekText[6] + '</span>'+
				'</div>'+
				'<div class="clenBody"></div>'+
			'</div>'
		);
	}
	
	/**
	* 构造日历
	* @getCalendar()
	* @year年份
	* @month月份
	*/
	this.getCalendar = function( year,month ){
		
		var tempDate = new Date( year ,month-1,1);
		var firstDay = tempDate.getDay(); //某年某月的第一天是星期几
			tempDate = new Date( year, month, 0 ); 
		var allDate = tempDate.getDate(); //返回本月共有多少天,同时避免复杂的判断润年不润年
		
		var clenTit = _dom.find('.clenTit');
		var ym = '<span class="ym">' + year + '年' + month + '月' + '</span>';
		var btn = '<a href="#none" class="prev">' + _args.preMonthText+ '</a><a href="#none"  class="next">' + _args.nextMonthText+ '</a>';
		clenTit.html(ym+btn)
		
		//绑定上一月/下一月事件
		clenTit.find('.next').click(function(){
			_self.changeMon.next(jQuery(this)); 
		}).end().find('.prev').click(function(){
			_self.changeMon.prev(jQuery(this)); 
		});
		
		clenTit.find('.ym').click(function(){
			_self.getYear();
		});
		
		var _spWarp = jQuery('<div class="inner"></div>');
		var day = 1; //日期，默认是1号
		var d = new Date();
			d = d.getDate();
		for( var i=0; i<42; i++ ){	
			var span = jQuery('<div class="d"></div>');
			if( i>= firstDay && i-firstDay < allDate){	
				span.addClass('has');
				if( day==d){
					span.addClass('cur')
				}
				span.html(day);
				day ++;
			}
			span.appendTo( _spWarp );
		}
		_dom.find('.clenBody').html(_spWarp);
		
		_dom.find('div.has').click(function(){
			var _this = jQuery(this);
			if( _args.onClick ){
			     dateStr= _self.getDate(_this.text());
				_args.onClick( _dom, dateStr);
			}
			else{
				_self._target.val( _self.getDate(_this.text()));
			}
			jQuery(this).addClass('cur').siblings().removeClass('cur');
			_dom.hide();
			return false;
		});
		this.cssReset();
	}
	
	/**
	* 设置样式
	*/
	this.cssReset = function(){
		var top    = this._target.offset().top;
		var left   = this._target.offset().left;
			left   = left + this._target.width() +5;
		var widthSpan    = Math.floor((_args.width-14)/7);
		var heightSpan   = Math.floor((_args.height-44)/7);
		var paddingLeft =(_args.width-(widthSpan+2)*7)/2 + 1;
		var marginTop  =(_args.height-(heightSpan+2)*7-30)/2 + 1;
		_dom.css({'top':top,'left':left,'width':_args.width,'height':_args.height });
		_dom.find('span.week,div.d').css({'width':widthSpan, 'height':heightSpan});
		_dom.find('.inner').css({'paddingLeft':paddingLeft}).end()
			.find('.clenHead').css({'paddingLeft':paddingLeft,'marginTop':marginTop,'lineHeight':heightSpan+'px'});
	}

	/**
	* 获取年月日，传入当天的号数，组合成当天的’年月日‘返回。
	* @d 号
	*/
	this.getDate = function(d){
		var split = _args.split;
		var ym = jQuery.trim(_dom.find('.clenTit .ym').text());
		var y = parseInt(ym);
		var m = ym.split('年')
			m = String(parseInt(m[1]));
		if(m.length<2){ m = '0' + m}
		if(d.length<2){ d = '0' + d}
		var ymd = y + split + m + split + d;
		return ymd;
	}
	
	/**
	* 获取年份，配合getMonth()方法，目的是选择年月日。
	*/
	this.getYear = function(){
		
		//切换年月时，显示年份和月份的图层
		var layerDom = jQuery('<div class="layer"><div class="yrs"></div><div class="switch"><span class="swL">&lt;</span><span class="swR">&gt;</span></div></div>')
		var date = new Date();        
		var year = date.getFullYear(); 
		
		//生成年份
		var _getData = function(y){
			layerDom.find('.yrs').html('');
			for( var i=-15; i<=12; i++){
				var _year = y+i;
				var span = jQuery('<span class="yr">'+ _year+'</span>');
				span.appendTo(layerDom.find('.yrs'));
			}
			layerDom.find('span.yr').click(function(){
				var _y = jQuery(this).text();
				_self.getMonth(_y);
				return false;
			});
		}
		
		//上一页
		layerDom.find('.swL').click(function(){
			var thatYear = parseInt(layerDom.find('span.yr').eq(0).text());
			_getData(thatYear-13);
		});
		
		//下一页
		layerDom.find('.swR').click(function(){
			var thatYear = parseInt(layerDom.find('span.yr:last').text());
			_getData(thatYear+16);
		});
		
		_getData(year);
		layerDom.css({width:_args.width, height:_args.height});
		layerDom.appendTo(_dom);
	}
	
	/**
	* 获取月份，并调用getCalendar(),重新构造日历。
	* @_y 传入年份
	*/
	this.getMonth = function(_y){
		var layerDom = _dom.find('.layer').html('');
		for( var i=1; i<=12; i++){
			var span = jQuery('<span class="m">'+ i +'</span>');
			span.appendTo(layerDom);
		}
		layerDom.find('span.m').click(function(){
			var _m = jQuery(this).text();
			_self.getCalendar( _y, _m );
			layerDom.remove();
			return false;
		});
	}
	
	/**
	* 月份切换
	* @next() 下一月份
	* @next() 上一月份
	*/
	this.changeMon={
		next:function(){
			var YM =  _dom.find('.ym').html();
			var year = parseInt(YM);
			var month = YM.split(year+'年');
				month =  parseInt(month[1]);
			month++;
			if( month == 13){
				month =1;
				year++;
			}
			 _dom.find('.ym').html( year + '年' + month + '月' );
			_self.getCalendar(year,month);
		},
		prev:function(){
			var YM =  _dom.find('.ym').html();
			var year = parseInt(YM);
			var month = YM.split(year+'年');
				month =  parseInt(month[1]);
			month--;
			if( month == 0){
				month =12;
				year--;
			}
			 _dom.find('.ym').html( year + '年' + month + '月' );
			_self.getCalendar(year,month);
		}
	}
	
	/**
	* 绑定目标对象的点击事件
	*/
	this.bindTarget = function(){
		this._target.click(function(){
			_dom.insertAfter(_self._target);
			_dom.show();
		});
	}
	
	/**
	* 日历点击事件
	*/
	this.onClick = function(callback){
		_args.onClick = callback;
	};
	
	/**
	* 显示日历
	*/
	this.show = function(){
		_dom.show();
	}
	
	/**
	* 隐藏日历
	*/
	this.hide = function(){
		_dom.hide();
	}
	
	/**
	* 删除日历
	*/
	this.remove = function(){
		_dom.remove();
	};
	
	this.init = function(){
		var d_Date = new Date();        //系统时间对象  
		var d_y = d_Date.getFullYear(); //完整的年份,千万不要使用getYear,firfox不支持  
		var d_m = d_Date.getMonth()+1;  //注意获取的月份比实现的小1  
		this.initDom();
		this.getCalendar(d_y,d_m);
		this.bindTarget();
	}
	
	this.init();
}
