<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;

class Holder extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
        $map = '';
        if ($this->request->param("mobile")) {
            $map['mobile'] = ["like", "%" . $this->request->param("mobile") . "%"];
        }
        if ($this->request->param("username")) {
            $map['username'] = ["like", "%" . $this->request->param("mobile") . "%"];
        }
        $list = db('Holder')->paginate(10, false, ['query' => $this->request->get()]);
        $this-> view -> assign('list', $list);
        $this-> view -> assign("page", $list -> render());
        return $this->view->fetch();
    }


    public function edit()
    {

        if ($this->request->isAjax()) {
            // 更新
            $data = $this->request->post();
            db('Holder')->where('id',$data['id'])->data($data)->update();
            return ajax_return_adv("编辑成功");

        } else {
            // 编辑
            $id = $this->request->param('id');
            $list = db('Holder')
                ->alias('a')
                ->where(array('a.id'=>$id))
                ->field('a.id,a.username,a.mobile,a.age,a.sex,a.money,a.record,a.createtime')
                ->find();
            $this->view->assign('vo',$list);
            return $this->view->fetch();
        }
    }

    public function add(){
        if ($this->request->isAjax()) {
            // 更新
            $data = $this->request->post();
            $data['createtime'] = time();
            //判断手机号有没有被注册
            $result = Db::query('call sl_holder(:_mobile)',['_mobile'=>$data['mobile']]);
            if($result[0][0]['@id'] != null){
                return ajax_return_adv_error("用户已经存在");
                exit;
            }else{
                db('Holder')->data($data)->insert();
                return ajax_return_adv("添加成功");
            }
        } else {
            // 编辑
            return $this->view->fetch();
        }
    }

    public function del(){
        $id  = $this->request->get('id');
        $da  =  db('Holder')->where('id',$id)->delete();
        if($da){
            return json_encode(1);
        }else{
            return json_encode(2);
        }
    }



}
