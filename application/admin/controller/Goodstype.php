<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Goodstype extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
        $list = db('goodstype')
            ->alias('a')
            ->join('goodstype b','a.son_id = b.id','left')
            ->field('a.id,a.name,b.name as sname,a.son_id')
            -> paginate(10, false, ['query' => $this->request->get()]);
        $this-> view -> assign('list', $list);
        $this-> view -> assign("page", $list -> render());
        return $this->view->fetch();
    }

    public function edit(){
        if($this->request->isAjax()){
            $data = $this->request->post();
            if($data['son_id'] == 0){
                $data['path'] = '0';
            }else{
                $data['path'] = ','.$data['son_id'];
            }
            db('goodstype')->data($data)->where('id',$data['id'])->update();
            return ajax_return_adv("添加成功");
        }else{
            $id = $this->request->param('id');
            $vo = db('goodstype')->where('id',$id)->find();
            //获取表中一级类
            $list = db('goodstype')->where(array('son_id'=>'0'))->field('id,name')->select();
            $this-> view -> assign('list', $list);
            $this-> view -> assign('vo', $vo);
            return $this->view->fetch();
        }
    }

    public function add(){
        if($this->request->isAjax()){
            $data = $this->request->post();
            if($data['son_id'] == 0){
                $data['path'] = '0';
            }else{
                $data['path'] = ','.$data['son_id'];
            }
            db('goodstype')->data($data)->insert();
            return ajax_return_adv("添加成功");
        }else{
            //获取表中一级类
            $list = db('goodstype')->where(array('son_id'=>'0'))->field('id,name')->select();
            $this-> view -> assign('list', $list);
            return $this->view->fetch();
        }
    }

    public function del(){
        $id  = $this->request->get('id');
        //判断是否有子集
        $data = db('goodstype')->where('son_id',$id)->find();
        if($data){
            return json_encode(2);
            exit;
        }
        $da  =  db('goodstype')->where('id',$id)->delete();
        if($da){
            return json_encode(1);
        }else{
            return json_encode(2);
        }
    }

}
