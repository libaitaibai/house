var app = getApp();

Page({
    data: {
        autoplay: !0,
        interval: 3e3,
        duration: 1e3,
        page: 1,
        loadMore: "",
        pid: 1,
        article:[],
        banners:[],
        category:[],
        dialog_show:true
    },
    onLoad: function(a) {
        wx.setNavigationBarTitle({
            title: "房产资讯-" + wx.getStorageSync("companyinfo").name
        });
       this.getnewslist()
    },
    getnewslist: function() {
        var t = this;
        app.util.request({
            url: "entry/wxapp/getarticle",
            data: {
                pid:this.data.pid,
                page: t.data.page
            },
            success: function(a) {

                (a.data.message.errno || (a.data.data.intro.maincolor || (a.data.data.intro.maincolor = "#3274e5")));

                wx.setNavigationBarColor({
                    frontColor: "#ffffff",
                    backgroundColor:a.data.data.intro.maincolor,
                    animation: {
                        duration: 400,
                        timingFunc: "easeIn"
                    }
                });
                    const tmp = {
                        article: {...t.data.article,...a.data.data.article},

                    };
                   (!a.data.data.banners || (tmp.banners = a.data.data.banners));
                   (!a.data.data.category || (tmp.category = a.data.data.category));
                    t.setData(tmp);


            },
            complete: function() {
                t.setData({
                    loadMore: ""
                }), wx.hideNavigationBarLoading(), wx.stopPullDownRefresh();
            }
        });
    },
    // getsecondlist: function() {
    //     var t = this;
    //     app.util.request({
    //         url: "entry/wxapp/getsecondlist",
    //         data: {
    //             pid: t.data.pid,
    //             page: t.data.page
    //         },
    //         success: function(a) {
    //             console.log(a.data.message.errno)
    //             a.data.message.errno || t.setData({
    //                 article: {...t.data.article,...a.data.data.article},
    //                 activeCategoryId: a.data.data.activeCategoryId
    //             });
    //
    //         },
    //         complete: function() {
    //             t.setData({
    //                 loadMore: ""
    //             }), wx.hideNavigationBarLoading(), wx.stopPullDownRefresh();
    //         }
    //     });
    // },
    tabClick: function(a) {
        var t = this, e = a.currentTarget.id;
        t.setData({
            banners:[]
        });
        t.data.pid = e, t.data.page = 1, app.util.request({
            url: "entry/wxapp/getarticle",
            data: {
                pid: e,
                page: t.data.page
            },
            success: function(a) {
                const tmp = { article: a.data.data.article};
                (!a.data.data.category || (tmp.category = a.data.data.category));
                (!a.data.data.banners || (tmp.banners = a.data.data.banners));
                tmp.pid = e;
                a.data.message.errno || t.setData(tmp);


            }
        });
    },
    toNewsDetail: function(a) {
        var t = a.currentTarget.dataset.id;
        wx.navigateTo({
            url: "/weixinmao_house/pages/newsdetail/index?id=" + t
        });
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {
        wx.hideNavigationBarLoading(), wx.stopPullDownRefresh();
    },
    onReachBottom: function() {
        this.setData({
            loadMore: "正在加载中..."
        }), this.data.page = this.data.page + 1, this.getnewslist()
    },
    onShareAppMessage: function() {
        return {
            title: "房产资讯-" + wx.getStorageSync("companyinfo").name,
            path: "/weixinmao_house/pages/article/index"
        };
    }
 
     

});