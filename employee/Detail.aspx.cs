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

public partial class employee_Detail : System.Web.UI.Page
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
            string sql = string.Format("select * from employee where eno='{0}'", Request.QueryString["id"]);

            //���ݱ�ŵõ���Ӧ�ļ�¼
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lbleno.Text = sdr["eno"].ToString();
                lblpass.Text = sdr["pass"].ToString();
                lblename.Text = sdr["ename"].ToString();
                lblsex.Text = sdr["sex"].ToString();
                lblpart.Text = sdr["part"].ToString();
                lbltel.Text = sdr["tel"].ToString();
                lblrole.Text = sdr["role"].ToString();
            }
  
        }
    }
}
