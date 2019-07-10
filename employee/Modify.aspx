<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="employee_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>修改工作人员</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">工作人员编号:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_eno" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_enoTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">登录密码:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_pass" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_passTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">姓名:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_ename" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_enameTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>


<tr>
<td  style=" text-align:right; width:20%;">性别:</td>
<td class="tbright"><div style="display:inline;float:left;">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True">男</asp:ListItem>
        <asp:ListItem>女</asp:ListItem>
    </asp:RadioButtonList>
    </div><div id="ctl00_ContentPlaceHolder1_txt_sexTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>


<tr>
<td  style=" text-align:right; width:20%;">部门:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_part" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_partTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">联系方式:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_tel" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_telTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">身份:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:RadioButtonList ID="rdlrole" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
    <asp:ListItem Selected="True">采购员</asp:ListItem>
    <asp:ListItem>销售员</asp:ListItem>
    <asp:ListItem>仓库管理员</asp:ListItem>
</asp:RadioButtonList> </td></tr>


       <tr class=" ">
            <td colspan="2"   style="text-align:left; text-indent:350px;" > <asp:Button ID="Button1" runat="server" Text="修 改" CssClass="button" OnClick="btnSave_Click"  OnClientClick="return jQuery.formValidator.PageIsValid('1');"   />
                &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="返 回" CssClass="button" OnClientClick="document.location='Manage.aspx';return false;" CausesValidation="false" />　</td>
        </tr>        
    </tbody>
    </table>   
</div>
</div><!-- #widget -->
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $.formValidator.initConfig({ onError: function(msg) { alert(msg) } });
        $("#ctl00_ContentPlaceHolder1_txt_eno").formValidator({ onshow: "请输入工作人员编号", onfocus: "工作人员编号不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "工作人员编号不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_pass").formValidator({ onshow: "请输入登录密码", onfocus: "登录密码不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "登录密码不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_ename").formValidator({ onshow: "请输入姓名", onfocus: "姓名不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "姓名不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_sex").formValidator({ onshow: "请输入性别", onfocus: "性别不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "性别不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_part").formValidator({ onshow: "请输入部门", onfocus: "部门不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "部门不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_tel").formValidator({ onshow: "请输入联系方式", onfocus: "联系方式不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "联系方式不能为空,请确认" });
    });
</script>

</asp:Content>

