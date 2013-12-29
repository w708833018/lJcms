// JKcustom.js 2013.09.02
// hope you have a sunny day, young man! 
// liujie LongJi ShandongJinan

//视频设置
videojs.options.flash.swf = "swf/video.swf";
//runs on load
	//图片拖动无效
		document.ondragstart = function (){return false;};


//document.ready
	$(document).ready(function(){
		//汉字字符串截取
			var subbytelength = $("[subbyte]").length;
			for(i=0; i< subbytelength;i++){
				the = $("[subbyte]:eq("+i+")");
				length = the.attr("subbyte");
				length *= 2;
				source = String(the.html());

				lengthofthehtml = source.length + source.replace(/[\u0000-\u00ff]/g, "").length;//得到字节数量
				if( lengthofthehtml > length){
					// alert("if条件成立进入语句块");
					source = source.substr(0,length).replace(/([^\x00-\xff])/g,"\x241 ")//双字节字符替换成两个
						.substr(0,length)//截取长度
						.replace(/[^\x00-\xff]$/,"")//去掉临界双字节字符
						.replace(/([^\x00-\xff]) /g,"\x241");//还原
					source += "...";
					the.html(source);
				};
			};//汉字字符串截取end

		//数字月份转字符串

			//backtotop
				$("body").append("<div id='backtotop'>↑</div>");
				$("#backtotop").hide();
				$("#backtotop").css({position: "fixed",right: "50px",bottom: "20px",color: "#fff",background: "#333",background: "rgba(0,0,0,0.7)",height: "30px",width: "30px","line-height": "30px","text-align": "center","font-size": "12px","border-radius":"50%","cursor":"pointer","z-index":"999"});

				$(window).scroll(function(){
					if ($(window).scrollTop()>400){$("#backtotop").fadeIn(400);}
					else{$("#backtotop").fadeOut(500);}
				});

				$("#backtotop").click(function(){
				$('body,html').animate({scrollTop:0},500);
				});//backtotop end


	});

	//今年是
	function showtheyear(mark){
		var today= new Date();
		date = today.getFullYear();
		$(mark).text(date);
	};




