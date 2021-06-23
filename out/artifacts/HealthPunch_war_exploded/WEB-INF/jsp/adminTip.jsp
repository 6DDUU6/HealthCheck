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
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jumpModifySchool">修改学校</a>
                </li>
                <li class="layui-nav-item layui-this">发布公告</li>
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
                <button class="layui-btn layui-btn-sm" lay-event="addData">增加记录</button>
                <button class="layui-btn layui-btn-sm" lay-event="deleteTips">删除所选数据</button>
                <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
            </div>
        </script>

        <script type="text/html" id="barDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-xs" lay-event="save">保存</button>
                <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
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
            , url: '${pageContext.request.contextPath}/queryAllTips'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , title: '提示数据表'
            ,page: true //开启分页
            ,limit: 20 //每页默认显示的数量
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', width: 100, fixed: 'left', unresize: true, sort: true}
                , {field: 'content', title: '提示内容', edit: 'text', width: 800, unresize: true}
                , {field: 'fromnick', title: '发布者', width: 200, unresize: true}
                , {field: 'create_time', title: '创建时间',width: 200, unresize: true, sort: true}
                , {fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
            ,parseData: function (res) {
                return {
                    "code": 0
                    ,"msg": "暂无数据"
                    ,"data": res
                }
            }
        });

        //工具条事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            switch (layEvent) {
                case 'save':
                    $.post('${pageContext.request.contextPath}/updateTip',{
                        data:JSON.stringify(data)
                    });
                    layer.msg("保存成功!");
                    break;
                case 'del':
                    $.post('${pageContext.request.contextPath}/deleteTip',{
                        data:JSON.stringify(data)
                    });
                    obj.del();
                    layer.msg("删除成功!");
                    break;
            };
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'addData':
                    $.ajax({
                        url: '${pageContext.request.contextPath}/addTip',
                        dataType: 'json',
                        async:false,
                        success:function(data){
                            var tabledata = table.cache["test"]; //获取现有数据
                            tabledata.push({
                                "id": data.id
                                ,"content": data.content
                                ,"fromnick":data.fromnick
                                ,"create_time":data.create_time
                            })//添加数据,  字段名对应值.  不要初始值的话 留空即可.
                            table.reload("test", {
                                data: tabledata,
                            })
                        }
                    });
                    break;
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'deleteTips':
                    var data = checkStatus.data;
                    if(data.length<=0){
                        layer.msg('最少选择一行');
                        break;
                    }
                    $.post('${pageContext.request.contextPath}/deleteTips',{
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
            };
        });
    });
</script>
</body>
</html>
