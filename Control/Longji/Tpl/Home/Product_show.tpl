<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">Our Products</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="oneproduct">	
		<div class="title">Borosilicate glass tube <span class="back">Back</span></div>
		<script>
			$(".back").click(function(){
				history.go(-1);
			});
		</script>
		<div class="content">
			<img src="{$image}" alt="">
			<p>{$content}</p>
			
		</div>
		<script>
			$(".content img").fadeTo(1000,1);
			$(".content table").removeAttr("style");
		</script>
	</div><!-- block end -->
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />

<script>
$(".nav li:eq(4) a").addClass("selected");
</script>
