<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class SetMail extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
        $map = array();
        if ($this->request->param("realname")) {
            $map['a.name'] = ["like", "%" . $this->request->param("realname") . "%"];
        }
        if($this->request->param("type")){
            if ($this->request->param("type") != '0') {
                $map['a.type'] = $this->request->param("type");
            }
        }
        if($this->request->param("stype")){
            if ($this->request->param("stype") != '0') {
                $map['a.stype'] = $this->request->param("stype");
            }
        }
        $list = db('set_mail')
            ->alias('a')
            ->join('goodstype b','a.stype = b.id','left')
            ->where($map)
            ->field('a.id,a.name,a.price,a.extra,a.stype,b.name as tname,a.stork')
            ->paginate(10, false, ['query' => $this->request->get()]);
        $this-> view -> assign('list', $list);
        $this-> view -> assign("page", $list -> render());
        return $this->view->fetch();
    }




    public function del(){
        $id  = $this->request->get('id');
        $da  =  db('set_mail')->where('id',$id)->delete();
        if($da){
            return json_encode(1);
        }else{
            return json_encode(2);
        }
    }
    public function add(){
        if ($this->request->isAjax()) {
            $data = $this->request->post();
            db('set_mail')->data($data)->insert();
            return ajax_return_adv("添加成功");
        } else {
            return $this->view->fetch();
        }
    }

    public function edit(){
        if ($this->request->isAjax()) {
            $data = $this->request->post();
            db('set_mail')->data($data)->where('id',$data['id'])->update();
            return ajax_return_adv("添加成功");
        } else {
            $id = $this->request->param('id');
            $list = db('set_mail')
                ->alias('a')
                ->join('goodstype b','a.type = b.id','left')
                ->join('goodstype c','a.stype = c.id','left')
                ->where('a.id',$id)
                ->field('a.id,a.name,a.price,a.extra,a.type,a.stype,b.name as tname,c.name as stname,a.stork')
                ->find();

            $this->view->assign('vo',$list);
            return $this->view->fetch();
        }
    }

    public function sort(){
        $fl = db('goodstype')->where(array('son_id'=>array('eq','0')))->field('id,name')
            ->select();
        echo json_encode(array('state'=>'1','data'=>$fl));
    }

    public function sortSon(){
        $fl = db('goodstype')->where('son_id',$this->request->param('id'))->field('id,name')
            ->select();
        if(empty($fl)){
            $fl[0] =array('id'=>'0','name'=>'请填写二级分类');
        }
        echo json_encode(array('state'=>'1','data'=>$fl));
    }
}
