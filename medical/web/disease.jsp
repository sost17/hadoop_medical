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
            <a href="disease.jsp" id="disurl" onclick="medurl('disurl')" data-value="Disease" class="active"
               title="疾病">疾病</a>
            <a href="examination.jsp" id="examurl" onclick="medurl('examurl')" data-value="Examination"
               title="检查">检查</a>
            <a href="drug.jsp" id="drugurl" onclick="medurl('drugurl')" data-value="Drug" title="药品">药品</a>

        </div>
        <form method="get" action="javascript:;" class="all-search clear" autocomplete="off">
            <div class="input-box clear">
                <input name="q" id="searchkeywords" type="text" class="input-text" placeholder="请输入疾病特征，多个字段用空格分开">
            </div>
            <button type="button" class="super-btn" id="btn_search" data-url="<%=path%>/toSearch?dbtype=disease" ><i
                    class="icon icon-search">搜索</i></button>
        </form>

    </div>
    <!--疾病-->
    <div class="res-bottom clear res-disease">
        <div class="res-bottom-left active">
            <div class="res-left-title">
                <h3>科室分类</h3>
            </div>

            <div class="res-left-list active">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=内分泌科" title="内分泌科">内科</b>
                    <span class="symbol">-</span>
                </div>
                <div class="lists" >

                    <i class="subjects to-right " style="top: 13px"></i>
                    <a href="javascript:;" title="内分泌科" data-url="medlist?dbtype=disease&secondclass=内分泌科">内分泌科</a>
                    <a href="javascript:;" title="神经内科" data-url="medlist?dbtype=disease&secondclass=神经内科">神经内科</a>
                    <a href="javascript:;" title="心血管内科" data-url="medlist?dbtype=disease&secondclass=心血管内科">心血管内科</a>
                    <a href="javascript:;" title="消化内科" data-url="medlist?dbtype=disease&secondclass=消化内科">消化内科</a>
                    <a href="javascript:;" title="风湿免疫科" data-url="medlist?dbtype=disease&secondclass=风湿免疫科">风湿免疫科</a>
                    <a href="javascript:;" title="血液科" data-url="medlist?dbtype=disease&secondclass=血液科">血液科</a>
                    <a href="javascript:;" title="呼吸内科" data-url="medlist?dbtype=disease&secondclass=呼吸内科">呼吸内科</a>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=神经外科" title="外科">外科</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists" >

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="神经外科" data-url="medlist?dbtype=disease&secondclass=神经外科">神经外科</a>
                    <a href="javascript:;" title="心脏外科" data-url="medlist?dbtype=disease&secondclass=心脏外科">心脏外科</a>
                    <a href="javascript:;" title="胸部外科" data-url="medlist?dbtype=disease&secondclass=胸部外科">胸部外科</a>
                    <a href="javascript:;" title="普通外科" data-url="medlist?dbtype=disease&secondclass=普通外科">普通外科</a>
                    <a href="javascript:;" title="肝胆外科" data-url="medlist?dbtype=disease&secondclass=肝胆外科">肝胆外科</a>
                    <a href="javascript:;" title="烧伤外科" data-url="medlist?dbtype=disease&secondclass=烧伤外科">烧伤外科</a>
                    <a href="javascript:;" title="整形外科" data-url="medlist?dbtype=disease&secondclass=整形外科">整形外科</a>
                    <a href="javascript:;" title="泌尿外科" data-url="medlist?dbtype=disease&secondclass=泌尿外科">泌尿外科</a>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=妇科" title="妇产科">妇产科</b>
                    <span class="symbol">+</span>
                </div>
                <div class="lists" >

                    <i class="subjects to-right" style="top: 13px"></i>
                    <a href="javascript:;" title="妇科" data-url="medlist?dbtype=disease&secondclass=妇科">妇科</a>
                    <a href="javascript:;" title="产科" data-url="medlist?dbtype=disease&secondclass=产科">产科</a>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=儿科" title="儿科">儿科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=皮肤性病科" title="皮肤性病科">皮肤性病科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=感染科" title="感染科">感染科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=眼科" title="眼科">眼科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=急诊科" title="急诊科">急诊科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=精神科" title="精神科">精神科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=口腔科" title="口腔科">口腔科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=肿瘤科" title="肿瘤科">肿瘤科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=骨科" title="骨科">骨科</b>
                    <span class="symbol">+</span>
                </div>
            </div>
            <div class="res-left-list">
                <div class="list-all all-title" >


                    <b data-url="medlist?dbtype=disease&secondclass=耳鼻咽喉头颈外科" title="耳鼻咽喉头颈外科">耳鼻咽喉头颈外科</b>
                    <span class="symbol">+</span>
                </div>
            </div>

            <a href="javascript:;" class="hide">收起</a><a href="javascript:;" class="more">展开</a>
        </div>

        <div class="res-bottom-right"  style="height: 797px;">
            <div class="icd-btn">
                <h3>内分泌科</h3>

            </div>
            <div class="lists-main clear" style="height: 747px; overflow-y: hidden; outline: none;" tabindex="0">
                <ul class="clear">
                    <li><a id="med1" onclick="adduser('med1')" href="info?dbtype=disease&amp;id=1">1型糖尿病</a>
                    </li>
                    <li><a id="med2" onclick="adduser('med2')" href="info?dbtype=disease&amp;id=2">2型糖尿病</a>
                    </li>
                    <li><a id="med3" onclick="adduser('med3')" href="info?dbtype=disease&amp;id=3">勃起功能障碍</a>
                    </li>
                    <li><a id="med4" onclick="adduser('med4')"
                           href="info?dbtype=disease&amp;id=4">表观盐皮质激素过多综合征</a></li>
                    <li><a id="med5" onclick="adduser('med5')" href="info?dbtype=disease&amp;id=5">苯丙酮尿症</a>
                    </li>
                    <li><a id="med6" onclick="adduser('med6')" href="info?dbtype=disease&amp;id=6">闭经-溢乳综合征</a>
                    </li>
                    <li><a id="med7" onclick="adduser('med7')" href="info?dbtype=disease&amp;id=7">半乳糖血症</a>
                    </li>
                    <li><a id="med8" onclick="adduser('med8')" href="info?dbtype=disease&amp;id=8">闭经</a></li>
                    <li><a id="med9" onclick="adduser('med9')" href="info?dbtype=disease&amp;id=9">巴特综合征</a>
                    </li>
                    <li><a id="med10" onclick="adduser('med10')"
                           href="info?dbtype=disease&amp;id=10">产后甲状腺炎</a></li>
                    <li><a id="med11" onclick="adduser('med11')" href="info?dbtype=disease&amp;id=11">成骨不全</a>
                    </li>
                    <li><a id="med12" onclick="adduser('med12')" href="info?dbtype=disease&amp;id=12">迟发性睾丸功能减退症</a>
                    </li>
                    <li><a id="med13" onclick="adduser('med13')" href="info?dbtype=disease&amp;id=13">成人隐匿性自身免疫糖尿病</a>
                    </li>
                    <li><a id="med14" onclick="adduser('med14')" href="info?dbtype=disease&amp;id=14">垂体瘤</a>
                    </li>
                    <li><a id="med15" onclick="adduser('med15')"
                           href="info?dbtype=disease&amp;id=15">垂体前叶功能减退症</a></li>
                    <li><a id="med16" onclick="adduser('med16')"
                           href="info?dbtype=disease&amp;id=16">Carney综合征</a></li>
                    <li><a id="med17" onclick="adduser('med17')" href="info?dbtype=disease&amp;id=17">代谢综合征</a>
                    </li>
                    <li><a id="med18" onclick="adduser('med18')" href="info?dbtype=disease&amp;id=18">多发性内分泌腺自身免疫综合征</a>
                    </li>
                    <li><a id="med19" onclick="adduser('med19')" href="info?dbtype=disease&amp;id=19">低血糖症</a>
                    </li>
                    <li><a id="med20" onclick="adduser('med20')"
                           href="info?dbtype=disease&amp;id=20">多发性神经纤维瘤病</a></li>
                    <li><a id="med21" onclick="adduser('med21')" href="info?dbtype=disease&amp;id=21">多发性内分泌腺肿瘤综合征</a>
                    </li>
                    <li><a id="med22" onclick="adduser('med22')"
                           href="info?dbtype=disease&amp;id=22">多囊卵巢综合征</a></li>
                    <li><a id="med23" onclick="adduser('med23')" href="info?dbtype=disease&amp;id=23">蛋白质-热能营养不良症</a>
                    </li>
                    <li><a id="med24" onclick="adduser('med24')" href="info?dbtype=disease&amp;id=24">低钠血症</a>
                    </li>
                    <li><a id="med25" onclick="adduser('med25')"
                           href="info?dbtype=disease&amp;id=25">单纯性甲状腺肿</a></li>
                    <li><a id="med26" onclick="adduser('med26')" href="info?dbtype=disease&amp;id=26">儿童糖尿病</a>
                    </li>
                    <li><a id="med27" onclick="adduser('med27')" href="info?dbtype=disease&amp;id=27">Ehlers-Danlos综合征</a>
                    </li>
                    <li><a id="med28" onclick="adduser('med28')" href="info?dbtype=disease&amp;id=28">氟骨症</a>
                    </li>
                    <li><a id="med29" onclick="adduser('med29')" href="info?dbtype=disease&amp;id=29">枫糖尿症</a>
                    </li>
                    <li><a id="med30" onclick="adduser('med30')" href="info?dbtype=disease&amp;id=30">肥胖-性生殖无能综合征</a>
                    </li>
                    <li><a id="med31" onclick="adduser('med31')" href="info?dbtype=disease&amp;id=31">肥胖症</a>
                    </li>
                    <li><a id="med32" onclick="adduser('med32')"
                           href="info?dbtype=disease&amp;id=32">功能失调性子宫出血</a></li>
                    <li><a id="med33" onclick="adduser('med33')" href="info?dbtype=disease&amp;id=33">高钠血症</a>
                    </li>
                    <li><a id="med34" onclick="adduser('med34')" href="info?dbtype=disease&amp;id=34">钙代谢紊乱</a>
                    </li>
                    <li><a id="med35" onclick="adduser('med35')"
                           href="info?dbtype=disease&amp;id=35">高血糖高渗综合征</a></li>
                    <li><a id="med36" onclick="adduser('med36')"
                           href="info?dbtype=disease&amp;id=36">Graves眼病</a></li>
                    <li><a id="med37" onclick="adduser('med37')"
                           href="info?dbtype=disease&amp;id=37">高尿酸血症与痛风</a></li>
                    <li><a id="med38" onclick="adduser('med38')"
                           href="info?dbtype=disease&amp;id=38">Gaucher病</a></li>
                    <li><a id="med39" onclick="adduser('med39')" href="info?dbtype=disease&amp;id=39">骨质疏松症</a>
                    </li>
                    <li><a id="med40" onclick="adduser('med40')"
                           href="info?dbtype=disease&amp;id=40">Hartnup病</a></li>
                    <li><a id="med41" onclick="adduser('med41')"
                           href="info?dbtype=disease&amp;id=41">甲状腺功能减退症</a></li>
                    <li><a id="med42" onclick="adduser('med42')"
                           href="info?dbtype=disease&amp;id=42">甲状腺功能亢进症</a></li>
                    <li><a id="med43" onclick="adduser('med43')"
                           href="info?dbtype=disease&amp;id=43">甲状腺功能亢进危象</a></li>
                    <li><a id="med44" onclick="adduser('med44')"
                           href="info?dbtype=disease&amp;id=44">家族性脂蛋白异常症</a></li>
                    <li><a id="med45" onclick="adduser('med45')"
                           href="info?dbtype=disease&amp;id=45">甲状旁腺功能减退症</a></li>
                    <li><a id="med46" onclick="adduser('med46')"
                           href="info?dbtype=disease&amp;id=46">经前期紧张综合征</a></li>
                    <li><a id="med47" onclick="adduser('med47')" href="info?dbtype=disease&amp;id=47">甲状腺功能亢进性心脏病</a>
                    </li>
                    <li><a id="med48" onclick="adduser('med48')" href="info?dbtype=disease&amp;id=48">甲硫氨酸代谢紊乱综合征</a>
                    </li>
                    <li><a id="med49" onclick="adduser('med49')"
                           href="info?dbtype=disease&amp;id=49">继发性糖尿病</a></li>
                    <li><a id="med50" onclick="adduser('med50')" href="info?dbtype=disease&amp;id=50">甲状腺结节</a>
                    </li>
                    <li><a id="med51" onclick="adduser('med51')" href="info?dbtype=disease&amp;id=51">钾代谢紊乱</a>
                    </li>
                    <li><a id="med52" onclick="adduser('med52')"
                           href="info?dbtype=disease&amp;id=52">急性化脓性甲状腺炎</a></li>
                    <li><a id="med53" onclick="adduser('med53')"
                           href="info?dbtype=disease&amp;id=53">巨人症与肢端肥大症</a></li>
                    <li><a id="med54" onclick="adduser('med54')"
                           href="info?dbtype=disease&amp;id=54">继发性醛固酮增多症</a></li>
                    <li><a id="med55" onclick="adduser('med55')"
                           href="info?dbtype=disease&amp;id=55">继发性血脂谱异常症</a></li>
                    <li><a id="med56" onclick="adduser('med56')" href="info?dbtype=disease&amp;id=56">继发性甲状旁腺功能亢进症</a>
                    </li>
                    <li><a id="med57" onclick="adduser('med57')"
                           href="info?dbtype=disease&amp;id=57">空泡蝶鞍综合征</a></li>
                    <li><a id="med58" onclick="adduser('med58')" href="info?dbtype=disease&amp;id=58">Klinefelter综合征</a>
                    </li>
                    <li><a id="med59" onclick="adduser('med59')" href="info?dbtype=disease&amp;id=59">抗利尿激素分泌不适当综合征</a>
                    </li>
                    <li><a id="med60" onclick="adduser('med60')" href="info?dbtype=disease&amp;id=60">Kallmann综合征</a>
                    </li>
                    <li><a id="med61" onclick="adduser('med61')" href="info?dbtype=disease&amp;id=61">磷代谢紊乱</a>
                    </li>
                    <li><a id="med62" onclick="adduser('med62')"
                           href="info?dbtype=disease&amp;id=62">类癌与类癌综合征</a></li>
                    <li><a id="med63" onclick="adduser('med63')"
                           href="info?dbtype=disease&amp;id=63">淋巴细胞性垂体炎</a></li>
                    <li><a id="med64" onclick="adduser('med64')"
                           href="info?dbtype=disease&amp;id=64">卵巢过度刺激综合征</a></li>
                    <li><a id="med65" onclick="adduser('med65')" href="info?dbtype=disease&amp;id=65">卵巢早衰</a>
                    </li>
                    <li><a id="med66" onclick="adduser('med66')" href="info?dbtype=disease&amp;id=66">酪氨酸血症</a>
                    </li>
                    <li><a id="med67" onclick="adduser('med67')"
                           href="info?dbtype=disease&amp;id=67">Liddle综合征</a></li>
                    <li><a id="med68" onclick="adduser('med68')" href="info?dbtype=disease&amp;id=68">老年糖尿病</a>
                    </li>
                    <li><a id="med69" onclick="adduser('med69')" href="info?dbtype=disease&amp;id=69">颅咽管瘤</a>
                    </li>
                    <li><a id="med70" onclick="adduser('med70')" href="info?dbtype=disease&amp;id=70">镁代谢紊乱</a>
                    </li>
                    <li><a id="med71" onclick="adduser('med71')" href="info?dbtype=disease&amp;id=71">泌乳素瘤</a>
                    </li>
                    <li><a id="med72" onclick="adduser('med72')" href="info?dbtype=disease&amp;id=72">慢性淋巴细胞性甲状腺炎</a>
                    </li>
                    <li><a id="med73" onclick="adduser('med73')"
                           href="info?dbtype=disease&amp;id=73">Marfan综合征</a></li>
                    <li><a id="med74" onclick="adduser('med74')" href="info?dbtype=disease&amp;id=74">慢性侵袭性纤维性甲状腺炎</a>
                    </li>
                    <li><a id="med75" onclick="adduser('med75')" href="info?dbtype=disease&amp;id=75">McCune-Albright综合征</a>
                    </li>
                    <li><a id="med76" onclick="adduser('med76')"
                           href="info?dbtype=disease&amp;id=76">男性更年期综合征</a></li>
                    <li><a id="med77" onclick="adduser('med77')"
                           href="info?dbtype=disease&amp;id=77">男性性腺功能减退症</a></li>
                    <li><a id="med78" onclick="adduser('med78')" href="info?dbtype=disease&amp;id=78">男性不育症</a>
                    </li>
                    <li><a id="med79" onclick="adduser('med79')"
                           href="info?dbtype=disease&amp;id=79">男性青春期发育延迟</a></li>
                    <li><a id="med80" onclick="adduser('med80')" href="info?dbtype=disease&amp;id=80">男性性早熟</a>
                    </li>
                    <li><a id="med81" onclick="adduser('med81')" href="info?dbtype=disease&amp;id=81">女性性早熟</a>
                    </li>
                    <li><a id="med82" onclick="adduser('med82')"
                           href="info?dbtype=disease&amp;id=82">女性青春期发育延迟</a></li>
                    <li><a id="med83" onclick="adduser('med83')"
                           href="info?dbtype=disease&amp;id=83">男性乳房发育症</a></li>
                    <li><a id="med84" onclick="adduser('med84')" href="info?dbtype=disease&amp;id=84">女性多毛症</a>
                    </li>
                    <li><a id="med85" onclick="adduser('med85')" href="info?dbtype=disease&amp;id=85">女性不育症</a>
                    </li>
                    <li><a id="med86" onclick="adduser('med86')" href="info?dbtype=disease&amp;id=86">尿崩症</a>
                    </li>
                    <li><a id="med87" onclick="adduser('med87')"
                           href="info?dbtype=disease&amp;id=87">皮质醇增多症</a></li>
                    <li><a id="med88" onclick="adduser('med88')"
                           href="info?dbtype=disease&amp;id=88">Paget骨病</a></li>
                    <li><a id="med89" onclick="adduser('med89')"
                           href="info?dbtype=disease&amp;id=89">醛固酮不敏感综合征</a></li>
                    <li><a id="med90" onclick="adduser('med90')" href="info?dbtype=disease&amp;id=90">青少年发病的成年型糖尿病</a>
                    </li>
                    <li><a id="med91" onclick="adduser('med91')"
                           href="info?dbtype=disease&amp;id=91">溶酶体脂质贮积病</a></li>
                    <li><a id="med92" onclick="adduser('med92')"
                           href="info?dbtype=disease&amp;id=92">妊娠合并糖尿病</a></li>
                    <li><a id="med93" onclick="adduser('med93')"
                           href="info?dbtype=disease&amp;id=93">妊娠期甲状腺毒症</a></li>
                    <li><a id="med94" onclick="adduser('med94')" href="info?dbtype=disease&amp;id=94">神经性厌食</a>
                    </li>
                    <li><a id="med95" onclick="adduser('med95')" href="info?dbtype=disease&amp;id=95">生长激素释放抑制激素瘤</a>
                    </li>
                    <li><a id="med96" onclick="adduser('med96')" href="info?dbtype=disease&amp;id=96">生长激素缺乏性侏儒症</a>
                    </li>
                    <li><a id="med97" onclick="adduser('med97')"
                           href="info?dbtype=disease&amp;id=97">肾上腺意外瘤</a></li>
                    <li><a id="med98" onclick="adduser('med98')" href="info?dbtype=disease&amp;id=98">生殖细胞瘤</a>
                    </li>
                    <li><a id="med99" onclick="adduser('med99')"
                           href="info?dbtype=disease&amp;id=99">肾上腺髓质增生症</a></li>
                    <li><a id="med100" onclick="adduser('med100')"
                           href="info?dbtype=disease&amp;id=100">酸碱平衡失调</a></li>
                    <li><a id="med101" onclick="adduser('med101')"
                           href="info?dbtype=disease&amp;id=101">肾小管酸中毒</a></li>
                    <li><a id="med102" onclick="adduser('med102')"
                           href="info?dbtype=disease&amp;id=102">肾素瘤</a></li>
                    <li><a id="med103" onclick="adduser('med103')" href="info?dbtype=disease&amp;id=103">失水</a>
                    </li>
                    <li><a id="med104" onclick="adduser('med104')"
                           href="info?dbtype=disease&amp;id=104">松果体肿瘤</a></li>
                    <li><a id="med105" onclick="adduser('med105')"
                           href="info?dbtype=disease&amp;id=105">嗜铬细胞瘤</a></li>
                    <li><a id="med106" onclick="adduser('med106')" href="info?dbtype=disease&amp;id=106">肾性骨营养不良</a>
                    </li>
                    <li><a id="med107" onclick="adduser('med107')"
                           href="info?dbtype=disease&amp;id=107">肾性尿崩症</a></li>
                    <li><a id="med108" onclick="adduser('med108')" href="info?dbtype=disease&amp;id=108">肾上腺皮质危象</a>
                    </li>
                    <li><a id="med109" onclick="adduser('med109')" href="info?dbtype=disease&amp;id=109">糖尿病视网膜病变</a>
                    </li>
                    <li><a id="med110" onclick="adduser('med110')"
                           href="info?dbtype=disease&amp;id=110">糖尿病肾病</a></li>
                    <li><a id="med111" onclick="adduser('med111')" href="info?dbtype=disease&amp;id=111">糖尿病心血管疾病</a>
                    </li>
                    <li><a id="med112" onclick="adduser('med112')" href="info?dbtype=disease&amp;id=112">糖尿病脑血管疾病</a>
                    </li>
                    <li><a id="med113" onclick="adduser('med113')" href="info?dbtype=disease&amp;id=113">糖皮质激素不敏感综合征</a>
                    </li>
                    <li><a id="med114" onclick="adduser('med114')" href="info?dbtype=disease&amp;id=114">糖尿病乳酸性酸中毒</a>
                    </li>
                    <li><a id="med115" onclick="adduser('med115')" href="info?dbtype=disease&amp;id=115">糖尿病神经病变</a>
                    </li>
                    <li><a id="med116" onclick="adduser('med116')" href="info?dbtype=disease&amp;id=116">糖尿病合并高血压</a>
                    </li>
                    <li><a id="med117" onclick="adduser('med117')" href="info?dbtype=disease&amp;id=117">特发性低促性腺激素性性腺功能减退症</a>
                    </li>
                    <li><a id="med118" onclick="adduser('med118')" href="info?dbtype=disease&amp;id=118">Turner综合征</a>
                    </li>
                    <li><a id="med119" onclick="adduser('med119')"
                           href="info?dbtype=disease&amp;id=119">糖尿病与感染</a></li>
                    <li><a id="med120" onclick="adduser('med120')" href="info?dbtype=disease&amp;id=120">糖尿病酮症酸中毒</a>
                    </li>
                    <li><a id="med121" onclick="adduser('med121')" href="info?dbtype=disease&amp;id=121">糖尿病骨关节病</a>
                    </li>
                    <li><a id="med122" onclick="adduser('med122')"
                           href="info?dbtype=disease&amp;id=122">糖尿病足病</a></li>
                    <li><a id="med123" onclick="adduser('med123')" href="info?dbtype=disease&amp;id=123">von
                        Hippel-Lindau病</a></li>
                    <li><a id="med124" onclick="adduser('med124')"
                           href="info?dbtype=disease&amp;id=124">戊二酸血症</a></li>
                    <li><a id="med125" onclick="adduser('med125')"
                           href="info?dbtype=disease&amp;id=125">胃泌素瘤</a></li>
                    <li><a id="med126" onclick="adduser('med126')" href="info?dbtype=disease&amp;id=126">围绝经期综合征</a>
                    </li>
                    <li><a id="med127" onclick="adduser('med127')"
                           href="info?dbtype=disease&amp;id=127">维生素缺乏症</a></li>
                    <li><a id="med128" onclick="adduser('med128')" href="info?dbtype=disease&amp;id=128">维生素D缺乏性佝偻病与骨软化症</a>
                    </li>
                    <li><a id="med129" onclick="adduser('med129')" href="info?dbtype=disease&amp;id=129">雄激素不敏感综合征</a>
                    </li>
                    <li><a id="med130" onclick="adduser('med130')"
                           href="info?dbtype=disease&amp;id=130">血卟啉病</a></li>
                    <li><a id="med131" onclick="adduser('med131')"
                           href="info?dbtype=disease&amp;id=131">血色病</a></li>
                    <li><a id="med132" onclick="adduser('med132')" href="info?dbtype=disease&amp;id=132">血管活性肠肽瘤</a>
                    </li>
                    <li><a id="med133" onclick="adduser('med133')"
                           href="info?dbtype=disease&amp;id=133">血脂谱异常症</a></li>
                    <li><a id="med134" onclick="adduser('med134')" href="info?dbtype=disease&amp;id=134">X-性连锁先天性肾上腺发育不良症</a>
                    </li>
                    <li><a id="med135" onclick="adduser('med135')" href="info?dbtype=disease&amp;id=135">先天性肾上腺皮质增生症</a>
                    </li>
                    <li><a id="med136" onclick="adduser('med136')"
                           href="info?dbtype=disease&amp;id=136">下丘脑综合征</a></li>
                    <li><a id="med137" onclick="adduser('med137')" href="info?dbtype=disease&amp;id=137">系统性淀粉样蛋白变性</a>
                    </li>
                    <li><a id="med138" onclick="adduser('med138')" href="info?dbtype=disease&amp;id=138">亚急性淋巴细胞性甲状腺炎</a>
                    </li>
                    <li><a id="med139" onclick="adduser('med139')" href="info?dbtype=disease&amp;id=139">原发性高密度脂蛋白代谢异常</a>
                    </li>
                    <li><a id="med140" onclick="adduser('med140')"
                           href="info?dbtype=disease&amp;id=140">胰高血糖素瘤</a></li>
                    <li><a id="med141" onclick="adduser('med141')"
                           href="info?dbtype=disease&amp;id=141">胰岛素瘤</a></li>
                    <li><a id="med142" onclick="adduser('med142')" href="info?dbtype=disease&amp;id=142">原发性醛固酮增多症</a>
                    </li>
                    <li><a id="med143" onclick="adduser('med143')" href="info?dbtype=disease&amp;id=143">原发性肾上腺皮质功能减退症</a>
                    </li>
                    <li><a id="med144" onclick="adduser('med144')" href="info?dbtype=disease&amp;id=144">原发性甲状旁腺功能亢进症</a>
                    </li>
                    <li><a id="med145" onclick="adduser('med145')" href="info?dbtype=disease&amp;id=145">亚急性肉芽肿性甲状腺炎</a>
                    </li>
                    <li><a id="med146" onclick="adduser('med146')" href="info?dbtype=disease&amp;id=146">遗传性高氨血症</a>
                    </li>
                    <li><a id="med147" onclick="adduser('med147')" href="info?dbtype=disease&amp;id=147">脂肪酸氧化酶缺陷综合征</a>
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

<script type="text/javascript">
    common.showData('.res-disease');
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
    });
</script>
</body>
</html>