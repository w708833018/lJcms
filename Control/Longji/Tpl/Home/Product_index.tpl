<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">Our Products</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="productblock">	

		<div class="productset">
			<LJ:subcat catid="4" id="r">
			<!-- 产品类块，含标题和若干产品项 -->
			<div class="item sortblock">
				<!-- 标题h6 -->
				<h6 class="sorttitle">{$r.catname}</h6>
				<!-- 产品组 prodset -->
				<div class="prodset">
					<LJ:list name="Product" catid="$r['id']" id="r1" field="image,url,title,content">
					<div class="item prod">
						<div class="pic"><img src="{$r1.image}" alt=""></div>
						<div class="text">
							<h6 class="title"><a href="{$r1.url}">{$r1.title}</a></h6>
							<p subbyte="75">{$r1.content}</p>
						</div>
					</div>
					</LJ:list>
				</div>
			</div>
			</LJ:subcat>
			
		<script>
			$(".pic").fadeTo(1200,1);
			$(".sorttitle").click(function(){
				$(this).next("div").slideToggle(500);
			});
		</script>
		</div><!-- productset end -->

	</div><!-- block end -->
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />
<script>
$(".nav li:eq(4) a").addClass("selected");
</script>
