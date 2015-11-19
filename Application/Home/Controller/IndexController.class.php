<?php
namespace Home\Controller;
class IndexController extends HomeController {
    //构造方法
    public function __construct()
    {
        parent::__construct();
    }
    public function index(){
        $map['status']=1;
        $data=D('Topic')->pageList($map);
        $this->assign('data', $data);
        $this->assign('hover', 'index');
        $this->display();
    }
}