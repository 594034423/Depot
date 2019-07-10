<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="trunstores_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>�޸Ŀ�����</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">���ε���:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_tno" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_tnoTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">�����ֿ�:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddldno1" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">����ֿ�:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_dno2" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_dno2Tip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">���ʱ��:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlgno" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">����:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_quantity" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_quantityTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">������:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_oper" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_operTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">��������:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_odate" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_odateTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
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
        $("#ctl00_ContentPlaceHolder1_txt_tno").formValidator({ onshow: "��������ε���", onfocus: "���ε��Ų���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "���ε��Ų���Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_dno2").formValidator({ onshow: "���������ֿ�", onfocus: "����ֿⲻ��Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "����ֿⲻ��Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_quantity").formValidator({empty:true,onshow:"������",onfocus:"ֻ����������",oncorrect:"������ȷ"}).RegexValidator({regexp:"num",datatype:"enum",onerror:"ֻ��Ϊ����"});
        $("#ctl00_ContentPlaceHolder1_txt_oper").formValidator({ onshow: "�����������", onfocus: "�����˲���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "�����˲���Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_odate").formValidator({ onshow: "�������������", onfocus: "�������ڲ���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "�������ڲ���Ϊ��,��ȷ��" });
    });
</script>

</asp:Content>
