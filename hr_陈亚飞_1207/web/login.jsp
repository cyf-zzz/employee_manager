<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${path}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${path}/css/admin.css" media="all">
    <script type="text/javascript" src="${path}/layui/layui.js"></script>
    <style type="text/css">
        .container {
            width: 420px;
            height: 320px;
            min-height: 320px;
            max-height: 320px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 20px;
            z-index: 130;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
            font-size: 16px;
        }

        .close {
            background-color: white;
            border: none;
            font-size: 18px;
            margin-left: 410px;
            margin-top: -10px;
        }

        .layui-input {
            border-radius: 5px;
            width: 300px;
            height: 40px;
            font-size: 15px;
        }

        .layui-form-item {
            margin-left: -20px;
        }

        #logoid {
            margin-top: -16px;
            padding-left: 150px;
            padding-bottom: 15px;
        }

        .layui-btn {
            margin-left: -50px;
            border-radius: 5px;
            width: 350px;
            height: 40px;
            font-size: 15px;
        }

        .verity {
            width: 120px;
        }

        .font-set {
            font-size: 13px;
            text-decoration: none;
            margin-left: 120px;
        }

        a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<form class="layui-form" action="${path}/admin_login" method="post">
    <div class="container">
        <button class="close" title="关闭">X</button>
        <div class="layui-form-mid layui-word-aux">
            <img id="logoid" src="./img/logo.png" height="35">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="admin.username" id="username" required lay-verify="required"
                       placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
            <div class="layui-input-inline">
                <input type="password" name="admin.pwd" id="pwd" required lay-verify="required"
                       placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-event="login" id="admin_login">登录</button>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-event="add" id="addAdmin">立即注册</button>
            </div>
        </div>

    </div>
</form>
<script>
    layui.use('layer', function () {
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;

        //登录检验
        $('#admin_login').click(function () {
            window.location = '${path}/admin_login';
        });

        //注册
        $('#addAdmin').click(function () {
            layer.open({
                title: '注册用户',
                type: 2,
                content: '${path}/admin_registerPage',
                offset: 'auto',
                btn: ['提交', '取消'],
                area: ['400px', '500px'],
                btn:['提交','取消'],
                yes: function (index, layero) {
                    var body = layer.getChildFrame('body', index);
                    body.find('#btn_addAdmin').click();
                    layer.close(index);
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        });

        //自定义验证规则
        form.verify({
            name: function (value) {
                if (value.length < 5) {
                    return '用户名至少得5个字符啊';
                }
            }
            , password: [
                /^[S]{3,8}$/
                , '密码必须3到8位，且不能出现空格'
            ]
        });

    });
</script>
</body>
</html>