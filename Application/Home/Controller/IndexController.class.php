<?php
namespace Home\Controller;
class IndexController extends HomeController {
    //构造方法
    public function __construct()
    {
        parent::__construct();
        $this->module='Index';
    }
    public function index(){
        $Topic=M('Topic');
        $topicList=$Topic->select();
       /* $r=think_send_mail('xx9815@qq.com','肖兴平','文件标题','邮件内容');
        trace($topicList,'find vo');*/
        $this->assign('topicList', $topicList);
        $this->display();
    }
}