<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="outstores_Manage" Title="" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>管理物资出库</b></div>

<div class="pageColumn">      
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td align="center" class="tdbg">
<strong> 出库单号:</strong><asp:TextBox ID="txt_oid" runat="server" width="150"></asp:TextBox>
<strong> 物资名称</strong><asp:DropDownList ID="ddlgno" runat="server" Width="150">
</asp:DropDownList><strong> 仓库编号</strong><asp:DropDownList ID="ddldno" runat="server" Width="150">
</asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="查询"  OnClick="btnSearch_Click" ></asp:Button>   
        </td>
    </tr>
</table>
          
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
    <th width="5%">编号</th>
    <th >出库单号</th>
    <th >物资名称</th>
    <th >仓库编号</th>
    <th >出库数量</th>
    <th >操作人</th>
    <th >出库日期</th>
    <th >操作</th>
   </tr>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >
<td align="center">
<%# Container.ItemIndex+1 %></td>
 <td align="center"><%# Eval("oid")%></td>
 <td align="center"><%# Eval("gname")%></td>
 <td align="center"><%# Eval("dno")%></td>
 <td align="center"><%# Eval("quantity")%></td>
 <td align="center"><%# Eval("oper")%></td>
 <td align="center"><%# Eval("odate")%></td>

<td align="center">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/ico_del.gif" ToolTip="删除该记录"  OnClick="del_Click"  CommandArgument='<%# Eval("oid") %>' OnClientClick='return confirm("您确定要删除此信息么？");' />
</td>
</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


    <div class="pageButton">
      <tr>
<td align="right"> <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="false" FirstPageText="首页" LastPageText="末页" NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged"  PageIndexBoxType="DropDownList" PageSize="10" PrevPageText="上一页" ShowPageIndexBox="Always" Width="90%" ></webdiyer:AspNetPager></td>
  </tr>

    
    </div>
</div>
</div>
</asp:Content>

