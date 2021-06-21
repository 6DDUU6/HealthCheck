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
                <li class="layui-nav-item layui-this">疫情实时数据</li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a>
                        <img src="https://cxq21.gitee.io/images/LIEFox.png"
                             class="layui-nav-img">
                        ${user1.username}管理员大大
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
        <h1 style="text-align: center">上帝视角</h1>
        <table class="layui-hide" id="test" lay-filter="test"></table>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
                <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
                <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
            </div>
        </script>
    </div>
</div>

<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/queryDataAll'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'temperature', title: '体温', width: 200, fixed: 'left', unresize: true, sort: true}
                , {field: 'username', title: '用户名', width: 200, edit: 'text'}
                , {field: 'address', title: '打卡地址', width: 500}
                , {field: 'date', title: '打卡时间', width: 500, sort: true}
            ]]
            ,parseData: function (res) {
                return {
                    "code": 0
                    ,"msg": "暂无数据"
                    , "data": res
                }
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
            }
            ;
        });
    });
</script>
</body>
</html>
