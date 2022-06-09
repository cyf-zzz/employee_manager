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
<div class="layui-container layui-card" id="sal_add_page">
    <div class="layui-fluid">
        <form class="layui-form" action="${path}/sal_add" method="post">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="employee.empno" id="empno" value="${employee.empno}" placeholder="员工编号" required autocomplete="off" class="layui-input" disabled>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">工资</label>
                    <div class="layui-input-block">
                        <input type="text" name="employee.empsalary" id="empsalary" value="${employee.empsalary}" placeholder="请输入员工工资" required autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">年份</label>
                    <div class="layui-input-block">
                        <input type="text" name="salary.empyear" id="empyear" placeholder="请输入年份" required autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">月份</label>
                    <div class="layui-input-block">
                        <select name="salary.empmonth">
                            <option value="1" selected>一月</option>
                            <option value="2">二月</option>
                            <option value="3">三月</option>
                            <option value="4">四月</option>
                            <option value="5">五月</option>
                            <option value="6">六月</option>
                            <option value="7">七月</option>
                            <option value="8">八月</option>
                            <option value="9">九月</option>
                            <option value="10">十月</option>
                            <option value="11">十一月</option>
                            <option value="12">十二月</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-col-md-offset1">
                <div class="layui-input-inline">
                    <input type="submit" id="btn_addSal" class="layui-btn layui-btn-fluid layui-hide" value="提交">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

