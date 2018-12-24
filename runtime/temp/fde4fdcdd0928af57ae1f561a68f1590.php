<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:87:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\deliver\index.html";i:1541318459;s:87:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\template\base.html";i:1540375638;s:98:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\template\javascript_vars.html";i:1488957233;s:86:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\deliver\form.html";i:1541318961;s:84:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\deliver\th.html";i:1541310872;s:84:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\deliver\td.html";i:1541310876;}*/ ?>
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
    <div style="float: left">
    <input type="text" class="input-text" style="width:250px" placeholder="用户名称" name="userName" value="<?php echo \think\Request::instance()->param('userName'); ?>" >
    <input type="text" class="input-text" style="width:250px" placeholder="用户手机号" name="userMobile" value="<?php echo \think\Request::instance()->param('userMobile'); ?>" >
    <input type="text" class="input-text" style="width:250px" placeholder="所属股东" name="userSon" value="<?php echo \think\Request::instance()->param('userSon'); ?>" >

        开始时间：<input style="width: 200px" type="text" class="input-text Wdate" placeholder="日期" name="starttime" value=""  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"   datatype="*" nullmsg="请选择日期">
        结束时间：<input style="width: 200px" type="text" class="input-text Wdate" placeholder="日期" name="endtime" value=""  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"   datatype="*" nullmsg="请选择日期">

    <button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </div>
</form>
    <div class="cl pd-5 ">
        <!--<span class="l">-->
            <!--<?php if (\Rbac::AccessCheck('add')) : ?><a class="btn btn-primary radius mr-5" href="javascript:;" onclick="layer_open('添加','<?php echo \think\Url::build('add', []); ?>')"><i class="Hui-iconfont">&#xe600;</i> 添加</a><?php endif; ?>-->
        <!--</span>-->
        <!--<span class="r pt-5 pr-5">-->
            <!--共有数据 ：<strong><?php echo isset($count) ? $count :  '0'; ?></strong> 条-->
        <!--</span>-->
    </div>
    <table class="table table-border table-bordered table-hover table-bg mt-20">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox"></th>
<th width="">id</th>
<th width="">所属用户</th>
<th width="">用户手机号</th>
<th width="">所属股东</th>
<th width="">总价</th>
<th width="">股东分成</th>
<th width="">创建时间</th>

            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr class="text-c">
            <td><input type="checkbox" name="id[]" value="<?php echo $vo['id']; ?>"></td>
<td><?php echo high_light($vo['id'],\think\Request::instance()->param('id')); ?></td>
<td><?php echo $vo['username']; ?></td>
<td><?php echo $vo['mobile']; ?></td>
<td><?php echo $vo['susername']; ?></td>
<td><?php echo $vo['price']; ?></td>
<td><?php echo $vo['sprice']; ?></td>
<td><?php echo date('Y-m-d',$vo['createtime']); ?></td>

            <td class="f-14" >

                <?php if (\Rbac::AccessCheck('edit')) : ?> <a title="编辑" href="javascript:;" onclick="layer_open('编辑','<?php echo \think\Url::build('edit', ['id' => $vo["id"], ]); ?>')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><?php endif; ?>
                <!--<a href="javascript:;" onclick="confirm(this)" name="<?php echo $vo['id']; ?>" style="margin: 5px 0" class="btn btn-success radius"><i class="Hui-iconfont">&#xe6a7;</i> 确认</a>-->
                <a href="javascript:;" onclick="del(this)" name="<?php echo $vo['id']; ?>" style="margin: 5px 0" class="btn btn-danger radius ml-5"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a>
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

<script type="text/javascript" src="__LIB__/My97DatePicker/WdatePicker.js"></script>
<script>
    function del(even){
        var id = $(even).attr('name');
        var loading = layer.load(3, {shade: [0.8, '#393D49']});
        layer.confirm('确定删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                url:"<?php echo url('del'); ?>",
                type:'get',
                dataType:'json',
                data:{
                    id:id
                },
                success:function(msg){
                    console.log(msg);
                    layer.close(loading);
                    layer.msg('删除成功', {icon: 1,time:2000});
                    window.location.reload();
                },
                error:function(err){
                    alert('网络连接错误');
                    window.location.reload();
                }
            });
        }, function(){
            layer.close(loading);
        });
    }

    function confirm(even){
        var id = $(even).attr('name');
        var loading = layer.load(3, {shade: [0.8, '#393D49']});
        layer.confirm('确定吗？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                url:"<?php echo url('confirm'); ?>",
                type:'get',
                dataType:'json',
                data:{
                    id:id
                },
                success:function(msg){
                    console.log(msg);
                    layer.close(loading);
                    layer.msg('确认成功', {icon: 1,time:2000});
                    window.location.reload();
                },
                error:function(err){
                    alert('网络连接错误');
                    window.location.reload();
                }
            });
        }, function(){
            layer.close(loading);
        });
    }

</script>

</body>
</html>