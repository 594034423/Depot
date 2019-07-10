<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="outstores_Detail" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>查看物资出库</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
         <tr>
	<td height="25" width="20%" align="right">出库单号：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lbloid" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">物资编号：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblgno" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">仓库编号：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lbldno" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">出库数量：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblquantity" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">操作人：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lbloper" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">出库日期：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblodate" runat="server" Text=""></asp:Label></td>
	</tr>

       <tr class=" ">
            <td colspan="2"   style="text-align:left; text-indent:350px;" > <input id="Button2" type="button" value="返回上页" onclick="location.href='Manage.aspx'" />　</td>
        </tr>        
    </tbody>
    </table>   
</div>
</div>
</asp:Content>

