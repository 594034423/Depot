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

public partial class depot_Modify : System.Web.UI.Page
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
        string sql = string.Format("select * from depot where  dno='{0}'", Request.QueryString["id"]);

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_dno.Text = sdr["dno"].ToString();
            txt_dquantity.Text = sdr["dquantity"].ToString();
            txt_lquantity.Text = sdr["lquantity"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //更新   

        string strSql=String.Format(@"update depot set 
                                    dno = '{0}',dquantity = {1},lquantity = {2}
                                    where dno={3}",
        txt_dno.Text,txt_dquantity.Text,txt_lquantity.Text,Request.QueryString["id"]);

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Manage.aspx");
    }

}
