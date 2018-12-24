<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Deliver extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];
    protected function filter(&$map)
    {
        if ($this->request->param("id")) {
            $map['id'] = ["like", "%" . $this->request->param("id") . "%"];
        }
    }

    public function index(){
       $list = db('deliver')
           ->alias('a')
           ->join('user b','a.uid = b.id','left')
           ->join('holder c','a.son_id = c.id','left')
           ->field('b.username,c.username as susername,a.id,a.price,a.state,a.createtime,a.mobile,a.sprice')
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
            return ajax_return_adv('添加成功');

        }else{
            $id = $this->request->param('id');
            $list = db('deliver')
                ->alias('a')
                ->join('user b','a.uid = b.id','left')
                ->join('holder c','a.son_id  = c.id','left')
                ->where('a.id',$id)
                ->field('a.id,a.price,a.goods,a.mobile,b.username,c.username as sname,c.id as sid,a.uid')
                ->find();

            $goods = json_decode($list['goods']);
            $list['goods'] = $goods;
            $this->view->assign('user',$list);
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



}
