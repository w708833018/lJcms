<include file="Public:header" />

<!-- 子页总标题 -->
<div class="thewrap leadtitlewrap">
<div class="thebox leadtitlebox">
	<div class="leadtitle">Contact</div>
</div><!-- leadtitlebox end  -->
</div><!-- leadtitlewrap end  -->

<div class="thewrap artwrap">
<div class="thebox artbox">
	<div class="contactblock">	
		<div class="contact">
		<LJ:list catid="10" id="r" field="title,content,image">
			<h6>{$r.title}</h6>
			<div class="contactinfo">
				<p><img src="{$r.image}" alt=""></p>
				<p>
					{$r.content}
				</p>
		</LJ:list>
				<div class="detailsset">
					<LJ:list catid="12" id="r" field="content">
					<div class="details">
						<p>{$r.content}</p>
					</div>
					</LJ:list>
				</div>

			</div>

			<h6>You can also leave us a message!</h6>
			<div class="formdiv">
				<form id="form1" name="form1" method="post" action="{:U('saveinfo')}">
				<input type="hidden" name="catid" value="{$catid}" />
				<input type="hidden" name="moduleid" value="17" />
				<input type="hidden" name="lang" value="{$lang}" />
					<!--[if lt IE 9]><p class="inputtabset">
						<span>Name:</span>
						<span>Phone:</span>
						<span>Email:</span>
					</p><![endif]-->
					<p>
						<input name="name" type="text" placeholder="Name">
						<input name="phone" type="text" placeholder="Phone">
						<input name="email" type="text" placeholder="Email">
					</p>
					<!--[if lt IE 9]><p class="inputtabset">
						<span>Your mesage:</span>
					</p><![endif]-->
					<p><textarea name="message" id="message" placeholder="Your mesage"></textarea></p>
					<p><input type="submit" name="submit" id="submit" value="submit" class="submitbtn" ></p>
					<script>
						$("#").click(function() {
							$("#").submit();
						});
					</script>
				</form>
			</div>
			<script>$("img").fadeTo(1200,1);</script>
		</div>
	</div><!-- block end -->
</div><!-- artbox end  -->
</div><!-- artwrap end  -->

<include file="Public:footer" />

<script>
$(".nav li:eq(5) a").addClass("selected");
</script>