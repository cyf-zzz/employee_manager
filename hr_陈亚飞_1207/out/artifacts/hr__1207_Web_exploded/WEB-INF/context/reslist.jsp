<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, emp-scalable=0">
    <link rel="stylesheet" href="${path}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${path}/css/admin.css" media="all">
    <script type="text/javascript" src="${path}/layui/layui.js"></script>
    <style type="text/css">
        .layui-table td {
            text-align: center;
        }
        .layui-table th {
            text-align: center;
            color: #0000FF;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <table id="LAY-emp-manage" lay-filter="LAY-emp-manage" class="layui-table">
                <tr>
                    <th>编号</th>
                    <th>部门</th>
                    <th>年份</th>
                    <th>月份</th>
                    <th>工资</th>
                </tr>
                <c:forEach items="${objectList}" var="obj" varStatus="st">
                    <tr>
                        <td>${st.count}</td>
                        <td>${obj[0]}</td>
                        <td>${obj[1]}</>
                        <td>${obj[2]}</td>
                        <td>${obj[3]}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use('layer',function(){
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;
    })
</script>
</html>

