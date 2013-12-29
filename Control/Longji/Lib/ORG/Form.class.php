<?php
/**
 * 
 * Form.php (模型表单生成)
 */
class Form extends BaseAction {
	public $data = array() ,$isadmin=1,$doThumb=1,$doAttach=1,$lang,$langname;
	
	
    public function __construct($data=array()) {
		$this->langname=cookie("langname");
		$langdata=F("lang");
		$this->lang=$langdata[$this->langname]["id"];
        $this->data = $data;
    }
 
	public function catid($info,$value){
		
		
        $validate = getvalidate($info);	
		$Category = F('Category_'.$this->lang);			
	
		
		
		$id = $field = $info['field'];
		$value = $value ? $value : $this->data[$field];
		$moduleid =$info['moduleid'];
		foreach ($Category as $r){
				$arr= explode(",",$r['arrchildid']);
				$show=0;
				foreach((array)$arr as $rr){
					if($Category[$rr]['moduleid'] ==$moduleid) $show=1;
				}
				if(empty($show))continue; 
				$r['disabled'] = $r['child'] ? ' disabled' :'';
				
				$array[] = $r;					
		}
		
		
		$str  = "<option value='\$id' \$disabled \$selected>\$spacer \$catname</option>";
		import("@.ORG.Tree");
		$tree = new Tree ($array);
		$parseStr .= '<select  id="'.$id.'" name="'.$field.'" class=" '.$info['class'].'"  '.$validate.'>';
		$parseStr .= '<option value="">请选择栏目</option>';
		$parseStr .= $tree->get_tree(0, $str, $value);
		$parseStr .= '</select>';
		return $parseStr;
	}


	public function title($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$thumb=$info['setup']['thumb'];
		$style=$info['setup']['style'];
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
		$value = $value ? $value : $this->data[$field];

		$title_style = explode(';',$this->data['title_style']);
		$style_color = explode(':',$title_style[0]);
		$style_color = $style_color[1];
		$style_bold = explode(':',$title_style[1]);
		$style_bold = $style_bold[1];

		if(empty($info['setup']['upload_maxsize'])){
			
				$Config = F('Config_'.$this->lang);			
			
 
			$info['setup']['upload_maxsize'] =  intval(byte_format($Config['attach_maxsize']));
		}

	 
		$yourphp_auth_key = sysmd5(C('ADMIN_ACCESS').$_SERVER['HTTP_USER_AGENT']);
		$yourphp_auth = authcode($this->isadmin.'-1-1-1-jpeg,jpg,png,gif-'.$info['setup']['upload_maxsize'].'-'.$info['moduleid'], 'ENCODE',$yourphp_auth_key);

		$thumb_ico = $this->data['thumb']? $this->data['thumb'] : YP_PATH.'/Statics/Images/admin_upload_thumb.png';
		$boldchecked= $style_bold=='bold' ? 'checked' : '';
		$thumbstr ='<div class="thumb_box"  id="thumb_box"><div id="thumb_aid_box"></div>
				<a href="javascript:swfupload(\'thumb_uploadfile\',\'thumb\',\''.L('uploadfiles').'\','.$this->isadmin.',1,1,1,\'jpeg,jpg,png,gif\','.$info['setup']['upload_maxsize'].','.$info['moduleid'].',\''.$yourphp_auth.'\',yesdo,nodo)"><img src="'.$thumb_ico.'" id="thumb_pic" ></a><br> <input type="button" value="'.L('clean_thumb').'" onclick="javascript:clean_thumb(\'thumb\');" class="button" />
				<input type="hidden"  id="thumb" name="thumb"  value="'.$this->data['thumb'].'" /></div>';

		$parseStr   = '<input type="text"   class="input-text input-title f_l" name="'.$field.'"  id="'.$id.'" value="'.$value.'" size="'.$info['setup']['size'].'"  '.$validate.'  /> ';

		$stylestr = '<div id="'.$id.'_colorimg" class="colorimg" style="background-color:'.$style_color.'"><img src="'.YP_PATH.'/Statics/Images/admin_color_arrow.gif"></div><input type="hidden" id="'.$id.'_style_color" name="style_color" value="'.$style_color.'" /><input type="checkbox" class="style_bold" id="style_bold" name="style_bold" value="bold" '.$boldchecked.' /><b>'. L('style_bold').'</b><script>$.showcolor("'.$id.'_colorimg","'.$id.'_style_color");</script>';
		if($thumb &&  $this->doThumb)$parseStr = $thumbstr.$parseStr;
		if($style) $parseStr = $parseStr.$stylestr;
		return $parseStr;
	}

	public function text($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
		$info['setup']['ispassword'] ? $inputtext = 'password' : $inputtext = 'text';
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		$parseStr   = '<input type="'.$inputtext.'"   class="input-text '.$info['class'].'" name="'.$field.'"  id="'.$id.'" value="'.stripcslashes($value).'" size="'.$info['setup']['size'].'"  '.$validate.'/> ';
		return $parseStr;
	}



	public function verify($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
		$parseStr   = '<input   class="input-text '.$info['class'].'" name="'.$field.'"  id="'.$id.'" value="" size="'.$info['setup']['size'].'"  '.$validate.' /><img src="'.URL('Home-Index/verify').'" onclick="javascript:resetVerifyCode();" class="checkcode" align="absmiddle"  title="点击刷新验证码" id="verifyImage"/>';
		return $parseStr;
	}




	public function number($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
		$info['setup']['ispassowrd'] ? $inputtext = 'passowrd' : $inputtext = 'text';
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		$parseStr   = '<input type="'.$inputtext.'"   class="input-text '.$info['class'].'" name="'.$field.'"  id="'.$id.'" value="'.$value.'" size="'.$info['setup']['size'].'"  '.$validate.'/> ';
		return $parseStr;
	}

	public function textarea($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
        $validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }

		$parseStr   = '<textarea  class="'.$info['class'].'" name="'.$field.'"  rows="'.$info['setup']['rows'].'" cols="'.$info['setup']['cols'].'"  id="'.$id.'"   '.$validate.'/>'.stripcslashes($value).'</textarea>';
		return $parseStr;
	}


	public function select($info,$value){

		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
		$validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
        if($value != '') $value = strpos($value, ',') ? explode(',', $value) : $value;

        if(is_array($info['options'])){
             if($info['options_key']){
				$options_key=explode(',',$info['options_key']);
				foreach((array)$info['options'] as $key=>$res){
					if($options_key[0]=='key'){
						$optionsarr[$key]=$res[$options_key[1]];
					}else{
						$optionsarr[$res[$options_key[0]]]=$res[$options_key[1]];
					}
				}
			}else{
             $optionsarr = $info['options'];
			}
        }else{
            $options    = $info['setup']['options'];
            $options = explode("\n",$info['setup']['options']);
        	foreach($options as $r) {
        		$v = explode("|",$r);
        		$k = trim($v[1]);
        		$optionsarr[$k] = $v[0];
        	}
        }


        if(!empty($info['setup']['multiple'])) {
            $parseStr = '<select id="'.$id.'" name="'.$field.'"  onchange="'.$info['setup']['onchange'].'" class="'.$info['class'].'"  '.$validate.' size="'.$info['setup']['size'].'" multiple="multiple" >';
        }else {
        	$parseStr = '<select id="'.$id.'" name="'.$field.'" onchange="'.$info['setup']['onchange'].'"  class="'.$info['class'].'" '.$validate.'>';
        }

        if(is_array($optionsarr)) {
			foreach($optionsarr as $key=>$val) {
				if(!empty($value)){
				    $selected='';
					if($value==$key || in_array($key,$value)) $selected = ' selected="selected"';
				    $parseStr   .= '<option '.$selected.' value="'.$key.'">'.$val.'</option>';
				}else{
					$parseStr   .= '<option value="'.$key.'">'.$val.'</option>';
				}
			}
		}
        $parseStr   .= '</select>';
        return $parseStr;
	}
	public function checkbox($info,$value){
	     
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
		$validate = getvalidate($info);
		if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
        $labelwidth = $info['setup']['labelwidth'];


        if(is_array($info['options'])){
			if($info['options_key']){
				$options_key=explode(',',$info['options_key']);
				foreach((array)$info['options'] as $key=>$res){
					if($options_key[0]=='key'){
						$optionsarr[$key]=$res[$options_key[1]];
					}else{
						$optionsarr[$res[$options_key[0]]]=$res[$options_key[1]];
					}
				}
			}else{
             $optionsarr = $info['options'];
			}
        }else{
            $options    = $info['setup']['options'];
            $options = explode("\n",$info['setup']['options']);
        	foreach($options as $r) {
        		$v = explode("|",$r);
        		$k = trim($v[1]);
        		$optionsarr[$k] = $v[0];
        	}
        }
		if($value != '') $value = (strpos($value, ',') && !is_array($value)) ? explode(',', $value) :  $value ;
		$value = is_array($value) ? $value : array($value);
		$i = 1;
		$onclick = $info['setup']['onclick'] ? ' onclick="'.$info['setup']['onclick'].'" ' : '' ;

		foreach($optionsarr as $key=>$r) {
			$key = trim($key);
            if($i>1) $validate='';
			$checked = ($value && in_array($key, $value)) ? 'checked' : '';
			if($labelwidth) $parseStr .= '<label style="float:left;width:'.$labelwidth.'px" class="checkbox_'.$id.'" >';
			$parseStr .= '<input type="checkbox" class="input_checkbox '.$info['class'].'" name="'.$field.'[]" id="'.$id.'_'.$i.'" '.$checked.$onclick.' value="'.htmlspecialchars($key).'"  '.$validate.'> '.htmlspecialchars($r);
			if($labelwidth) $parseStr .= '</label>';
			$i++;
		}
		return $parseStr;

	}
	public function radio($info,$value){

       $info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
		$validate = getvalidate($info);
		if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
        $labelwidth = $info['setup']['labelwidth'];

        if(is_array($info['options'])){
             if($info['options_key']){
				$options_key=explode(',',$info['options_key']);
				foreach((array)$info['options'] as $key=>$res){
					if($options_key[0]=='key'){
						$optionsarr[$key]=$res[$options_key[1]];
					}else{
						$optionsarr[$res[$options_key[0]]]=$res[$options_key[1]];
					}
				}
			}else{
             $optionsarr = $info['options'];
			}
        }else{
            $options    = $info['setup']['options'];
            $options = explode("\n",$info['setup']['options']);
        	foreach($options as $r) {
        		$v = explode("|",$r);
        		$k = trim($v[1]);
        		$optionsarr[$k] = $v[0];
        	}
        }
		$onclick = $info['setup']['onclick'] ? ' onclick="'.$info['setup']['onclick'].'" ' : '' ;
        $i = 1;
        foreach($optionsarr as $key=>$r) {
            if($i>1) $validate ='';
			$checked = trim($value)==trim($key) ? 'checked' : '';
			if(empty($value) && empty($key) ) $checked = 'checked';
			if($labelwidth) $parseStr .= '<label style="float:left;width:'.$labelwidth.'px" class="checkbox_'.$id.'" >';
			$parseStr .= '<input type="radio" class="input_radio '.$info['class'].'" name="'.$field.'" id="'.$id.'_'.$i.'" '.$checked.$onclick.' value="'.$key.'" '.$validate.'> '.$r;
			if($labelwidth) $parseStr .= '</label>';
            $i++;
		}
		return $parseStr;
	}


	public function editor($info,$value){
		
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
		$validate = getvalidate($info);
		if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		
		$height=$info["setup"]["height"];

		
		$str ='';
		$str .= '<div class="editor_box" style="margin-left:8px;"><div style="display:none;" id="'.$field.'_aid_box"></div><textarea name="'.$field.'" class="'.$info['class'].'"  id="'.$id.'"  boxid="'.$id.'" '.$validate.'  style="width:99%;height:'.$height.'px;visibility:hidden;">'.$value.'</textarea>';
		


			
			$upurl= $_SERVER['SCRIPT_NAME']."?g=Admin&m=Attache&a=index&isadmin=$this->isadmin&more=1&isthumb=0&file_limit=$alowuploadlimit&file_types=$Config[attach_allowext]&file_size=$file_size&moduleid=$moduleid&auth=$attach_auth&l=$this->lang";
			$filemanage=$_SERVER['SCRIPT_NAME']."?g=Admin&m=Attache&a=imagelist&isadmin=$this->isadmin&l=$this->lang";
			$uploadJson=$_SERVER['SCRIPT_NAME']."?g=Admin&m=Attache&a=imageup&isadmin=$this->isadmin&l=$this->lang";
			$str .= "<script type=\"text/javascript\">\r\n";		
			$str .= "KindEditor.ready(function(K) {\r\n";
			$str .= "K.create('#".$id."', {\r\n";
			$str .= "	fileManager:true,\r\n";
			$str .=	"	fileManagerJson:'$filemanage',\r\n";
			$str .=	"	uploadJson:'$uploadJson',\r\n";
			
			
			
			$str .= "	editorid:'$id',\r\n";
			$str .=	"	items : ['source', '|','formatblock', 'fontname','fontsize','forecolor','bold','italic','underline','strikethrough','|','table','baidumap','link','unlink','|','image','insertfile','media','flash','|','removeformat', 'clearhtml'],\r\n";
			$str .= "	imageUploadJson:'$upImgUrl',\r\n";
			$str .= "	allowFileManager : true\r\n";

			$str .= "});\r\n";
			$str .= "});\r\n";
			$str .= '</script>';
			$str .= '</div>';
		


		return $str;
	}
	public function datetime($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
		$validate = getvalidate($info);
		if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		$DateFormat =  $info['setup']['dateformat'] ?  $info['setup']['dateformat'] : 'Y-m-d H:i:s';
		$value = $value ?  toDate($value,$DateFormat) : toDate(time(),$DateFormat);
		$DateFormat =  str_replace(array('Y','m','d','H','i','s'),array('yyyy','MM','dd','HH','mm','ss'),$DateFormat);  
		$parseStr = '<input  class="Wdate input-text  '.$info['class'].'"  '.$validate.'  name="'.$field.'" type="text" id="'.$id.'" size="25" DateFormat="'.$DateFormat.'" value="'.$value.'" />';
        return $parseStr;
	}
    public function groupid($info,$value){
        $newinfo = $info;
        $info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
        $groups=F('Role');$options=array();
        foreach($groups as $key=>$r) {
            if($r['status']){
                $options[$key]=$r['name'];
            }
		}
        $newinfo['options']=$options;
        $fun=$info['setup']['inputtype'];
        return $this->$fun($newinfo,$value);
    }
    public function posid($info,$value){
        $newinfo = $info;
        $posids=F('Posid');
        $options=array();
        $options[0]= L('请选择推荐位');
        foreach($posids as $key=>$r) {
           $options[$key]=$r['name'];
		}
        $newinfo['options']=$options;
        $fun=$info['setup']['inputtype'];
        return $this->select($newinfo,$value);
    }

	public function typeid($info,$value){
        $newinfo = $info;
        $types=F('Type');
	
 
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);	
		$id = $field = $info['field'];
		$value = $value ? $value : $this->data[$field];
		$parentid=$info['setup']['default'];
		$keyid = $types[$parentid]['keyid'];

		$options=array();
        $options[0]= L('please_chose');
		foreach((array)$types as $key => $r) {
			if($r['keyid']!=$keyid) continue;
			$r['id']=$r['typeid'];
			$array[] = $r;
			$options[$key]=$r['name'];
		}

		import ( '@.EXT.Tree' );
		$str  = "<option value='\$typeid' \$selected>\$spacer \$name</option>";
		$tree = new Tree ($array);		 
		$tree->nbsp='&nbsp;&nbsp;';
		$select_type = $tree->get_tree(0, $str,$value);
		
		$fun=$info['setup']['inputtype'];
		if($fun=='select'){
			return '<SELECT  id="'.$id.'" class="'.$info['class'].'"   name="'.$field.'"><option value="0">'.L('please_chose').'</option>'. $select_type.'</select>';
		}else{			
			$newinfo['options']=$options;			
			return $this->$fun($newinfo,$value);
		}
    }

    public function template($info,$value){

        $templates= template_file(MODULE_NAME);
        $newinfo = $info;
        $info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
        $options=array();
        $options[0]= L('please_chose');
        foreach($templates as $key=>$r) {
            if(strstr($r['value'],'show')){
                $options[$r['value']]=$r['filename'];
            }
		}
        $newinfo['options']=$options;
        $fun=$info['setup']['inputtype'];
        return $this->select($newinfo,$value);
    }


	public function image($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		
		$moreurl="ext=".$info['setup']['upload_allowext']."&maxsize=".$info['setup']['upload_maxsize']*1024*1024;
		$parseStr="<input type=\"text\" id=\"$id\" name=\"$id\"  value=\"$value\" /> <button type=\"button\" class=\"btn02\" onclick=\"myupload('上传图片','".U('Attache/index',$moreurl)."','$id');\">上传图片</button>";
		return $parseStr;
	}

	public function images($info,$value,$price=0){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		$data='';
		$i=0;
		if($value){
			$options = explode(":::",$value);
			if(is_array($options)){
				foreach($options as  $r) {
						$v = explode("|",$r);
						if($price){
							$price_str = ' <input type="text" class="input-text" name="'.$field.'_price[]" value="'.$v[2].'" size="20" />';
						}else{
							$price_str = '';
						}
						$data .='<div id="uplistd_'.$i.'"><input type="text" size="50" class="input-text" name="'.$field.'[]" value="'.$v[0].'"  /> <input type="text" class="input-text" name="'.$field.'_name[]" value="'.$v[1].'" size="30" />'.$price_str.' &nbsp;<a href="javascript:remove_this(\'uplistd_'.$i.'\');">'.L('remove').'</a> </div>';
						$i++;
				}
			}
		}
		if(empty($info['setup']['upload_maxsize'])){
			if(APP_LANG){ 
				$Config = F('Config_'.$this->lang);			
			}else{
				$Config = F('Config');		
			}
			$info['setup']['upload_maxsize'] =  intval(byte_format($Config['attach_maxsize']));
		}
		$yourphp_auth_key = sysmd5(C('ADMIN_ACCESS').$_SERVER['HTTP_USER_AGENT']);
		$yourphp_auth = authcode($this->isadmin.'-'.$info['setup']['more'].'-0-'.$info['setup']['upload_maxnum'].'-'.$info['setup']['upload_allowext'].'-'.$info['setup']['upload_maxsize'].'-'.$info['moduleid'], 'ENCODE',$yourphp_auth_key);

		$parseStr   = '<fieldset class="images_box">
        <legend>'.L('upload_images').'</legend><center><div>'.L('upload_maxfiles').' <font color=\'red\'>'.$info['setup']['upload_maxnum'].'</font> '.L('zhang').'</div></center>
		<div id="'.$field.'_images" class="imagesList">'.$data.'</div>
		</fieldset>
		<div class="c"></div>
		<input type="button" class="button" value="'.L('upload_images').'" onclick="javascript:swfupload(\''.$field.'_uploadfile\',\''.$field.'\',\''.L('uploadfiles').'\','.$this->isadmin.','.$info['setup']['more'].',0,'.$info['setup']['upload_maxnum'].',\''.$info['setup']['upload_allowext'].'\','.$info['setup']['upload_maxsize'].','.$info['moduleid'].',\''.$yourphp_auth.'\',up_images,nodo,'.$price.')">  ';

		return $parseStr;
	}

	public function attr($info,$value){

		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
        $validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		if($info['setup']['inputtype']=='images'){
			$info['setup']['more']=1;
			$info['setup']['upload_maxnum']=50;
			$info['setup']['upload_allowext']='jpg,jpeg,png,gif,bmp';
			$info['setup']['upload_maxsize']='5';
			return $this->images($info,$value,1);
		}else{
			$parseStr   = '<textarea  class="'.$info['class'].'" name="'.$field.'"  rows="7" cols="20"  id="'.$id.'"   '.$validate.'/>'.stripcslashes($value).'</textarea>';
			return $parseStr;
		}		
	}

	public function file($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		
		$moreurl="ext=".$info['setup']['upload_allowext']."&maxsize=".$info['setup']['upload_maxsize']*1024*1024;
		$parseStr="<input type=\"text\" id=\"$id\" name=\"$id\"  value=\"$value\" /> <button type=\"button\" class=\"btn02\" onclick=\"myupload('上传文件','".U('Attache/index',$moreurl)."','$id');\">上传文件</button>";
		return $parseStr;
	}

	public function files($info,$value){
		$info['setup']=is_array($info['setup']) ? $info['setup'] : string2array($info['setup']);
		$id = $field = $info['field'];
	    $validate = getvalidate($info);
        if(ACTION_NAME=='add'){
			$value = $value ? $value : $info['setup']['default'];
        }else{
			$value = $value ? $value : $this->data[$field];
        }
		if(empty($info['setup']['upload_maxsize'])){
			if(APP_LANG){ 
				$Config = F('Config_'.$this->lang);			
			}else{
				$Config = F('Config');		
			}
			$info['setup']['upload_maxsize'] =  intval(byte_format($Config['attach_maxsize']));
		}
		$yourphp_auth_key = sysmd5(C('ADMIN_ACCESS').$_SERVER['HTTP_USER_AGENT']);
		$yourphp_auth = authcode($this->isadmin.'-'.$info['setup']['more'].'-0-'.$info['setup']['upload_maxnum'].'-'.$info['setup']['upload_allowext'].'-'.$info['setup']['upload_maxsize'].'-'.$info['moduleid'], 'ENCODE',$yourphp_auth_key);

		$parseStr   = '<fieldset class="images_box">
        <legend>'.L('upload_images').'</legend><center><div>'.L('upload_maxfiles').' <font color=\'red\'>'.$info['setup']['upload_maxnum'].'</font> '.L('zhang').'</div></center>
		<div id="'.$field.'_images" class="imagesList"></div>
		</fieldset>
		<input type="button"  style="margin-left:5px;" class="button" value="'.L('upload_files').'" onclick="javascript:swfupload(\''.$field.'_uploadfile\',\''.$field.'\',\''.L('uploadfiles').'\','.$this->isadmin.','.$info['setup']['more'].',0,'.$info['setup']['upload_maxnum'].',\''.$info['setup']['upload_allowext'].'\','.$info['setup']['upload_maxsize'].','.$info['moduleid'].',\''.$yourphp_auth.'\',up_images,nodo)">  ';

		return $parseStr;
	}
}
?>