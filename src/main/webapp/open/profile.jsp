<%@page import="org.apache.catalina.User"%>
<%@page import="openBean.loginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <title>profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            padding: 1.5rem;
        }

        .top {
            width: 100%;
            height: 25rem;
            background: url(./image/profile_bg.png);
            background-repeat: no-repeat;
            background-position: top;
            background-size: cover;
            border-radius: 0.2rem;
        }

        .user {
            height: inherit;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .tabDiv {
            width: 100%;
            height: 52px;
            color: #999;
            background-color: #fff;
            font-size: 14px;
            overflow-x: scroll;
            white-space: nowrap;
        }

        .tabDiv::-webkit-scrollbar {
            display: none;
        }

        .tabDiv::-webkit-scrollbar-thumb {
            display: none;
        }

        .tabDiv div {
            text-align: center;
            width: auto;
            margin: 0 1rem;
            height: 40px;
            display: inline-block;
            line-height: 40px;
            border-radius: 15px;
        }

        .tabDiv .selectTab {
            border-radius: 15px;
            color: #1978ff;
            position: relative;
            font-weight: bold;
        }

        .tabDiv .selectTab::before {
            content: ' ';
            width: 40px;
            height: 2px;
            position: absolute;
            left: 50%;
            bottom: 2px;
            transform: translate(-50%, 0%);
            background-color: #1978ff;
        }

        .news_item {
            border-radius: 1rem;
            width: 100%;
            height: 9rem;
            background-color: #f6f6f6;
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
            justify-content: space-evenly;
        }

        .icon_list {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .information {
            width: inherit;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            left: 0;
        }

        .information_num {
            width: inherit;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            left: 0;
        }

        .information>div,
        .information_num>div {
            -webkit-filter: drop-shadow(0px 0px 5px #585858);
            filter: drop-shadow(0px 0px 5px #585858);
            text-align: center;
            width: 5rem;
        }
        .spinner {
    font-size: 60px;
    width: 1em;
    height: 1em;
    border-radius: 50%;
    box-shadow: inset 0 0 0 .1em rgba(58, 168, 237, .2);
}
.spinner i {
    position: absolute;
    clip: rect(0, 1em, 1em, .5em);
    width: 1em;
    height: 1em;
    animation: spinner-circle-clipper 1s ease-in-out infinite;
}
.spinner_container {
	width:100%;
	display:flex;
            justify-content: center;
            align-items: center;
}
@keyframes spinner-circle-clipper {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(180deg);
    }
}
.spinner i:after {
    position: absolute;
    clip: rect(0, 1em, 1em, .5em);
    width: 1em;
    height: 1em;
    content: '';
    animation: spinner-circle 1s ease-in-out infinite;
    border-radius: 50%;
    box-shadow: inset 0 0 0 .1em #3aa8ed;
}

@keyframes spinner-circle {
    0% {
        transform: rotate(-180deg);
    }

    100% {
        transform: rotate(180deg);
    }
}
    </style>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

</head>

<body>
    <div class="container">
        <div class="top">
            <div class="user">
                <img id="face" style="border-radius: 50%; width: 7rem;" src="./image/Art.svg" alt="">
                <img id="camera" style="margin-top: 5rem; margin-left: -2rem;" src="./image/camera.svg" alt="">
                <img id="setting" style="position: absolute; top: 4rem; right: 4rem;-webkit-filter: drop-shadow(0px 0px 5px rgb(237, 237, 237));
                filter: drop-shadow(0px 0px 5px rgb(237, 237, 237));" src="./image/Setting.svg" alt="">
                <div style="font-size: 1rem; position: absolute; top: 18rem; width: 100%; text-align: center; color: white;"
                    id="userName"><span style="-webkit-filter: drop-shadow(0px 0px 5px #000);
                    filter: drop-shadow(0px 0px 5px #000);"><%= ((loginBean)request.getSession().getAttribute("user")).getUsername()  %></span>
                    <div style="padding: 1.5rem;">
                        <div class="information">
                            <div><%= ((loginBean)request.getSession().getAttribute("user")).getPosts()  %></div>
                            <div><%= ((loginBean)request.getSession().getAttribute("user")).getFans()  %></div>
                            <div>23222</div>
                        </div>
                        <div class="information_num">
                            <div>帖子</div>
                            <div>关注</div>
                            <div>喜欢</div>
                        </div>
                    </div>

                </div>
</div>
            </div>
            <div class="main" style="margin-top: 0.5rem;margin-bottom: 5rem;">
                <div class="menu">
                    <div class="tabDiv">
                        <div onclick="changeTab(this,0)" class="selectTab">历史</div>
                        <div onclick="changeTab(this,1)">最近的</div>
                        <div onclick="changeTab(this,2)">喜欢</div>
                    </div>
                </div>
                <div class="list" style="margin-top: 0.5rem;">
					<div class="spinner_container"><div class="spinner"><i></i></div></div>
                </div>
            </div>
        </div>
        <script>
    	let essayId = null
    	var timeout;
    	//$(".news_item").forEach(item,index) {
        $(document).on({
        	
            touchstart: function(E) {
                    // 长按事件触发
            essayId = $(E.currentTarget)[0].getAttribute("data-id")
                timeOutEvent = setTimeout(function(e){                   
                	timeOutEvent = 0;
                    e.preventDefault();
                    $('.context-menu-one').contextMenu();
                }, 400);
            },
            touchmove: function(E) {
                clearTimeout(timeOutEvent);
                timeOutEvent = 0;
            },
            touchend: function(E) {
                clearTimeout(timeOutEvent);
                if (timeOutEvent != 0) {
               		localStorage.setItem("essayUrl", $(E.currentTarget)[0].getAttribute("name"))
               		localStorage.setItem("essayId", $(E.currentTarget)[0].getAttribute("data-id"))
          			window.location.href = "./essayDetails.jsp"
                }
                return false;
            }
    	
        }, ".news_item")
    	
    	
        $.contextMenu({
            selector: '.context-menu-one', 
            callback: function(key, options) {
            	if(key === "添加至阅读清单") {
                    $.ajax({
                        url:"http://localhost:8080/WISH/addListServlet?essayId="+essayId+"",
                        type:"GET",
                        dataType:"json",
                        success:function (rs) {
                        }
                    })
            	} else if("喜欢该文章") {
                    $.ajax({
                        url:"http://localhost:8080/WISH/likeServlet?essayId="+essayId+"",
                        type:"GET",
                        dataType:"json",
                        success:function (rs) {
                        
                        }
                    })
            	}
            },
            items: {
                "添加至阅读清单": {name: "添加至阅读清单", icon: "edit"},
                "喜欢该文章": {name: "喜欢该文章", icon: "cut"},
                "sep1": "---------",
                "退出": {name: "退出", icon: function($triggerElement, events){
                    return "退出";
                }}
            }
        });
        	$("#setting").on('click', function() {
        		$(location).attr('href', "http://127.0.0.1:8080/WISH/open/setting.jsp")
        	})
        	
        function changeTab(e, index) {
        		$(e).addClass('selectTab').siblings().removeClass('selectTab'); 
            let select = $(e).html();
            console.log(select)
            $.ajax({
                url:"http://localhost:8080/WISH/profileServlet?select="+select+"",
                type:"GET",
                dataType:"json",
                success:function (rs) {
                    let d = "";
                    rs.forEach((item, index) => {
                    d+= '<div class="news_item context-menu-one" data-id="'+item.essayId+'" name = "'+item.essayUrl+'">'
                    d+= '<div>'
                    d+= '<img src="'+item.essayPic+'" alt="" style="width: 6rem; height: 6rem;border-radius:0.5rem;object-fit:cover;">'
                    d+= '</div>'
                    d+= '<div>'
                    d+= '<div style="color: #585858;width: 12rem;">'+item.essayTitle+'</div>'
                    d+= '<div class="icon_list" style="margin-top: 0.1rem;">'
                    d+=            '<div><img src="./image/Show.svg" alt=""><span'
                    d+=                    ' style="color: #585858; margin-left: 0.3rem;font-size: 0.8rem;">'+item.views+'</span></div>'
                    d+=         '<div><img src="./image/comment.svg" alt=""><span'
                    d+=                   ' style="color: #585858; margin-left: 0.3rem;font-size: 0.8rem;">'+item.comments+'</span></div>'
                    d+=         '<div><img src="./image/Heart.svg" alt=""><span'
                    d+=                  ' style="color: #585858; margin-left: 0.3rem;font-size: 0.8rem;">'+item.likes+'</span></div>'
                    d+=       '</div>'
                    d+=     '<div style="color: #9a9a9a; font-size: 0.4rem; margin-top: 1rem;">'+ formatTime(item.publishDate)+ '</div>'
                    d+=   '</div>'
                    d+= '</div>'
                            
                    });
                    $(".list").html(d)
                    $(".list").trigger("create") 
                }
            })
        }
            $(document).ready(()=>{
            $.ajax({
                url:"http://localhost:8080/WISH/profileServlet?select=历史",
                type:"GET",
                dataType:"json",
                success:function (rs) {
                    let d = "";
                    rs.forEach((item, index) => {
                    d+= '<div class="news_item context-menu-one" data-id="'+item.essayId+'" name = "'+item.essayUrl+'">'
                    d+= '<div>'
                    d+= '<img src="'+item.essayPic+'" alt="" style="width: 6rem; height: 6rem;border-radius:0.5rem;object-fit:cover;">'
                    d+= '</div>'
                    d+= '<div>'
                    d+= '<div style="color: #585858;width: 12rem;">'+item.essayTitle+'</div>'
                    d+= '<div class="icon_list" style="margin-top: 0.1rem;">'
                    d+=            '<div><img src="./image/Show.svg" alt=""><span'
                    d+=                    ' style="color: #585858; margin-left: 0.3rem;font-size: 0.8rem;">'+item.views+'</span></div>'
                    d+=         '<div><img src="./image/comment.svg" alt=""><span'
                    d+=                   ' style="color: #585858; margin-left: 0.3rem;font-size: 0.8rem;">'+item.comments+'</span></div>'
                    d+=         '<div><img src="./image/Heart.svg" alt=""><span'
                    d+=                  ' style="color: #585858; margin-left: 0.3rem;font-size: 0.8rem;">'+item.likes+'</span></div>'
                    d+=       '</div>'
                    d+=     '<div style="color: #9a9a9a; font-size: 0.4rem; margin-top: 1rem;">'+ formatTime(item.publishDate)+ '</div>'
                    d+=   '</div>'
                    d+= '</div>'
                            
                    });
                    $(".list").html(d)
                	$(".list").trigger("create") 
                }

        })


            	})
            function formatTime(commintTime) {
                var date = new Date();
                //date.setTime(value);
                var month = date.getMonth() + 1;
                var hours = date.getHours();
                if (hours < 10)
                    hours = "0" + hours;
                var minutes = date.getMinutes();
                if (minutes < 10)
                    minutes = "0" + minutes;
                var time = date.getFullYear() + "-" + month + "-" + date.getDate() +
                    " " + hours + ":" + minutes;
                return time;
            }

           </script>
</body>

</html>