<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="goods_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>修改物资</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">物资编号:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_gno" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_gnoTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">物资名称:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_gname" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_gnameTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">物资材料:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_gtype" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_gtypeTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
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
        $("#ctl00_ContentPlaceHolder1_txt_gno").formValidator({ onshow: "请输入物资编号", onfocus: "物资编号不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "物资编号不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_gname").formValidator({ onshow: "请输入物资名称", onfocus: "物资名称不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "物资名称不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_gtype").formValidator({ onshow: "请输入物资材料", onfocus: "物资材料不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "物资材料不能为空,请确认" });
    });
</script>

</asp:Content>

