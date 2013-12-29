<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">About Us</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="aboutartblock ofa">	
		<div class="fll half">
			<!-- 文章插入到class="art"这里 -->
			<div class="artset">
				<LJ:list catid="1" id="r" field="title,content">
				<div class="art">
					<h6 class="title">{$r.title}</h6>
					<div class="text">
						<p>{$r.content}</p>	
					</div>
				</div>
				</LJ:list>

			</div>
			<script>
				//点击标题隐藏文本
				$(".art .title").click(function(){
					$(this).next(".text").slideToggle(500);
				});
			</script>
		</div>
		<div class="picshow fll">
			<!-- 图片插入到“picset” -->
			<div class="picset">
				<LJ:list catid="1" id="r">
				<div class="pic"><img src="{$r.image}"></div>
				<div><span class="pictitle">{$r.title}</span></div>
				</LJ:list>
			</div>
			<script>
					$(".picset img").load(function(){
						$(this).fadeTo(1000,1);
					});
			</script>
		</div>
	</div>
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />

<script>
$(".nav li:eq(1) a").addClass("selected");
</script>