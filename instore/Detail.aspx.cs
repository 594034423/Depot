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

public partial class instore_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ShowInfo();
        }
    }

    //��ʼ��
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //���ò�ѯSql
            string sql = string.Format("select a.*,b.gname from instore a left join goods b on a.gno=b.gno where ino='{0}'", Request.QueryString["id"]);

            //���ݱ�ŵõ���Ӧ�ļ�¼
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblino.Text = sdr["ino"].ToString();
                lblgno.Text = sdr["gname"].ToString();
                lbldno.Text = sdr["dno"].ToString();
                lblquantiy.Text = sdr["quantiy"].ToString();
                lblopname.Text = sdr["opname"].ToString();
                lblindate.Text = sdr["indate"].ToString();
            }
  
        }
    }
}
