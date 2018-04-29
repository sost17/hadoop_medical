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
            <a href="index.jsp" class="fRed">退出</a>
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
               class="active" title="检查">检查</a>
            <a href="drug.jsp" id="drugurl" onclick="medurl('drugurl')" data-value="Drug" title="药品">药品</a>

        </div>
        <form method="get" action="javascript:;" class="all-search clear" autocomplete="off">
            <div class="input-box clear" >
                <input name="q" id="searchkeywords" type="text" class="input-text" placeholder="请输入疾病特征，多个字段用空格分开">
            </div>
            <button type="button" class="super-btn" id="btn_search" data-url="<%=path%>/toSearch?dbtype=examination" ><i
                    class="icon icon-search">搜索</i></button>
        </form>

    </div>
    <!--检查-->
    <div class="res-bottom clear res-examination" style="display: block;">
        <div class="res-bottom-left active">
            <div class="res-left-title">
                <h3>检查分类</h3>
            </div>

            <div class="res-left-list active">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=examination&secondclass=蛋白质测定" title="临床化学检查">临床化学检查</b>
                    <span class="symbol">-</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="蛋白质测定"
                       data-url="medlist?dbtype=examination&secondclass=蛋白质测定">蛋白质测定</a>
                    <a href="javascript:;" title="肝病的实验诊断" data-url="medlist?dbtype=examination&secondclass=肝病的实验诊断">肝病的实验诊断</a>
                    <a href="javascript:;" title="骨质疏松的实验诊断"
                       data-url="medlist?dbtype=examination&secondclass=骨质疏松的实验诊断">骨质疏松的实验诊断</a>
                    <a href="javascript:;" title="激素测定" data-url="medlist?dbtype=examination&secondclass=激素测定">激素测定</a>
                    <a href="javascript:;" title="其它酶类测定" data-url="medlist?dbtype=examination&secondclass=其它酶类测定">其它酶类测定</a>
                    <a href="javascript:;" title="肾脏疾病的实验诊断"
                       data-url="medlist?dbtype=examination&secondclass=肾脏疾病的实验诊断">肾脏疾病的实验诊断</a>
                    <a href="javascript:;" title="糖及其代谢物测定" data-url="medlist?dbtype=examination&secondclass=糖及其代谢物测定">糖及其代谢物测定</a>
                    <a href="javascript:;" title="维生素、氨基酸与血药浓度测定"
                       data-url="medlist?dbtype=examination&secondclass=维生素、氨基酸与血药浓度测定">维生素、氨基酸与血药…</a>
                    <a href="javascript:;" title="无机物质测定及血气分析"
                       data-url="medlist?dbtype=examination&secondclass=无机物质测定及血气分析">无机物质测定及血气分…</a>
                    <a href="javascript:;" title="心肌疾病的实验诊断"
                       data-url="medlist?dbtype=examination&secondclass=心肌疾病的实验诊断">心肌疾病的实验诊断</a>
                    <a href="javascript:;" title="血脂及脂蛋白测定" data-url="medlist?dbtype=examination&secondclass=血脂及脂蛋白测定">血脂及脂蛋白测定</a>
                </div>
            </div>
            <div class="res-left-list ">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=examination&secondclass=感染免疫学检测" title="临床免疫、血清检测">临床免疫、血清检测</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="感染免疫学检测" data-url="medlist?dbtype=examination&secondclass=感染免疫学检测">感染免疫学检测</a>
                    <a href="javascript:;" title="过敏原测定"
                       data-url="medlist?dbtype=examination&secondclass=过敏原测定">过敏原测定</a>
                    <a href="javascript:;" title="免疫功能测定" data-url="medlist?dbtype=examination&secondclass=免疫功能测定">免疫功能测定</a>
                    <a href="javascript:;" title="肿瘤相关抗原测定" data-url="medlist?dbtype=examination&secondclass=肿瘤相关抗原测定">肿瘤相关抗原测定</a>
                    <a href="javascript:;" title="自身免疫病的实验项目"
                       data-url="medlist?dbtype=examination&secondclass=自身免疫病的实验项目">自身免疫病的实验项目</a>
                </div>
            </div>
            <div class="res-left-list ">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=examination&secondclass=血型、输血及人类组织相关性抗原检测"
                       title="临床体液、血液检验">临床体液、血液检验</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="血型、输血及人类组织相关性抗原检测"
                       data-url="medlist?dbtype=examination&secondclass=血型、输血及人类组织相关性抗原检测">血型、输血及人类组织…</a>
                    <a href="javascript:;" title="出凝血检查"
                       data-url="medlist?dbtype=examination&secondclass=出凝血检查">出凝血检查</a>
                    <a href="javascript:;" title="粪便检查" data-url="medlist?dbtype=examination&secondclass=粪便检查">粪便检查</a>
                    <a href="javascript:;" title="骨髓检查及常用染色技术"
                       data-url="medlist?dbtype=examination&secondclass=骨髓检查及常用染色技术">骨髓检查及常用染色技…</a>
                    <a href="javascript:;" title="尿液一般检查" data-url="medlist?dbtype=examination&secondclass=尿液一般检查">尿液一般检查</a>
                    <a href="javascript:;" title="溶血检查" data-url="medlist?dbtype=examination&secondclass=溶血检查">溶血检查</a>
                    <a href="javascript:;" title="体液与分泌物检查" data-url="medlist?dbtype=examination&secondclass=体液与分泌物检查">体液与分泌物检查</a>
                    <a href="javascript:;" title="血液流变学检查" data-url="medlist?dbtype=examination&secondclass=血液流变学检查">血液流变学检查</a>
                    <a href="javascript:;" title="血液一般检查" data-url="medlist?dbtype=examination&secondclass=血液一般检查">血液一般检查</a>
                </div>
            </div>
            <div class="res-left-list ">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=examination&secondclass=细菌检测" title="临床微生物检测">临床微生物检测</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="细菌检测" data-url="medlist?dbtype=examination&secondclass=细菌检测">细菌检测</a>
                    <a href="javascript:;" title="真菌检测" data-url="medlist?dbtype=examination&secondclass=真菌检测">真菌检测</a>
                    <a href="javascript:;" title="其它检验试验" data-url="medlist?dbtype=examination&secondclass=其它检验试验">其它检验试验</a>
                    <a href="javascript:;" title="衣原体检测"
                       data-url="medlist?dbtype=examination&secondclass=衣原体检测">衣原体检测</a>
                    <a href="javascript:;" title="支原体检测"
                       data-url="medlist?dbtype=examination&secondclass=支原体检测">支原体检测</a>
                    <a href="javascript:;" title="梅毒螺旋体检测" data-url="medlist?dbtype=examination&secondclass=梅毒螺旋体检测">梅毒螺旋体检测</a>
                    <a href="javascript:;" title="病毒检测" data-url="medlist?dbtype=examination&secondclass=病毒检测">病毒检测</a>
                </div>
            </div>
            <div class="res-left-list ">
                <div class="list-all all-title">


                    <b data-url="medlist?dbtype=examination&secondclass=感染性疾病分子生物学检验" title="临床细胞分子遗传检测">临床细胞分子遗传检测</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists">

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="感染性疾病分子生物学检验"
                       data-url="medlist?dbtype=examination&secondclass=感染性疾病分子生物学检验">感染性疾病分子生物学…</a>
                    <a href="javascript:;" title="疾病相关分子生物学及细胞遗传学检验"
                       data-url="medlist?dbtype=examination&secondclass=疾病相关分子生物学及细胞遗传学检验">疾病相关分子生物学及…</a>
                    <a href="javascript:;" title="肿瘤分子生物学检验"
                       data-url="medlist?dbtype=examination&secondclass=肿瘤分子生物学检验">肿瘤分子生物学检验</a>
                    <a href="javascript:;" title="用药指导的分子生物学检验"
                       data-url="medlist?dbtype=examination&secondclass=用药指导的分子生物学检验">用药指导的分子生物学…</a>
                    <a href="javascript:;" title="其它" data-url="medlist?dbtype=examination&secondclass=其它">其它</a>
                </div>
            </div>

            <a href="javascript:;" class="hide">收起</a><a href="javascript:;" class="more">展开</a>
        </div>
        <div class="res-bottom-right" style="height: 700px;">
            <div class="icd-btn">
                <h3>蛋白质测定</h3>
            </div>
            <div class="lists-main clear" style="height: 642px; overflow-y: hidden; outline: none;" tabindex="0">
                <ul class="clear">
                    <li><a id="med1" onclick="adduser('med1')" href="info?dbtype=examination&amp;id=1">α-酸性糖蛋白测定</a>
                    </li>
                    <li><a id="med2" onclick="adduser('med2')" href="info?dbtype=examination&amp;id=2">阿尔茨海默相关神经丝蛋白检测</a>
                    </li>
                    <li><a id="med3" onclick="adduser('med3')" href="info?dbtype=examination&amp;id=3">α1-抗胰蛋白酶测定</a>
                    </li>
                    <li><a id="med4" onclick="adduser('med4')" href="info?dbtype=examination&amp;id=4">α1-微球蛋白测定</a>
                    </li>
                    <li><a id="med5" onclick="adduser('med5')" href="info?dbtype=examination&amp;id=5">β2-微球蛋白测定</a>
                    </li>
                    <li><a id="med6" onclick="adduser('med6')"
                           href="info?dbtype=examination&amp;id=6">层粘连蛋白测定</a></li>
                    <li><a id="med7" onclick="adduser('med7')" href="info?dbtype=examination&amp;id=7">肠型脂肪酸结合蛋白测定</a>
                    </li>
                    <li><a id="med8" onclick="adduser('med8')"
                           href="info?dbtype=examination&amp;id=8">粪便钙卫蛋白测定</a></li>
                    <li><a id="med9" onclick="adduser('med9')" href="info?dbtype=examination&amp;id=9">肝型脂肪酸结合蛋白测定</a>
                    </li>
                    <li><a id="med10" onclick="adduser('med10')" href="info?dbtype=examination&amp;id=10">可溶性转铁蛋白受体测定</a>
                    </li>
                    <li><a id="med11" onclick="adduser('med11')" href="info?dbtype=examination&amp;id=11">脑脊液髓鞘碱性蛋白测定</a>
                    </li>
                    <li><a id="med12" onclick="adduser('med12')" href="info?dbtype=examination&amp;id=12">脑脊液寡克隆免疫球蛋白G测定</a>
                    </li>
                    <li><a id="med13" onclick="adduser('med13')" href="info?dbtype=examination&amp;id=13">尿氨基酸测定</a>
                    </li>
                    <li><a id="med14" onclick="adduser('med14')" href="info?dbtype=examination&amp;id=14">尿T-H糖蛋白测定</a>
                    </li>
                    <li><a id="med15" onclick="adduser('med15')" href="info?dbtype=examination&amp;id=15">酸性铁蛋白测定</a>
                    </li>
                    <li><a id="med16" onclick="adduser('med16')" href="info?dbtype=examination&amp;id=16">微量总蛋白测定</a>
                    </li>
                    <li><a id="med17" onclick="adduser('med17')" href="info?dbtype=examination&amp;id=17">血清淀粉样蛋白A测定</a>
                    </li>
                    <li><a id="med18" onclick="adduser('med18')" href="info?dbtype=examination&amp;id=18">血清转铁蛋白测定</a>
                    </li>
                    <li><a id="med19" onclick="adduser('med19')" href="info?dbtype=examination&amp;id=19">血清视黄醇结合蛋白测定</a>
                    </li>
                    <li><a id="med20" onclick="adduser('med20')" href="info?dbtype=examination&amp;id=20">血清蛋白电泳测定</a>
                    </li>
                    <li><a id="med21" onclick="adduser('med21')" href="info?dbtype=examination&amp;id=21">血清白蛋白测定</a>
                    </li>
                    <li><a id="med22" onclick="adduser('med22')" href="info?dbtype=examination&amp;id=22">血清总蛋白测定</a>
                    </li>
                    <li><a id="med23" onclick="adduser('med23')" href="info?dbtype=examination&amp;id=23">血清前白蛋白测定</a>
                    </li>
                    <li><a id="med24" onclick="adduser('med24')" href="info?dbtype=examination&amp;id=24">血浆铜蓝蛋白检测</a>
                    </li>
                    <li><a id="med25" onclick="adduser('med25')" href="info?dbtype=examination&amp;id=25">心脏型脂肪酸结合蛋白测定</a>
                    </li>
                    <li><a id="med26" onclick="adduser('med26')" href="info?dbtype=examination&amp;id=26">胰蛋白酶原-Ⅱ测定</a>
                    </li>
                    <li><a id="med27" onclick="adduser('med27')" href="info?dbtype=examination&amp;id=27">胰蛋白酶原测定</a>
                    </li>
                    <li><a id="med28" onclick="adduser('med28')"
                           href="info?dbtype=examination&amp;id=28">黏蛋白测定</a></li>
                    <li><a id="med29" onclick="adduser('med29')" href="info?dbtype=examination&amp;id=29">朊病毒蛋白测定</a>
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
    common.showData('.res-examination');
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