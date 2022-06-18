
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #F9FBFC;
        }

        .container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .item {
            margin: 1rem 0;
            width: inherit;
            height: 4.5rem;
            background-color: white;
            display: flex;
            justify-content: start;
            align-items: center;
        }
        .top {
            width: 100%;
            position: fixed;
            top: 0;
            background-color: #F9FBFC;
        }
        .topBar {
            height: 3rem;
            display: flex;
            width: 100%;
            justify-content: space-between;
            align-items: center;
        }
    </style>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="top">
        <div class="topBar">
            <img id="back" style="margin-left: 1.5rem;" src="./image/back_button.svg" alt="">
            <div><p style="font-size: 1.4rem; color: #585858;">设置</p></div>
            <img style="visibility: hidden;margin-right: 1.5rem;" src="./image/back_button.svg" alt="">
        </div>
    </div>
        <div class="item" style="margin-top: 4.5rem;">
            <img style="margin-left: 1.5rem;" src="./image/vip.svg" alt="">
            <p style="margin-left: 1.5rem;">会员</p>
        </div>
        <div class="item">
            <img style="margin-left: 1.5rem;" src="./image/email.svg" alt="">
            <p style="margin-left: 1.5rem;">电子邮件设置</p>
        </div>
        <div class="item">
            <img style="margin-left: 1.5rem;" src="./image/draft.svg" alt="">
            <p style="margin-left: 1.5rem;">草稿</p>
        </div>
        <div class="item">
            <img style="margin-left: 1.5rem;" src="./image/statistic.svg" alt="">
            <p style="margin-left: 1.5rem;">统计数据</p>
        </div>
        <div class="item">
            <img style="margin-left: 1.5rem;" src="./image/help.svg" alt="">
            <p style="margin-left: 1.5rem;">帮助</p>
        </div>
        <div id="exit" class="item">
            <img style="margin-left: 1.5rem;" src="./image/exit.svg" alt="">
            <p style="margin-left: 1.5rem;">退出</p>
        </div>
    </div>
    <script>
		$("#back").on('click', function() {
			history.go(-1)
		})
    	$("#exit").on('click', function() {
    		$(location).attr('href', "http://192.168.1.184:8080/WISH/open/login.jsp")
    	})
    </script>
</body>
</html>