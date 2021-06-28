<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
</head>
<style>
    .layui-bg-gray {
        background-color: rgba(255, 0, 0, 0.0) !important
    }

    .layui-card {
        background-color: rgba(255, 255, 255, 0.8) !important;
    }

    .fullscreenvideo {
        position: absolute;
        top: 50%;
        left: 50%;
        min-width: 100%;
        min-height: 100%;
        width: auto;
        height: auto;
        z-index: -100;
        -webkit-transform: translateX(-50%) translateY(-50%);
        transform: translateX(-50%) translateY(-50%);
        -webkit-transition: 1s opacity;
        transition: 1s opacity;
    }

    .videocontainer {
        position: fixed;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -100;
    }

    .videocontainer:before {
        content: "";
        position: absolute;
        width: 100%;
        height: 100%;
        display: block;
        z-index: -1;
        top: 0;
        left: 0;
        background: rgba(25, 29, 34, .65);
    }

    body {
        margin: 0;
        padding: 0;
    }
</style>
<body>
<span id="flag" style="display: none">${flag}</span>
<script>
    var flag = document.querySelector("#flag").innerHTML;
    if (flag == "false") {
        var layer = layui.use('layer', function () {
            layer.msg("用户名已存在", {icon: 5});
        });
    }
</script>
<div class="videocontainer">
    <video class="fullscreenvideo" poster="" id="bgvid" playsinline=""
           autoplay="" muted="" loop="">
        <source src="${pageContext.request.contextPath}/static/video/kanyi1.mp4" type="video/mp4">
    </video>
</div>
<div class="layui-bg-gray" style="padding: 200px ">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card">
                    <div class="layui-card-header" style="text-align: center">
                        <h1>教师注册</h1>
                    </div>
                    <div class="layui-card-body">
                        <%--输入框--%>
                        <form class="layui-form" action="${pageContext.request.contextPath}/IfTeacherRegister" method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label"><h3>教师名字:</h3></label>
                                <div class="layui-input-block">
                                    <input id="suggestId" type="text" name="username" lay-verify="required|username"
                                           autocomplete="off" lay-reqtext="取个名字吧！" placeholder="请输入用户名"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"><h3>密&nbsp;&nbsp;&nbsp;&nbsp;码：</h3></label>
                                <div class="layui-input-block">
                                    <input type="text" name="password" lay-verify="required|pass" autocomplete="off"
                                           lay-reqtext="请输入您的密码"
                                           placeholder="请输入您的密码" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"><h3>学&nbsp;&nbsp;&nbsp;&nbsp;校：</h3></label>
                                <div class="layui-input-block">
                                    <input type="text" name="school" lay-verify="required|pass" autocomplete="off"
                                           lay-reqtext="学校是必填项，岂能为空？"
                                           placeholder="请输入您所在的学校" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <div style="text-align: center ;margin-left: -40px">
                                        <button type="submit" class="layui-btn" lay-submit="">注册</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                            <%--小聪明，当时的灵机一动，感觉不好的可以直接修改--%>
                            <span style="color: red;"><i class="layui-icon layui-icon-face-surprised" style="font-size: 20px"></i>&nbsp;${info}</span>
                        <%--输入框 end--%>
                        <a href="${pageContext.request.contextPath}/login.jsp" style="float:right">返回</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        form.verify({
            username:[
                /^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$/
                ,'用户名不合法喔！'
            ]
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            , pass: [
                /^[\S]{3,6}$/
                , '密码必须3到6位，且不能出现空格'
            ]
        });
    });
</script>

</body>
</html>
