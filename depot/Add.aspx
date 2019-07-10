<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" ValidateRequest="false" Inherits="depot_Add" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>添加仓库</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">仓库编号:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_dno" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_dnoTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">存储能力:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_dquantity" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_dquantityTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>




       <tr class=" ">
            <td colspan="2"   style="text-align:left; text-indent:350px;" > <asp:Button ID="Button1" runat="server" Text="添 加" CssClass="button" OnClick="btnSave_Click"  OnClientClick="return jQuery.formValidator.PageIsValid('1');"    />
                &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="返 回" CssClass="button" OnClientClick="document.location='Manage.aspx';return false;" CausesValidation="false" />　</td>
        </tr>        
    </tbody>
    </table>   
</div>
</div><!-- #widget -->
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $.formValidator.initConfig({ onError: function(msg) { alert(msg) } });
        $("#ctl00_ContentPlaceHolder1_txt_dno").formValidator({ onshow: "请输入仓库编号", onfocus: "仓库编号不能为空", oncorrect: "合法" }).InputValidator({ min: 1, onerror: "仓库编号不能为空,请确认" });
        $("#ctl00_ContentPlaceHolder1_txt_dquantity").formValidator({empty:false,onshow:"请输入",onfocus:"只能输入数字",oncorrect:"输入正确"}).RegexValidator({regexp:"num",datatype:"enum",onerror:"只能为数字"});
    });
</script>

</asp:Content>

