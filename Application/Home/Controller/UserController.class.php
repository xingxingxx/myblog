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
        $this->User = D('User');
    }

    /**
     * 首页
     */
    public function index()
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

    /**
     * 注册一个新用户
     * @param $username     用户名
     * @param $password     密码
     * @param $email        邮箱
     * @param $__hash__     表单令牌
     */
    public function register($username, $password, $email)
    {
        $result=$this->User->register($username, $password, $email);
        if($result===true){
            $this->success('系统已发送激活邮件到您的邮箱：<br><strong class="email-url">'.$email.'</strong><br>请点击邮件中的链接激活帐号。');
        }else{
            $this->error($result);
        }
    }

    /**
     * 激活账号
     */
    public function active(){
        $map = array(
            'token'  => I('get.token'),
            'status' => 0,
        );
        $data=$this->User->field('uid, token_exptime')->where($map)->find();
        if($data){
            if(time()>$data['token_exptime']){
                $this->error('您的激活有效期已过，请登录您的帐号重新发送激活邮件.', U('Index/index'), 5);
            }else{
                $data['status']=1;
                $row=$this->User->save($data);
                if($row){
                    $this->success('恭喜，账号激活成功！', U('Index/index'), 5);
                }else{
                    $this->error('账号激活失败！', U('Index/index'), 5);
                }
            }
        }else{
            $this->error('未找到需要激活的账号！', U('Index/index'));
        }
    }

}