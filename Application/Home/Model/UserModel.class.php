<?php
/**
 * Created by PhpStorm.
 * User: 肖兴平
 * Email: xx9815@qq.com
 * Date: 2015/5/25
 * Time: 16:54
 */
namespace Home\Model;
use Think\Model;

/**
 * 用户基础模型
 */
class UserModel extends Model{
    /* 用户模型自动验证 */
    protected $_validate = array(
        /* 验证用户名 */
        array('username', 'require','用户名不为空' , self::EXISTS_VALIDATE), //用户名不为空
        array('username', '3,18', '用户名长度不合法', self::EXISTS_VALIDATE, 'length'), //用户名长度不合法
        array('username', '', '用户名被占用', self::EXISTS_VALIDATE, 'unique'), //用户名被占用

        /* 验证密码 */
        array('password', 'require','密码不为空' , self::EXISTS_VALIDATE), //密码不为空
        array('password', '6,30', '密码长度不合法', self::EXISTS_VALIDATE, 'length'), //密码长度不合法

        /* 验证邮箱 */
        array('email', 'require','邮箱不为空' , self::EXISTS_VALIDATE), //邮箱不为空
        array('email', 'email', '邮箱格式不正确', self::EXISTS_VALIDATE), //邮箱格式不正确
        array('email', '1,32', '邮箱长度不合法', self::EXISTS_VALIDATE, 'length'), //邮箱长度不合法
        array('email', '', '邮箱被占用', self::EXISTS_VALIDATE, 'unique'), //邮箱被占用
    );

    /* 用户模型自动完成 */
    protected $_auto = array(
        array('password', 'md5', self::MODEL_BOTH, 'function'),
        array('regtime', NOW_TIME, self::MODEL_INSERT),
        array('regip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
    );

    /**
     * 注册一个新用户
     * @param  string $username 用户名
     * @param  string $password 用户密码
     * @param  string $email    用户邮箱
     * @return integer          注册成功-用户信息，注册失败-错误信息
     */
    public function register($username, $password, $email){
        $token = md5($username . time());//创建用于激活识别码
        $token_exptime = time() + 60 * 60 * 24;//过期时间为24小时后
        //创建数组
        $data = array(
            'username' => $username,
            'password' => $password,
            'email' => $email,
            'token' => $token,
            'token_exptime' => $token_exptime,
        );
        if($this->create($data)){
            //邮件内容
            $emailInfo = "亲爱的" . $username . "：<br/>感谢您在我站注册了新帐号。<br/>
            请点击链接激活您的帐号。<br/>
            <a href='".$_SERVER['HTTP_HOST']. U('User/active', array('token'=> $token)). "' target='_blank'>
            ". $_SERVER['HTTP_HOST']. U('User/active', array('token'=> $token)). "</a><br/>
            如果以上链接无法点击，请将它复制到你的浏览器地址栏中进入访问，该链接24小时内有效。";
            //调用邮件发送函数
            $rs=think_send_mail($email, $username, '用户帐号激活', $emailInfo);
            //如果邮件发送成功，则将信息加入数据库
            if($rs===true){
                $uid = $this->add();
                return $uid ? true : '未知错误';
            }else{
                return '邮箱不合法或不存在，请重新填写邮箱。';
            }
        } else {
            return $this->getError(); //错误详情见自动验证注释
        }
    }

    /**
     * 用户登录认证
     * @param  string  $username 用户名
     * @param  string  $password 用户密码
     * @param  integer $type     用户名类型 （1-用户名，2-邮箱，3-手机，4-UID）
     * @return integer           登录成功-用户ID，登录失败-错误编号
     */
    public function login($username, $password, $type = 1){
        $map = array();
        switch ($type) {
            case 1:
                $map['username'] = $username;
                break;
            case 2:
                $map['email'] = $username;
                break;
            case 3:
                $map['mobile'] = $username;
                break;
            case 4:
                $map['id'] = $username;
                break;
            default:
                return 0; //参数错误
        }

        /* 获取用户数据 */
        $user = $this->where($map)->find();
        if(is_array($user) && $user['status']){
            /* 验证用户密码 */
            if(think_ucenter_md5($password, UC_AUTH_KEY) === $user['password']){
                $this->updateLogin($user['id']); //更新用户登录信息
                return $user['id']; //登录成功，返回用户ID
            } else {
                return -2; //密码错误
            }
        } else {
            return -1; //用户不存在或被禁用
        }
    }

    /**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
    }

    /**
     * 自动登录用户
     * @param  integer $user 用户信息数组
     */
    private function autoLogin($user){
        /* 更新登录信息 */
        $data = array(
            'uid'             => $user['uid'],
            'login'           => array('exp', '`login`+1'),
            'last_login_time' => NOW_TIME,
            'last_login_ip'   => get_client_ip(1),
        );
        $this->save($data);

        /* 记录登录SESSION和COOKIES */
        $auth = array(
            'uid'             => $user['uid'],
            'username'        => get_username($user['uid']),
            'last_login_time' => $user['last_login_time'],
        );

        session('user_auth', $auth);
        session('user_auth_sign', data_auth_sign($auth));
    }

}