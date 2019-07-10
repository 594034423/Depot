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

public partial class outstores_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ShowInfo();
        }
    }

    //初始化
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //设置查询Sql
            string sql = string.Format("select a.*,b.gname from outstores a left join goods b on a.gno=b.gno where oid='{0}'", Request.QueryString["id"]);

            //根据编号得到相应的记录
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lbloid.Text = sdr["oid"].ToString();
                lblgno.Text = sdr["gname"].ToString();
                lbldno.Text = sdr["dno"].ToString();
                lblquantity.Text = sdr["quantity"].ToString();
                lbloper.Text = sdr["oper"].ToString();
                lblodate.Text = sdr["odate"].ToString();
            }
  
        }
    }
}
