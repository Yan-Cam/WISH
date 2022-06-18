<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
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
    <title>main</title>
    <style>
        .tabBar {
            position: fixed;
            box-shadow: 0 0 2px #585858;
            border-radius: 0.6rem 0.6rem 0 0;
            bottom: 0;
            height: 4.7rem;
            width: 100%;
            left: 0;
            background: #fff;
        }

        .tab_container {
            width: 100%;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-wrap: wrap;
        }

        .tab_container>img {
            flex-shrink: 0;
        }
       form {
			display:none;
       }
    </style>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
</head>
<body>
<%
HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
req.setCharacterEncoding("utf-8");
System.out.println(request.getRequestURI());
String selectTabSrc[] = new String[4];
String pageUrl = null;
if(request.getParameter("select")!=null) {
	pageUrl = req.getParameter("select");
	selectTabSrc[0] = req.getParameter("selectTab1");
	selectTabSrc[1] = req.getParameter("selectTab2");
	selectTabSrc[2] = req.getParameter("selectTab3");
	selectTabSrc[3] = req.getParameter("selectTab4");
} else {
	pageUrl = "home.jsp";
	selectTabSrc[0] = "./image/Iconly_Bulk_Home_active.svg";
	selectTabSrc[1] = "./image/Iconly_Bulk_Notification.svg";
	selectTabSrc[2] = "./image/Iconly_Bulk_Profile.svg";
	selectTabSrc[3] = "./image/Iconly_Bulk_Bookmark.svg";
}

	System.out.println(selectTabSrc[0]);
	System.out.println(pageUrl);
%>
<jsp:include page ="<%= pageUrl %>"/>
    <div class="tabBar">
        <div class="tab_container">
            <img style="width: 2rem; width: 2rem;" id="home" src="<%= selectTabSrc[0] %>" />
            <img style="width: 2rem; width: 2rem;" id="notification" src="<%= selectTabSrc[1] %>" />
            <img style="width: 4rem; width: 4rem; border-radius: 4rem; border: #f6f6f6 solid 0.2rem;" id="add"
                src="./image/add.svg">
            <img style="width: 2rem; width: 2rem;" id="profile" src="<%= selectTabSrc[2] %>" />
            <img style="width: 2rem; width: 2rem;" id="bookmark" src="<%= selectTabSrc[3] %>" />
        </div>
        <form id="tabForm" value="" action="/WISH/open/main.jsp" method="post">
        	<input type="text" value="" id="select" name="select"></input>
        	<input type="text" value="" id = "selectTab1" name="selectTab1"></input>
        	<input type="text" value="" id = "selectTab2" name="selectTab2"></input>
        	<input type="text" value="" id = "selectTab3" name="selectTab3"></input>
        	<input type="text" value="" id = "selectTab4" name="selectTab4"></input>
        </form>
    </div>
    <script>
        $("#home").on('click', function () {
            $("#home").attr("src", "./image/Iconly_Bulk_Home_active.svg")
            $("#notification").attr("src", "./image/Iconly_Bulk_Notification.svg")
            $("#profile").attr("src", "./image/Iconly_Bulk_Profile.svg")
            $("#bookmark").attr("src", "./image/Iconly_Bulk_Bookmark.svg")
            $("#select").val("home.jsp")
            $("#selectTab1").val("./image/Iconly_Bulk_Home_active.svg")
            $("#selectTab2").val("./image/Iconly_Bulk_Notification.svg")
    		$("#selectTab3").val("./image/Iconly_Bulk_Profile.svg")
    		$("#selectTab4").val("./image/Iconly_Bulk_Bookmark.svg")
            $("#tabForm").submit() 
        })
        $("#notification").on('click', function () {
            $("#home").attr("src", "./image/Iconly_Bulk_Home.svg")
            $("#notification").attr("src", "./image/Iconly_Bulk_Notification_active.svg")
            $("#profile").attr("src", "./image/Iconly_Bulk_Profile.svg")
            $("#bookmark").attr("src", "./image/Iconly_Bulk_Bookmark.svg")
            $("#select").val("notification.jsp")
            $("#selectTab1").val("./image/Iconly_Bulk_Home.svg")
            $("#selectTab2").val("./image/Iconly_Bulk_Notification_active.svg")
            $("#selectTab3").val("./image/Iconly_Bulk_Profile.svg")
            $("#selectTab4").val("./image/Iconly_Bulk_Bookmark.svg")
            $("#tabForm").submit() 
        })
        $("#profile").on('click', function () {
            $("#home").attr("src", "./image/Iconly_Bulk_Home.svg")
            $("#notification").attr("src", "./image/Iconly_Bulk_Notification.svg")
            $("#profile").attr("src", "./image/Iconly_Bulk_Profile_active.svg")
            $("#bookmark").attr("src", "./image/Iconly_Bulk_Bookmark.svg")
            $("#select").val("profile.jsp")
            $("#selectTab1").val("./image/Iconly_Bulk_Home.svg")
            $("#selectTab2").val("./image/Iconly_Bulk_Notification.svg")
            $("#selectTab3").val("./image/Iconly_Bulk_Profile_active.svg")
            $("#selectTab4").val("./image/Iconly_Bulk_Bookmark.svg")
            $("#tabForm").submit()
        })
        $("#bookmark").on('click', function () {
            $("#home").attr("src", "./image/Iconly_Bulk_Home.svg")
            $("#notification").attr("src", "./image/Iconly_Bulk_Notification.svg")
            $("#profile").attr("src", "./image/Iconly_Bulk_Profile.svg")
            $("#bookmark").attr("src", "./image/Iconly_Bulk_Bookmark_active.svg")
            $("#select").val("list.jsp")
            $("#selectTab1").val("./image/Iconly_Bulk_Home.svg")
            $("#selectTab2").val("./image/Iconly_Bulk_Notification.svg")
            $("#selectTab3").val("./image/Iconly_Bulk_Profile.svg")
            $("#selectTab4").val("./image/Iconly_Bulk_Bookmark_active.svg")
            $("#tabForm").submit()        
        })
    </script>
</body>
</html>