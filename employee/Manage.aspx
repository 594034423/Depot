<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="employee_Manage" Title="" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>管理工作人员</b></div>

<div class="pageColumn">      
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td align="center" class="tdbg">
<strong> 工作人员编号:</strong><asp:TextBox ID="txt_eno" runat="server" width="150"></asp:TextBox>
<strong> 姓名:</strong><asp:TextBox ID="txt_ename" runat="server" width="150"></asp:TextBox>

        <asp:Button ID="btnSearch" runat="server" Text="查询"  OnClick="btnSearch_Click" ></asp:Button>   
        </td>
    </tr>
</table>
          
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
    <th width="5%">编号</th>
    <th >工作人员编号</th>
    <th >登录密码</th>
    <th >姓名</th>
    <th >性别</th>
    <th >部门</th>
    <th >联系方式</th>
    <th >身份</th>
    <th >操作</th>
   </tr>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >
<td align="center">
<%# Container.ItemIndex+1 %></td>
 <td align="center"><%# Eval("eno")%></td>
 <td align="center"><%# Eval("pass")%></td>
 <td align="center"><%# Eval("ename")%></td>
 <td align="center"><%# Eval("sex")%></td>
 <td align="center"><%# Eval("part")%></td>
 <td align="center"><%# Eval("tel")%></td>
 <td align="center"><%# Eval("role")%></td>

<td align="center">
    <a href="Detail.aspx?id=<%# Eval("eno") %>"><img src="../images/ico_view.gif" width="16" height="16" style="border:0px;" title="查看该记录" /></a> 
    <a href="Modify.aspx?id=<%# Eval("eno") %>"><img src="../images/ico_edit.gif" width="16" height="16" style="border:0px;" title="修改该记录" /></a> 
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/ico_del.gif" ToolTip="删除该记录"  OnClick="del_Click"  CommandArgument='<%# Eval("eno") %>' OnClientClick='return confirm("您确定要删除此信息么？");' />
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

