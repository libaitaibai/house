!
    function(e, t) {
        t.fn.extend({
            simpleSlider: function(e) {
                function o(e, t) {
                    var o, n;
                    "left" == l.style ? (n = "lr", o = t ? s : i) : "top" == l.style && (n = "bt", o = t ? r : a), t && (e < h ? e = l.items * Math.floor(e / l.items) - 1 : e > h && (console.log(e, "downc"), e = l.items * Math.ceil(e / l.items), e = Math.min(e, p.length - l.items), console.log(e, "downc"))), e = Math.max(e, 0), e = Math.min(e, p.length - 1);
                    var u, f = p.eq(e);
                    tools.getRelPos(f, c), tools.getRelPos(f, d);
                    tools.tabActive(p.eq(e)), console.log(t), t ? (console.log(3, "s"), d.css({
                        transform: function() {
                            console.log(e);
                            var t, i = -o[e];
                            return console.log(i), "lr" == n ? t = "translate3D(" + i + "px, 0px, 0px)" : "bt" == n && (t = "translate3D(0px, " + i + "px, 0px)"), t
                        }
                    })) : p[e - 1] && tools.getRelPos(c, p.eq(e - 1))[l.style] < 0 ? (u = tools.getRelPos(p.eq(e - 1), d), console.log(u, e, "up"), d.css({
                        transform: function() {
                            return "translate3D(" + u.left + "px, " + u.top + "px, 0px)"
                        }
                    })) : p.eq(e + 1)[0] && tools.getRelPos(c, p.eq(e + 1))[l.style] >= c.outerWidth() && (console.log(2), d.css({
                        transform: function() {
                            var t, i = -o[e + 1];
                            return "lr" == n ? t = "translate3D(" + i + "px, 0px, 0px)" : "tb" == n && (t = "translate3D(0px, " + i + "px, 0px)"), t
                        }
                    })), h = e, c.trigger("change-simpleSlider", [{
                        item: h
                    }])
                }
                var n = 0,
                    i = [],
                    s = [],
                    a = [],
                    r = [],
                    l = {
                        style: "top",
                        items: 3,
                        dir: !0,
                        margin: 0,
                        speed: 800
                    },
                    d = t(this),
                    c = d.parent(),
                    p = (parseInt(c.css("padding-left")).toFixed(2), parseInt(c.css("padding-right")).toFixed(2), parseInt(c.css("padding-top")).toFixed(2), parseInt(c.css("padding-bottom")).toFixed(2), d.children()),
                    h = 0;
                if (p.eq(0).addClass("active"), p.wrapAll('<div class="simple-slider-outer"><div class="simple-slider-stage"></div></div>'), d = t(this).find(".simple-slider-stage"), c = d.parent(), t.extend(l, e, !0), l.dir && t('\n                <div class="owl-nav">\n                    <div class="owl-prev">\n                        <i class="icon iconfont icon-back"></i>\n                    </div>\n                    <div class="owl-next">\n                        <i class="iconfont icon-more"></i>\n                    </div>\n                </div>').insertAfter(c), l.items = l.items ? l.items : Math.round(c.width() / p.eq(0).width()), c.css({
                    overflow: "hidden"
                }), d.css({
                    transition: l.speed / 1e3 + "s"
                }), "left" == l.style) l.margin = l.margin ? l.margin : -parseInt(t(this).css("margin-right")), p.each(function(e, o) {
                    t(o).css({
                        width: function() {
                            return n += ((c.width() + l.margin) / l.items).toFixed(3) - l.margin + l.margin, ((c.width() + l.margin) / l.items).toFixed(3) - l.margin
                        }
                    }), i.push(Math.max(n - c.width())), s.push(n)
                }), s.unshift(0), '', '', d.css({
                    width: n
                }), p.css({
                    float: "left",
                    "margin-right": l.margin
                });
                else {
                    l.margin = l.margin ? l.margin : parseInt(t(this).css("margin-bottom")), p.each(function(e, o) {
                        t(o).css({
                            width: function() {
                                return t(this).outerWidth()
                            },
                            height: function() {
                                return t(this).outerHeight()
                            }
                        })
                    });
                    p.eq(0).height();
                    p.css({
                        float: "none",
                        "margin-bottom": l.margin
                    }), d.css({
                        height: "auto"
                    }), c.css({
                        height: function() {
                            return (p.eq(0).outerHeight() + l.margin) * l.items - l.margin
                        }
                    }), p.each(function(e, t) {
                        console.log(p.length, l.items), r.push((p.eq(0).outerHeight() + l.margin) * Math.min(p.length - l.items, e))
                    }), console.log(r)
                }
                return p.on("click", function() {
                    o(t(this).index())
                }), t(this).find(".owl-prev").click(function(e) {
                    console.log(h), o(h - 1, !0)
                }), t(this).find(".owl-next").click(function(e) {
                    console.log(h), o(h + 1, !0)
                }), {
                    el: c,
                    now: function() {
                        return h
                    },
                    to: function(e) {
                        o(e)
                    },
                    next: function() {
                        this.to(h + 1)
                    },
                    prev: function() {
                        this.to(h - 1)
                    }
                }
            }
        })
    }(window, jQuery);
var newStyleContent = {
        sliderDotThemb: "\n        #topSlider .content_list .owl-prev:hover #sliderDotThemb,\n        #topSlider .content_list .owl-prev:hover #sliderDirThemb {\n            visibility: visible;\n            opacity: 1\n        }\n        #sliderDirThemb,\n        #sliderDotThemb {\n            width: 100px;\n            height: 50px;\n            position: absolute;\n            border: 3px solid #fff;\n            visibility: hidden;\n            opacity: 0;\n            box-sizing: border-box;\n            transition: visibility 0.36s ease, opacity 0.36s ease;\n        } \n        \n        #sliderDirThemb.dot,\n        #sliderDotThemb.dot {\n            top: auto !important;\n            bottom: 40px;\n            transition: all 0.36s ease;\n            transform: translateX(-50%);\n        }\n        #sliderDirThemb.dir,\n        #sliderDotThemb.dir {\n            bottom: auto !important;\n        }\n        #sliderDirThemb .owl-item .thumb-item,\n        #sliderDotThemb .owl-item .thumb-item {\n            width: 100px;\n            height: 44px;\n            background-position: center center;\n            background-size: cover;\n        }\n        #sliderDirThemb .owl-dots,\n        #sliderDotThemb .owl-dots {\n        }\n        #sliderDirThemb .owl-stage-outer,\n        #sliderDotThemb .owl-stage-outer {\n        }\n        #sliderDirThemb.showStage,\n        #sliderDotThemb.showStage {\n            visibility: visible;\n            opacity: 1\n        }\n    ",
        npostSlider: "\n        #postSlider .tab_button .content_list {\n            width: 240px;\n        }\n    ",
        timeTurnEn: "\n        .date_wrap {\n            opacity: 0 !important;\n        }\n        .date_wrap.showTime {\n\n            opacity: 1 !important;\n        }\n    ",
        parallax: "\n        .module {\n            position: relative;\n            z-index: 1\n        }\n    "
    },
    tools = {
        getRelPos: function(e, t) {
            console.log(e);
            var o = $(e).offset(),
                n = $(t).offset();
            return {
                left: Math.round(n.left - o.left),
                top: Math.round(n.top - o.top)
            }
        },
        hideEl: function(e, t) {
            $(window).scroll(function(o) {
                var n = $(window).scrollTop();
                t < n ? $(e).removeClass("outPos").addClass("inPos") : $(e).removeClass("inPos").addClass("outPos")
            })
        },
        tabActive: function(e, t) {
            t = t || "active", e.siblings().removeClass(t), e.addClass(t)
        }
    },
    job = {
        initThings: function() {
            $(".item_block").off(), $("#topSlider .progress").remove()
        },
        headerHover: function() {
            function e(e) {
                return $(e).width()
            }
            function t(e) {
                return $(e).position()
            }
            var o, n, i = $("#navWrapper .nav"),
                s = $("#navWrapper .nav>.navitem", "#header"),
                a = $("#navWrapper .nav>.navitem>.active", "#header").closest(".navitem");
            o = $('<li class="jsMoveEl"><span></span></li>').appendTo("#navWrapper .nav"), n = o.find("span"), i.css("position", "relative"), o.css({
                position: "absolute",
                left: t(a).left,
                bottom: "0",
                width: e(a),
                height: "2px",
                "z-index": -1
            }), n.css({
                position: "absolute",
                left: "0",
                right: 0,
                top: "0",
                margin: "auto",
                width: "100%",
                height: "2px",
                "z-index": -1
            }), s.on("mouseenter", function() {
                var i = this,
                    s = $(this).find(".subnav:not(:animated)");
                s[0] ? (s.slideDown(200), o.stop().animate({
                    width: e(i),
                    left: t(i).left,
                    opacity: 0
                })) : o.stop().animate({
                    width: e(i),
                    left: t(i).left,
                    opacity: 1
                }), n.stop().animate({
                    width: "100%",
                    opacity: "1"
                })
            }), s.on("mouseleave", function() {
                var e = $(this).find(".subnav");
                e.length && e.slideUp()
            }), i.on("mouseleave", function() {
                o.stop().animate({
                    width: e(a),
                    left: t(a).left
                })
            })
        },
        parallax: function(e) {
            var t = $(e).offset().top,
                o = $(e).data("slider-height");
            "0" == o ? $("#indexPage #topSlider").height($(window).height()) : $("#indexPage #topSlider").height(o), $(window).on("scroll", function() {
                $(e).css({
                    position: "fixed",
                    "z-index": -1
                }), $(e).css("top", function() {
                    return t - 1 * $(document).scrollTop() / ($(e).height() / 140).toFixed(2)
                })
            })
        },
        parallaxPage: function(e) {
            if (0 !== $el.length) {
                var t = $(e).offset().top;
                $(e).parent().height(function() {
                    return $(e).height()
                }), $(e).css({
                    width: "100%",
                    height: function() {
                        return $(e).height()
                    }
                }), $(window).scroll(function() {
                    $(e).css({
                        position: "fixed",
                        "z-index": -1
                    }), $(e).css("top", function() {
                        return t - 1 * $(document).scrollTop() / 2
                    })
                })
            }
        },
        sliderDotThemb: function() {
            var e, t = [],
                o = $("#topSlider .content_list .owl-item:not(.cloned) .item_block .item_bg"),
                n = '<div id="sliderDotThemb" class="topSliderThumb owl-carousel owl-theme">';
            this.topSliderApp;
            o.each(function(e, o) {
                n += '<div class="thumb-item" style="background-image:url(' + $(o).data("thumb").replace("_80x80.jpg", ".jpg") + ')"></div>', t.push($(o).data("thumb"))
            }), n += "</div>", e = $(n).appendTo($("#topSlider")).owlCarousel({
                center: !1,
                items: 1,
                loop: !0,
                margin: 10,
                autoWidth: !1,
                nav: !1,
                responsive: !1,
                dots: !1
            }), $("#topSlider .content_list").find(".owl-dot").on({
                mouseenter: function() {
                    var t = this,
                        o = tools.getRelPos("#topSlider", t);
                    $("#sliderDotThemb").css({
                        left: function() {
                            return o.left + $(t).width() / 2
                        }
                    }), $("#sliderDotThemb").removeClass("dir prev-dir next-dir"), setTimeout(function() {
                        $("#sliderDotThemb").addClass("showStage dot")
                    }), e.trigger("to.owl.carousel", $(this).index())
                }
            }), $("#topSlider .owl-dots").on({
                mouseleave: function() {
                    $("#sliderDotThemb").removeClass("showStage")
                },
                mouseenter: function() {}
            })
        },
        sliderDirThemb: function(e) {
            var t, o = [],
                n = $("#topSlider .content_list .owl-item:not(.cloned) .item_block .item_bg"),
                i = '<div id="sliderDirThemb" class="topSliderThumb owl-carousel owl-theme">',
                s = this.topSliderApp;
            n.each(function(e, t) {
                i += '<div class="thumb-item" style="background-image:url(' + $(t).data("thumb").replace("_80x80.jpg", ".jpg") + ')"></div>', o.push($(t).data("thumb"))
            }), i += "</div>", t = $(i).appendTo($("#topSlider")).owlCarousel({
                center: !1,
                items: 1,
                loop: !0,
                margin: 10,
                autoWidth: !1,
                nav: !1,
                responsive: !1,
                dots: !1
            }), $("#topSlider .content_list ").find(".owl-prev").add($("#topSlider .content_list ").find(".owl-next")).on({
                mouseenter: function() {
                    var o = this,
                        n = $("#topSlider .content_list .owl-dots .owl-dot.active").index();
                    $(o).hasClass("owl-prev") ? n -= 1 : $(o).hasClass("owl-next") && (n += 1), t.trigger("to.owl.carousel", [n]), s.on("changed.owl.carousel", function(e) {
                        var n = e.item.index;
                        $(o).hasClass("owl-prev") || $(o).hasClass("owl-next") && (n -= 1), t.trigger("to.owl.carousel", [n])
                    }), $("#sliderDirThemb").removeClass("dot").addClass(function() {
                        return $(o).hasClass(".owl-prev") ? "prev-dir dir showStage" : "next-dir dir showStage"
                    }).css({
                        left: function() {
                            return "top" == e ? tools.getRelPos("#topSlider", o).left + ($(o).outerWidth() - $(this).outerWidth()) / 2 : "LR" == e ? $(o).offset().left + $("#sliderDirThemb").outerWidth() + $(o).outerWidth() >= $(window).width() ? tools.getRelPos("#topSlider", o).left - $("#sliderDirThemb").outerWidth() : tools.getRelPos("#topSlider", o).left + $(o).outerWidth() : void 0
                        },
                        top: function() {
                            return "LR" == e ? tools.getRelPos("#topSlider", o).top + ($(o).outerHeight() - $(this).outerHeight()) / 2 : "top" == e ? tools.getRelPos("#topSlider", o).top - $(this).outerHeight() : void 0
                        }
                    }), "top" === e && $("#sliderDirThemb").css({
                        transition: "left 0.36s ease"
                    })
                },
                mouseleave: function() {
                    $("#sliderDirThemb").removeClass("showStage")
                }
            })
        },
        sliderTitle: function() {
            var e, t = $("#topSlider .content_list .owl-item:not(.cloned) .item_block .title"),
                o = '<div id="sliderTitle" class="sliderTitle owl-carousel owl-theme">',
                n = this.topSliderApp;
            t.each(function(e, t) {
                o += "<p>" + $(t).text() + "</p>"
            }), o += "</div>", e = $(o).appendTo($("#topSlider")).owlCarousel({
                center: !1,
                loop: !0,
                autoWidth: !1,
                nav: !1,
                responsive: !1,
                animateOut: "slideOutDown",
                animateIn: "flipInX",
                items: 1,
                margin: 30,
                stagePadding: 30,
                dots: !1,
                smartSpeed: 450
            }), n.on("changed.owl.carousel", function(t) {
                var o = t.item.index;
                e.trigger("to.owl.carousel", [o])
            })
        },
        npostSlider: function() {
            var e = $("#postSlider .tab_content").addClass("owl-carousel owl-theme").owlCarousel({
                    center: !1,
                    items: 1,
                    loop: !1,
                    autoWidth: !1,
                    responsive: !1,
                    nav: !0,
                    dots: !1,
                    smartSpeed: 800,
                    navText: ['<i class="icon iconfont icon-back"></i>', '<i class="iconfont icon-more"></i>']
                }),
                t = $("#postSlider .tab_button").addClass("owl-carousel owl-theme").owlCarousel({
                    center: !1,
                    items: 3,
                    loop: !1,
                    autoWidth: !1,
                    responsive: !1,
                    nav: !1,
                    dots: !1,
                    margin: 10
                });
            $("#postSlider .tab_button").find('.item_block[data-tab-index="0"]').addClass("current"), e.on("changed.owl.carousel", function(e) {
                var o = e.item.index,
                    n = $("#postSlider .tab_button").find(".item_block");
                t.trigger("to.owl.carousel", [o]), $("#postSlider .tab_button").find(".item_block").removeClass("current"), n.eq(o).addClass("current")
            }), $("#postSlider .tab_button").find(".owl-item").click(function() {
                var t = $(this).index();
                e.trigger("to.owl.carousel", [t])
            })
        },
        postTabHiden: function() {
            var e;
            $("#postSlider")[0] ? (e = $("#postSlider").offset().top + $("#postSlider").height(), tools.hideEl($(".ff_postPage .conTabBtn"), e)) : $(".ff_postPage .conTabBtn").addClass("inPos")
        },
        specialModule: function() {
            $(".team_tabs").find(".tab_content .content_list").addClass("owl-carousel owl-theme").owlCarouselPor({
                center: !1,
                items: 2,
                loop: !1,
                nav: !0,
                dots: !1,
                margin: 10,
                navText: ['<i class="icon iconfont icon-back"></i>', '<i class="iconfont icon-more"></i>']
            })
        },
        teamTabs: function() {
            var e = $(".ff_indexPage .team_tabs .tab_content .content_list").addClass("owl-carousel owl-theme").owlCarousel({
                    center: !1,
                    items: 1,
                    loop: !1,
                    autoWidth: !1,
                    responsive: !1,
                    nav: !0,
                    dots: !1,
                    smartSpeed: 800,
                    navText: ['<i class="icon iconfont icon-back"></i>', '<i class="iconfont icon-more"></i>']
                }),
                t = $(".ff_indexPage .team_tabs .tab_button .item_block"),
                o = $(".ff_indexPage .team_tabs .tab_button .content_list").simpleSlider({
                    dir: !1,
                    style: "left"
                });
            t.click(function() {
                var t = $(this).index();
                e.trigger("to.owl.carousel", [t])
            }), e.on("changed.owl.carousel", function(e) {
                var t = e.item.index;
                o.to(t)
            }), o.el.on("change-simpleSlider", function(e, t) {})
        },
        teamTabsTwo: function() {
            $(".ff_indexPage .team_tabs .tab_content .content_list").simpleSlider({
                style: "top"
            });
            setTimeout(function() {
                $(".ff_indexPage .team_tabs .tab_content .content_list .item_block:gt(3)").removeClass("wow").css({
                    visibility: "visible"
                })
            })
        },
        searchForm: function(e) {
            var t = $("#search-nav .searchOnOff"),
                o = {
                    searchShow: function() {
                        var o, n = this,
                            i = $("#headTop").outerWidth(!0);
                        t.click(function() {
                            $("#navWrapper .nav").addClass("navShow"), $("#search-nav").addClass("navShow"), $(".bodyMask").addClass("open"), $(".searchGroup input").off().click(function(e) {
                                return e.cancelBubble = !0, !1
                            }), $("body").off().on({
                                "mousewheel.stopScroll": function() {
                                    return !1
                                }
                            }), o = setInterval(function() {
                                console.log($("#navWrapper .nav").find(".navitem").eq(0).css("opacity")), $("#navWrapper .nav").find(".navitem").eq(0).css("opacity") <= .02 && ($("#navWrapper .nav").addClass("navStop"), "LR" == e.type && $("#search-nav").css({
                                    left: i
                                }), $("#search-nav").addClass("navStop").find("input").focus(), $("body").off().on({
                                    "click.hideSearch": function() {
                                        n.searchHide()
                                    }
                                }), clearInterval(o))
                            }, 100)
                        })
                    },
                    searchHide: function() {
                        $("#navWrapper .nav").addClass("navHide"), $("#search-nav").addClass("navHide"), $(".bodyMask").removeClass("open"), $("body").off("mousewheel.stopScroll"), $("body").off("click.hideSearch"), "LR" == e.type && $("#search-nav").css({
                            left: "auto"
                        }), timer = setInterval(function() {
                            $("#search-nav.navHide").css("opacity") >= .98 && ($("#navWrapper .nav").removeClass("navShow navStop navHide"), $("#search-nav").removeClass("navShow navStop navHide"), clearInterval(timer))
                        }, 100)
                    },
                    searchNormal: function() {
                        t.click(function() {
                            $("#search-nav").toggleClass("search-open")
                        })
                    }
                };
            switch (e.style) {
                case "one":
                    o.searchShow();
                    break;
                case "two":
                    o.searchNormal()
            }
        },
        timeTurnEn: function(e) {
            var t = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            $(e).addClass("showTime").find(".m").text(function() {
                return t[parseInt($(this).text())]
            })
        }
    },
    selfTools = {
        bindPage: function(e, t, o) {
            e.name;
            for (var n = 0; n < t.length; n++) {
                var i = e,
                    s = t[n];
                YY.Page[s].prototype.things.push([i, o])
            }
        },
        addStyle: function() {
            var e = '<style id="ff_add">';
            for (var t in newStyleContent) newStyleContent.hasOwnProperty(t) && ('', config[t].open && (e += newStyleContent[t]));
            e += "</style>", $(e).insertBefore($("link")[0])
        }
    },
    pageConfig = {
        list: ["indexMain", "baseMain", "postMain"]
    },
    config = {
        initThings: {
            open: !0,
            page: ["indexMain"],
            fn: job.initThings
        },
        headerHover: {
            open: !1,
            page: pageConfig.list,
            fn: job.headerHover
        },
        parallax: {
            open: !1,
            page: ["indexMain"],
            fn: job.parallax,
            parameter: ["#topSlider .content_list"]
        },
        parallaxPage: {
            open: !1,
            page: ["baseMain"],
            fn: job.parallaxPage,
            parameter: [".npagePage #banner div"]
        },
        sliderDotThemb: {
            open: !1,
            page: ["indexMain"],
            fn: job.sliderDotThemb
        },
        sliderDirThemb: {
            open: !1,
            page: ["indexMain"],
            fn: job.sliderDirThemb,
            parameter: ["LR"]
        },
        sliderTitle: {
            open: !1,
            page: ["indexMain"],
            fn: job.sliderTitle
        },
        npostSlider: {
            open: !0,
            page: ["postMain"],
            fn: job.npostSlider
        },
        postTabHiden: {
            open: !1,
            page: ["postMain"],
            fn: job.postTabHiden
        },
        specialModule: {
            open: !1,
            page: ["indexMain"],
            fn: job.specialModule
        },
        teamTabs: {
            open: !0,
            page: ["indexMain"],
            fn: job.teamTabs
        },
        teamTabsTwo: {
            open: !1,
            page: ["indexMain"],
            fn: job.teamTabsTwo
        },
        searchForm: {
            open: !0,
            page: pageConfig.list,
            fn: job.searchForm,
            parameter: [{
                style: "two",
                type: "LR"
            }]
        },
        timeTurnEn: {
            open: !1,
            page: pageConfig.list,
            fn: job.timeTurnEn,
            parameter: [".service .item_block .date_wrap"]
        }
    };
selfTools.addStyle(), function() {
    for (var e = 0; e < pageConfig.list.length; e++) {
        var t = pageConfig.list[e];
        YY.Page[t].prototype.things = [], YY.Page[t].prototype.interfaceFun = function() {
            for (var e = this, t = 0; t < this.things.length; t++) {
                var o = this.things[t][0],
                    n = this.things[t][1];
                o.apply(e, n)
            }
        }
    }
    for (var o in this.config) if (this.config.hasOwnProperty(o)) {
        var n = this.config[o];
        n.open && selfTools.bindPage(n.fn, n.page, n.parameter)
    }
}();
