<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;

class Daochu extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
        return $this->view->fetch();
    }

    public function order(){
        $map = array();
        if ($this->request->param("userName")) {
            $map['a.username'] = ["like", "%" . $this->request->param("userName") . "%"];
        }
        if ($this->request->param("userMobile")) {
            $map['a.mobile'] = ["like", "%" . $this->request->param("userMobile") . "%"];
        }
        if ($this->request->param("userSon")) {
            $map['c.username'] = ["like", "%" . $this->request->param("userSon") . "%"];
        }
        if ($this->request->param("starttime")) {
            $map['a.createtime'] = array('egt',strtotime($this->request->param("starttime")));
        }
        if ($this->request->param("endtime")) {
            $map['a.createtime'] = array('elt',strtotime($this->request->param("endtime")));
        }

        $header = ['用户姓名','手机号','股东姓名','订单价格','股东分成' ,'订单创建时间','订单类型'];

        $list = db('deliver')
            ->alias('a')
            ->join('user b','a.uid = b.id','left')
            ->join('holder c','a.son_id = c.id','left')
            ->where($map)
            ->field('a.username,a.mobile,c.username as susername,a.price,a.sprice,a.createtime,a.type')
            ->select();
        if($list){
            foreach($list as $k=>$v){
                $list[$k]['createtime'] = date('Y-m-d H:i:s',$v['createtime']);
                if($v['type'] == 1){
                    $list[$k]['type'] = '柜员确认';
                }else{
                    $list[$k]['type'] = '系统扣款';
                }
            }
        }
        if ($error = \Excel::export($header, $list, "订单导出", '2007')) {
            throw new Exception($error);
        }
    }


}
