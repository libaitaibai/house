var app = getApp();

Page({
    data: {

        isShow:0,
        noData:'暂无数据',
        developers:[]

    },
    onLoad: function() {

        wx.setNavigationBarTitle({
            title: "美国房屋管理公司"
        })
        app.util.request({

            url:'entry/wxapp/getmanagement',
            data:{},
            success:(e)=>{

                if(!e.data.data.errno){
                    (e.data.data.barTitle && wx.setNavigationBarTitle({
                        title: e.data.data.barTitle
                    }));

                    const tmp = {};
                    e.data.data.developers.length && (tmp.developers = e.data.data.developers);
                    e.data.data.developers.length || (tmp.isShow = 1);
                    e.data.data.noData && (tmp.noData = e.data.data.noData);

                    this.setData(tmp);

                }



            }


        });


    }
});