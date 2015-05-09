/**
 * Created by xiaoxingping on 14-4-11.
 *
 * From表单验证
 */

(function($){
    $.fn.validForm=function(){
        return this.each(function(){
          var  $this=$(this);
            $("input,select,textarea",$this).data('valid',true);
            //select下拉框验证
            $("select[dataType*='*']",$this).each(function(){
                $(this).on("blur", function() {
               if($("option:selected",$(this)).val()!='0') {
                   $(this).attr('title','');
                   $(this).css('border-color','#888888');
                   $(this).data('valid',true);
               }else{
                   $(this).attr('title','');
                   $(this).css('border-color','red');
                   $(this).data('valid',false);
               }
                 });
            });
            //不为空
            $("input[type=text][dataType*='*']",$this).each(function(){
               $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        $(this).data('valid',1001);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                });
            });
            //不限长度数字
        $("input[type=text][dataType*='num']",$this).each(function(){
            $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }else if(!/^[0-9]*$/.test(value)){
                        $(this).attr('title','请输入正确数字！');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                });
            });
            //用户名(字母开头，允许5-16字节，允许字母数字下划线)
           $("input[type=text][dataType*='user']",$this).each(function(){
               $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/.test(value)){
                        $(this).attr('title','请输入正确的用户名');
                        $(this).attr('title','');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                })
            });
            //密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)
            $("input[type=text][dataType*='pwd']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^[a-zA-Z]\w{5,17}$/.test(value)){
                        $(this).attr('title','请输入正确的密码');
                        $(this).attr('title','');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                })
            });
            //区号
            $("input[type=text][dataType*='areaCode']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^(0[1-9]{2,3})/.test(value)){
                        $(this).attr('title','请输入正确的区号');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                })
            });
            //固定电话，加区号或不加区号都可以
            $("input[type=text][dataType*='tel']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/.test(value)){
                        $(this).attr('title','请输入正确的号码');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                })
            });
            //手机
            $("input[type=text][dataType*='phone']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test(value)){
                        $(this).attr('title','请输入正确手机号码');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                });
            });
            //邮箱
            $("input[type=text][dataType*='email']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^([a-zA-Z0-9_.-]+)@([\da-zA-Z.-]+).([a-zA-Z.]{2,6})$/.test(value)){
                        $(this).attr('title','请输入正确邮箱地址');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else if(value>50){
                        $(this).attr('title','您的邮箱地址有误');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }

                });
            });
            //QQ
            $("input[type=text][dataType*='qq']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^[1-9][0-9]{4,}$/.test(value)){
                        $(this).attr('title','请输入正确QQ号码');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                });
            });
            //邮编
            $("input[type=text][dataType*='zipCode']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^[0-9]{6}$/.test(value)){
                        $(this).attr('title','请输入正确的邮编');
                        $(this).attr('title','');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                })
            });
            //网址
            $("input[type=text][dataType*='url']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
                        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
                        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
                        + "|" // 允许IP和DOMAIN（域名）
                        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
                        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
                        + "[a-z]{2,6})" // first level domain- .com or .museum
                        + "(:[0-9]{1,4})?" // 端口- :80
                        + "((/?)|" // a slash isn't required if there is no file name
                        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
                    var re=new RegExp(strRegex);
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }else if(re.test(value)){
                        $(this).attr('title','请输入正确的网址');
                        $(this).attr('title','');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                });
            });
            //日期（yyyy-mm-dd）
            $("input[type=text][dataType*='date']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/^\d{4}-\d{1,2}-\d{1,2}$/.test(value)){
                        $(this).attr('title','请输入正确的日期格式');
                        $(this).attr('title','');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                })
            });
            //金额
            $("input[type=text][dataType*='money']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(!/(^\d{1,10}\.{1}\d{1,3}$)|(^\d{1,10}$)/.test(value)){
                        $(this).attr('title','请输入正确金额');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }

                });
            });
            //长度为30的字符串
            $("input[type=text][dataType*='30']",$this).each(function(){
                $(this).on("blur", function() {
                    var value = $(this).val();
                    value=value.replace(/(^\s+)|(\s+$)/g,"");
                    $(this).css('boxShadow','none');
                    if(!value){
                        if($(this).data('valid')==1001){
                            $(this).attr('title','不能为空');
                            $(this).css('border-color','red');
                            $(this).data('valid',false);
                        }else{
                            $(this).attr('title','');
                            $(this).css('border-color','#888888');
                            $(this).data('valid',true);}
                    }
                    else if(value.length>30){
                        $(this).attr('title','请输入长度小于30的字符串！');
                        $(this).css('border-color','red');
                        $(this).data('valid',false);
                    }else{
                        $(this).attr('title','');
                        $(this).css('border-color','#888888');
                        $(this).data('valid',true);
                    }
                });
            });
        });
    }
})(jQuery);