<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>admin</title>
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
    <script type="text/javascript">
        $(function () {
            $('#menu').tree({
                onClick: function (node) {
                    if ($('#menu').tree("isLeaf", node.target)) {
                        var tabs = $("#tabs");
                        var tab = tabs.tabs("getTab", node.text);
                        if (tab) {
                            tabs.tabs("select", node.text);
                        } else {
                            tabs.tabs('add', {
                                title: node.text,
                                href: node.attributes.url,
                                closable: true,
                                bodyCls: "content"
                            });
                        }
                    }
                }
            });
        });
        $(document).ready({
        	
        })
        	
        
    </script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <body class="easyui-layout">
        <div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
            <ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
                <li>
                    <span>新闻管理</span>
                    <ul>
                        <li data-options="attributes:{'url':'./news.jsp',method:'get'}">新闻列表</li>
                    </ul>
                </li>
                <li>
                    <span>用户帐号管理</span>
                    <ul>
                        <li data-options="attributes:{'url':'./user.jsp',method:'get'}">用户列表</li>
                    </ul>
                </li>
                <li>
                    <span>管理员帐号管理</span>
                    <ul>
                        <li data-options="attributes:{'url':'./admin.jsp',method:'get'}">评论列表</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div data-options="region:'center',title:''">
            <div id="tabs" class="easyui-tabs">
                <div title="首页" style="padding:20px;">
                    
                </div>
            </div>
        </div>
    </body>
</html>