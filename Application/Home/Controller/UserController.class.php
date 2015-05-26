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

use Think\Controller;

class UserController extends Controller
{

    private $User;

    //构造方法
    public function __construct()
    {
        parent::__construct();
        $this->User = M('User');
    }
    /**
     * 首页
     */
    public function index()
    {

    }

    /**
     * 注册
     */
    public function register()
    {

    }

    /**
     * 验证用户名是否已被注册
     */
    public function check_name()
    {
        echo $this->User->where(array('username' => I('get.username')))->find() ? 'false' : 'true';
    }

    /**
     * 验证邮箱是否已被使用
     */
    public function check_email()
    {
        echo $this->User->where(array('email' => I('get.email')))->find() ? 'false' : 'true';
    }

}