<?php
namespace Home\Controller;
class TopicController extends HomeController {
    private $Topic;

    //构造方法
    public function __construct()
    {
        parent::__construct();
        $this->Topic=D('Topic');
    }
    public function info(){
        $info=$this->Topic->info(I('get.tid'));
        $this->assign('info', $info);
        $this->assign('hover', 'index');
        $this->display();
    }

    public function news(){
        $this->assign('hover', 'news');
        $this->display();
    }
}