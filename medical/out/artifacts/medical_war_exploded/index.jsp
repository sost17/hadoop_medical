<%--
  Created by IntelliJ IDEA.
  User: commo
  Date: 2018/4/11
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  <body>
  <script language="JavaScript">
      window.location.href = "disease.jsp"
  </script>
  </body>
</html>
