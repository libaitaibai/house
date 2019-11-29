//ajax数据
var _page = 2;
var _formData = {};


var indexBanner = new Swiper('#index-banner', {
    autoplay: {
        delay: 3000,
    },
    lazy: {
        loadPrevNext: true,
    },
    // 如果需要分页器
    pagination: {
        el: '.swiper-pagination',
    },
});

var indexTuijian = new Swiper('#swiper-tuijian', {
    allowTouchMove: false,
    direction: 'vertical',
    autoplay: {
        delay: 3000,
    },
});
var indexHouse = new Swiper('#index-house', {
    slidesPerView: 'auto',
    lazy: {
        loadPrevNext: true,
    },
});

$(".section-tab .tab-item").click(function () {
    $(this).addClass('on').siblings().removeClass('on');
    var _index = $(this).index();
    var _content = $(this).parent().siblings('.section-tab-content');
    _content.find('.list-inner').hide().eq(_index).show();
});

$(".quick-nav").click(function () {
    if ($(".page-nav").hasClass('visibility')) {
        $(".page-nav").removeClass('visibility');
        $(this).addClass('on');
        $('html,body').css('overflow', 'hidden');
    } else {
        $(".page-nav").addClass('visibility');
        $(this).removeClass('on');
        $('html,body').css('overflow', 'auto');
    }
});

var pageList = new Swiper('#page-list', {
    autoplay: {
        delay: 3000,
    },
});

//筛选
$(".filter").click(function () {
    if ($(this).hasClass('on')) {
        $(this).removeClass('on');
        $('html,body').css('overflow', 'auto');
        $(".filter-inner").hide();
    } else {
        $(this).addClass('on');
        $('html,body').css('overflow', 'hidden');
        $(".filter-inner").show();
    }
});
$(".filter-inner .radio a").click(function () {
    if ($(this).hasClass('on')) {
        $(this).removeClass('on');
    } else {
        $(this).addClass('on').siblings().removeClass('on');
    }
});
$(".clearFilter").click(function () {
    _formData = {};
    $(".filter-inner .radio a").each(function () {
        $(this).removeClass('on');
    });
});
$(".subFilter").click(function () {
    _formData = {};
    $(".filter-inner .radio a").each(function () {
        if ($(this).hasClass('on')) {
            _formData[$(this).parent().data('name')] = $(this).text();
        }
    });
    _page = 1;
    $('.dropload .ajax-box').html('');
    $(".filter").removeClass('on');
    $('html,body').css('overflow', 'auto');
    $(".filter-inner").hide();
    _dropload.unlock();
    _dropload.noData(false);
    _dropload.resetload();
});

//房源内容
new Swiper('.house-swiper', {
    autoHeight: true,
    lazy: {
        loadPrevNext: true,
    },
    pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
    },
});



var Pulluptoloadmore = ['上拉加载更多','Pull up to load more'];
var Loading = ['加载中','Loading'];
var noData = ['暂无数据','No Data'];
function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}
var lang = getQueryVariable('lang');
!lang && (lang = 'zh-cn');

//下拉加载
var _dropload = $('.dropload').dropload({
    domDown:{
        domClass : 'dropload-down',
        //滑动到底部显示内容
        domRefresh : '<div class="dropload-refresh">↑'+(lang=='zh-cn'?Pulluptoloadmore[0]:Pulluptoloadmore[1])+'</div>',
        //内容加载过程中显示内容
        domLoad :  '<div class="dropload-load"><span class="loading"></span>'+(lang=='zh-cn'?Loading[0]:Loading[1])+'...</div>',
        // 没有更多内容
        domNoData : '<div class="dropload-noData">'+(lang=='zh-cn'?noData[0]:noData[1])+'</div>'
    },
    scrollArea: window,
    loadDownFn: function (me) {
        var _url = $('.dropload').data('url');
        var url_link = window.location.search?( _url + "&page=" + _page):(_url+'?page='+_page);
        $.ajax({
            url:url_link,
            data: _formData,
            type: "GET",
            dataType: "json",
        }).done(function (_res) {
        
            _page++;
            if (_res.code == 1) {
                if (_res.data.html == "") {
                    me.lock();
                    me.noData();
                
                }else{
                    $('.ajax-box').append(_res.data.html);
                }
                me.resetload();
            }
        }).fail(function (xhr, status, errorThrown) {
            me.lock();
            me.noData();
            me.resetload();
            alert("Sorry, there was a problem!");
            console.log("Error: " + errorThrown);
            console.log("Status: " + status);
            console.dir(xhr);
        });
    }
});

$('#goToTop').click(function () {
    window.scrollTo(0,0);
});
$('#copyWechat').click(function () {
    $('.wechatInfo').show();
});
$('.wechatInfo .mask').click(function () {
    $('.wechatInfo').hide();
});

var copyWeixin = new ClipboardJS('.copyWeixin');
copyWeixin.on('success', function(e) {
    $('.wechatInfo').hide();
    alert('复制成功');
});