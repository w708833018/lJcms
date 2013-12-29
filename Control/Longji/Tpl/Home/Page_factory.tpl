<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">A Glance Of The Factory</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="factoryblock">	
		<div class="factory">
			<LJ:list catid="3" id="r" field="content">
			<p>{$r.content}</p> <br>
			</LJ:list>

		</div>
		<script>
			//文章图片淡入
			$(".factory img").load(function(){
				$(this).fadeTo(1000,1);
			});
		</script>
	</div><!-- block end -->
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />
<script>
$(".nav li:eq(3) a").addClass("selected");
</script>