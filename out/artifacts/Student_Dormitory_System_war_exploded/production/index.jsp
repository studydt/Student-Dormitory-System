<%@ page import="java.sql.ResultSet" %>
<%@ page import="javabean.JDBC" %>
<%@ page import="javabean.admin" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>

<html lang="en">
<head>
    <%@ include file="head.jsp" %>
    <meta http-equiv="refresh" content="60">
</head>

<body class="nav-md" onload="succ(${success})">
<c:remove var="success" scope="session"/>
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>学生宿舍管理系统</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                        <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>欢迎,</span>
                        <h2>${admin.adminname}</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->
                <br/>
                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h3>功能</h3>
                        <ul class="nav side-menu">
                            <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a>
                            </li>
                            <li><a href="index_profile.jsp"><i class="fa fa-edit"></i> profile</a>
                            </li>
                            <li><a href="help.jsp"><i class="fa fa-desktop"></i> help</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.jsp">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                    <ul class=" navbar-right">
                        <li class="nav-item dropdown open" style="padding-left: 15px;">
                            <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true"
                               id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                                <img src="images/img.jpg" alt="">${admin.adminname}
                            </a>
                            <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="index_profile.jsp"> Profile</a>

                                <a class="dropdown-item" href="help.jsp">Help</a>
                                <a class="dropdown-item" href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Log
                                    Out</a>
                            </div>
                        </li>


                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->

                <div class="tile_count">
                    <div class="col-md-4 col-sm-4 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 外来人员</span>
                        <div class="count green">
                            ${x1}
                        </div>
                        <span class="count_bottom">探亲</span>
                    </div>
                    <div class="col-md-4 col-sm-4 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 外来人员</span>
                        <div class="count green"> ${x2}</div>
                        <span class="count_bottom">开会</span>
                    </div>
                    <div class="col-md-4 col-sm-4 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 宿舍人员</span>
                        <div class="count green"> ${x3}</div>
                        <span class="count_bottom">携带贵重物品</span>
                    </div>
                </div>
            <!-- /top tiles -->

            <div class="row">
                <div class="col-md-12 col-sm-12 ">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2><small>${admin.adminhome}公寓的人员管理列表</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box table-responsive">
                                        <table id="datatable-checkbox"
                                               class="table table-striped table-bordered bulk_action"
                                               style="width:100%">
                                            <thead>

                                            <tr>
                                                <th>姓名</th>
                                                <th>学号</th>
                                                <th>所在宿舍</th>
                                                <th>邮箱</th>
                                                <th>备注</th>
                                                <th>时间</th>
                                                <th>
                                                删除
                                            </th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="userhome" items="${userhomes}">
                                                <tr>
                                                    <form action="delete" method="post">
                                                        <input type="text" name="number" value="${userhome.number}" hidden>
                                                        <input type="text" name="adminhome" value="${admin.adminhome}" hidden>
                                                    <td>${userhome.name}</td>
                                                    <td>${userhome.number}</td>
                                                    <td>${userhome.home}</td>
                                                    <td>${userhome.email}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${userhome.thing == 1}">探亲</c:when>
                                                            <c:when test="${userhome.thing == 2}">开会</c:when>
                                                            <c:when test="${userhome.thing == 3}">携带贵重物品</c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>${userhome.date}</td>
                                               <td>
                                                <input type="submit"  class="btn-app">
                                            </td>
                                                    </form>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
        </div>
        <!-- /page content -->
    </div>
</div>

<%@include file="body.jsp" %>
</body>
</html>
