
/*
 * jQuery validation 验证类型扩展
 * 扩展的验证类型：用户名，邮政编码，大陆身份证号码，大陆手机号码,电话号码
 */

// 邮政编码验证
jQuery.validator.addMethod("isZipCode", function(value, element) {
    var zip = /^[0-9]{6}$/;
    return this.optional(element) || (zip.test(value));
}, "请正确填写您的邮政编码!");

// 身份证号码验证
jQuery.validator.addMethod("isIdCardNo", function(value, element) {
    var idCard = /^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\w)$/;
    return this.optional(element) || (idCard.test(value));
}, "请输入正确的身份证号码!");

// 手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/.test(value));
}, "请正确填写您的手机号码!");

// 电话号码验证
jQuery.validator.addMethod("isPhone", function(value, element) {
    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
    return this.optional(element) || (tel.test(value));
}, "请正确填写您的电话号码!")

// 用户名字符验证
jQuery.validator.addMethod("userName", function(value, element) {
    return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
}, "只能包含中文字、英文字母、数字和下划线!");

// 联系电话(手机/电话皆可)验证
jQuery.validator.addMethod("isTel", function(value,element) {
    var length = value.length;
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
    var tel = /^\d{3,4}-?\d{7,9}$/;
    return this.optional(element) || (tel.test(value) || mobile.test(value));
}, "请正确填写您的联系电话!");

// IP地址验证
jQuery.validator.addMethod("ip", function(value, element) {
    return this.optional(element) || /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(value);
}, "请填写正确的IP地址！");

//设置默认属性
$.validator.setDefaults({
    errorElement : 'span',
    errorClass : 'help-block',
    focusInvalid : false,
    highlight : function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },

    success : function(label) {
        label.closest('.form-group').removeClass('has-error');
        label.remove();
    },

    errorPlacement : function(error, element) {
        element.parent('div').append(error);
    },

    submitHandler : function(form) {
        form.submit();
    }
});

//登录验证
$('#form-login').validate({
    rules: {
        username: {
            required: true
        },
        password: {
            required: true,
            rangelength: [6, 18]
        }
    },
    messages: {
        username: {
            required: "用户名不能为空！"
        },
        password: {
            required: "密码不能为空！",
            rangelength: "密码长度必须为6-8为的字母或数字！"
        }
    }
});



//显示密码
$('#password').togglePassword({
    el: '#togglePassword'
});

$('#passwordRegister').togglePassword({
    el: '#togglePasswordRegister'
});