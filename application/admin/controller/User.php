<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;

class User extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
        $map = '';
        if ($this->request->param("realname")) {
            $map['b.username'] = ["like", "%" . $this->request->param("realname") . "%"];
        }
        if ($this->request->param("realname")) {
            $map['a.mobile'] = ["like", "%" . $this->request->param("mobile") . "%"];
        }
        $list = db('user')
            ->alias('a')
            ->join('holder b','a.son_id = b.id')
            ->where($map)
            ->field('a.id,a.username,a.mobile,a.age,a.sex,a.money,a.record,a.createtime,b.username as realname')
            ->paginate(10, false, ['query' => $this->request->get()]);
        $this-> view -> assign('list', $list);
        $this-> view -> assign("page", $list -> render());
        return $this->view->fetch();
    }


    public function edit()
    {

        if ($this->request->isAjax()) {
            // 更新
            $data = $this->request->post();
            db('user')->where('id',$data['id'])->data($data)->update();
            return ajax_return_adv("编辑成功");

        } else {
            // 编辑
            $id = $this->request->param('id');
            $list['sex'] = '0';
            $list = db('user')
                ->alias('a')
                ->join('holder b','a.son_id = b.id')
                ->where(array('a.id'=>$id))
                ->field('a.id,a.username,a.mobile,a.age,a.sex,a.money,a.record,a.createtime,b.username as realname')
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
            $result = Db::query('call sl_user(:_mobile)',['_mobile'=>$data['mobile']]);
            if($result[0][0]['@id'] != null){
                return ajax_return_adv_error("用户已经存在");
                exit;
            }else{
                db('user')->data($data)->insert();
                return ajax_return_adv("添加成功");
            }
        } else {
            // 编辑
            return $this->view->fetch();
        }
    }

    public function del(){
        $id  = $this->request->get('id');
        $da  =  db('User')->where('id',$id)->delete();
        if($da){
            return json_encode(1);
        }else{
            return json_encode(2);
        }
    }


    public function Recharge(){
        if($this->request->isAjax()){
            $data = $this->request->post();
            $where['type'] = '1';
            $where['state'] = '1';
            $where['consume'] = array('elt',$data['money']);
            $list = db('activ')->where($where)->order('consume desc')->field('discount')->find();
            $money = $data['money']+ $list['discount'];
            db('user')->where('id',$data['id'])->setInc('money',$money);
            return ajax_return_adv("充值成功");
        }else{
            $id = $this->request->param('id');
            $user  =db('user')->where('id',$id)->field('id,username')->find();
            $this->view->assign('vo',$user);
            return $this->view->fetch();
        }
    }

    public function deliver(){
        if($this->request->isAjax()){
            $data = $this->request->post();
            $goods = array();
            $price = 0;
            $sprice = 0;
            if(!isset($data['goodsSname'])){
                echo json_encode(array('state'=>'1','data'=>'请选择商品'));
                exit();
            }

            foreach($data['goodsSname'] as $k=>$v){
                $goods[$k]['goodsId'] = $data['goodsId'][$k];
                $goods[$k]['goodsSname'] = $data['goodsSname'][$k];
                $goods[$k]['goodsPrice'] = $data['goodsPrice'][$k];
                $goods[$k]['goodsNum'] = $data['goodsNum'][$k];
                $goods[$k]['goodsExtra'] = $data['goodsExtra'][$k];

                $price = $price +  $goods[$k]['goodsPrice'] * $goods[$k]['goodsNum'];
                $sprice =  $sprice +$goods[$k]['goodsPrice'] * $goods[$k]['goodsNum']*$goods[$k]['goodsExtra'];
            }

            //库存
            foreach($goods as $k=>$v){
                $goo = db('set_mail')->where(array('id'=>$v['goodsId'])) ->field('id,name,stork')->find();
                if($goo['stork'] < $v['goodsNum']){
                   // return ajax_return_adv_error($goo['name'].'库存不足,剩余件数'.$goo['stork']);
                    echo json_encode(array('state'=>'1','data'=>$goo['name'].'库存不足,剩余件数'.$goo['stork']));
                    exit();
                }
            }

            //钱
            $mo = db('user')->where(array('id'=>$data['uid'],'money'=>array('egt',$price)))->select();
            if(!$mo){
                //余额不足
                $dataaa['type'] = '1';
            }else{
                $dataaa['type'] = '0';
            }

            $dataa['son_id']  = $data['son_id'];
            $dataa['price']  = $price;
            $dataa['goods']  = json_encode($goods);
            $dataa['createtime']  = time();
            $dataa['uid']  = $data['uid'];
            $dataa['mobile']  = $data['mobile'];
            $dataa['sprice']  = $sprice;
            $dataa['username']  =$data['username'];


            foreach($goods as $k=>$v){
                db('set_mail')->where('id',$v['goodsId'])->setDec('stork',$v['goodsNum']);
            }
            if($dataaa['type'] == '0'){
                db('user')->where('id',$data['uid'])->setDec('money',$price);
            }
            db('holder')->where('id',$data['son_id'])->setInc('money',$sprice);
            db('deliver')->insert($dataa);

            echo json_encode(array('state'=>'0','data'=>'出货成功'));
        }else{
            $id = $this->request->param('id');
            $user = db('user')
                ->alias('a')
                ->join('holder b','a.son_id = b.id','left')
                ->where('a.id',$id)
                ->field('a.id,a.username,a.mobile,b.username as sname,b.id as sid')
                ->find();

            $this->view->assign('user',$user);
            return $this->view->fetch();
        }
    }

    public function goods(){
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


    public function holder(){
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

}
