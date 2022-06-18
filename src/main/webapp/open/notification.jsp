<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <title>Document</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            padding: 1.5rem;
        }

        .top {
            z-index: 1;
            height: 3rem;
            background: white;
            display: flex;
            width: 100%;
            align-items: center;
            justify-content: center;
            position: fixed;
            top: 0;
            left: 0;
        }

        .notification_item {
            border-radius: 1rem;
            width: 100%;
            height: 9rem;
            background-color: #f6f6f6;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            margin-bottom: 1.5rem;
        }
    </style>
</head>

<body>
    <div class="top">
        <p style="font-size: 1.4rem; color: #585858;">通知</p>
    </div>
    <div class="list" style="margin-top: 1.5rem;">
        <div class="notification_item">
            <img src="./image/Art.svg" alt="" style="width: 5rem; height: 5rem; border-radius: 50%;">
            <div>
                <p style="color: #585858;">李浩洋</p>
                <p style="color: #585858; font-size: 0.5rem;">在吗？</p>
                <p style="color: #9a9a9a; font-size: 0.5rem; margin-top: 1rem;">25分钟前</p>
            </div>
        </div>
        <div class="notification_item">
            <img src="./image/Art.svg" alt="" style="width: 5rem; height: 5rem; border-radius: 50%;">
            <div>
                <p style="color: #585858;">李浩洋</p>
                <p style="color: #585858; font-size: 0.5rem;">在吗？</p>
                <p style="color: #9a9a9a; font-size: 0.5rem; margin-top: 1rem;">25分钟前</p>
            </div>
        </div>
        <div class="notification_item">
            <img src="./image/Art.svg" alt="" style="width: 5rem; height: 5rem; border-radius: 50%;">
            <div>
                <p style="color: #585858;">李浩洋</p>
                <p style="color: #585858; font-size: 0.5rem;">在吗？</p>
                <p style="color: #9a9a9a; font-size: 0.5rem; margin-top: 1rem;">25分钟前</p>
            </div>
        </div>
        <div class="notification_item">
            <img src="./image/Art.svg" alt="" style="width: 5rem; height: 5rem; border-radius: 50%;">
            <div>
                <p style="color: #585858;">李浩洋</p>
                <p style="color: #585858; font-size: 0.5rem;">在吗？</p>
                <p style="color: #9a9a9a; font-size: 0.5rem; margin-top: 1rem;">25分钟前</p>
            </div>
        </div>

    </div>
</body>
</html>