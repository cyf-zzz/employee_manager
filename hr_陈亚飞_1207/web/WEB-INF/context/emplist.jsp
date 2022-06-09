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
        <div class="layui-form layui-card-header layuiadmin-card-header-auto">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">信息</label>
                    <div class="layui-input-block">
                        <input type="text" name="keyword" id="keyword" placeholder="用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn layuiadmin-btn-empadmin" id="emp_search">
                        <i class="layui-icon layui-icon-search layuiemp-button-btn"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="layui-card-body">
            <%--头部工具条--%>
            <div id="toolbarDemo">
                <%--						<button class="layui-btn layuiadmin-btn-empadmin" lay-event="batchdel">删除</button>--%>
                <button class="layui-btn layuiadmin-btn-empadmin" lay-event="add" id="emp_add">添加</button>
                <button class="layui-btn layuiadmin-btn-empadmin" lay-event="flush" id="emp_flush">刷新</button>
                <button class="layui-btn layuiadmin-btn-empadmin" lay-event="res" id="sal_res">部门平均工资</button>
            </div>

            <table id="LAY-emp-manage" lay-filter="LAY-emp-manage" class="layui-table">
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>工资</th>
                    <th>部门</th>
                    <th>操   作</th>
                </tr>
                <c:forEach items="${empList}" var="emp">
                    <tr>
                        <td>${emp.empno}</>
                        <td>${emp.empname}</td>
                        <td>${emp.empsalary}</td>
                        <%--<td>${emp.dptno}</td>--%>
                        <td>
                            <c:forEach items="${deptList}" var="dept">
                                <c:if test="${dept.id == emp.dptno}">
                                    ${dept.dname}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <button class="layui-btn layui-btn-sm" onclick="delEmp('${emp.empno}')">
                                删除
                            </button>
                            <button class="layui-btn layui-btn-sm" onclick="editEmp('${emp.empno}')">
                                修改
                            </button>
                            <button class="layui-btn layui-btn-sm" onclick="addSal('${emp.empno}')">
                                录入工资
                            </button>
                        </td>
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

        // 删除客户信息
        window.delEmp = function(empno) {
            layer.confirm("确定删除员工ID为"+empno+"的员工吗？",{icon:2,title:"提示"},function(idx){
                layer.msg("数据删除成功",{icon:1,time:2000});
                window.location = '${path}/emp_delete?employee.empno='+empno;
                layer.close(idx);
            })
        };

        // 刷新数据
        $('#emp_flush').click(function () {
            window.location = '${path}/emp_list';
        });

        $('#sal_res').click(function () {
            window.location='${path}/reslist';
        });

        // 添加客户信息
        $('#emp_add').click(function () {
            layer.open({
                type:2
                ,title:'添加员工信息'
                ,content:'${path}/emp_addPage'
                ,offset:'auto'
                ,area: ['400px', '500px']
                ,btn: ['提交','取消']
                ,yes:function (index,layero) {
                    var body = layer.getChildFrame('body', index);
                    body.find('#btn_addEmp').click();
                    layer.close(index);
                }
                ,btn2:function (index) {
                    layer.close(index);
                }
                ,end:function () {
                    // 刷新数据
                    $('#emp_flush').click();
                }
            })
        });

        // 编辑客户信息
        window.editEmp = function (empno) {
            var index = layer.open({
                title:'编辑客户信息',
                type:2,
                content:'${path}/emp_editPage?employee.empno='+empno,
                offset:'auto',
                btn:['提交','取消'],
                area: ['400px', '500px'],

                yes:function (index,layero) {
                    var body = layer.getChildFrame('body', index);
                    body.find('#btn_editEmp').click();
                    layer.close(index);
                },
                btn2:function (index) {
                    layer.close(index);
                },
                // layer关闭回调
                end:function () {
                    // 刷新数据
                    $('#emp_flush').click();
                }
            });
        };

        // 添加工资记录
        window.addSal = function (empno) {
            var index = layer.open({
                title:'添加工资记录',
                type:2,
                content:'${path}/sal_addPage?employee.empno='+empno,
                offset:'auto',
                btn:['提交','取消'],
                area: ['400px', '500px'],

                yes:function (index,layero) {
                    var body = layer.getChildFrame('body', index);
                    body.find('#btn_addSal').click();
                    layer.close(index);
                },
                btn2:function (index) {
                    layer.close(index);
                },
                // layer关闭回调
                end:function () {
                    // 刷新数据
                    $('#emp_flush').click();
                }
            });
        };

        $('#emp_search').click(function () {
            var key = $('#keyword').val();
            window.location = '${path}/emp_search?keyword='+key;
        })
    })
</script>
</html>

