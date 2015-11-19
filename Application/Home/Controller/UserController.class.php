<?php
/**
 * Created by PhpStorm.
 * User: 肖兴平
 * Email: xx9815@qq.com
 * Date: 2015/5/20
 * Time: 11:25
 */

/**
 * 用户中心控制器
 */
namespace Home\Controller;

class UserController extends HomeController
{

    private $User;

    //构造方法
    public function __construct()
    {
        parent::__construct();
        $this->User = D('User');
    }

    /**
     * 首页
     */
    public function index()
    {
        $this->assign('hover', 'user');
        $this->display();
    }

    /**
     * 验证用户名是否已被注册
     */
    public function checkName()
    {
        echo $this->User->where(array('username' => I('get.username')))->find() ? 'false' : 'true';
    }

    /**
     * 验证邮箱是否已被使用
     */
    public function checkEmail()
    {
        echo $this->User->where(array('email' => I('get.email')))->find() ? 'false' : 'true';
    }

    /**
     * 注册一个新用户
     * @param $username     用户名
     * @param $password     密码
     * @param $email        邮箱
     */
    public function register($username, $password, $email)
    {
        $result=$this->User->register($username, $password, $email);
        if($result===true){
            $this->success('系统已发送激活邮件到您的邮箱：<br><strong>'.$email.'</strong><br>请点击邮件中的链接激活帐号。');
        }else{
            $this->error($result);
        }
    }

    /**
     * 激活账号
     * @param $token 激活码
     */
    public function active($token){
        $result=$this->User->active($token);
        if($result===true){
            $this->success('恭喜，账号激活成功！', U('Index/index'), 5);
        }else{
            $this->error($result, U('Index/index'), 5);
        }
    }

    /**
     * 用户登录
     * @param $username 用户名
     * @param $password 密码
     * @param int $remeber_me 记住我
     */
    public function login($username, $password, $remeber_me=0){
        $result=$this->User->login($username, $password, $remeber_me);
        if($result===true){
            $this->success('登录成功！');
        }else{
            $this->error($result);
        }
    }

    /**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        if (is_login()) {
            $this->User->logout();
            $this->success('退出成功！');
        }
    }

}