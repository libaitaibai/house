var bannerSwiper = new Swiper('.banner_swiper', {
    speed: 400,
    loop: true,
    navigation: {
        prevEl: '.banner-button_prev',
        nextEl: '.banner-button_next',
    },
    autoplay: {
        delay: 3000,
    },
    on: {
        slideChangeTransitionEnd: function () {
            var index = this.activeIndex;
            if (index > $('.banner_swiper .navigation-item').length) index = 1;
            $('.banner_swiper .navigation-item').removeClass('active');
            $('.banner_swiper .navigation-item').eq(index - 1).addClass('active');
        }
    }
});

// 文字按钮
$('.banner_swiper .navigation-item').click(function () {
    var index = $(this).index();
    bannerSwiper.slideTo(index + 1);
});

var mySwiper = new Swiper('.remark-swiper', {
    speed: 400,
    navigation: {
        prevEl: '.remark-button_prev',
        nextEl: '.remark-button_next',
    },
    spaceBetween: 30,
    slidesPerView: 'auto',
    pagination: {
        el: '.remark-swiper-pagination',
        clickable: true,
    },
});

// 初始化swiper
var picBanner = new Swiper('#pic-banner', {
    direction: 'horizontal',
    loop: false,
    autoplay: false,
    navigation: {
        prevEl: '#pic-banner .swiper-button-prev',
        nextEl: '#pic-banner .swiper-button-next',
    },
    lazy: {
        loadPrevNext: true,
    },
    on: {
        slideChangeTransitionEnd: function () {
            picThumbnail.slideTo(picBanner.activeIndex);
            $('#pic-thumbnail .swiper-slide').eq(picBanner.activeIndex).addClass('active').siblings().removeClass('active');
        }
    }
});
var picThumbnail = new Swiper('#pic-thumbnail', {
    direction: 'horizontal',
    loop: false,
    autoplay: false,
    slidesPerView: 'auto',
    spaceBetween: 8
});
$('#pic-thumbnail .swiper-button-next').click(function () {
    var index = picBanner.activeIndex + 1;
    swiper_index(index);
});
$('#pic-thumbnail .swiper-button-prev').click(function () {
    var index = picBanner.activeIndex - 1;
    if (index >= 0) {
        swiper_index(index);
    }
});
$(".swiper-thumbnail").click(function () {
    picBanner.slideTo($(this).attr('data'), 0);
    picThumbnail.slideTo($(this).attr('data'), 0);
});
function swiper_index(index)
{
    picBanner.slideTo(index);
    $('#pic-banner .swiper-slide').eq(index).addClass('active').siblings().removeClass('active');
    picThumbnail.slideTo(index);
    $('#pic-thumbnail .swiper-slide').eq(index).addClass('active').siblings().removeClass('active');
}

new Swiper('.news-swiper .swiper-container', {
    autoHeight: true,
    loop: true,
    autoplay: {
        delay: 3000,
    },
    pagination: {
        el: '.swiper-pagination',
    },
});

$("#sbtn").click(function () {
    $(this).parents("form").submit();
});