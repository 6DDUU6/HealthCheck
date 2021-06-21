<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>

    <style>
        /*背景透明化*/
        .layui-bg-gray {
            background-color: rgba(255, 0, 0, 0.0) !important
        }

        /*卡片透明化*/
        .layui-card {
            background-color: rgba(255, 255, 255, 0.8) !important;

        }

        /*输入框透明化*/
        .layui-input {
            background-color: rgba(255, 255, 255, 0.5) !important;
            box-shadow: 1px 1px 1px #226
        }

        /*视频背景设置*/
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
</head>
<body>
<%--视频背景--%>
<div class="videocontainer">
    <video class="fullscreenvideo" poster="" id="bgvid" playsinline=""
           autoplay="" muted="" loop="">
        <source src="${pageContext.request.contextPath}/static/video/kanyi1.mp4" type="video/mp4">
    </video>
</div>
<%--视频背景--%>

<%--主体--%>
<div class="layui-bg-gray" style="padding: 200px ;height: 250px">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-row layui-col-space15">
                <div class="layui-card">
                    <div class="layui-card-header" style="text-align: center">
                        <h1>用户登录</h1>
                    </div>
                    <div class="layui-card-body">
                        <%--输入框--%>
                        <form class="layui-form" action="${pageContext.request.contextPath}/LoginUser" method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label"><h3>用户名：</h3></label>
                                <div class="layui-input-block">
                                    <input id="suggestId" type="text" name="username" lay-verify="required"
                                           autocomplete="off" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入用户名"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"><h3>密&nbsp;&nbsp;&nbsp;&nbsp;码：</h3></label>
                                <div class="layui-input-block">
                                    <input type="text" name="password" lay-verify="required" lay-reqtext="密码是必填项，岂能为空？"
                                           placeholder="请输入您的密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <div style="text-align: center ;margin-left: -40px">
                                        <button type="submit" class="layui-btn" lay-submit="" class="submit">登录
                                        </button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <%--小聪明，当时的灵机一动，感觉不好的可以直接修改--%>
                        <span style="color: red;margin-left: 460px"><i class="layui-icon layui-icon-face-surprised"
                                                                       style="font-size: 20px"></i>&nbsp;${info}</span>
                        <%--输入框 end--%>
                        <a href="${pageContext.request.contextPath}/jumpRegister" style="margin-left: 1075px">注册</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<%--主体--%>


<div style="margin-left: 650px">
    <%--gitee仓库图标地址--%>
    <a href='https://gitee.com/cxq21/HealthCheck' target="_blank" title="项目仓库"><img
            src='https://gitee.com/cxq21/HealthCheck/widgets/widget_6.svg' alt='Fork me on Gitee'></img></a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <%--liefox官网--%>
    <a href='https://cxq21.gitee.io' target="_blank" title="LIEFox官网"><img
            src="https://cxq21.gitee.io/images/LIEFox.png" alt='LIEFox官网' height="40px"></img></a>
</div>

</body>
</html>