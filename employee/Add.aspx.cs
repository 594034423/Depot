 using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Data.SqlClient;

public partial class employee_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {   
        //验证是否已经存在
        if (SqlHelper.GetCount("select count(*) from employee where eno='" + txt_eno.Text + "' ") > 0)
        {
            MessageBox.Show(this, "该工作人员编号已存在，请重新输入！");
            return;
        } 
        
       //设置添加sql
       string strSql=String.Format(@"insert into employee(eno,pass,ename,sex,part,tel,role)
                                values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                                txt_eno.Text,txt_pass.Text,txt_ename.Text,RadioButtonList1.SelectedValue,txt_part.Text,txt_tel.Text,rdlrole.SelectedValue);
        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Add.aspx");

    }
}
