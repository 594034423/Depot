<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>С���߲˲ֿ����ϵͳ</title>
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
           ���ã�<%= Session["adminName"].ToString() %>����������ǣ�<%=Session["adminPower"].ToString() %>
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
        	<li class="subMenuTitle">�˵��б�</li>


<% if(Session["adminPower"].ToString()=="����Ա"){ %>
<!--  ������Ա��ʼ    -->
  <li class="subMenu"><a href="#">������Ա����</a>
   <ul>
       <li><a href='employee/Add.aspx' target="right">��ӹ�����Ա</a></li>
        <li><a href='employee/Manage.aspx' target="right">��������Ա</a></li>
    </ul>
   </li>
<!--  ������Ա����    -->


<!--  ���ʿ�ʼ    -->
  <li class="subMenu"><a href="#">���ʹ���</a>
   <ul>
       <li><a href='goods/Add.aspx' target="right">�������</a></li>
        <li><a href='goods/Manage.aspx' target="right">��������</a></li>
    </ul>
   </li>
<!--  ���ʽ���    -->


<!--  �ֿ⿪ʼ    -->
  <li class="subMenu"><a href="#">�ֿ����</a>
   <ul>
       <li><a href='depot/Add.aspx' target="right">��Ӳֿ�</a></li>
        <li><a href='depot/Manage.aspx' target="right">����ֿ�</a></li>
    </ul>
   </li>
<!--  �ֿ����    -->

<!--  ������⿪ʼ    -->
  <li class="subMenu"><a href="#">����������</a>
   <ul>
       <li><a href='instore/Add.aspx' target="right">����������</a></li>
        <li><a href='instore/Manage.aspx' target="right">�����������</a></li>
    </ul>
   </li>
<!--  ����������    -->


<!--  ���ʳ��⿪ʼ    -->
  <li class="subMenu"><a href="#">���ʳ������</a>
   <ul>
       <li><a href='outstores/Add.aspx' target="right">������ʳ���</a></li>
        <li><a href='outstores/Manage.aspx' target="right">�������ʳ���</a></li>
    </ul>
   </li>
<!--  ���ʳ������    -->


<!--  ��������ʼ    -->
  <li class="subMenu"><a href="#">����������</a>
   <ul>
       <li><a href='trunstores/Add.aspx' target="right">��ӿ�����</a></li>
        <li><a href='trunstores/Manage.aspx' target="right">���������</a></li>
    </ul>
   </li>
<!--  ����������    -->
<%} %>

            <% if (Session["adminPower"].ToString() == "�ɹ�Ա")
               { %>
              <li class="subMenu"><a href="#">����������</a>
   <ul>
       <li><a href='instore/Add.aspx' target="right">����������</a></li>
        <li><a href='instore/Manage.aspx' target="right">�����������</a></li>
    </ul>
   </li>
<!--  ����������    -->

            <%} %>

                    <% if (Session["adminPower"].ToString() == "����Ա")
                       { %>
              <li class="subMenu"><a href="#">���ʳ������</a>
   <ul>
       <li><a href='outstores/Add.aspx' target="right">������ʳ���</a></li>
        <li><a href='outstores/Manage.aspx' target="right">�������ʳ���</a></li>
    </ul>
   </li>
            <%} %>

                    <% if(Session["adminPower"].ToString()=="�ֿ����Ա"){ %>
              <li class="subMenu"><a href="#">����������</a>
   <ul>
       <li><a href='trunstores/Add.aspx' target="right">��ӿ�����</a></li>
        <li><a href='trunstores/Manage.aspx' target="right">���������</a></li>
    </ul>
   </li>
            <%} %>
<!--  ��濪ʼ    -->
  <li class="subMenu"><a href="#">������</a>
   <ul>
        <li><a href='stores/Manage.aspx' target="right">������</a></li>
    </ul>
   </li>
<!--  ������    -->

  <li class="subMenu"><a href="#">ϵͳ����</a>
   <ul>
        <li><a href='system/pwd.aspx' target="right">�޸ĵ�¼����</a></li>
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
