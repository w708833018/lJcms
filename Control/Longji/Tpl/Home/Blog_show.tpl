<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">Blog</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="oneblog">	
		<div class="title">{$title} <span class="date">{$r.createtime|date="d",###}<span class="month">{$r.createtime|date="m",###}</span>{$r.createtime|date="Y",###}</span></div>
		<script>month2str(".date .month");</script>
		<div class="content">
			<img src="{$image}" alt="">
			<p>{$content}</p>

		</div>
		<script>
			$(".content img").fadeTo(1000,1);
			$(".content table").removeAttr("style");
		</script>
	</div><!-- oneblog end -->
	<script></script>
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />
<script>
$(".nav li:eq(2) a").addClass("selected");
</script>