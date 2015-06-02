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
        $this->module='User';
        $this->User = D('User');
    }

    /**
     * 首页
     */
    public function index()
    {
        $this->display();
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
     */
    public function active(){
        $map = array(
            'token'  => I('get.token'),
            'status' => 0,
        );
        $data=$this->User->field('uid, reg_time')->where($map)->find();
        if($data){
            $token_expire = C('TOKEN_EXPIRE');//从配置中获取激活码有效期
            $token_expire = $data['reg_time'] + $token_expire;
            if(time()>$token_expire){
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

    /**
     * 用户登录认证
     * @param $username 用户名
     * @param $password 密码
     */
    public function login($username, $password, $remeber_me=0){
        $map=array();
        $map['username|email|mobile']=$username;
        $user = $this->User->field('uid, username, password, status')->where($map)->find();
        if(is_array($user) && $user['status']){
            // 验证用户密码
            if(think_md5($password) === $user['password']){
                //更新用户登录信息
                $user['last_login_time'] =  NOW_TIME;
                $user['last_login_ip'] = get_client_ip(1);
                $user['login'] = array('exp', 'login+1');
                $this->User->save($user);
                // 记录登录SESSION和COOKIES
                $auth = array(
                    'uid'             => $user['uid'],
                    'username'        => $user['username'],
                    'last_login_time' => $user['last_login_time'],
                );
                session('user_auth', $auth);
                session('user_auth_sign', data_auth_sign($auth));
                //是否自动登录
                if($remeber_me==1){
                    $auto=$user['uid'].'|'.$user['username'].'|'.$user['last_login_ip'];
                    $auto=think_base64($auto, 1);//加密
                    cookie('auto',$auto,C('AUTO_LOGIN_TIME'));
                }
                $this->success('登录成功!');
            } else {
                $this->error('密码错误!');
            }
        } else {
            $this->error('用户不存在或未激活!');
        }
    }

    /**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
        cookie('auto', null);
        $this->success('注销成功!');
    }
}