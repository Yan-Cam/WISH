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
        <table id="test2" style="width:940px" title="用户操作" data-options="'iconcls':'icon-edit' ">
        </table>
        <script>
        $(function () {
            initTable();
        });
        function initTable(queryData) {
        $('#test2').datagrid({
            url: 'http://localhost:8080/WISH/adminmServlet',
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
                {field:'uid',title:'id',width:100,editor:{
					type:'validatebox',
					options:{}
        }},        
        {field:'username',title:'用户名',width:100,editor:{
			type:'validatebox',
			options:{}
}},        
{field:'password',title:'密码',width:100,editor:{
	type:'validatebox',
	options:{}
}}        
             ]],
 
		 toolbar:
			 [{
				text:'添加数据',
				iconCls:'icon-add',
				handler:function(){
					$("#test2").datagrid("insertRow",{
														index:0,
														row:{}
														});	
					$("#test2").datagrid("beginEdit",0);
					
									}
			   },
			   {
				text:'编辑数据',
				iconCls:'icon-edit',
				handler:function(){
					var hasSelect = $("#test2").datagrid("getSelections");
					if(hasSelect.length == 1){
						//alert(hasSelect[0].name);
						var row = hasSelect[0];
						rowNumber = $("#test2").datagrid("getRowIndex",row);
						$("#test2").datagrid("beginEdit",rowNumber);
					}
					
					
				}
			   },
			   {
				text:'保存修改',
				iconCls:'icon-save',
				handler:function(){
					$("#test2").datagrid("endEdit",rowNumber);
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