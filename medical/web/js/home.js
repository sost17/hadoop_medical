function returnurl() {
    var url = window.location.href;
    retUrl = "?ReturnUrl="+ url;
    $("#loginUrl").prop("href", $("#loginUrl").prop("href") + retUrl);
}
function medurl(id) {
    var fullurl = window.location.href;
    if(fullurl.indexOf("?") != -1){
        var returnurl = fullurl.substr(1);
        var user = "";
        returnurl = returnurl.split("?")[1];
        user = returnurl.split("&")[0];
        returnurl = returnurl.split("&")[1];
        user = user.split("=")[1];
        returnurl = returnurl.split("=")[1];
        retUrl = "?username="+ user +"&Url="+ returnurl;
        $("#"+ id).prop("href", $("#"+ id).prop("href") + retUrl);
    }
}
function searchgroup(id) {
    var user = $('.header-wrapper .header .state').find('b').text();
    retUrl = "&username="+ user;
    $("#"+ id).prop("href", $("#"+ id).prop("href") + retUrl);
}
function adduser(id) {
    var fullurl = window.location.href;
    if(fullurl.indexOf("?") != -1){
        var returnurl = fullurl.substr(1);
        var user = "";
        returnurl = returnurl.split("?")[1];
        user = returnurl.split("&")[0];
        user = user.split("=")[1];
        userurl = "&username="+ user;
        $("#"+ id).prop("href", $("#"+ id).prop("href") + userurl);
    }
}
function searchadduser(id) {
    var fullurl = window.location.href;
    if(fullurl.indexOf("?") != -1){
        var returnurl = fullurl.substr(1);
        var user = "";
        returnurl = returnurl.split("?")[1];
        user = returnurl.split("&")[0];
        user = user.split("=")[1];
        userurl = "&username="+ user;
        $("#"+ id).prop("href", $("#"+ id).prop("href") + userurl);
    } else{
        var user = $('.header-wrapper .header .state').find('b').text();
        userurl = "&username="+ user;
        $("#"+ id).prop("href", $("#"+ id).prop("href") + userurl);
    }
}
function infotoindex(id) {
    var fullurl = window.location.href;
    if(fullurl.indexOf("?") != -1){
        var returnurl = fullurl.substr(1);
        var user = "";
        returnurl = returnurl.split("?")[1];
        user = returnurl.split("&")[0];
        user = user.split("=")[1];
        retUrl = "disease.jsp?user="+ user +"&returnurl=datainfo.jsp";
        $("#"+ id).prop("href",retUrl);
    } else {
        var username = $('.header-wrapper .header .state').find('b').text();
        if (username != "") {
            retUrl = "disease.jsp?user="+ username +"&returnurl=datainfo.jsp";
            $("#"+ id).prop("href",retUrl);
        }
    }
}

function goToPage(id,pagesum,href){
    var pagenum = $("#"+ id).prop("value");
    if(!/^\d+$/.test(pagenum) || !$.isNumeric(pagenum) || Number(pagenum) <= 0 || Number(pagenum) > Number(pagesum)){
        $("#"+ id).prop("value",1);
        alert('请输入正确的页码');
    }else {
        var user = $('.header-wrapper .header .state').find('b').text();
        var begin = 0;
        var tag = 0;
        if(Number(pagenum)%9 == 0){
            pagenum = pagenum -1;
            tag = 1;
        }
        begin = Number(pagenum) - Number(pagenum)%9 + 1;
        var end = 0;
        if((pagesum-begin)/10 >= 1){
            end = begin + 9;
        } else {
            end = pagesum;
        }
        if(tag == 1){
            pagenum = pagenum +1;
        }

        var tmp = document.createElement("form");
        var action = href +"&pagenum="+ pagenum +"&begin="+ begin +"&end="+ end +"&username="+ user;
        tmp.action = action;
        tmp.method = "post";
        document.body.appendChild(tmp);
        tmp.submit();
    }

}

$(function(){
    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    $(function () {
        $(window).scroll(function(){
            if ($(window).scrollTop()>100){
                $("#back-to-top").fadeIn(1500);
            }
            else
            {
                $("#back-to-top").fadeOut(1500);
            }
        });

        //当点击跳转链接后，回到页面顶部位置

        $("#back-to-top").click(function(){
            $('body,html').animate({scrollTop:0},1000);
            return false;
        });
    });
});

var promptInfo = "请输入搜索关键词";
var indexBtn = (function () {
    return {
        changeUrl: function (obj) {
            var $input = $("input[name='q']");
            var query = $.trim($input.val());
            if (query === "" || query === promptInfo) {
                alert(promptInfo);
                $input.focus();
                return false;
            } else{
                var url = $(obj).data('url');
                var searchvalue ="&data="+ $.trim($("#searchkeywords").val());
                var username = "&username="+ $('.header-wrapper .header .state').find('b').text();
                var tmp = document.createElement("form");
                var action = url + searchvalue + username +"&pagenum=0&begin=1&end=10";
                tmp.action = action;
                tmp.method = "post";
                document.body.appendChild(tmp);
                tmp.submit();
            }
        }
    };
})();
/*一框式检索*/
$("#btn_search").click(function () {
    indexBtn.changeUrl(this);
});
/****检索框赋值***/
function BindParm() {
    var currentKewords = $.trim($("#hide-Qvalue").val());
    var encodeKeywords = encodeURI(currentKewords).replace(/\+/g, '%2B');
    if (currentKewords.length === 0) {
        return;
    }

    $(".hide-keywords").val(decodeURI(encodeKeywords));
}

(function () {
    BindParm();
})()
function alertDialog(obj, text, func, closeFun) {
    obj.find('p').text(text);
    obj.dialog({
        modal: true,
        height: 160,
        width: 300,
        buttons: [{
            text: "确定",
            'class': 'btn-confirm-1',
            click: function () {
                $(this).dialog("close");
                if (func && $.isFunction(func)) {
                    func();
                }
            }
        }],
        close: function () {
            $(this).dialog("close");
            if (closeFun && $.isFunction(closeFun)) {
                closeFun();
            }
        }
    });
}
var common = {
    showData: function (obj) {
        $(obj + ' .res-bottom-left .res-left-list .all-title').on('click', function () {
            var url = $(this).find('b').data('url');
            $(obj + ' .res-bottom-right .lists-main ul li').remove();
            if ($(this).next().text() !== '') {
                $('.icd-btn h3').text($(this).siblings('.lists').find('a:eq(0)').prop('title'));
            } else {
                $('.icd-btn h3').text($(this).find('b:eq(0)').prop('title'));
            }
            $.ajax({
                type: 'POST',
                url: url,
                beforeSend: function () {
                    $(obj + ' .res-bottom-right .lists-main ul').html('加载中...');
                },
                success: function (msg) {
                    var json = eval(msg);
                    var datainfo = "";
                    for(i in json){
                        datainfo += "<li><a id=\"med"+ json[i].id +"\" onclick=\"adduser(\'med"+ json[i].id +"\')\" href=\""+ json[i].url +"\">"+ json[i].name +"</a></li>";
                    }
                    $('.lists-main ul').html(datainfo);
                },
                error: function (jqXhr) {
                    if (window.console) {
                        console.log(jqXhr.responseText + "," + jqXhr.responseXML + "," + jqXhr.readyState + "," + jqXhr.status);
                        console.log("获取出错。");
                    }
                }
            });

        });
        $(obj + ' .res-bottom-left .res-left-list .lists').on('click', 'a', function () {
            $(obj + ' .res-bottom-right .lists-main ul li').remove();
            var url = $(this).data('url');
            $('.icd-btn h3').text($(this).prop('title'));
            $.ajax({
                type: 'POST',
                url: url,
                beforeSend: function () {
                    $(obj + ' .res-bottom-right .lists-main ul').html('加载中...');
                },
                success: function (msg) {
                    var json = eval(msg);
                    var datainfo = "";
                    for(i in json){
                        datainfo += "<li><a id=\"med"+ json[i].id +"\" onclick=\"adduser(\'med"+ json[i].id +"\')\" href=\""+ json[i].url +"\">"+ json[i].name +"</a></li>";
                    }
                    $(obj + ' .res-bottom-right .lists-main ul').html(datainfo);
                    if ($(obj + ' .res-bottom-right .lists-main ul').html() == '') {
                        $(obj + ' .res-bottom-right .lists-main ul').html('无数据');
                    }
                },
                error: function (jqXhr) {
                    if (window.console) {
                        console.log(jqXhr.responseText + "," + jqXhr.responseXML + "," + jqXhr.readyState + "," + jqXhr.status);
                        console.log("获取出错。");
                    }
                }
            });
        });
    }
};
(function () {
    $(document).off('click', 'a.asynLoad').on('click', 'a.asynLoad', function (event) {
        event.preventDefault();
        var me = $(this);
        var thisId = '#' + me.data('containerid');
        var thisUrl = me.data('url') + "&p=";
        $.ajax({
            url: thisUrl,
            beforeSend: function () {
                if ($(thisId).find('div').has('.documentWrapper')) {
                    $('.documentWrapper').html('<p class="mb-loading" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">加载中...</p>');
                }
            },
            success: function (data) {
                $(thisId).html(data);
            }
        });
        initPage(thisId, thisUrl, $(thisId));
        initgoToPage(thisId, thisUrl, $(thisId));
    });
    $(document).off('click', 'a.loadTab').on('click', 'a.loadTab', function (event) {
        event.preventDefault();
        var me = $(this);
        $('#' + me.siblings('a.loadTab').data("containerid")).hide();
        var id = me.data("containerid");
        var $panel = $('#' + id).show();
        if ($panel.html().length === 0) {
            $.ajax({
                url: me.data("url"),
                beforeSend: function () {
                    $panel.html('<p class="mb-loading" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">加载中...</p>');
                },
                success: function (html) {
                    $panel.html(html);
                    var $pager = $panel.find('div.tab_Pagers');
                    if ($pager.children('.pager').length === 0) {
                        return;
                    }
                    var container = '#' + id;
                    var urltemplate = $pager.data('url');
                    initPage(container, urltemplate, $panel);
                    initgoToPage(container, urltemplate, $panel);
                },
                error: function (jqXhr) {
                    if (window.console) {
                        console.log(jqXhr.responseText + "," + jqXhr.responseXML + "," + jqXhr.readyState + "," + jqXhr.status);
                        console.log("获取出错。");
                    }
                }
            });
        }
    });
    $('a.view-more').click(function (event) {
        $('a.loadTab').filter(function () {
            return $(this).text() === '临床文献';
        }).click();
        $('body,html').scrollTop(0);
    });
    $('a.mb-view-more').click(function (event) {
        if ($('.lcwx-boxs').length == 1) {
            $('.lcwx-boxs').css('display', 'block');
        }
        $('a.loadLable').filter(function () {
            return $(this).text() === '全部';
        }).eq(0).click();
        $('body,html').scrollTop(0);
    });

    $('a.loadLable').click(function (event) {
        var urls = $(this).data('url');
        var id = $(this).data("containerid");
        var $panel = $('#' + id).show();
        $('#' + id).parent().show().siblings().hide();
        var value = $(this).text();
        $panel.empty();
        $panel.prev().text(value);
        $.ajax({
            url: urls + '&cache=' + new Date(),
            cache: false,
            beforeSend: function () {
                $panel.html('<p class="mb-loading" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">加载中...</p>');
            },
            success: function (html) {
                $panel.html(html);
                var currentpage = $panel.find('.hidden-currentpage').val();
                var totalCount = $panel.find('.hidden-totalCount').val();
                if (currentpage == totalCount) {
                    $panel.append('<p class="lastPage" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">- -  END  - -</p>');
                    $('.lastPage:gt(0)').remove();
                    var height = $(window).height();
                    var bodyHeight = $('html').height();
                    var footHeight = $('.mb-footer').outerHeight();
                    if ((height - bodyHeight) > footHeight) {
                        $('.mb-footer').css('bottom', '0');
                    } else {
                        $('.mb-footer').css('bottom', '');
                    }
                    return false;
                }

            },
            error: function (jqXhr) {
                if (window.console) {
                    console.log(jqXhr.responseText + "," + jqXhr.responseXML + "," + jqXhr.readyState + "," + jqXhr.status);
                    console.log("获取出错。");
                }
            }
        });
    });

    //自动加载
    function autoBrowse(parentId) {
        var parentIdLable = "#" + parentId;
        if ($(parentIdLable).length == 0) {
            return false;
        }
        var isdisplay = $(parentIdLable).css('display');
        if (isdisplay == "none") {
            return false;
        }
        var url = $(parentIdLable).find('.hidden-url').data('url');
        if (url == "undefined") {
            return false;
        }

        if (!url) { return false; }
        var currentpage = $(parentIdLable).find('.hidden-currentpage').val();
        var totalCount = $(parentIdLable).find('.hidden-totalCount').val();
        currentpage = currentpage * 1 + 1;
        if (currentpage > totalCount) {
            $(parentIdLable).append('<p class="lastPage" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">- -  END  - -</p>');
            $(parentIdLable + ' .lastPage:gt(0)').remove();
            return false;
        } else {
            url = url + currentpage;
            if (currentpage <= totalCount) {
                $.ajax({
                    type: "GET",
                    url: url,
                    beforeSend: function () {
                        $(parentIdLable).append('<p class="mb-loading" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">加载中...</p>');
                        $(parentIdLable+' .mb-loading:gt(0)').remove();
                    },
                    success: function (html) {
                        $(parentIdLable+' .mb-loading').remove();
                        $(parentIdLable).find('.hidden-currentpage').val(currentpage);
                        var allhtml = $(parentIdLable).html() + html;
                        $(parentIdLable).html(allhtml);
                        if (currentpage == totalCount) {
                            $(parentIdLable).append('<p class="lastPage" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">- -  END  - -</p>');
                            $(parentIdLable+' .lastPage:gt(0)').remove();
                            return false;
                        }
                    }
                });
            }
        }
    }


    $(window).scroll(function () {
        if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
            autoBrowse("loadPaper");
            autoBrowse("loadVideo");
            autoBrowse("searchreaultList");
            autoBrowse("clinicalpaperList");
            autoBrowse("subjectVideoList");
            autoBrowse("resourceDetailList");
            replaceABatch("mb-sb-doc");
        }
    });
})();
$(function () {
    var homeJs = {
        //pc端排序的切换
        pcOrder: function () {
            if (!$('div').is('.sort-term')) return;
            $(".lt .sort-term a").click(function () {
                $(this).addClass("active").parents('li').siblings().find('a').removeClass("active");
            });
        },
        //pc端placeholder的兼容
        pcPlaceHolder: function () {
            $.each($(':input[placeholder]'), function () {
                $(this).watermark($(this).attr('placeholder'));
            });
        },
        //pc端文章中的tabel样式及其他
        pcTable: function () {
            $('.MsoNormalTable,table').css({ 'marginLeft': '0', 'margin': '0 auto' });
            $('.content-wrapper .lt .lt-header .header-list .list .list-label').each(function () {
                var html = $(this).find('.list-text span').html();
                if (/<sup>.*?<\/sup>/.test(html)) {
                    $(this).find('.list-text span').css('lineHeight', '6px');
                }
            });
        },
        //学科页
        subjectEvent: {
            //pc心血管内科下拉列表
            sbNav: function () {
                $('.top-nav').on('click', '.lt .lt-nav .nav1', function () {
                    $('.cardiovascular-list').stop(true, true).toggle();
                });
            },
            //pc选择框的显示
            sbSelect: function () {
                $('.select-box').hover(function () {
                    $('.drop-list').stop(true, true).toggle();
                });
                $('.drop-list').on('click', 'a', function (e) {
                    var $text = $(this).text();
                    $('.select-box').find('span').text($text);
                    $(this).addClass('active').parent().siblings().find('a').removeClass('active');
                    var url = $(this).data('url');
                    var sort = $(this).data('itemvalue');
                    var language = $(this).parents('.select-box').siblings('.active').find('span').data('itemvalue');
                    $.ajax({
                        url: url,
                        type: 'POST',
                        data: { 'Language': language, 'Sort': sort },
                        beforeSend: function () {
                            $('#sub-doc').html('<p class="mb-loading" style="font-size:12px;color:#aaa;text-align:center;width:100%;padding-top:25px;">加载中...</p>');
                        },
                        success: function (data) {
                            $('#sub-doc').html(data);
                        }
                    });
                });
            },
            //pc字母浮动
            sbFloat: function () {
                if (!$('div').is('.nav-disease-main')) return;
                $('.sub-main .lt .lt-second .se-box').each(function () {
                    var me = $(this);
                    var objOffset = me.find('.nav-disease-main').offset();
                    if (!objOffset) {
                        return;
                    } else {
                        navMain = objOffset.top;
                        $(window).scroll(function () {
                            var s = $(window).scrollTop();//滚动的距离
                            me.find('.letter-nav').css({ 'top': (navMain - s) + 'px' });
                            var screenHeight = $(window).height();//屏幕的高度
                            var letterHeight = $('.letter-nav').height();//字母的高度
                            var tops = Math.floor((screenHeight - letterHeight) / 2);//屏幕的高度-字母的高度  的一半
                            var documentHeight = $(document).height();//文档的高度
                            var bottomS = documentHeight - screenHeight;//文档与屏幕高度之差
                            //判断是否是ie7的版本号
                            var browser = navigator.appName
                            var b_version = navigator.appVersion
                            var version = b_version.split(";");
                            var trim_Version = version[1].replace(/[ ]/g, "");

                            if (tops <= 96) {
                                if (s >= 334) {//滚动的高度是否大于334
                                    if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
                                        me.find('.letter-nav').css({ 'top': '90px' });
                                    } else {
                                        me.find('.letter-nav').css({ 'top': '50px' });
                                    }
                                } else {
                                    if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
                                        me.find('.letter-nav').css({ 'top': (navMain - s + 62) + 'px' });
                                    } else {
                                        me.find('.letter-nav').css({ 'top': (navMain - s) + 'px' });
                                    }
                                }
                                if (s >= bottomS) {//滑倒底部的时候
                                    me.find('.letter-nav').stop(true, true).animate({ 'top': -(96 - 2 * tops) + 'px' }, 500);
                                }
                            } else {
                                if (s >= 334) {
                                    me.find('.letter-nav').css({ 'top': tops + 'px' });
                                } else {
                                    if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
                                        me.find('.letter-nav').css({ 'top': (navMain - s + 62) + 'px' });
                                    } else {
                                        me.find('.letter-nav').css({ 'top': (navMain - s) + 'px' });
                                    }
                                }
                                if (s >= bottomS) {
                                    me.find('.letter-nav').stop(true, true).animate({ 'top': tops + 'px' }, 500);
                                }
                            }
                        });
                    }
                });
                //锚点控制
                $('.sub-main .lt .lt-second .se-nav').find('a').each(function (index) {
                    $('.sub-main .lt .lt-second .se-box').eq(index).find('.nav-disease-main .letter-nav ul li').click(function () {
                        var hrefValue = $(this).find("a").prop('class');
                        if (hrefValue == '#') {
                            $('body,html').animate({
                                scrollTop: 0
                            }, 500);
                        } else {
                            var topValue = $(this).parents('.letter-nav').siblings('.nav-disease').find('#' + hrefValue + '').offset().top - 40;
                            $('body,html').animate({
                                scrollTop: topValue + 'px'
                            }, 500);
                        }
                    });
                });
            },
            //pc头部nav切换
            sbNavChange: function () {
                $('.top-nav .lt-nav>li.nav1').mouseover(function () {
                    if (!$(this).prop('class') == 'nav1 active') {
                        $(this).find('.subjects').removeClass('listdown').addClass('listdown-gray');
                    } else {
                        $(this).find('.subjects').removeClass('listdown-gray').addClass('listdown');
                    }
                }).mouseleave(function () {
                    if ($(this).prop('class') === 'nav1 active') {
                        return;
                    } else {
                        $(this).find('.subjects').removeClass('listdown').addClass('listdown-gray');
                    }
                });
            },
        },
        //资源页
        resourceEvent: {
            //科室分类
            departments: function () {
                var resLeftList = (function () {
                    var me = $('.res-bottom .res-bottom-left .res-left-list');
                    var length = me.length;
                    var everyHeight = me.find('.list-all').height();
                    var firstHeight = me.height();
                    return {
                        //箭头的上下移动
                        triMove: function (obj, index) {
                            $(obj).siblings('i.to-right').css({ 'top': 13 + index * 33 + 'px' });
                        },
                        //点击一级菜单
                        firstLevel: function (obj) {
                            $(obj).parent().siblings('.res-left-list').find('.symbol').text('+');
                            $(obj).parent().toggleClass('active').siblings('.res-left-list').removeClass('active');
                            if ($(obj).next().text() !== '') {
                                if ($(obj).next().css('display') == 'none') {
                                    $(obj).find('.symbol').text('+');
                                } else {
                                    $(obj).find('.symbol').text('-');
                                }
                            } else {
                                if ($(obj).find('.symbol').text() == '+') {
                                    $(obj).find('.symbol').text('-');
                                } else {
                                    $(obj).find('.symbol').text('+');
                                }
                            }
                            $('body,html').animate({ scrollTop: 0 }, 500);
                        },
                        //处理高度问题
                        heightEvent: function (obj) {
                            var leftH = $(obj).parents('.res-bottom-left').height() + 20;
                            if (leftH > 700) {
                                $(obj).parents('.res-bottom-left').siblings('.res-bottom-right').css('height', leftH);
                                $(obj).parents('.res-bottom-left').siblings('.res-bottom-right').find('.lists-main').css('height', leftH - 50);
                            } else {
                                $(obj).parents('.res-bottom-left').siblings('.res-bottom-right').css('height', 700);
                                $(obj).parents('.res-bottom-left').siblings('.res-bottom-right').find('.lists-main').css('height', 642);
                            }
                        },
                        //判断个数显示
                        show: function (obj) {
                            if (length > 13) {
                                $('.more').css('display', 'block');
                                $(obj).parent().find('.res-left-list:gt(12)').css('display', 'none');
                            }
                        },
                        //收起
                        hide: function (obj) {
                            $(obj).parent().find('.res-left-list:gt(12)').css('display', 'block');
                        }
                    };
                })();
                resLeftList.show('.res-left-list');//初始化
                resLeftList.heightEvent('.res-left-list');
                $('.res-bottom').find('.res-bottom-left .res-left-list').each(function (i) {
                    if ($(this).prop('class') == 'res-left-list active') {
                        resLeftList.firstLevel(this);//初始化
                        resLeftList.heightEvent('.res-left-list');
                    }
                    $(this).find('.lists a').each(function (i) {
                        $(this).click(function () {
                            resLeftList.triMove(this, i);
                            $('body,html').animate({ scrollTop: 0 }, 500);
                        });
                    });
                    $(this).find('.list-all').click(function () {
                        resLeftList.firstLevel(this);
                        resLeftList.heightEvent('.res-left-list');
                        $(this).next().find('.to-right').css('top', '13px');
                    });
                });
                //展开
                $('.res-bottom .res-bottom-left .more').on('click', function () {
                    resLeftList.hide(this);
                    $('.hide').css('display', 'block');
                    $(this).css('display', 'none');
                    resLeftList.heightEvent('.res-left-list');
                });
                //收起
                $('.res-bottom .res-bottom-left .hide').click(function () {
                    resLeftList.show('.res-left-list');
                    $('.more').css('display', 'block');
                    $(this).css('display', 'none');
                    $(this).parent().siblings('.res-bottom-right').css('height', '');
                    resLeftList.heightEvent('.res-left-list');
                });
            },
            //icd弹窗
            icdPop: function () {
                //滚动条设置
                $('.publish-right').niceScroll({
                    cursorcolor: "#008b67",//滚动条的颜色
                    cursoropacitymax: 1, //滚动条的透明度，从0-1
                    touchbehavior: false, //使光标拖动滚动像在台式电脑触摸设备
                    cursorwidth: "5px", //滚动条的宽度
                    cursorborder: "0", // 游标边框css定义
                    cursorborderradius: "5px",//以像素为光标边界半径  圆角
                    autohidemode: 'auto', //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
                    zindex: "auto",//给滚动条设置z-index值
                    cursorfixedheight: 29,
                    background: '#ccc',
                    horizrailenabled: false,
                    railpadding: { top: 0, right: 0, left: 0, bottom: 0 }//滚动条的位置
                });
            }
        },
    };
    homeJs.pcOrder();
    homeJs.pcPlaceHolder();
    homeJs.pcTable();
    homeJs.subjectEvent.sbNav();
    homeJs.subjectEvent.sbSelect();
    homeJs.subjectEvent.sbFloat();
    homeJs.subjectEvent.sbNavChange();
    homeJs.resourceEvent.departments();
    homeJs.resourceEvent.icdPop();
})