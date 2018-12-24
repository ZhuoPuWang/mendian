<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:84:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\user\goods.html";i:1541233965;s:87:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\template\base.html";i:1540375638;s:98:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\template\javascript_vars.html";i:1488957233;}*/ ?>
﻿<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>计费管理系统</title>
    <link rel="Bookmark" href="__ROOT__/favicon.ico" >
    <link rel="Shortcut Icon" href="__ROOT__/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="__LIB__/html5.js"></script>
    <script type="text/javascript" src="__LIB__/respond.min.js"></script>
    <script type="text/javascript" src="__LIB__/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/app.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    
    <!--[if IE 6]>
    <script type="text/javascript" src="__LIB__/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--定义JavaScript常量-->
<script>
    window.THINK_ROOT = '<?php echo \think\Request::instance()->root(); ?>';
    window.THINK_MODULE = '<?php echo \think\Url::build("/" . \think\Request::instance()->module(), "", false); ?>';
    window.THINK_CONTROLLER = '<?php echo \think\Url::build("___", "", false); ?>'.replace('/___', '');
</script>
</head>
<body>

<nav class="breadcrumb">
    <div id="nav-title"></div>
    <a class="btn btn-success radius r btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="刷新"><i class="Hui-iconfont"></i></a>
</nav>


<div class="page-container">
    <form class="mb-20" method="get" action="<?php echo \think\Url::build(\think\Request::instance()->action()); ?>">
        <input type="text" class="input-text" style="width:250px;"style="float: left;width: 30%"  placeholder="商品名称" name="realname" value="<?php echo \think\Request::instance()->param('realname'); ?>" >
        <!--<input type="text" class="input-text" style="width:250px" placeholder="分类名称" name="mobile" value="<?php echo \think\Request::instance()->param('mobile'); ?>" >-->
        <select name="type" id="select" class="select-box"  onchange="sort(this)" style="float: left;width: 30%" >
            <option value="0" >请选择商品分类</option>
        </select>
        <select name="stype" id="selectson" class="select-box" style="float: left;width: 30%">
            <option value="0" id ="optione">请选择商品二级分类</option>
        </select>
        <button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </form>
    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l" <?php if($_SESSION['think']['auth_id'] != 1): ?> style="display: none;" <?php endif; ?>>
            <?php if (\Rbac::AccessCheck('add')) : ?><a class="btn btn-primary radius mr-5" href="javascript:;" onclick="layer_open('添加','<?php echo \think\Url::build('add', []); ?>')"><i class="Hui-iconfont">&#xe600;</i> 添加</a><?php endif; ?>
        </span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg mt-20">
        <thead>
        <tr class="text-c">
            <th width="">ID</th>
            <th width="">商品名称</th>
            <th width="">商品价格（元）</th>
            <th width="">商品库存</th>
            <th width="">股东分成</th>
            <th width="">所属上级</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr class="text-c">
            <td><?php echo $vo['id']; ?></td>
            <td><?php echo $vo['name']; ?></td>
            <td><?php echo $vo['price']; ?></td>
            <td><?php echo $vo['stork']; ?></td>
            <td><?php echo $vo['extra']; ?></td>
            <td><?php echo $vo['tname']; ?></td>
            <td class="f-14">
              <a href="javascript:;" onclick="setChoose(this)" dat="<?php echo $vo['id']; ?>" dat2="<?php echo $vo['name']; ?>" dat3="<?php echo $vo['price']; ?>" dat4="<?php echo $vo['extra']; ?>" class="btn btn-danger radius ml-5"><i class="Hui-iconfont">&#xe6e2;</i> 选择</a>
            </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
    <div class="page-bootstrap"><?php echo isset($page) ? $page :  ''; ?></div>
</div>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="__STATIC__/js/app.js"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js"></script>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script>

    function setChoose(even){
        var id = $(even).attr('dat');
        var name = $(even).attr('dat2');
        var price = $(even).attr('dat3');
        var extra = $(even).attr('dat4');
        window.parent.setChoose(id,name,price,extra);
        window.parent.layer.close(parent.layer.getFrameIndex(window.name));
    }


    $(function(){
        $.ajax({
            url:'<?php echo url("sort"); ?>',
            type:'get',
            dataType:'json',
            data:'',
            success:function(msg){
                var data = msg.data;
                for(var i =0;i<data.length;i++){
                    var option = "<option value='"+data[i].id+"'>"+data[i].name+"</option>";
                    $("#select").append(option);
                }
            },
            error:function(err){
                alert('网络连接错误');
            }
        });
    })

    function sort(even){
        $('.aa').removeClass("hidden");
        var id= $(even).val();
        $("#selectson").find('option').remove();
        $.ajax({
            url:'<?php echo url("sortSon"); ?>',
            type:'get',
            dataType:'json',
            data:{
                'id':id
            },
            success:function(msg){
                var data = msg.data;
                var option ="<option value='0'>请选择商品二级分类</option>"+option;

                for(var i =0;i<data.length;i++){
                    option = option+"<option value='"+data[i].id+"'>"+data[i].name+"</option>";

                }
                $("#selectson").append(option);
            },
            error:function(err){
                alert('网络连接错误');
            }
        });
    }

</script>

</body>
</html>