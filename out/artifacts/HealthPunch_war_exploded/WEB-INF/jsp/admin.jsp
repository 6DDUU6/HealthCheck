<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${user1.username}管理员界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<%--    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js" charset="utf-8"></script>--%>

</head>
<body>
<%--导航栏 start--%>
<div class="grid-demo">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <a href="${pageContext.request.contextPath}/jumpMain"> <div class="layui-logo" style="color: white;font-size: 32px">疫情防控</div></a>
            <!-- 头部区域（可配合layui 已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layui-this">修改学校</li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jumpModifyTip">发布公告</a>
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
        <h1 style="text-align: center">学校管理</h1>
        <table class="layui-hide" id="test" lay-filter="test"></table>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="addSchool">添加学校</button>
                <button class="layui-btn layui-btn-sm" lay-event="deleteSchool">删除所选学校</button>
                <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
            </div>
        </script>
    </div>
</div>

<script>
    layui.use(['jquery','table'], function () {
        var table = layui.table;
        $ = layui.jquery;

        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/queryAllSchool'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , title: '学校数据表'
            ,page: true //开启分页
            ,limit: 20 //每页默认显示的数量
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'schoolid', title: '学校id', width: 200, fixed: 'left', unresize: true, sort: true}
                , {field: 'schoolname', title: '学校名'}
            ]]
            ,parseData: function (res) {
                return {
                    "code": 0
                    ,"msg": "暂无数据"
                    ,"data": res
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
                case 'deleteSchool':
                    var data = checkStatus.data;
                    if(data.length<=0){
                        layer.msg('最少选择一行');
                        break;
                    }
                    $.post('${pageContext.request.contextPath}/deleteSchool',{
                        data:JSON.stringify(data)
                    });
                    layer.alert("删除成功！");
                    var tableDT = table.cache["test"];
                    for (var i = 0; i < tableDT.length; i++) {//遍历表格缓存数组
                        var btnObj = tableDT[i];
                        if (btnObj.LAY_CHECKED) {//条件：选中
                            tableDT.splice(i, 1);//移除后后造成数组下标索引发生变化，所以下面需要i--
                            i--;
                        }
                    }
                    table.reload("test", {
                        data: tableDT,   // 将新数据重新载入表格
                    });
                    break;
                case 'addSchool': //添加学校
                    layer.prompt({
                        formType: 0,
                        value: '',
                        title: '请输入值',
                    }, function(value, index, elem){
                        $.ajax({
                            url: '${pageContext.request.contextPath}/addSchool',
                            data: {"schoolname":value},
                            dataType: 'json',
                            async:false,
                            success:function(data){
                                if(data.schoolid == -1){
                                    layer.alert("已存在该学校！");
                                }else{
                                    layer.alert("添加成功！");
                                    var tabledata = table.cache["test"]; //获取现有数据
                                    tabledata.push({
                                        "schoolid": data.schoolid
                                        ,"schoolname": data.schoolname
                                    })//添加数据,  字段名对应值.  不要初始值的话 留空即可.
                                    table.reload("test", {
                                        data: tabledata,
                                    })
                                }
                            }
                        });
                        layer.close(index);
                    });
                    break;
            }
            ;
        });
    });
</script>
</body>
</html>
