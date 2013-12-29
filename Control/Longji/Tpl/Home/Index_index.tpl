<include file="Public:header" />

	<link href="__CSS__/flex.css" rel="stylesheet">
	<link href="__CSS__/video.css" rel="stylesheet">

	<script src="__JS__/modernizrCss3.js" type="text/javascript"></script>
	<script src="__JS__/video.js" type="text/javascript"></script>
	<script>videojs.options.flash.swf = "__SWF__/video.swf"</script>
	<script src="__JS__/flex.js" type="text/javascript"></script>


<!-- 首页标语横栏 -->
<div class="thewrap firstwordswrap">
<div class="thebox firstwordsbox">
	<div class="firstwordsblock">
		<div class="firstwords">	
			<LJ:block pos="firstwords" />
		</div>
	</div>
</div><!-- navbox end  -->
</div><!-- navwrap end  -->

<!-- banner横栏 -->
<div class="thewrap bannerwrap">
<div class="thebox bannerbox">
	<div class="bannerblock">
		<div class="banner flexslider">
			<ul class="slides">
				<LJ:flash flashid="1" />
			</ul>
		</div>
		<script>
			$(".flexslider").hide();
			$(".flexslider").fadeTo(1500,1);
			$(".slides img").click(function(){
				$(".flex-next").trigger("click");
			});

			$(window).load(function() {
				$('.flexslider').flexslider({
					animation: "slide",
					animationSpeed: 1200,
					slideshowSpeed: 7000, 
				});
			});
		</script>
	</div>
</div><!-- bannerbox end  -->
</div><!-- bannerwrap end  -->

<!-- 简介横栏：what we do -->
<div class="thewrap indexline1wrap">
<div class="thebox indexline1box">
	<div class="indexline1block">
		<h6 class="linetitle"><span>what we do</span></h6>
		<div class="itemset">

			<div class="item">
				<h6 class="itemtitle">Design</h6>
				<div class="cont" subbyte="100">
					<LJ:block pos="design" />
				</div>
			</div>

			<div class="item">
				<h6 class="itemtitle">Producting</h6>
				<div class="cont" subbyte="100">
					<LJ:block pos="design" />
				</div>
			</div>

			<div class="item">
				<div class="videobtn">
					<p>Watch a video</p>
				</div>

				<!-- thebigmask视频embed -->
				<div class="thebigmask">
					<div class="closebtn"></div>

					<div class="videoblock">
					</div>

					<div class="movielist">
						<LJ:list catid="13" id="r" field="name,title">
						<div class="movieitem selected">
							<span class="movieitembtn">{$r.title}</span>
							<div class="itemcont">
								<video class="video-js vjs-default-skin vjs-big-play-centered" controls="controls" preload="auto" data-setup="{}">
									<source src="__VIDEO__/{$r.name}" type='video/mp4' />
									<source src="__VIDEO__/clip.webm" type='video/webm' />
								</video>
							</div>
						</div>
						</LJ:list>
						

					</div>
				</div>
				<script>
					document.createElement('video');document.createElement('audio');
					//视频点击事件
					$(".videobtn").click(function(){
						$(".thebigmask").slideDown(700);
					});
					$(".thebigmask .closebtn").click(function(){
						$(".thebigmask").slideUp();
						$(".videoblock").html("");
						$(".thebigmask video:first").pause();

					});
					$(".movieitem").click(function(){
						$(".movieitem").removeClass("selected");
						$(this).addClass("selected");
					});
				</script>
			</div>

		</div>
	</div>
</div><!-- ____box end  -->	
</div><!-- ____wrap end  -->

<!-- 产品横栏：Products -->
<div class="thewrap indexline2wrap">
<div class="thebox indexline2box">
	<div class="indexline2block">
		<h6 class="linetitle"><span>new products</span></h6>
		<div class="itemset">
			<LJ:list name="Product" catid="4" id="r" field="image,title,url" limit="0,4">
			<div class="item">
				<a href="{$r.url}">
					<div class="pic"><img src="{$r.image}" alt=""></div>
					<div class="pictitle" subbyte="14">{$r.title}</div>
					<div class="pictext" subbyte="29">short text attached</div>
				</a>
			</div>
			</LJ:list>
			

		</div>
	</div>
</div><!-- ____box end  -->	
</div><!-- ____wrap end  -->

<include file="Public:footer" />

<script>
$(".nav li:first a").addClass("selected");
</script>