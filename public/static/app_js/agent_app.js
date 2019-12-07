var _back = ''; //上一页
var _dashboard = '/agent_admin/index/dashboard.html'; //仪表盘地址
var _xs = false;    //全局移动设备标识
//分页按钮配置
var _pageConfig = {
    pageSizes: [20, 50, 100],
    pageSize: 20,
    pagerCount: 7,
    layout: 'total, sizes, prev, pager, next, jumper'
};

var _error = {
    template: '<div class="exception">\n' +
        '        <div class="imgBlock">\n' +
        '            <div class="imgEle e404"></div>\n' +
        '        </div>\n' +
        '        <div class="content">\n' +
        '            <h1>404</h1>\n' +
        '            <div class="desc">抱歉，你访问的页面不存在</div>\n' +
        '            <div class="actions"><a href="#' + _dashboard + '"><button type="button" class="el-button el-button--primary"><span>返回首页</span></button></a></div>\n' +
        '        </div>\n' +
        '    </div>',
};
var vm = new Vue({
    el: '#app',
    data: {
        isCollapse: false,  //PC端菜单展<>缩控制
        isCollapseBody: true,   //移动端菜单展<>缩控制
        color: '#304156',   //菜单背景色
        hash: null,     //路由
        APP: {},    //远程组件
        screenWidth: window.screen.width,   //屏幕大小
        componentLoading: false,     //组件loading
    },
    methods: {
        menuTrigger: function () {
            if (window.screen.width < 768) {
                this.isCollapse = true;
                // this.isCollapse = false;
                if (this.isCollapseBody) {
                    this.isCollapseBody = false;
                } else {
                    this.isCollapseBody = true;
                }
                return;
            }

            this.isCollapse = !this.isCollapse;
        },
    },
    mounted: function () {
        var _this = this;
        if (window.location.hash == '') {
            _this.hash = _dashboard;
        } else {
            _this.hash = window.location.hash.substr(1);
        }

        // 添加请求拦截器
        axios.interceptors.request.use(function (config) {
            // 在发送请求之前做些什么
            _this.componentLoading = true;
            return config;
        }, function (error) {
            // 对请求错误做些什么
            return Promise.reject(error);
        });

        //添加ajax数据响应拦截器
        axios.interceptors.response.use(function (response) {
            // 对响应数据做点什么
            _this.componentLoading = false;

            var _data = response.data;
            if (_data.code == 0) {
                _this.$message.error({
                    showClose: true,
                    message: _data.msg,
                    onClose: function () {
                        if (_data.url) _this.hash = _data.url;
                    }
                });
            } else {
                if (_data.msg) {
                    _this.$message({
                        showClose: true,
                        message: _data.msg,
                        type: 'success',
                        onClose: function () {
                            if (_data.url) _this.hash = _data.url;
                        }
                    });
                } else {
                    if (_data.url) _this.hash = _data.url;
                }
            }
            return _data;
        }, function (error) {
            console.log(error);
            _this.componentLoading = false;
            _this.$message.error(error.message);
            return Promise.reject(error);
        });
    },
    created :function(){
        if (window.screen.width < 768) {
            this.isCollapse = true;
        }
    },
    watch: {
        hash: function (_url, _history) {
            var _this = this;
            var _ms = document.getElementById('mountScript');
            if (_ms) _ms.remove();
            NProgress.start();
            var componentScript = document.createElement("script");
            componentScript.id = "mountScript";
            componentScript.type = "text/javascript";
            componentScript.src = _url;
            componentScript.onerror = function () {
                _this.APP = _error;
                NProgress.done();
            };
            document.body.appendChild(componentScript);
        },
        isCollapseBody: function (_is) {
            if (_is) {
                document.body.style = null;
            } else {
                document.body.style = 'transform: translateX(64px);';
            }
        }
    }
});
//监听路由变化
window.addEventListener('popstate', function () {
    _back = vm.hash;
    vm.hash = window.location.hash.substr(1);
});
//监听页面窗口变化
// window.onresize = function () {
//     window.location.reload();
// };

//全局移动设备参数设置
setXSConfig();

function setXSConfig() {
    if (vm.screenWidth < 768) {
        //分页布局
        _pageConfig.layout = 'prev, total, jumper, next';
        //设置移动设备标识
        _xs = true;
    } else {
        //分页布局
        _pageConfig.layout = 'total, sizes, prev, pager, next, jumper';
        //设置移动设备标识
        _xs = false;
    }
}

//组件初始化
var _init = function (_this) {

    //封装form表单post
    _this.postForm = function (_reset) {
        _this.$refs['dataForm'].validate(function (valid) {
            if (valid) {
                axios.post(vm.hash, _this.dataForm).then(function (res) {
                    if (res.code == 1 && _reset == 1) _this.resetForm();
                });
            } else {
                return false;
            }
        });
    };
    //封装form表单重置
    _this.resetForm = function () {
        _this.$refs['dataForm'].resetFields();
        for (var _i in _this.$refs) {
            //重置所有编辑器内容
            if (_this.$refs[_i].className == 'editor' && _this.editors) {
                _this.editors[_i].txt.html('');
            }
            //重置组图
            if (_this.$refs[_i].$el) {
                if (_this.$refs[_i].$el.className == 'pics-uploader') {
                    _this.$refs[_i].clearFiles();
                }
            }
        }
    };

    //ajax获取数据
    _this.getData = function () {
        var _params = {};
        if (_this.params, _params) _params = _this.params;
        axios.get(vm.hash).then(function (res) {
            if (res.code == 1) {
                for (var _i in res.data) {
                    _this[_i] = res.data[_i];
                    // _this.$set(_this, _i, res.data[_i]);
                }
                //编辑器
                _this.editor();
            }
        });
    };

    //编辑器
    _this.editor = function () {
        var E = window.wangEditor;
        _this.editors = [];
        for (var _i in _this.$refs) {
            if (_this.$refs[_i].className == 'editor') {
                _this.editors[_i] = new E(_this.$refs[_i]);
                _this.editors[_i].customConfig.showLinkImg = false;
                _this.editors[_i].customConfig.uploadImgServer = '/admin/sys/upeditorimg';
                _this.editors[_i].customConfig.uploadFileName = 'file[]';
                _this.editors[_i].customConfig.uploadImgMaxSize = 1024 * 1024 * 10;
                _this.editors[_i].customConfig.onchange = function (html) {
                    for (var _ii in _this.editors) {
                        _this.dataForm[_ii] = _this.editors[_ii].txt.html();
                    }
                };
                if(_xs) {   //移动端配置菜单
                    _this.editors[_i].customConfig.menus = [
                        'head',
                        'bold',
                        'italic',
                        'underline',
                        'image',
                        'video',
                    ];
                }
                _this.editors[_i].create();
            }
        }
        //编辑器赋值
        for (var _i in _this.$refs) {
            if (_this.$refs[_i].className == 'editor' && _this.editors && _this.dataForm[_i]) {
                _this.editors[_i].txt.html(_this.dataForm[_i]);
            }
        }
    };

    // 缩略图
    _this.handleUploadImgSuccess = function (res, file, fileList, filed) {
        _this.loading = false;
        if (res.code == 1) {
            // _this.dataForm[filed] = res.data.path;
            _this.$set(_this.dataForm, filed, res.data.path);
            _this.$message({
                message: res.msg,
                type: 'success'
            });
        } else {
            _this.$message.error(res.msg);
        }
    };
    _this.beforeUploadImg = function (file, size) {
        if (!size) size = 2;
        var isLtM = file.size / 1024 / 1024 < size;
        if (!isLtM) {
            _this.$message.error('上传图片大小不能超过 ' + size + 'MB!');
        }
        _this.loading = true;
        return isLtM;
    };
    // 缩略图 结束

    //图组
    _this.handleUploadImgsRemove = function (file, fileList, filed) {
        _this.dataForm[filed] = fileList;
    };
    _this.handleUploadImgsSuccess = function (res, file, fileList, filed) {
        if (res.code == 1) {
            file['url'] = res.data['path'];
            _this.dataForm[filed] = fileList;
        } else {
            _this.$message.error(res.msg);
        }
    };
    //图组 结束


    //列表
    _this.getList = function () {
        var _params = _this.search;
        _params.page = _this.currentPage;
        _params.limit = _this.pageConfig.pageSize;
        axios.get(vm.hash, {
            params: _params
        }).then(function (_d) {
            if (_d.code == 1) {
                for (var _i in _d.data) {
                    _this[_i] = _d.data[_i];
                }
            }
        });
    };
    _this.handleSelectionChange = function (val) { //全选处理
        _this.multipleSelection = val;
    };
    _this.handleSizeChange = function (val) {      //修改每页limit
        _this.pageConfig.pageSize = val;
        _this.currentPage = 1;
        _this.getList();
    };
    _this.handleCurrentChange = function (val) {   //页面跳转
        _this.currentPage = val;
        _this.getList();
    };
    _this.handleCommand = function (command) {
        if (typeof _this[command] === "function") {
            _this[command]();
        } else {
            _this.$message.error(command + '函数未定义');
        }
    };
    _this.onSearch = function () {                 //搜索
        _this.currentPage = 1;
        _this.getList();
    };

};
