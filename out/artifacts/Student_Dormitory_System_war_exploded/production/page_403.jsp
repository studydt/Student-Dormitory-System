<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>
<html lang="en">
  <head>
    <%@ include file="head.jsp"%>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <h1 class="error-number">403</h1>
              <h2>Access denied</h2>
              <p>Full authentication is required to access this resource.
              </p>
              <div class="mid_center">
                <h3>Return</h3>
                <form action="login.jsp" method="post">
                  <div class="  form-group pull-right top_search">
                    <div class="input-group">
                      <input type="text" class="form-control" value="return index">
                      <span class="input-group-btn">
                              <button class="btn btn-secondary" type="submit">Go!</button>
                          </span>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

   <%@ include file="body.jsp"%>>
  </body>
</html>