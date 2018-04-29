<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=1180">
    <link rel="shortcut icon"
          href="img/favicon.ico">
    <title>搜索</title>
    <link href="css/global.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>

<%
    String username = (String) request.getSession().getAttribute("username");
    String dbtype = (String) request.getSession().getAttribute("dbtype");
    int resultcount = (Integer) request.getSession().getAttribute("searchcount");
    String resultdata = (String) request.getSession().getAttribute("searchidinfo");
    int pagenum = (Integer) request.getSession().getAttribute("pagenum");
    int pagesum = (int) Math.ceil(resultcount/10.0);
    int begin = (Integer) request.getSession().getAttribute("begin");
    int end = (Integer) request.getSession().getAttribute("end");
    if(pagesum <= 10){
        end = pagesum;
    }
%>

<div class="header-wrapper">
    <div class="header clear">
        <div class="nav clear">
            <a class="title" href="index.jsp" id="index" onclick="infotoindex('index')">首页</a>
        </div>
        <div class="state" id="userLogin">
            <a href="usermanager/login.jsp" id="loginUrl" onclick="returnurl()">登录</a>

        </div>
        <div class="state" id="userLogout" style="">
            <b id="loginUserName"><%if(username == null){%></b><%}else{%><%=username%></b><%}%>
            <a href="index.jsp">退出</a>
        </div>
    </div>
</div>


<div class="top-search clear">
    <img src="img/logo.png" height="70" width="250">
    <form method="get" action="javascript:;" class="clear" autocomplete="off">
        <div class="input-box clear">
            <input name="q" id="searchkeywords" type="text" class="hide-keywords input-text index-btn" placeholder="请输入疾病特征，多个字段用空格分开">
        </div>
        <button type="button" class="btn btn-search" id="btn_search" data-url="<%=path%>/toSearch?&dbtype=<%=dbtype%>" ><i
                class="icon icon-search">搜索</i></button>
    </form>
</div>

<div class="nav-resource-wrapper">
    <div class="nav-resource">
        <a class="item active"><%=request.getSession().getAttribute("dbtag")%>
        </a>
    </div>
</div>
<div class="content content-search clear">
    <div class="lt">
        <div class="result-list">
            <c:forEach var="data_group" begin="0"  varStatus="count" items="${datainfo}">
                <div class="item">
                    <div class="title title-text link">
                        <a href="${data_group.hrefinfo}" id="search${count.index}" onclick="searchadduser('search${count.index}')"
                           class="title-text link">${data_group.name}</a>
                    </div>
                    <div class="desc" id="summary${data_group.id}"></div>
                    <script>
                        $(
                            function () {
                                $('#summary' +${data_group.id}).load(${data_group.subpage}+' .message-boxs');
                            }
                        )
                    </script>
                </div>
            </c:forEach>
            <div class="pager">
                <span class="total">共找到<i><%=resultcount%></i>条结果</span>
                <c:choose>
                <c:when test="${pagenum == 1 }">
                    <b>&lt;</b>
                </c:when>
                <c:otherwise>
                    <%
                        if(end != 10){
                            if(pagenum == begin){
                                end = begin;
                                begin = end - 9;
                            }
                        }
                    %>
                    <a href="toSearch?begin=<%=begin%>&end=<%=end%>&pagenum=<%=pagenum-1%>&dbtype=<%=dbtype%>&data=<%=request.getSession().getAttribute("data")%>&searchidinfo=<%=resultdata%>" id="previouspage" onclick="searchgroup('previouspage')">&lt;</a>
                </c:otherwise>
                </c:choose>

                <c:forEach begin="<%=begin%>" varStatus="pagecount" end="<%=end%>">
                    <c:choose>
                    <c:when test="${pagecount.index == pagenum}">
                        <b>${pagecount.index}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="toSearch?begin=<%=begin%>&end=<%=end%>&pagenum=${pagecount.index}&dbtype=<%=dbtype%>&data=<%=request.getSession().getAttribute("data")%>&searchidinfo=<%=resultdata%>" id="page${pagecount.index}" onclick="searchgroup('page${pagecount.index}')">${pagecount.index}</a>
                    </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                <c:when test="<%=pagenum == pagesum%>">
                    <b>&gt;</b>
                </c:when>
                <c:otherwise>
                    <%
                        if(end != pagesum){
                            if(pagenum == end){
                                begin = end;
                                if((pagesum-end)/10 >= 1){
                                    end = begin + 9;
                                } else{
                                    end = pagesum;
                                }
                            }
                        }
                    %>
                    <a href="toSearch?begin=<%=begin%>&end=<%=end%>&pagenum=<%=pagenum+1%>&dbtype=<%=dbtype%>&data=<%=request.getSession().getAttribute("data")%>&searchidinfo=<%=resultdata%>" id="nextpage" onclick="searchgroup('nextpage')">&gt;</a>
                </c:otherwise>
                </c:choose>
                <input class="input-text input-text-1" type="text" id="toIndex" value="1">
                <button class="btn" onclick="goToPage('toIndex',<%=pagesum%>,'toSearch?dbtype=<%=dbtype%>&data=<%=request.getSession().getAttribute("data")%>&searchidinfo=<%=resultdata%>')">跳到</button>
            </div>
        </div>
    </div>
    <div class="rt">
        <div class="md-hot">
            <div class="hd clear">
                <span class="text">搜索历史</span>
            </div>
            <div class="bd">
                <c:forEach var="search_group" begin="0"  varStatus="count" items="${searchhistoryinfo}">
                    <a href="<%=path%>/toSearch?pagenum=0&begin=1&end=10&dbtype=<%=dbtype%>&data=${search_group}" id="<%=dbtype%>${count.index}" onclick="searchgroup('<%=dbtype%>${count.index}')" class="item">${search_group}</a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<input id="hide-Qvalue" type="hidden" value="<%=request.getSession().getAttribute("data")%>">

<script>
    $(function () {
        window.onload = function () {
            var fullurl = window.location.href;
            if (fullurl.indexOf("?") != -1) {
                var returnurl = fullurl.substr(1);
                var user = "";
                returnurl = returnurl.split("?")[1];
                returnurl = returnurl.split("&")[0];
                user = returnurl.split("=")[1];
                $("#loginUserName").html(user);
            }
            var localusername = $('.header-wrapper .header .state').find('b').text();
            if (localusername == "") {
                $("#userLogout").hide();
                $("#userLogin").show();
            } else {
                $("#userLogout").show();
                $("#userLogin").hide();

            }
            BindParm();
        }
    });
</script>
<script src="js/home.js" type="text/javascript"></script>
</body>
</html>