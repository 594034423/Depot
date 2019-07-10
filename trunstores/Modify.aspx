<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="trunstores_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>修改库存调拨</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">调拔单号:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_tno" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_tnoTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">调出仓库:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddldno1" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">调入仓库:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_dno2" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_dno2Tip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">物资编号:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlgno" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">数量:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_quantity" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_quantityTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">操作人:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_oper" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_operTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">调拔日期:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_odate" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_odateTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>


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
        $("#ctl00_ContentPlaceHolder1_txt_tno").formValidator({ onshow: "请输入调拔单号", onfocus: "调拔单号不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "调拔单号不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_dno2").formValidator({ onshow: "请输入调入仓库", onfocus: "调入仓库不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "调入仓库不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_quantity").formValidator({empty:true,onshow:"请输入",onfocus:"只能输入数字",oncorrect:"输入正确"}).RegexValidator({regexp:"num",datatype:"enum",onerror:"只能为数字"});
        $("#ctl00_ContentPlaceHolder1_txt_oper").formValidator({ onshow: "请输入操作人", onfocus: "操作人不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "操作人不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_odate").formValidator({ onshow: "请输入调拔日期", onfocus: "调拔日期不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "调拔日期不能为空,请确认" });
    });
</script>

</asp:Content>

