<?php
namespace Home\Controller;
class IndexController extends HomeController {
    public function index(){
        $Topic=M('Topic');
        $topicList=$Topic->select();
       /* $r=think_send_mail('xx9815@qq.com','肖兴平','文件标题','邮件内容');
        trace($topicList,'find vo');*/
        $this->assign('topicList', $topicList);
        $this->display();
    }
}