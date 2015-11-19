<?php
return array(
    //邮件配置
    'THINK_EMAIL' => array(
        'SMTP_HOST'   => 'smtp.exmail.qq.com', //SMTP服务器
        'SMTP_PORT'   => '465', //SMTP服务器端口
        'SMTP_USER'   => 'xiaoxingping@easy-biz.cn', //SMTP服务器用户名
        'SMTP_PASS'   => 'x98x15p90', //SMTP服务器密码
        'FROM_EMAIL'  => 'xiaoxingping@easy-biz.cn', //发件人EMAIL
        'FROM_NAME'   => '肖兴平的个人博客', //发件人名称
        'REPLY_EMAIL' => '', //回复EMAIL（留空则为发件人EMAIL）
        'REPLY_NAME'  => '', //回复名称（留空则为发件人名称）
    ),
    //配置账号激活码有效期
    'TOKEN_EXPIRE'         =>  60 * 60 * 24,    //24小时

    //自动登录设置
    'AUTO_LOGIN_TIME'  =>  60 * 60 * 24 * 7,    // Cookie有效期 ,7天

    //用户登录密码加密KEY
    'AUTH_KEY' => '4HT)D7fW1$?`JOR}^EA#b[@3BL.h~!z9<nK5&0w_',

    //设置分页每页数据条数
    'PAGE'=> 12,

    //模板相关配置
    'TMPL_PARSE_STRING' => array(
        '__UP__' => __ROOT__ . '/Uploads',
        '__IMG__'    => __ROOT__ . '/Static/img',
        '__CSS__'    => __ROOT__ . '/Static/css',
        '__JS__'     => __ROOT__ . '/Static/js',
    ),

    //数据库配置
    'DB_TYPE'   => 'mysqli', // 数据库类型
    'DB_HOST'   => 'localhost', // 服务器地址
    'DB_NAME'   => 'myblog', // 数据库名
    'DB_USER'   => 'root', // 用户名
    'DB_PWD'    => 'ses007',  // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'bbs_', // 数据库表前缀
);