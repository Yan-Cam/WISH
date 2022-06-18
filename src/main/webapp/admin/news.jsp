<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script language="JavaScript" type="text/javascript" src="../open/ui/jquery.min.js" charset="utf-8"></script>
    <!--(指定编码方式，防止出现乱码)引入EasyUI中使用的Jquery版本-->
    <script language="JavaScript" type="text/javascript" src="../open/ui/jquery.easyui.min.js" charset="utf-8"></script>
    <!--(指定编码方式，防止出现乱码)引入EasyUi文件-->
    <link rel="stylesheet" type="text/css" href="../open/ui/themes/default/easyui.css">
    <!--引入CSS样式-->
    <link rel="stylesheet" type="text/css" href="../open/ui/themes/icon.css">
    <!--Icon引入-->
    <script language="JavaScript" type="text/javascript" src="../open/ui/locale/easyui-lang-zh_CN.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <table id="test" style="width:940px" title="用户操作" data-options="'iconcls':'icon-edit' ">
        </table>
        <script>
        $(function () {
            initTable();
        });
        function initTable(queryData) {
        $('#test').datagrid({
            url: 'http://localhost:8080/WISH/newsmServlet',
            title: '文章信息表',
            iconCls: 'icon-save',
            height: 368,
            nowrap: true,
            autoRowHeight: false,
            striped: true,
            collapsible: true,
            pagination: true,
            rownumbers: true,
            sortOrder: 'asc',
            remoteSort: false,
            idField: 'ID',
            pageSize:20,
            queryParams: queryData,
            frozenColumns: [[
            	{ field: 'ck', checkbox: true },
                {field:'classfication',title:'分类',width:100,editor:{
					type:'validatebox',
					options:{}
        }},        
        {field:'comments',title:'评论数',width:100,editor:{
			type:'validatebox',
			options:{}
}},        
{field:'essayDesc',title:'文章简介',width:100,editor:{
	type:'validatebox',
	options:{}
}},        
{field:'essayId',title:'id',width:100,editor:{
	type:'validatebox',
	options:{}
}},        
{field:'essayPic',title:'文章略缩图地址',width:100,editor:{
	type:'validatebox',
	options:{}
}},        
{field:'essayTitle',title:'文章标题',width:100,editor:{
	type:'validatebox',
	options:{}
}},        
{field:'likes',title:'点赞数',width:100,editor:{
	type:'validatebox',
	options:{}
}},   
{field:'publishDate',title:'发布日期',width:100,editor:{
	type:'validatebox',
	options:{}
}},  
{field:'views',title:'浏览量',width:100,editor:{
	type:'validatebox',
	options:{}
}},  
             ]],
 
		 toolbar:
			 [{
				text:'添加数据',
				iconCls:'icon-add',
				handler:function(){
					$("#test").datagrid("insertRow",{
														index:0,
														row:{}
														});	
					$("#test").datagrid("beginEdit",0);
					
									}
			   },
			   {
				text:'编辑数据',
				iconCls:'icon-edit',
				handler:function(){
					var hasSelect = $("#test").datagrid("getSelections");
					if(hasSelect.length == 1){
						//alert(hasSelect[0].name);
						var row = hasSelect[0];
						rowNumber = $("#test").datagrid("getRowIndex",row);
						$("#test").datagrid("beginEdit",rowNumber);
					}
					
					
				}
			   },
			   {
				text:'保存修改',
				iconCls:'icon-save',
				handler:function(){
					$("#test").datagrid("endEdit",rowNumber);
				}
				}],
				
		  pagination:true,
		  onAfterEdit:function(index,data,changes){
			 /*  alert(index);
			  console.info(data); */
			  $.post(
					"${pageContext.request.contextPath}/"	  
			  );
		  }
		 

}); 
        }
        </script>
</body>
</html>