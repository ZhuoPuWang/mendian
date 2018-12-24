<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Deliver extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function index(){
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
       $list = db('deliver')
           ->alias('a')
           ->join('user b','a.uid = b.id','left')
           ->join('holder c','a.son_id = c.id','left')
           ->where($map)
           ->order('a.id desc')
           ->field('a.username,c.username as susername,a.id,a.price,a.state,a.createtime,a.mobile,a.sprice,a.type')
           ->paginate(10, false, ['query' => $this->request->get()]);
        $this-> view -> assign('list', $list);
        $this-> view -> assign("page", $list -> render());
        return $this->view->fetch();
    }

    public function edit(){
        if($this->request->isAjax()){
            $data = $this->request->post();
            $goods = array();
            $price = 0;
            $sprice = 0;
            foreach($data['goodsSname'] as $k=>$v){
                $goods[$k]['goodsId'] = $data['goodsId'][$k];
                $goods[$k]['goodsSname'] = $data['goodsSname'][$k];
                $goods[$k]['goodsPrice'] = $data['goodsPrice'][$k];
                $goods[$k]['goodsNum'] = $data['goodsNum'][$k];
                $goods[$k]['goodsExtra'] = $data['goodsExtra'][$k];

                $price = $price +  $goods[$k]['goodsPrice'] * $goods[$k]['goodsNum'];
                $sprice =  $sprice +$goods[$k]['goodsPrice'] * $goods[$k]['goodsNum']*$goods[$k]['goodsExtra'];
            }

            $dataa['son_id']  = $data['son_id'];
            $dataa['price']  = $price;
            $dataa['goods']  = json_encode($goods);
            $dataa['createtime']  = time();
            $dataa['uid']  = $data['uid'];
            $dataa['mobile']  = $data['mobile'];
            $dataa['sprice']  = $sprice;

            db('deliver')->where('id',$data['id'])->data($dataa)->update();
            return ajax_return_adv('编辑成功');

        }else{
            $id = $this->request->param('id');
            $list = db('deliver')
                ->alias('a')
                ->join('user b','a.uid = b.id','left')
                ->join('holder c','a.son_id  = c.id','left')
                ->where('a.id',$id)
                ->field('a.id,a.price,a.goods,a.mobile,a.username,c.username as sname,c.id as sid,a.uid,a.price,a
                .sprice')
                ->find();

            $goods = json_decode($list['goods']);
            $list['goods'] = $goods;
            $this->view->assign('user',$list);
            return $this->view->fetch();
        }
    }

    public function add(){
        if($this->request->isAjax()){
            $data = $this->request->post();
            if(!isset($data['son_id'])){
                $dataa['son_id'] = '0';
            }else{
                $dataa['son_id'] = $data['son_id'];
            }
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
            $dataa['type'] = '1';
            $dataa['price']  = $price;
            $dataa['goods']  = json_encode($goods);
            $dataa['createtime']  = time();
            $dataa['uid']  = '0';
            $dataa['mobile']  = $data['mobile'];
            $dataa['sprice']  = $sprice;
            $dataa['username']  =$data['username'];


            foreach($goods as $k=>$v){
                db('set_mail')->where('id',$v['goodsId'])->setDec('stork',$v['goodsNum']);
            }
            if( $dataa['son_id'] != '0'){
                db('holder')->where('id',$data['son_id'])->setInc('money',$sprice);
            }
            db('deliver')->insert($dataa);

            echo json_encode(array('state'=>'0','data'=>'出货成功'));
        }else{
            return $this->view->fetch();
        }
    }



    public function confirm (){
        $id = $this->request->param('id');
        $data['state'] = '1';
        $da  =  db('deliver')->where('id',$id)->update($data);
        if($da){
            return json_encode(1);
        }else{
            return json_encode(2);
        }

    }
    public function del(){
        $id  = $this->request->get('id');
        $da  =  db('deliver')->where('id',$id)->delete();
        if($da){
            return json_encode(1);
        }else{
            return json_encode(2);
        }
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

    public function daochu(){
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
