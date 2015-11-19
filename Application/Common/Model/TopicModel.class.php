<?php
/**
 * Created by PhpStorm.
 * User: 肖兴平
 * Email: xx9815@qq.com
 * Date: 2015/11/12
 * Time: 11:30
 */
namespace Common\Model;
use Think\Model;

/**
 * 文章模型
 */
class TopicModel extends Model{
    /* 用户模型自动验证 */
    protected $_validate = array();

    /* 用户模型自动完成 */
    protected $_auto = array();

    /**
     * 分页查询
     * @param array $map 查询条件
     * @return array
     */
    public function pageList($map=array()){
        //总记录数
        $total=$this->where($map)->count();
        $page = new \Think\Page($total, C('PAGE'));
        $list=$this->where($map)->limit($page->firstRow, $page->listRows)->order('create_time desc')->select();
        return array('list'=>$list, '_page'=>$page->showFront());
    }

    /**
     * 查询文章内容
     */
    public function info($tid){
        return $this->where(array('tid'=>$tid))->find();
    }
}