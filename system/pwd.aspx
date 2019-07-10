<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="pwd.aspx.cs" ValidateRequest="false" Inherits="goods_Add" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/formValidator.js" type="text/javascript"></script>  
<script src="../js/formValidatorRegex.js" type="text/javascript"></script>
<link href="../css/validator.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="widget table-widget">
<div class="pageTitle" style="font-size:14px;"><b>修改密码</b></div>
<div class="pageColumn">      
       <table cellSpacing="0" cellPadding="0" width="100%" border="0">
      <tr>
                <td  style=" text-align:right; width:30%;">原密码:</td>
                <td class="tbright"><div style="display:inline;float:left;"><asp:TextBox ID="txt_pwd" runat="server" TextMode="Password"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_txt_pwdTip" style="width:250px; display:inline;float:left; text-align:left;"></div> </td>
            </tr>
          <tr>
                <td  style=" text-align:right; width:30%;">新密码:</td>
                <td class="tbright"><div style="display:inline;float:left;"><asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_TextBox1Tip" style="width:250px; display:inline;float:left; text-align:left;"></div> </td>
            </tr>
             <tr>
                <td  style=" text-align:right; width:30%;">确认密码:</td>
                <td class="tbright"><div style="display:inline;float:left;"><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></div><div id="ctl00_ContentPlaceHolder1_TextBox2Tip" style="width:250px; display:inline;float:left; text-align:left;"></div> </td>
            </tr>
                    <tr class=" ">
            <td colspan="2"   style="text-align:left; text-indent:400px;" ><asp:Button ID="Button1" runat="server" Text="保存" OnClick="btnSave_Click" class="button" OnClientClick="return jQuery.formValidator.PageIsValid('1');"></asp:Button></td>
        </tr>  
        

</table><script language="javascript" type="text/javascript">
            $(document).ready(function () {
                $.formValidator.initConfig({ onError: function (msg) { alert(msg) } });
                $("#ctl00_ContentPlaceHolder1_txt_pwd").formValidator({ onshow: "请输入原密码", onfocus: "原密码不能为空", oncorrect: "密码合法" }).InputValidator({ min: 1, onerror: "原密码不能为空,请确认" });
                $("#ctl00_ContentPlaceHolder1_TextBox1").formValidator({ onshow: "请输入新密码", onfocus: "新密码不能为空", oncorrect: "密码合法" }).InputValidator({ min: 1, onerror: "新密码不能为空,请确认" });
                $("#ctl00_ContentPlaceHolder1_TextBox2").formValidator({ onshow: "请输入重复密码", onfocus: "两次密码必须一致哦", oncorrect: "密码合法" }).InputValidator({ min: 1, onerror: "重复密码不能为空,请确认" });

            });
</script>
</div>
</div><!-- #widget -->


</asp:Content>

