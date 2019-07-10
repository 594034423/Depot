<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登陆</title>
    <link href="images/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">  
    <div id="wrap">
	
	<div id="header">
            <br />
        <br />
        <br />
        <br />
        <br />
        <table align="center" style="width:600px;" >
            <tr>
                <td align="center">
                    <asp:Label ID="Label1" runat="server" Text="小型蔬菜管理系统" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
        </table>
	</div>
    <div id="content-wrap">
    	<div class="space"> </div>
   	 <div class="content">
        <div class="field"><label>账　户：</label><input class="username" name="" id="username" runat="server" value="" type="text" /></div>
		<div class="field"><label>密　码：</label><input class="password" name="" id="password" runat="server" value="" type="password" /><br /></div>
        <div class="field"><label>身&nbsp; 份：</label>
        
            <asp:DropDownList ID="DropDownList1" runat="server" Height="29" Width="150">
                <asp:ListItem>管理员</asp:ListItem>
                <asp:ListItem>工作人员</asp:ListItem>
            </asp:DropDownList>
        
        <br />
        
        </div>
        <div class="btn">
            <asp:Button ID="btnLogin" runat="server"  class="login-btn" Text="" 
                onclick="btnLogin_Click" />
        </div>
      </div>
    </div>
    <div id="footer"> </div>
</div>
    </form>
</body>
</html>
