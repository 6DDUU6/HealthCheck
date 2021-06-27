<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>健康签到</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
            font-size: 14px;
        }

        #l-map {
            position: fixed;
            left: 25%;
            top: 50%;
            margin-top: 100px;
            height: 50%;
            width: 50%;
            box-shadow: 5px 3px 10px #226
        }
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=bdN37lQtQ2tGTFYGWg9AgGiHIes8rhEB"></script>
</head>
<body>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<div class="layui-row">
    <div class="layui-col-xs12 layui-col-md8">
        <%--导航栏 start--%>
        <div class="grid-demo">
            <div class="layui-layout layui-layout-admin">
                <div class="layui-header">
                    <a href="${pageContext.request.contextPath}/jumpMain"> <div class="layui-logo" style="color: white;font-size: 32px">疫情防控</div></a>
                    <!-- 头部区域（可配合layui 已有的水平导航） -->
                    <ul class="layui-nav layui-layout-left">
                        <li class="layui-nav-item"><a
                                href="${pageContext.request.contextPath}/queryDataByUsername/${user1.username}">打卡记录</a>
                        </li>
                        <li class="layui-nav-item"><a href="http://2019ncov.chinacdc.cn/2019-nCoV/" target="_blank">疫情实时数据</a>
                        </li>
                    </ul>
                    <ul class="layui-nav layui-layout-right">
                        <li class="layui-nav-item">
                            <a href="javascript:;">
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

    <div class="layui-col-xs6 layui-col-md12">
        <div class="grid-demo grid-demo-bg2" style="margin-top: 100px">
            <div class="layui-col-xs12 layui-col-md12">
                <h1 style="text-align: center">消息列表</h1>

                <table class="layui-table" lay-size="lg" id="tab">

                    <thead>
                    <tr >
                        <th>发布者</th>
                        <th>内容</th>
                        <th>是否已填写</th>
                        <th>时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${list}">
                        <tr>
                            <td>${user.fromNick}</td>
                            <td>${user.content}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.tipstype == 0}"> 此为公告</c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${user.daka}"><span style="color: gray">已填写</span></c:when>
                                            <c:otherwise><a href="${pageContext.request.contextPath}${user.toUrl}"><button type="button" class="layui-btn layui-btn-fluid">未填写</button></a> </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
<%--    <div style="margin-left: 650px">--%>
<%--        &lt;%&ndash;gitee仓库图标地址&ndash;%&gt;--%>
<%--        <a href='https://gitee.com/cxq21/HealthCheck' target="_blank" title="项目仓库"><img--%>
<%--                src='https://gitee.com/cxq21/HealthCheck/widgets/widget_6.svg' alt='Fork me on Gitee'></img></a>--%>
<%--        &nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--        &lt;%&ndash;liefox官网&ndash;%&gt;--%>
<%--        <a href='https://cxq21.gitee.io' target="_blank" title="LIEFox官网"><img--%>
<%--                src="https://cxq21.gitee.io/images/LIEFox.png" alt='LIEFox官网' height="40px"></img></a>--%>
<%--    </div>--%>
</div>
<%--引用layui的框架--%>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<%--调用了百度地图的接口--%>
<script type="text/javascript">
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("l-map");
    map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {
            "input": "suggestId"
            , "location": map
        });

    ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province + _value.city + _value.district + _value.street + _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province + _value.city + _value.district + _value.street + _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
        G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace() {
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun() {
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }

        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }
</script>
<%--调用了百度地图的接口--%>
</body>
</html>
