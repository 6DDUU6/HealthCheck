<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%--导航栏 start--%>
<div class="grid-demo">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <a href="${pageContext.request.contextPath}/jumpMain">
                <div class="layui-logo" style="color: white;font-size: 32px">疫情防控</div>
            </a>
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
                        <dd><a href="${pageContext.request.contextPath}/jumpMain">主页</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/Logout">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="layui-bg-gray" style="padding: 100px;margin-top: 100px">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header"><h1 style="text-align: center">${user1.username}的信息</h1></div>
                <div class="layui-card-body">
                    <form class="layui-form" action="${pageContext.request.contextPath}/updateUserInfo" method="get">
                        <div class="layui-upload" style="text-align: center">
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="demo1" height="100px" width="100px">
                                <p id="demoText"></p>
                            </div>
                            <button type="button" class="layui-btn" id="test1">上传头像</button>
                        </div>
                        <p><br></p>
                        <input type="hidden" name="username" value="${user1.username}">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="font-weight: bold">修改密码：</label>
                            <div class="layui-input-block">
                                <input type="text" name="password" lay-verify="required|pass" lay-reqtext="密码是必填项，岂能为空？"
                                       placeholder="请输入" autocomplete="off" class="layui-input"
                                       value="${user1.password}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <div style="text-align: center">
                                    <button type="submit" class="layui-btn" lay-submit="" class="submit">立即修改
                                    </button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-left: 550px">
        <%--gitee仓库图标地址--%>
        <a href='https://gitee.com/cxq21/HealthCheck' target="_blank" title="项目仓库"><img
                src='https://gitee.com/cxq21/HealthCheck/widgets/widget_6.svg' alt='Fork me on Gitee'></img></a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <%--liefox官网--%>
        <a href='https://cxq21.gitee.io' target="_blank" title="LIEFox官网"><img
                src="https://cxq21.gitee.io/images/LIEFox.png" alt='LIEFox官网' height="40px"></img></a>
    </div>
</div>
<%--导航栏 end--%>
</body>
</html>
<script>
    /*未完成*/
    /*图片上传*/
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: 'https://httpbin.org/post' //改成您自己的上传接口
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        /*图片上传*/

        /*表单验证*/
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;
            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
            form.verify({
                username: [
                    /^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$/
                    , '用户名不合法喔！'
                ]
                //我们既支持上述函数式的方式，也支持下述数组的形式
                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                , pass: [
                    /^[\S]{3,6}$/
                    , '密码必须3到6位，且不能出现空格'
                ]
            });
        });
        /*表单验证*/
    })

</script>