<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Holdermoney extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
        $map = array();
        if ($this->request->param("userSon")) {
            $map['c.username'] = ["like", "%" . $this->request->param("userSon") . "%"];
        }else{
            $map['c.username'] = '';
        }
        if ($this->request->param("starttime")) {
            $map['a.createtime'] = array('egt',strtotime($this->request->param("starttime")));
        }
        if ($this->request->param("endtime")) {
            $map['a.createtime'] = array('elt',strtotime($this->request->param("endtime")));
        }
       $list = db('deliver')
           ->alias('a')
           ->join('user b','a.uid = b.id','left')
           ->join('holder c','a.son_id = c.id','left')
           ->where($map)
           ->field('b.username,c.username as susername,a.id,a.price,a.state,a.createtime,a.mobile,a.sprice')
           ->paginate(10, false, ['query' => $this->request->get()]);
        $this-> view -> assign('list', $list);
        $this-> view -> assign("page", $list -> render());
        return $this->view->fetch();
    }


}
