<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
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
<div class="layui-container layui-card" id="emp_add_page">
    <div class="layui-fluid">
        <form class="layui-form" action="${path}/emp_add" method="post">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="employee.empno" placeholder="员工编号" required autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="employee.empname" id="empname" placeholder="请输入员工姓名" required autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">工资</label>
                    <div class="layui-input-block">
                        <input type="text" name="employee.empsalary" id="empsalary" placeholder="请输入工资" required autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">部门</label>
                    <div class="layui-input-block">
                        <s:select name="employee.dptno" list="%{#request.deptList}" listValue="dname" value="" listKey="id"
                        headerValue="请选择" headerKey="-1"></s:select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-col-md-offset1">
                <div class="layui-input-inline">
                    <input type="submit" id="btn_addEmp" class="layui-btn layui-btn-fluid layui-hide" value="提交">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

