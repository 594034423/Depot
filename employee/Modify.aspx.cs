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

public partial class employee_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ShowInfo();
        }
    }

       // 初始化
    protected void ShowInfo()
    {

        //设置查询Sql
        string sql = string.Format("select * from employee where  eno='{0}'", Request.QueryString["id"]);

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_eno.Text = sdr["eno"].ToString();
            txt_pass.Text = sdr["pass"].ToString();
            txt_ename.Text = sdr["ename"].ToString();
            RadioButtonList1.SelectedValue = sdr["sex"].ToString();
            txt_part.Text = sdr["part"].ToString();
            txt_tel.Text = sdr["tel"].ToString();
            rdlrole.SelectedValue=sdr["role"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //更新   

        string strSql=String.Format(@"update employee set 
                                    eno = '{0}',pass = '{1}',ename = '{2}',sex = '{3}',part = '{4}',tel = '{5}',role = '{6}'
                                    where eno='{7}'",
        txt_eno.Text,txt_pass.Text,txt_ename.Text,RadioButtonList1.SelectedValue,txt_part.Text,txt_tel.Text,rdlrole.SelectedValue,Request.QueryString["id"]);

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Manage.aspx");
    }

}
