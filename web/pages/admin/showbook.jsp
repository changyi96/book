<%@ page import="com.chang.entity.Book" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jstl核心标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <title>图书馆管理系统</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/bootstrap-3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/bootstrap-3.3.5/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/bootstrap-3.3.5/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/datatables-1.10.8/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/common.css">
    <script src="<%=basePath%>static/plugins/jquery-1.11.3/jquery.min.js"></script>
    <script src="<%=basePath%>static/plugins/bootstrap-3.3.5/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/plugins/bootstrap-3.3.5/js/bootstrap-dropdown.min.js"></script>
    <script src="<%=basePath%>static/plugins/datatables-1.10.8/js/jquery.dataTables.zh_CN.js"></script>
    <script src="<%=basePath%>static/plugins/datatables-1.10.8/js/dataTables.bootstrap.js"></script>
    <%--<script src="<%=basePath%>static/js/common.js"></script>--%>
    <%--<script src="<%=basePath%>static/js/admin/book.js"></script>--%>
</head>
<body class="bootstrap-admin-with-small-navbar">
    <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="collapse navbar-collapse main-navbar-collapse">
                        <a class="navbar-brand" href="<%=basePath%>#"><strong>欢迎使用图书馆管理系统</strong></a>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="<%=basePath%>#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> 欢迎您，${username} <i class="caret"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=basePath%>logout">退出</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
            <!-- left, vertical navbar -->
            <div class="col-md-2 bootstrap-admin-col-left">
                <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                    <li>
                        <a href="<%=basePath%>/pages/admin/book.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/book-type.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书分类管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/borrow.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书借阅</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/return.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书归还</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/borrow-info.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 借阅查询</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/admin.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 管理员管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/student.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 学生管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/pages/admin/setting.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 系统设置</a>
                    </li>
                </ul>
            </div>
            <!-- content -->
            <div class="col-md-10">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title"></div>
                                <div class="alert alert-info">
                                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    输入要查询的图书编号和图书名称ddd
                                    <% String error = (String)request.getAttribute("error");
                                        if(error!=null&&!"".equals(error)){
                                    %>
                                    <p style="color:red"><%=error%></p>
                                    <%}%>
                                </div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <form action="querybook" class="form-horizontal" method="post">
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bno">图书编号</label>
                                        <div class="col-lg-8">
                                            <input name="bno" class="form-control" id="query_bno" type="text" value="">
                                            <label class="control-label" for="query_bno" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">图书名称</label>
                                        <div class="col-lg-8">
                                            <input name="bname" class="form-control" id="query_bname" type="text" value="">
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 form-group">
                                        <button type="submit" class="btn btn-primary" id="btn_query" onclick="query()">查询</button>
                                        <button type="button" class="btn btn-primary" id="btn_add" onclick="showAdd()">添加</button>
                                        <button type="button" class="btn btn-primary" id="btn_return" onclick="javascript:window.location.href='../main.jsp'">返回</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <c:if test="${lb!=null}">
                        <table id="data_list" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <tr>
                                <th>图书编号</th>
                                <th>图书名称</th>
                                <th>分类</th>
                                <th>作者</th>
                                <th>价格</th>
                                <th>介绍</th>
                                <th>总数量</th>
                                <th>上架时间</th>
                            </tr>
                            <c:forEach  items="${lb}" var="book">
                                <tr>
                                    <td>${book.bno }</td>
                                    <td>${book.bname }</td>
                                    <td>${book.tname}</td>
                                    <td>${book.author}</td>
                                    <td>${book.price}</td>
                                    <td>${book.brief}</td>
                                    <td>${book.total}</td>
                                    <td>${book.cdate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>