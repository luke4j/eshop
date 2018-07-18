define(function(require, exports, module) {
    require("md5") ;
    require("J") ;
    require("backbone") ;
    require("bootstrap") ;
    var MainView = Backbone.View.extend({
        el: $("body"),
        events: {

        },
        initialize: function () {
         debugger;
            J.getJBody().html("<div id='_main' class='container' style='height:100%;'></div>") ;

            this.render() ;
        },
        render:function(){
            this.page_cfg() ;
            /**添加导航*/
            this.render_add_nav() ;
            /**添加主要工作区*/
            $("#_main").append("<div class='container' id='wm_workspace' style='margin-top:60px;'>main</div>") ;
            /**添加时间*/
            this.render_add_time() ;
            $("#nav_current_user_name").text(LukeApp.User.CurrentUser.name) ;
            $("#nav_current_user_role").text(LukeApp.User.CurrentUser.roleName) ;
            if(LukeApp.User.CurrentCom)
                $("#nav_current_user_com").text(LukeApp.User.CurrentCom.name) ;
            if(LukeApp.User.CurrentStore)
                $("#nav_current_user_store").text(LukeApp.User.CurrentStore.name) ;

        },
        page_cfg:function(){
            J.ajax({
                url:'login/getInfo.act',
                async:false,
                success:function(d){
                    if(d=='操作成功'){
                        LukeApp.Role = [] ;
                    }else{
                        console.log("=============LukeApp.info start==========================") ;
                        console.dir( LukeApp.info) ;
                        console.log("=============LukeApp.info end============================") ;
                        LukeApp.info = d ;
                    }

                }
            }) ;
        },
        /**添加主导航条*/
        render_add_nav:function(){
            var main_nav = J.htmlTemp('app/login/main.nav.html') ;
            $("#_main").append($(main_nav)) ;
        },
        /**添加时间*/
        render_add_time:function(){
            var _now = J.JavaTimeToJsTime(LukeApp.SysTime) ;
            $("#lmt_time").text(J.jsDateToStr(_now)) ;
            function outtime(){
                _now = new Date(_now.getTime()+1000) ;
                $("#lmt_time").text(J.jsDateToStr(_now)) ;
            } ;
            this.timeInterval = setInterval(outtime,1000) ;
        },

        /**返回主页logo*/
        main_logo_btn_handler:function(e){
            var workspace = $("#wm_workspace").html("") ;
            $("#wm_workspace").addClass("bg") ;
        },
        /**返回主页*/
        main_home_btn_handler:function(e){
            J.changeView(J._CurrentWorkSpaceView,"app/menu/menu.view") ;
        },
        /**导航条，用户信息查看*/
        main_nav_user_info__a_handler:function(e){
            var jq_a = $(e.currentTarget) ;
            var msgId = $("<input />").attr('type','hidden').val(jq_a.attr('msgId')) ;
            var jform = J.jForm({fid:'_alert_hideForm',fname:'_alert_hideForm',els:[msgId]}) ;
            var alertCount = jq_a.attr('msg')+"<hr>"
                                + J.jsDateToStr(J.JavaTimeToJsTime(jq_a.attr('wt')) )
                                +jform.html();
            J.alert({
                title:jq_a.text(),
                //msg:jq_a.attr('msg')+"<hr>"+  J.jsDateToStr(J.JavaTimeToJsTime(jq_a.attr('wt')) )+"<input type='hidden' value='"+jq_a.attr('msgId')+"'>",
                msg:alertCount,
                btnsGroup:{
                    text:'已读',
                    handler:function(e,alt){
                        var msgId = $("input",alt).val() ;
                        J.ajax({
                            url:'login/update_readInfo',
                            data:{id:msgId},
                            success:function(data){
                                J.alert(data) ;
                            }
                        })
                    }
                }
            }) ;

        },
        /**头部导航条用户信息点击事件*/
        a_mt_userInfo_handler:function(e){
            var userinfo = J.htmlTemp('app/login/userInfo.temp.html') ;
            J.alert({
                title:"用户信息",
                msg:$(userinfo)
            }) ;
            J.ajax({
                url:'login/findLoginUserInfo.act',
                success:function(d){
                    for(var n in d){
                        /**定义的页面元素名与返回数据后台类的属性名有规则对应关系*/
                        $("#user_"+n).html(d[n]) ;
                    }
                }
            }) ;
        },

        /**头部导航条修改密码点击事件*/
        a_mt_updatePwd_handler:function(e){
            var fpwd = J.htmlTemp('app/login/userPassword.temp.html') ;
            J.alert({
                title:'修改密码',
                btns:'YN',
                msg:$(fpwd),
                okFunction:function(e,alt){
                    var formData = {
                        id: $("#user_id",alt).val(),
                        password:$("#user_password",alt).val(),
                        password2:$("#user_password2",alt).val()
                    } ;
                    var isValid = J.validate(formData,{
                        id:[{null_able:false,msg:'用户异常'}],
                        password:[{null_able:false,msg:'密码不能为空'}],
                        password2:[{null_able:false,msg:'重复密码不能为空'},
                            {equals:function(){
                                if($("#user_password",alt).val()!=$("#user_password2",alt).val()){
                                    return false ;
                                }else{
                                    return true ;
                                }
                            },msg:'两次密码不相同'}]
                    }) ;
                    if(isValid){
                        formData.password = J.md5(formData.password) ;
                        formData.password2 = J.md5(formData.password2) ;
                        J.ajax({url:'login/updateUserPassword',isMsg:true,data:formData}) ;
                    }
                }
            }) ;
            $("#user_name").text(LukeApp.User.CurrentUser.name) ;
            $("#user_loginName").text(LukeApp.User.CurrentUser.loginName) ;
            $("#user_id").val(LukeApp.User.CurrentUser.id) ;
        },
        /**头部导航退出登录事件*/
        a_mt_logout_handler:function(e){
            var me = this ;
            J.ajax({
                url:'login/logout',
                success:function(data){
                    J.alert(data) ;
                    J.changeView(me,'app/login/login.view') ;
                    if(me.msgInterval){
                        clearInterval(me.msgInterval) ;
                    }
                    if(me.timeInterval){
                        clearInterval(me.timeInterval) ;
                    }
                }
            }) ;
        }
    });
    return MainView ;
}) ;