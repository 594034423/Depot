<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>小型蔬菜仓库管理系统</title>
    <link href="images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//setMenuHeight
	$('.menu').height($(window).height()-51-27-26-5);
	$('.sidebar').height($(window).height()-51-27-26-5);
	$('.page').height($(window).height()-51-27-26-5);
	$('.page iframe').width($(window).width()-15-168);
	
	//menu on and off
	$('.btn').click(function(){
		$('.menu').toggle();
		
		if($(".menu").is(":hidden")){
			$('.page iframe').width($(window).width()-15+5);
			}else{
			$('.page iframe').width($(window).width()-15-168);
				}
		});
		
	//
	$('.subMenu a[href="#"]').click(function(){
		$(this).next('ul').toggle();
		return false;
		});
})
</script>
   
</head>
<body  style="overflow-y:hidden">
    <form id="form1" runat="server">
    <div id="wrap">
	<div id="header">
    <div class="logo fleft"></div>
    <div class="nav fleft" style="width:500px; ">
    	<ul style="text-align:center;  vertical-align:text-bottom;">
        	<br />
           您好：<%= Session["adminName"].ToString() %>，您的身份是：<%=Session["adminPower"].ToString() %>
        </ul>
    </div>
  
        <asp:Button ID="Button1" class="logout fright" runat="server" Text="" style="cursor:pointer;"
                    onclick="Button1_Click" />
    <div class="clear"></div>
    <div class="subnav">
    	<div class="subnavLeft fleft"></div>
        <div class="fleft"></div>
        <div class="subnavRight fright"></div>
    </div>
    </div><!--#header -->
    <div id="content">
    <div class="space"></div>
    <div class="menu fleft">
    	<ul>
        	<li class="subMenuTitle">菜单列表</li>


<% if(Session["adminPower"].ToString()=="管理员"){ %>
<!--  工作人员开始    -->
  <li class="subMenu"><a href="#">工作人员管理</a>
   <ul>
       <li><a href='employee/Add.aspx' target="right">添加工作人员</a></li>
        <li><a href='employee/Manage.aspx' target="right">管理工作人员</a></li>
    </ul>
   </li>
<!--  工作人员结束    -->


<!--  物资开始    -->
  <li class="subMenu"><a href="#">物资管理</a>
   <ul>
       <li><a href='goods/Add.aspx' target="right">添加物资</a></li>
        <li><a href='goods/Manage.aspx' target="right">管理物资</a></li>
    </ul>
   </li>
<!--  物资结束    -->


<!--  仓库开始    -->
  <li class="subMenu"><a href="#">仓库管理</a>
   <ul>
       <li><a href='depot/Add.aspx' target="right">添加仓库</a></li>
        <li><a href='depot/Manage.aspx' target="right">管理仓库</a></li>
    </ul>
   </li>
<!--  仓库结束    -->

<!--  物资入库开始    -->
  <li class="subMenu"><a href="#">物资入库管理</a>
   <ul>
       <li><a href='instore/Add.aspx' target="right">添加物资入库</a></li>
        <li><a href='instore/Manage.aspx' target="right">管理物资入库</a></li>
    </ul>
   </li>
<!--  物资入库结束    -->


<!--  物资出库开始    -->
  <li class="subMenu"><a href="#">物资出库管理</a>
   <ul>
       <li><a href='outstores/Add.aspx' target="right">添加物资出库</a></li>
        <li><a href='outstores/Manage.aspx' target="right">管理物资出库</a></li>
    </ul>
   </li>
<!--  物资出库结束    -->


<!--  库存调拨开始    -->
  <li class="subMenu"><a href="#">库存调拨管理</a>
   <ul>
       <li><a href='trunstores/Add.aspx' target="right">添加库存调拨</a></li>
        <li><a href='trunstores/Manage.aspx' target="right">管理库存调拨</a></li>
    </ul>
   </li>
<!--  库存调拨结束    -->
<%} %>

            <% if (Session["adminPower"].ToString() == "采购员")
               { %>
              <li class="subMenu"><a href="#">物资入库管理</a>
   <ul>
       <li><a href='instore/Add.aspx' target="right">添加物资入库</a></li>
        <li><a href='instore/Manage.aspx' target="right">管理物资入库</a></li>
    </ul>
   </li>
<!--  物资入库结束    -->

            <%} %>

                    <% if (Session["adminPower"].ToString() == "销售员")
                       { %>
              <li class="subMenu"><a href="#">物资出库管理</a>
   <ul>
       <li><a href='outstores/Add.aspx' target="right">添加物资出库</a></li>
        <li><a href='outstores/Manage.aspx' target="right">管理物资出库</a></li>
    </ul>
   </li>
            <%} %>

                    <% if(Session["adminPower"].ToString()=="仓库管理员"){ %>
              <li class="subMenu"><a href="#">库存调拨管理</a>
   <ul>
       <li><a href='trunstores/Add.aspx' target="right">添加库存调拨</a></li>
        <li><a href='trunstores/Manage.aspx' target="right">管理库存调拨</a></li>
    </ul>
   </li>
            <%} %>
<!--  库存开始    -->
  <li class="subMenu"><a href="#">库存管理</a>
   <ul>
        <li><a href='stores/Manage.aspx' target="right">管理库存</a></li>
    </ul>
   </li>
<!--  库存结束    -->

  <li class="subMenu"><a href="#">系统管理</a>
   <ul>
        <li><a href='system/pwd.aspx' target="right">修改登录密码</a></li>
    </ul>
   </li>
                
        </ul>
    </div>
    <div class="sidebar fleft"><div class="btn"></div></div>
    <div class="page">
    <iframe width="100%" scrolling="auto" height="100%" frameborder="false" allowtransparency="true" style="border: medium none;" src="right.aspx" id="rightMain" name="right"></iframe>
    </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer">CopyRight &copy; 2014 </div><!--#footer -->
   
    
</div>
    </form>
</body>
</html>
