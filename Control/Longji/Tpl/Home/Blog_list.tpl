<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">Blog</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="blogblock">	
		<div class="blogset">
			<LJ:list catid="2" id="r" field="createtime,title,content,url,image">
			<div class="item blog">
				<div class="timebox"><span class="date">{$r.createtime|date="d",###}<span class="month">{$r.createtime|date="m",###}</span><br>{$r.createtime|date="Y",###}</span></div>
				<h6><a href="{$r.url}">{$r.title}</a></h6>
				<div class="text">
					<p>{$r.content}</p>
				</div>
				<div class="readmore"><a href="{$r.url}">readmore...</a></div>
			</div>
			</LJ:list>
			
		</div>
		<script>
			$(".blogset").fadeTo(500,1);
			
			//日期逐个显示
			month2str(".month");
		</script>
		<div class="pagechange">
			{$pages}
		</div>
	</div><!-- blogblock end -->
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />

<script>
$(".nav li:eq(2) a").addClass("selected");
</script>

