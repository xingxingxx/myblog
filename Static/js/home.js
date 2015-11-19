require.config({
    paths: {
        jquery: 'lib/jquery-1.11.3.min',
        modal: 'plugins/modal',
        carousel: 'plugins/carousel',
        validate: 'plugins/validate',
        validateEx: 'plugins/validate-ex',
        togglePassword: 'plugins/toggle-password',
    },
    /*shim: {
        'jquery.modal': {
            deps: ['jquery'],
            exports: 'jQuery.fn.modal'
        },
        'jquery.carousel': {
            deps: ['jquery'],
            exports: 'jQuery.fn.carousel'
        },
        'jquery.validate': {
            deps: ['jquery'],
            exports: 'jQuery.fn.validate'
        },
        'jquery.validate.ex': {
            deps: ['jquery'],
            exports: 'jQuery.fn.modal'
        },
    }*/
});

require(['jquery','modal','carousel','validate','validateEx','togglePassword'], function($) {
    //显示密码
    $('.password').togglePassword({
        el: '.toggle-password'
    });
    //注册验证
    $('#form-register').validate({
        rules: {
            username: {
                required: true,
                userName: true,
                remote: checkName //ajax验证用户名是否已存在
            },
            password: {
                required: true,
                isPassword: true
            },
            email: {
                required: true,
                email: true,
                remote: checkEmail //ajax验证邮箱是否已被使用
            }
        },
        messages: {
            username: {
                required: "用户名不能为空！",
                remote: "该用户名已被注册！"
            },
            password: {
                required: "密码不能为空！",
            },
            email: {
                required: "邮箱不能为空！",
                email: "邮箱地址格式不正确！",
                remote: '该邮箱地址已被使用！'
            }
        },
        submitHandler: function (form) {
            $.post($(form).attr("action"), $(form).serialize(), success, "json");
            return false;
            function success(data) {
                if (data.status) {
                    $(form).hide();
                    $(form).parent('div').find('.hidden').removeClass('hidden').find('.alert-success').html(data.info);
                } else {
                    $(form).find('.alert-danger').removeClass('hidden').text(data.info);
                }
            }
        }
    });
    //登录验证
    $('#form-login').validate({
        rules: {
            username: {
                required: true,
                rangelength: [3, 30]
            },
            password: {
                required: true,
                isPassword: true
            }
        },
        messages: {
            username: {
                required: "用户名不能为空！",
                rangelength: "用户名长度为3-30！"
            },
            password: {
                required: "密码不能为空！",
            }
        },
        submitHandler: function (form) {
            $.post($(form).attr("action"), $(form).serialize(), success, "json");
            return false;
            function success(data) {
                if (data.status) {
                    window.location.reload();//刷新当前页
                } else {
                    $(form).find('.alert-danger').removeClass('hidden').text(data.info);
                }
            }
        }
    });
});