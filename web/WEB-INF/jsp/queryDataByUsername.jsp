<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${user1.username}打卡记录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%--导航栏 start--%>
<div class="grid-demo">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <a href="${pageContext.request.contextPath}/jumpMain"> <div class="layui-logo" style="color: white;font-size: 32px">疫情防控</div></a>
            <!-- 头部区域（可配合layui 已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layui-this">打卡记录</li>
                <li class="layui-nav-item"><a href="http://2019ncov.chinacdc.cn/2019-nCoV/" target="_blank">疫情实时数据</a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a>
                        <img src="https://cxq21.gitee.io/images/LIEFox.png"
                             class="layui-nav-img">
                        ${user1.username}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/jumpUserMod">个人信息</a></dd>
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
        <h1 style="text-align: center">${user1.username}的打卡记录</h1>

        <table class="layui-table" lay-size="lg" id="tab">

            <thead>
            <tr >
                <th>体温<span style="float: right">单位：℃</span></th>
                <th>所在位置</th>
                <th>打卡时间</th>
                <th>粤康码颜色</th>
                <th>是否去过东莞</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="info" items="${list}">
                <tr>
                    <td>${info.temperature}&nbsp;&nbsp;℃</td>
                    <td>${info.address}</td>
                    <td>${info.date}</td>
                    <td>${info.qr_code_color}</td>
                    <td>${info.is_to_dongguan}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/jumpMain"><button type="button" class="layui-btn layui-btn-fluid">返回</button></a>
    </div>
</div>

<script>
    /*layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'tab' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 30 //数据总数，从服务端得到
        });
    });*/
</script>
</body>
</html>
