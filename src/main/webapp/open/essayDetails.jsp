<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <title>essayDetails</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        body {
            width: 100%;
        }
        iframe {
            width: 100%;
            height: 100vh;
            border:0;
            margin:0;
        }
    </style>
</head>
<body>
    <iframe src="">

    </iframe>
    <script type="text/javascript">
    
    console.log(localStorage.getItem("essayUrl"))
    $(document).ready(()=>{
    	let essayId = localStorage.getItem("essayId")
        $.ajax({
            url:"http://localhost:8080/WISH/essayOpServlet?essayId="+essayId+"",
            type:"GET",
            dataType:"json",
            success:function (rs) {
				
            }
        })
    	})
    $(document).ready(()=>{
    	$("iframe").attr("src",localStorage.getItem("essayUrl"))
    })
    </script>
</body>
</html>