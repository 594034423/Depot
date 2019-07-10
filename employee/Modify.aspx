<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="employee_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>�޸Ĺ�����Ա</b></div>
<div class="pageColumn">      
    <table>     
    <tbody>
        <tr>
<td  style=" text-align:right; width:20%;">������Ա���:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_eno" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_enoTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">��¼����:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_pass" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_passTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">����:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_ename" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_enameTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>


<tr>
<td  style=" text-align:right; width:20%;">�Ա�:</td>
<td class="tbright"><div style="display:inline;float:left;">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True">��</asp:ListItem>
        <asp:ListItem>Ů</asp:ListItem>
    </asp:RadioButtonList>
    </div><div id="ctl00_ContentPlaceHolder1_txt_sexTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>


<tr>
<td  style=" text-align:right; width:20%;">����:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_part" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_partTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">��ϵ��ʽ:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_tel" runat="server" width="200"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_telTip" style="width:250px;display:inline;float:left;text-align:left;"></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:20%;">���:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:RadioButtonList ID="rdlrole" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
    <asp:ListItem Selected="True">�ɹ�Ա</asp:ListItem>
    <asp:ListItem>����Ա</asp:ListItem>
    <asp:ListItem>�ֿ����Ա</asp:ListItem>
</asp:RadioButtonList> </td></tr>


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
        $("#ctl00_ContentPlaceHolder1_txt_eno").formValidator({ onshow: "�����빤����Ա���", onfocus: "������Ա��Ų���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "������Ա��Ų���Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_pass").formValidator({ onshow: "�������¼����", onfocus: "��¼���벻��Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "��¼���벻��Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_ename").formValidator({ onshow: "����������", onfocus: "��������Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "��������Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_sex").formValidator({ onshow: "�������Ա�", onfocus: "�Ա���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "�Ա���Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_part").formValidator({ onshow: "�����벿��", onfocus: "���Ų���Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "���Ų���Ϊ��,��ȷ��" });
        $("#ctl00_ContentPlaceHolder1_txt_tel").formValidator({ onshow: "��������ϵ��ʽ", onfocus: "��ϵ��ʽ����Ϊ��", oncorrect: "�Ϸ�" }).InputValidator({ min: 1, onerror: "��ϵ��ʽ����Ϊ��,��ȷ��" });
    });
</script>

</asp:Content>

