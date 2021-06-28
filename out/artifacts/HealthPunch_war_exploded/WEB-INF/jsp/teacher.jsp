<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户打卡记录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%--导航栏 start--%>
<div class="grid-demo">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo" style="color: white;font-size: 32px">疫情防控</div>
            <!-- 头部区域（可配合layui 已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layui-this">学生打卡记录</li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jumpTeacherModifyTip">发布打卡</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a>
                        <img src="https://cxq21.gitee.io/images/LIEFox.png"
                             class="layui-nav-img">
                        ${user1.username}老师
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/Logout">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
<%--导航栏 end--%>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<div class="layui-row" style="margin-top: 100px">
    <div class="layui-col-xs12 layui-col-md12">
        <h1 style="text-align: center">任务情况</h1>
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>

<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/querySignInfo'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , title: '用户数据表'
            , cols: [[
                {field: 'signid', title: '签到id', width: 100, unresize: true, sort: true}
                , {field: 'username', title: '用户名', width: 200}
                , {field: 'address', title: '打卡地址', width: 500}
                , {field: 'temperature', title: '体温', width: 100, sort: true}
                , {field: 'qr_code_color', title: '健康码颜色', width: 200, sort: true}
                , {field: 'is_to_dongguan', title: '是否去过高风险地区', width: 200}
                , {field: 'date', title: '打卡时间', sort: true}
            ]]
            ,parseData: function (res) {
                return {
                    "code": 0
                    ,"msg": "暂无数据"
                    ,"data": res
                }
            }
        });
    });
</script>
</body>
</html>
