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
    <link rel="shortcut icon" href="img/favicon.ico">
    <title>大数据医疗</title>
    <link href="css/global.min.css" rel="stylesheet">
    <script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script>
        function islogin() {
            var fullurl = window.location.href;
            if (fullurl.indexOf("?") != -1) {
                var returnurl = fullurl.substr(1);
                var user = "";
                returnurl = returnurl.split("?")[1];
                returnurl = returnurl.split("&")[0];
                user = returnurl.split("=")[1];
                $("#loginUserName").html(user);
            }
            var username = $('.header-wrapper .header .state').find('b').text();
            if (username == "") {
                $("#userLogout").hide();
                $("#userLogin").show();
            } else {
                $("#userLogout").show();
                $("#userLogin").hide();

            }
        }
    </script>

    <meta name="description" content="临床诊疗知识库">
</head>
<body onload="islogin()">

<div class="header-wrapper">
    <div class="header clear">
        <div class="state" id="userLogin">
            <a href="usermanager/login.jsp" id="loginUrl" onclick="returnurl()">登录</a>

        </div>
        <div class="state" id="userLogout" style="">
            <b id="loginUserName"></b>
            <a href="index.jsp">退出</a>
        </div>
    </div>
</div>


<div class="res-logo clear">
    <a class="link-logo"><img src="img/logo.png" height="200" width="800"></a>
</div>
<div class="res-box">
    <div class="res-top">
        <div class="res-nav clear">
            <a href="disease.jsp" id="disurl" onclick="medurl('disurl')" data-value="Disease" title="疾病">疾病</a>
            <a href="examination.jsp" id="examurl" onclick="medurl('examurl')" data-value="Examination"
               title="检查">检查</a>
            <a href="drug.jsp" id="drugurl" onclick="medurl('drugurl')" data-value="Drug" class="active"
               title="药品">药品</a>

        </div>
        <form method="get" action="javascript:;" class="all-search clear" autocomplete="off">
            <div class="input-box clear" >
                <input name="q" id="searchkeywords" type="text" class="input-text" placeholder="请输入疾病特征，多个字段用空格分开">
            </div>
            <button type="button" class="super-btn" id="btn_search" data-url="<%=path%>/toSearch?dbtype=drug" ><i
                    class="icon icon-search">搜索</i></button>
        </form>

    </div>
    <!--药品-->
    <div class="res-bottom clear res-pill" style="display: block;">
        <div class="res-bottom-left active">
            <div class="res-left-title">
                <h3>药品分类</h3>
            </div>

            <div class="res-left-list active">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=drug&secondclass=抗寄生虫药" title="化学药品">化学药品</b>
                    <span class="symbol">-</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="抗寄生虫药" data-url="medlist?dbtype=drug&secondclass=抗寄生虫药">抗寄生虫药</a>
                    <a href="javascript:;" title="耳鼻咽喉科用药"
                       data-url="medlist?dbtype=drug&secondclass=耳鼻咽喉科用药">耳鼻咽喉科用药</a>
                    <a href="javascript:;" title="妇产科用药" data-url="medlist?dbtype=drug&secondclass=妇产科用药">妇产科用药</a>
                    <a href="javascript:;" title="呼吸系统用药" data-url="medlist?dbtype=drug&secondclass=呼吸系统用药">呼吸系统用药</a>
                    <a href="javascript:;" title="解毒药" data-url="medlist?dbtype=drug&secondclass=解毒药">解毒药</a>
                    <a href="javascript:;" title="解热、镇痛、抗炎与抗风湿药以及抗痛风药"
                       data-url="medlist?dbtype=drug&secondclass=解热、镇痛、抗炎与抗风湿药以及抗痛风药">解热、镇痛、抗炎与抗…</a>
                    <a href="javascript:;" title="精神药物" data-url="medlist?dbtype=drug&secondclass=精神药物">精神药物</a>
                    <a href="javascript:;" title="抗感染药物" data-url="medlist?dbtype=drug&secondclass=抗感染药物">抗感染药物</a>
                    <a href="javascript:;" title="抗过敏药" data-url="medlist?dbtype=drug&secondclass=抗过敏药">抗过敏药</a>
                    <a href="javascript:;" title="抗肿瘤药物" data-url="medlist?dbtype=drug&secondclass=抗肿瘤药物">抗肿瘤药物</a>
                    <a href="javascript:;" title="口腔科用药" data-url="medlist?dbtype=drug&secondclass=口腔科用药">口腔科用药</a>
                    <a href="javascript:;" title="麻醉药与麻醉辅助用药" data-url="medlist?dbtype=drug&secondclass=麻醉药与麻醉辅助用药">麻醉药与麻醉辅助用药</a>
                    <a href="javascript:;" title="泌尿系统用药" data-url="medlist?dbtype=drug&secondclass=泌尿系统用药">泌尿系统用药</a>
                    <a href="javascript:;" title="免疫调节药" data-url="medlist?dbtype=drug&secondclass=免疫调节药">免疫调节药</a>
                    <a href="javascript:;" title="内分泌系统用药"
                       data-url="medlist?dbtype=drug&secondclass=内分泌系统用药">内分泌系统用药</a>
                    <a href="javascript:;" title="皮肤科用药" data-url="medlist?dbtype=drug&secondclass=皮肤科用药">皮肤科用药</a>
                    <a href="javascript:;" title="神经系统用药" data-url="medlist?dbtype=drug&secondclass=神经系统用药">神经系统用药</a>
                    <a href="javascript:;" title="糖类、盐类与酸碱平衡调节药"
                       data-url="medlist?dbtype=drug&secondclass=糖类、盐类与酸碱平衡调节药">糖类、盐类与酸碱平衡…</a>
                    <a href="javascript:;" title="维生素、矿物质和肠外肠内营养药"
                       data-url="medlist?dbtype=drug&secondclass=维生素、矿物质和肠外肠内营养药">维生素、矿物质和肠外…</a>
                    <a href="javascript:;" title="消毒防腐药" data-url="medlist?dbtype=drug&secondclass=消毒防腐药">消毒防腐药</a>
                    <a href="javascript:;" title="消化系统用药" data-url="medlist?dbtype=drug&secondclass=消化系统用药">消化系统用药</a>
                    <a href="javascript:;" title="心血管系统用药"
                       data-url="medlist?dbtype=drug&secondclass=心血管系统用药">心血管系统用药</a>
                    <a href="javascript:;" title="血液系统用药" data-url="medlist?dbtype=drug&secondclass=血液系统用药">血液系统用药</a>
                    <a href="javascript:;" title="眼科用药" data-url="medlist?dbtype=drug&secondclass=眼科用药">眼科用药</a>
                </div>
            </div>
            <div class="res-left-list ">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=drug&secondclass=解表剂" title="中成药">中成药</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="解表剂" data-url="medlist?dbtype=drug&secondclass=解表剂">解表剂</a>
                    <a href="javascript:;" title="清热剂" data-url="medlist?dbtype=drug&secondclass=清热剂">清热剂</a>
                    <a href="javascript:;" title="温里剂" data-url="medlist?dbtype=drug&secondclass=温里剂">温里剂</a>
                    <a href="javascript:;" title="补益剂" data-url="medlist?dbtype=drug&secondclass=补益剂">补益剂</a>
                    <a href="javascript:;" title="安神剂" data-url="medlist?dbtype=drug&secondclass=安神剂">安神剂</a>
                    <a href="javascript:;" title="开窍剂" data-url="medlist?dbtype=drug&secondclass=开窍剂">开窍剂</a>
                    <a href="javascript:;" title="理气剂" data-url="medlist?dbtype=drug&secondclass=理气剂">理气剂</a>
                    <a href="javascript:;" title="理血剂" data-url="medlist?dbtype=drug&secondclass=理血剂">理血剂</a>
                    <a href="javascript:;" title="治风剂" data-url="medlist?dbtype=drug&secondclass=治风剂">治风剂</a>
                    <a href="javascript:;" title="祛湿剂" data-url="medlist?dbtype=drug&secondclass=祛湿剂">祛湿剂</a>
                    <a href="javascript:;" title="化痰止咳平喘剂"
                       data-url="medlist?dbtype=drug&secondclass=化痰止咳平喘剂">化痰止咳平喘剂</a>
                    <a href="javascript:;" title="消食导滞剂" data-url="medlist?dbtype=drug&secondclass=消食导滞剂">消食导滞剂</a>
                    <a href="javascript:;" title="痈疡剂" data-url="medlist?dbtype=drug&secondclass=痈疡剂">痈疡剂</a>
                    <a href="javascript:;" title="其他剂类" data-url="medlist?dbtype=drug&secondclass=其他剂类">其他剂类</a>
                </div>
            </div>

            <a href="javascript:;" class="hide">收起</a><a href="javascript:;" class="more">展开</a>
        </div>
        <div class="res-bottom-right" style="height: 929px;">
            <div class="icd-btn">
                <h3>抗寄生虫药</h3>
            </div>
            <div class="lists-main clear" style="height: 879px; overflow-y: hidden; outline: none;" tabindex="0">
                <ul class="clear">
                    <li><a id="med1" onclick="adduser('med1')" href="info?dbtype=drug&amp;id=1">阿苯达唑</a></li>
                    <li><a id="med2" onclick="adduser('med2')" href="info?dbtype=drug&amp;id=2">本芴醇</a></li>
                    <li><a id="med3" onclick="adduser('med3')" href="info?dbtype=drug&amp;id=3">甲硝唑</a></li>
                    <li><a id="med4" onclick="adduser('med4')" href="info?dbtype=drug&amp;id=4">甲苯咪唑</a></li>
                    <li><a id="med5" onclick="adduser('med5')" href="info?dbtype=drug&amp;id=5">奎宁</a></li>
                    <li><a id="med6" onclick="adduser('med6')" href="info?dbtype=drug&amp;id=6">磷酸咯萘啶</a></li>
                    <li><a id="med7" onclick="adduser('med7')" href="info?dbtype=drug&amp;id=7">磷酸氯喹</a></li>
                    <li><a id="med8" onclick="adduser('med8')" href="info?dbtype=drug&amp;id=8">氯硝柳胺</a></li>
                    <li><a id="med9" onclick="adduser('med9')" href="info?dbtype=drug&amp;id=9">磷酸哌喹</a></li>
                    <li><a id="med10" onclick="adduser('med10')" href="info?dbtype=drug&amp;id=10">磷酸伯氨喹</a>
                    </li>
                    <li><a id="med11" onclick="adduser('med11')" href="info?dbtype=drug&amp;id=11">硫氯酚</a></li>
                    <li><a id="med12" onclick="adduser('med12')" href="info?dbtype=drug&amp;id=12">喷他脒</a></li>
                    <li><a id="med13" onclick="adduser('med13')" href="info?dbtype=drug&amp;id=13">葡萄糖酸锑钠</a>
                    </li>
                    <li><a id="med14" onclick="adduser('med14')" href="info?dbtype=drug&amp;id=14">青蒿琥酯</a>
                    </li>
                    <li><a id="med15" onclick="adduser('med15')" href="info?dbtype=drug&amp;id=15">青蒿素</a></li>
                    <li><a id="med16" onclick="adduser('med16')" href="info?dbtype=drug&amp;id=16">双氢青蒿素</a>
                    </li>
                    <li><a id="med17" onclick="adduser('med17')" href="info?dbtype=drug&amp;id=17">三苯双脒</a>
                    </li>
                    <li><a id="med18" onclick="adduser('med18')" href="info?dbtype=drug&amp;id=18">双碘喹啉</a>
                    </li>
                    <li><a id="med19" onclick="adduser('med19')" href="info?dbtype=drug&amp;id=19">替硝唑</a></li>
                    <li><a id="med20" onclick="adduser('med20')" href="info?dbtype=drug&amp;id=20">伊维菌素</a>
                    </li>
                    <li><a id="med21" onclick="adduser('med21')" href="info?dbtype=drug&amp;id=21">乙胺嘧啶</a>
                    </li>
                    <li><a id="med22" onclick="adduser('med22')" href="info?dbtype=drug&amp;id=22">蒿甲醚</a></li>
                    <li><a id="med23" onclick="adduser('med23')" href="info?dbtype=drug&amp;id=23">羟氯喹</a></li>
                    <li><a id="med24" onclick="adduser('med24')" href="info?dbtype=drug&amp;id=24">噻嘧啶</a></li>
                    <li><a id="med25" onclick="adduser('med25')" href="info?dbtype=drug&amp;id=25">吡喹酮</a></li>
                    <li><a id="med26" onclick="adduser('med26')" href="info?dbtype=drug&amp;id=26">枸橼酸乙胺嗪</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="js/global.min.js" type="text/javascript"></script>
<script src="js/jquery.watermark-3.1.3.min.js" type="text/javascript"></script>
<script src="js/home.js" type="text/javascript"></script>
<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>

<script>
    common.showData('.res-pill');
    $(function () {
        $('.lists-main').niceScroll({
            cursorcolor: "#008b67",//滚动条的颜色
            cursoropacitymax: 1, //滚动条的透明度，从0-1
            touchbehavior: false, //使光标拖动滚动像在台式电脑触摸设备
            cursorwidth: "5px", //滚动条的宽度
            cursorborder: "0", // 游标边框css定义
            cursorborderradius: "5px",//以像素为光标边界半径  圆角
            autohidemode: "leave", //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
            zindex: "auto",//给滚动条设置z-index值
            cursorfixedheight: 29,
            background: '#ccc',
            horizrailenabled: false,
            railpadding: {top: 0, right: 0, left: 0, bottom: 0}//滚动条的位置
        });
    })
</script>
</body>
</html>