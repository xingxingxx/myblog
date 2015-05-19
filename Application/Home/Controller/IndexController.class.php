<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $Topic=M('Topic');
        $topicList=$Topic->select();
        $this->assign('topicList', $topicList);
        $this->display();
    }
}