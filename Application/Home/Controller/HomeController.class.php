<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}

    protected function _initialize(){
        //自动登录操作
        if(isset($_COOKIE['auto']) && !is_login()){
            $auto =explode('|',think_base64($_COOKIE['auto']));
            if($auto[2] == get_client_ip(1)){
                $map =array(
                    'uid'=>$auto[0],
                    'username' =>$auto[1],
                );
                $user= M('User')->where($map)->find();
                if($user){
                    $auth = array(
                        'uid'             => $user['uid'],
                        'username'        => $user['username'],
                        'last_login_time' => $user['last_login_time'],
                    );
                    session('user_auth', $auth);
                    session('user_auth_sign', data_auth_sign($auth));
                }
            }
        }
    }

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}

    

}
