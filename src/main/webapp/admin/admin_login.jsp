<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script language="JavaScript" type="text/javascript" src="../open/ui/jquery.min.js" charset="utf-8"></script>
    <!--(指定编码方式，防止出现乱码)引入EasyUI中使用的Jquery版本-->
    <script language="JavaScript" type="text/javascript" src="../open/ui/jquery.easyui.min.js" charset="utf-8"></script>
    <!--(指定编码方式，防止出现乱码)引入EasyUi文件-->
    <link rel="stylesheet" type="text/css" href="../open/ui/themes/default/easyui.css">
    <!--引入CSS样式-->
    <link rel="stylesheet" type="text/css" href="../open/ui/themes/icon.css">
    <!--Icon引入-->
    <script language="JavaScript" type="text/javascript" src="../open/ui/locale/easyui-lang-zh_CN.js"></script>
    <!--汉化-->
    <title>adminLogin</title>
    <style>
        body {
            background-color: #0A96E1;
            background-image: -moz-radial-gradient(center, ellipse closest-corner, #29C4FD 20%, #0F6CB1 100%);
            background-image: -webkit-radial-gradient(center, ellipse closest-side, #29C4FD 30%, #0F6CB1 100%);
            background-image: -ms-radial-gradient(center, ellipse closest-side, #29C4FD 20%, #0F6CB1 100%);
            background-image: -o-radial-gradient(center, ellipse closest-side, #29C4FD 20%, #0F6CB1 100%);
        }

        .foot {
            z-index: 0;
            display: block;
            position: absolute;
            width: 100%;
            height: 20%;
            bottom: 0px;
            background-image: -webkit-gradient(linear, top, bottom, from(#054E81), to(#0D5D9A));
            background-image: -webkit-linear-gradient(top, #054E81 0%, #0D5D9A 20%);
            background-image: -moz-linear-gradient(top, #054E81 0%, #0D5D9A 20%);
            background-image: -ms-linear-gradient(top, #054E81 0%, #0D5D9A 20%);
            background-image: -o-linear-gradient(top, #054E81 0%, #0D5D9A 20%);
            background-image: linear-gradient(to bottom, #054E81 0%, #0D5D9A 20%);
        }
        .container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1;
        }
    </style>
</head>

<body class="easyui-layout">
        <div class="container">
            <img src="../open/image/logo_transparent .png">
            <div style="margin:20px 0;"></div>
            <div class="easyui-panel" title="后台管理系统" style="width:100%;max-width:400px;padding:30px 60px;">
                <form action="adminLoginServlet" method="post" id="adminLoginForm">
                <div style="margin-bottom:10px">
                
                    <input id="username" name="username" class="easyui-textbox" style="width:100%;height:40px;padding:12px"
                        data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38">
                </div>
                <div style="margin-bottom:20px">
                    <input id="password" name="password" class="easyui-textbox" type="password" style="width:100%;height:40px;padding:12px"
                        data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38">
                </div>
                <div style="margin-bottom:20px">
                    <input id="checkbox" type="checkbox" checked="checked">
                    <span>记住密码</span>
                </div>
                <div>
                    <a href="#" id="btn_login" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                        style="padding:5px 0px;width:100%;">
                        <span style="font-size:14px;">登陆</span>
                    </a>
                </div>
                </form>
            </div>
        </div>
        <div class="foot"></div>
        <script>
    	$("#btn_login").on('click', () => {
    		$("#adminLoginForm").submit() 
    	})
        </script>
    </body>
</html>