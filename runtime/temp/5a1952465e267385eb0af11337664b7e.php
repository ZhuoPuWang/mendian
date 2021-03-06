<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:86:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\user\deliver.html";i:1541233785;s:87:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\template\base.html";i:1540375638;s:98:"D:\phpStudy\PHPTutorial\WWW\mendian\public/../application/admin\view\template\javascript_vars.html";i:1488957233;}*/ ?>
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
    <form class="form form-horizontal" id="form" method="post" action="<?php echo \think\Request::instance()->baseUrl(); ?>">
        <input type="hidden" class="input-text" name="uid" value="<?php echo $user['id']; ?>" >
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3">用户姓名：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text"  readonly="readonly" value="<?php echo $user['username']; ?>">
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3">收货人：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" placeholder="手机号" name="mobile" value="<?php echo $user['mobile']; ?>" >
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3">所属股东：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text"  readonly="readonly" value="<?php echo $user['sname']; ?>">
                <input type="hidden" class="input-text" name="son_id" value="<?php echo $user['sid']; ?>" >
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3">选择商品：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <table border="1" id ="table">
                    <!--<tr>-->
                        <!--<td><input style="border: none" type="text" name="goodsSname[]" value="商品1"></td>-->
                        <!--<td style="display: none"><input style="border: none" type="text" name="goodsId[]" value="id"></td>-->
                        <!--<td><input style="border: none" type="text" name="goodsPrice[]" value="商品价格"></td>-->
                        <!--<td><input style="border: none" type="text" name="goodsNum[]" value="商品数量"></td>-->
                        <!--<td><a href="javascript:;" onclick="del(this)" name="" class="btn btn-danger radius ml-5"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a></td>-->
                    <!--</tr>-->
                </table>
                <tr>
                    <td><a href="javascript:open();" class="btn btn-success radius ml-5"><i class="Hui-iconfont">&#xe615;</i> 添加商品</a></td>
                </tr>
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>


        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="submit" class="btn btn-primary radius">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
                <button type="button" class="btn btn-default radius ml-20" onClick="layer_close();">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="__STATIC__/js/app.js"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js"></script>

<script type="text/javascript" src="__LIB__/Validform/5.3.2/Validform.min.js"></script>
<script>
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form").Validform({
            tiptype: 2,
            ajaxPost: true,
            showAllError: true,
            callback: function (ret){
                ajax_progress(ret);
            }
        });
    })

    function open(){
        layer_open('选择商品',"<?php echo url('User/goods',false,true); ?>");
    }

    function setChoose(id,name,price,extra){
        var tr = "<tr><td style='display: none;text-align: center'><input style='border: none' type='text' name='goodsId[]' value='"+id+"'></td><td style='display: none;text-align: center'><input style='border: none' type='text' name='goodsExtra[]' value='"+extra+"'></td><td><input style='border: none;text-align: center' type='text' name='goodsSname[]' value='"+name+"'></td><td><input style='border: none;text-align: center' type='text' name='goodsPrice[]' value='"+price+"'>元</td><td><input style='border: none;text-align: center' type='text' name='goodsNum[]' value='1'>件</td><td><a href='javascript:;' onclick='del(this)' name='' class='btn btn-danger radius ml-5'><i class='Hui-iconfont'>&#xe6e2;</i> 删除</a></td></tr>";
        $('#table').append(tr);
    }

    function del(even){
        $(even).parents("tr").remove();
    }
</script>

</body>
</html>