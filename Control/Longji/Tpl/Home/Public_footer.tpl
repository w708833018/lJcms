<div class="thewrap indexline3wrap">
<div class="thebox indexline3box">
	<h6 class="linetitleempty"><span></span></h6>
	<div class="itemset">

		<div class="item indexfeedback">	
			<form id="form1" name="form1" method="post" action="{:U('saveinfo')}">
				<input type="hidden" name="catid" value="{$catid}" />
				<input type="hidden" name="moduleid" value="17" />
				<input type="hidden" name="lang" value="{$lang}" />
				<h6>Any question just contact us!</h6>
					<p>
						<input name="email" type="text" placeholder="Email Address">
					</p>
					<p><textarea name="message" id="message" placeholder="Your mesage"></textarea></p>
					<p><input type="submit" name="submit" id="submit" value="send" class="submitbtn" ></p>
					<script>
						$("#").click(function() {
							$("#").submit();
						});
					</script>
				</form>
		</div>

		<div class="item indexinforboard">
			<h6>Phone and Email</h6>
			<div>
				<p><LJ:block pos="phone and email" /></p>
				
			</div>
		</div>
		
		<div class="item indexclientshowboard">
			<h6><!-- 预留区域 --></h6>
			<div class="picset">
				<!-- 预留区域 -->
			</div>
		</div>

		<div class="item indexlinksboard">
			<h6>Maybe interested</h6>
			<ul>
			<LJ:link id="r">
				<li><a href="{$r.siteurl}" target="_blank" >{$r.name}</a></li>
			</LJ:link>
			</ul>
		</div>

	</div>
</div><!-- indexline3box end  -->	
</div><!-- indexline3wrap end  -->

<div class="thewrap footwrap">
<div class="thebox footbox">
	<div class="footblock">
		&copy; <span class="strong">c_flying</span> All rights reserved. <span class="showthisyear"></span>
		<script>showtheyear(".showthisyear");</script>
	</div>
</div><!-- footbox end  -->	
</div><!-- footwrap end  -->	

</div><!-- bigwrap end  -->
</body>
</html>
