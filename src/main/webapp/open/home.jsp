<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="openBean.loginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%loginBean user = (loginBean)request.getSession().getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <title>home</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
        <script>
        function changeTab(e, index) {
            $(e).addClass('selectTab').siblings().removeClass('selectTab');
        }
    </script>
    <style>
        .tabDiv {
            width: 100%;
            height: 52px;
            border-bottom: 1px solid #e7e1e1;
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
            width: 25%;
            margin: 0 0.4rem;
            height: 40px;
            display: inline-block;
            line-height: 40px;
            border-radius: 15px;
            color: #9a9a9a;
            background-color: #f6f6f6;
        }

        .tabDiv .selectTab {
            border-radius: 15px;
            background-color: #1978ff;
            color: #fff;
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

        #search {
            width: 100%;
            margin: 15px auto;
            font-family: 'Microsoft YaHei';
            font-size: 14px;
        }

        #search>input {
            margin: 1rem 0;
            border-radius: 5rem;
            width: inherit;
            border: 1px solid #e2e2e2;
            height: 3rem;
            background-image: url(./image/Iconly_Bulk_Search.svg);
            background-repeat: no-repeat;
            background-size: 25px;
            background-position: 5px center;
            padding: 0 0 0 40px;
        }

        .hot {
            flex-shrink: 0;
            margin-top: 1rem;
            width: 15rem;
            height: 15rem;
            background: url(./image/hot.svg);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            display: flex;
            margin: 0 1rem;
            justify-content: center;
            border-radius: 0.5rem;
        }

        .ract {
            margin-top: 6rem;
            width: 100%;
            height: 8rem;
            background: url(./image/hot_bg.svg);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .tabHot {
            overflow-x: scroll;
            display: flex;
            flex-shrink: 0;
        }

        .tabHot::-webkit-scrollbar {
            display: none;
        }

        .news_item {
            border-radius: 1rem;
            width: 100%;
            height: 9rem;
            background-color: #f6f6f6;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            margin-bottom: 1rem;
        }
         .news_item>p {
                    word-wrap: break-word;
    word-break: break-all;
    overflow: hidden;
         }
        * {
        	margin: 0;
        	padding: 0;
        }
        body {
        	padding: 1.5rem;
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
</head>

<body>
    <div class="container">
        <p style="margin-top: 0.7rem;"><%= user.getUsername()  %></p>
        <p style="font-size: 1.4rem;">欢迎回来！</p>
    </div>
    <div id="search">
        <input type="search" name="search" placeholder="请输入关键字">
    </div>
    <div class="tabDiv">
		<%
			String[] recommedndStrings = user.getRecommendlist().split(",");
			out.println("<div onclick='changeTab(this,0)' class='selectTab'>"+recommedndStrings[0]+"</div>");	
			for (int i = 1;i<recommedndStrings.length;i++) {
			out.println("<div onclick='changeTab(this,"+i+")'>"+recommedndStrings[i]+"</div>");
			}
		%>
    </div>
    <p style="font-size: 1.2rem;">受欢迎的：</p>
    <div class="tabHot">

    </div>
    <div class="news_list" style="margin-top: 1.5rem; margin-bottom: 5rem;">
    <div class="spinner_container"><div class="spinner"><i></i></div></div>
    </div>
</body>
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
    $(document).ready(()=>{
    	let classfication = $(".selectTab").text()
        $.ajax({
            url:"http://localhost:8080/WISH/homeServlet?classfication="+classfication+"",
            type:"GET",
            dataType:"json",
            success:function (rs) {
                let d = "";
                rs.forEach((item, index) => {
                    d += '<div class="news_item context-menu-one" name = "'+item.essayUrl+'" data-id="'+item.essayId+'"><div><img src="'+ item.essayPic+ '" alt="" style="width: 6rem; height: 6rem;border-radius:0.5rem;object-fit:cover;">'
                    d += '</div><div><div style="color: #585858; width:10rem">'+ item.essayTitle+'</div>'
                    d += '<div style="color: #9a9a9a; font-size: 0.5rem; margin-top: 0.2rem;width: 10rem;">'+ formatTime(item.publishDate)+ '</div>'
                    d += '<div style="color: #5a5a5a; font-size: 0.6rem;width: 10rem; margin-top: 0.2rem;">'+ item.essayDesc.substring(0,40)+ '...</div></div></div>'   
                        
                });
                $(".news_list").html(d);
                $(".news_list").trigger("create"); 
            }
        })
        $.ajax({
            url:"http://localhost:8080/WISH/hotServlet",
            type:"GET",
            dataType:"json",
            success:function (rs) {
                let d = "";
                rs.forEach((item, index) => {
                    d+='<div class="hot" name = "'+item.essayUrl+'" data-id="'+item.essayId+'">'
                     d+='<div class="ract">'
                            d+='<div>'
                                d+='<img style="border-radius: 50%;width: 4.5rem;height: 4.5rem;object-fit:cover;" src="'+item.essayPic+'" alt="">'
                                    d+='</div>'
                                        d+='<div>'
                                            d+='<div class="title" style="font-size: 0.7rem; width: 7rem;color: #585858;">'+item.essayTitle+'</div>'
                                                d+= '<div class="desc" style="font-size: 0.5rem;width: 7rem;color: #5a5a5a;">'+item.essayDesc.substring(0,40)+'...</div>'
                                                    d+='</div>'
                                                        d+='</div>'
                                                            d+= '</div>'
                        
                });
                $(".tabHot").html(d);
                $(".tabHot").trigger("create"); 
            }
        })

    	})
    	
        function changeTab(e, index) {
            $(e).addClass('selectTab').siblings().removeClass('selectTab');
            let classfication = $(e).text()
            $.ajax({
                url:"http://localhost:8080/WISH/homeServlet?classfication="+classfication+"",
                type:"GET",
                dataType:"json",
                success:function (rs) {
                    let d = "";
                    rs.forEach((item, index) => {
                        d += '<div class="news_item context-menu-one" name = "'+item.essayUrl+'" data-id="'+item.essayId+'"><div><img src="'+ item.essayPic+ '" alt="" style="width: 6rem; height: 6rem;border-radius:0.5rem;object-fit:cover;">'
                        d += '</div><div><div style="color: #585858; width:10rem">'+ item.essayTitle+'</div>'
                        d += '<div style="color: #9a9a9a; font-size: 0.5rem; margin-top: 0.2rem;width: 10rem;">'+ formatTime(item.publishDate)+ '</div>'
                        d += '<div style="color: #5a5a5a; font-size: 0.6rem;width: 10rem; margin-top: 0.2rem;">'+ item.essayDesc.substring(0,40)+ '...</div></div></div>'   
                    });
                    $(".news_list").html(d);
                    $(".news_list").trigger("create"); 
                }
            })
        }
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

          	$(document).on("click", ".news_item",(e)=>{	
               		localStorage.setItem("essayUrl", $(e.currentTarget)[0].getAttribute("name"))
               		localStorage.setItem("essayId", $(e.currentTarget)[0].getAttribute("data-id"))
               		console.log($(e.currentTarget)[0].getAttribute("name"))
          			window.location.href = "./essayDetails.jsp"
          	})
          	          	$(document).on("click", ".hot",(e)=>{	
               		localStorage.setItem("essayUrl", $(e.currentTarget)[0].getAttribute("name"))
               		localStorage.setItem("essayId", $(e.currentTarget)[0].getAttribute("data-id"))
               		console.log($(e.currentTarget)[0].getAttribute("name"))
          			window.location.href = "./essayDetails.jsp"
          	})

    </script>
</html>