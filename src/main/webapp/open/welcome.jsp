<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <title>welcome</title>
    <link rel="stylesheet" type="text/css"
	href="./ui/themes/default/easyui.css">
    <script type="text/javascript" src="./ui/jquery.min.js"></script>
<script type="text/javascript" src="./ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="./ui/jquery.easyui.mobile.js"></script>
<script language="JavaScript" type="text/javascript" src="./ui/locale/easyui-lang-zh_CN.js"></script>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    .container {
        width: 100%;
        text-align: center;
    }
    body {
        padding: 1.5rem;
    }
    p {
        color: #888888;
    }
    .img_container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    img {
        width: 9rem;
        height: 9rem;
        border-radius: 15px;
    }
    img.img-active{
        box-shadow: 0 0 10px #585858;
        border-radius: 15px;
    }
    .img_group {
        display: flex;
        width: 100%;
        align-items: center;
        justify-content: space-around;
        margin: 1rem 0;
    }
    form {
    	display:none;
    }
</style>
<body>
    <div class="container">
        <h1 style="margin-top: 3rem;color: #585858;">欢迎来到见闻！</h1>
        <p>选择至少四个主题进行个性化</p>
        <p>你的主页</p>
        <div class="img_container">
        
            <div class="img_group">
                <img src="./image/Art.svg" name="艺术">
                <img src="./image/education.svg" name="教育"> 
            </div>
            <div class="img_group">
                <img src="./image/Travel.svg" name="旅游">
                <img src="./image/Business.svg" name="商业"> 
            </div>
            <div class="img_group">
                <img src="./image/Food.svg" name="美食"> 
                <img src="./image/Sport.svg" name="运动">  
            </div>
            <div class="img_group">
                <img src="./image/Gaming.svg" name="游戏"> 
                <img src="./image/TV.svg" name="TV">
            </div>
        </div>
        <div style="text-align: center; margin-top: 30px">
				<a id="btn_submit"
					class="easyui-linkbutton" style="width: 100%; height: 40px"> <span
					style="font-size: 16px">提交</span>
				</a>
			</div>
    </div>
    <form action="welcomeServlet" method="post">
    	<input name = "recommendList"></input>
    </form>
    <script>
	let str = new Array()
    let imglist = document.querySelectorAll("img");
        imglist.forEach(item => item.addEventListener("click", () => item.classList.contains('img-active') ? item.classList.remove("img-active") :  item.classList.add("img-active")))
    	$("#btn_submit").on('click', () => {
        	let recommendList = $(".img-active")
        	if(recommendList.length < 4) {
        		alert("error")
        	} else {
        		$.each(recommendList,(index,value) => {
        			str.push(value.name)
        		})
        		$("input").val(str.toString())
        		console.log($("input").val())
        		$("form").submit()
        	}
		})
    </script>
</body>
</html>