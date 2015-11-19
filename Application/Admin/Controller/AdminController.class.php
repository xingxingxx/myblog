<?php
namespace Admin\Controller;
use Think\Controller;
/**
 * 后台首页控制器
 */
class AdminController extends Controller {
    /**
     * 后台控制器初始化
     */
    protected function _initialize(){
        // 获取当前用户ID
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }

    }
}
