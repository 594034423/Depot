<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="employee_Detail" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>�鿴������Ա</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
         <tr>
	<td height="25" width="20%" align="right">������Ա��ţ�</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lbleno" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">��¼���룺</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblpass" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">������</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblename" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">�Ա�</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblsex" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">���ţ�</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblpart" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">��ϵ��ʽ��</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lbltel" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="20%" align="right">��ݣ�</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblrole" runat="server" Text=""></asp:Label></td>
	</tr>

       <tr class=" ">
            <td colspan="2"   style="text-align:left; text-indent:350px;" > <input id="Button2" type="button" value="������ҳ" onclick="location.href='Manage.aspx'" />��</td>
        </tr>        
    </tbody>
    </table>   
</div>
</div>
</asp:Content>

