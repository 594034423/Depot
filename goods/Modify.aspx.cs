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

public partial class goods_Modify : System.Web.UI.Page
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
        string sql = string.Format("select * from goods where  gno='{0}'", Request.QueryString["id"]);

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_gno.Text = sdr["gno"].ToString();
            txt_gname.Text = sdr["gname"].ToString();
            txt_gtype.Text = sdr["gtype"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //更新   

        string strSql=String.Format(@"update goods set 
                                    gno = '{0}',gname = '{1}',gtype = '{2}'
                                    where gno='{3}'",
        txt_gno.Text,txt_gname.Text,txt_gtype.Text,Request.QueryString["id"]);

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Manage.aspx");
    }

}
