<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" ValidateRequest="false" Inherits="outstores_Add" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />

<script src="../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>������ʳ���</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">���ⵥ��:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_oid" runat="server" width="200" Enabled="false"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_oidTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">��������:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlgno" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">�ֿ���:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddldno" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">��������:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_quantity" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_quantityTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">������:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_oper" runat="server" width="200" Enabled="false"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_operTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">��������:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_odate" runat="server" width="200" class="Wdate" onfocus="WdatePicker()"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_odateTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>


       <tr class=" ">
            <td colspan="2"   style="text-align:left; text-indent:350px;" > <asp:Button ID="Button1" runat="server" Text="�� ��" CssClass="button" OnClick="btnSave_Click"  OnClientClick="return jQuery.formValidator.PageIsValid('1');"   />
                &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="�� ��" CssClass="button" OnClientClick="document.location='Manage.aspx';return false;" CausesValidation="false" />��</td>
        </tr>        
    </tbody>
    </table>   
</div>
</div><!-- #widget -->
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $.formValidator.initConfig({ onError: function(msg) { alert(msg) } });
        $("#ctl00_ContentPlaceHolder1_txt_oid").formValidator({ onshow: "��������ⵥ��", onfocus: "���ⵥ�Ų���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "���ⵥ�Ų���Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_quantity").formValidator({empty:false,onshow:"������",onfocus:"ֻ����������",oncorrect:"������ȷ"}).RegexValidator({regexp:"num",datatype:"enum",onerror:"ֻ��Ϊ����"});
        $("#ctl00_ContentPlaceHolder1_txt_oper").formValidator({ onshow: "�����������", onfocus: "�����˲���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "�����˲���Ϊ��,��ȷ��" });
    });
</script>

</asp:Content>

