<?php
namespace Admin\Controller;
/**
 * 后台首页控制器
 */
class PublicController extends \Think\Controller {

    /**
     * 后台用户登录
     */
    public function login($username=null, $password=null) {
        if(IS_POST){
            $result=D('User')->login($username, $password, 0);
            if($result===true){
                $this->redirect('Index/index');
            }else{
                $this->error($result);
            }
        } else {
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                $this->display();
            }
        }
    }
}
