<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>

<html>
  <head>
	  <base href="<%=basePath %>">
	  <title>用户注册</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	  <link rel="shortcut icon"
			href="img/favicon.ico">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
	<link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  
  <body>
    <div class="container-fluid">
		<div class="row" style="background-color: #008b67;height: 40px">
			<div class="col-md-12 ">
				<div>
					<a href="index.jsp">
						<small style="color: #fff;line-height: 40px;">首页</small>
					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<a href="index.jsp"><img src="img/logo.png" height="200" width="800"></a>
			</div>
		</div>
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4" >
			<div class="page-header" style="width:500px;">
				<h1 class="text-center">
					注册
				</h1>
			</div>
			<form action="user" method="post" class="form-horizontal" role="form" style="width:500px;" >
				<div class="form-group">
					 
					<label for="username" class="col-sm-2 control-label">
						账户
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="username" name="username">
					</div>
				</div>
				<div class="form-group">

				<label for="password" class="col-sm-2 control-label">
					密码
				</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password" name="password">
				</div>
			  	</div>
				<div class="form-group">

					<label for="c_password" class="col-sm-2 control-label">
						确认密码
					</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="c_password" name="c_password">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10  text-right">
						 
						<button type="button" class="btn btn-default text-left" name="usermanager" id="usermanager" value="register" onclick="register()">
							注册
						</button>

						<button type="reset" class="btn btn-default">
							清空
						</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script language="JavaScript">
        function register() {
            var usermanager = document.getElementById("usermanager").value;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var c_password = document.getElementById("c_password").value;
            if(username == ""){
                alert("请输入用户名！！！");
            } else if(password == ""){
                alert("请输入密码！！！")
            } else if(c_password == ""){
                alert("请输入确认密码！！！")
            }else if(password != c_password){
                alert("密码和确认密码不一致！！！")
			}else{
                var url = "?usermanager="+ usermanager +"&username="+ username +"&password="+ password;
                $.ajax({
                    url: "<%=path %>/user" +url,
                    type: "POST",
                    success: function (msg) {
                        if(msg == "1"){
                            var fullurl = window.location.href;
                            if(fullurl.indexOf("?") != -1){
                                var returnurl = fullurl.substr(1);
                                returnurl = returnurl.split("ReturnUrl=")[1];
                                returnurl = returnurl.split("/");
                                tourl = returnurl[returnurl.length -1];
                            }
                            var tmp = document.createElement("form");
                            var action = "<%=path %>/tologin?username="+ username +"&url="+ tourl;
                            tmp.action = action;
                            tmp.method = "post";
                            document.body.appendChild(tmp);
                            tmp.submit();

                        }else{
                            alert(msg);
                        }
                    }
                });
            }
        }
	</script>
  </body>
</html>
