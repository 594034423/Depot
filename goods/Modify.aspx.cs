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

       // ��ʼ��
    protected void ShowInfo()
    {

        //���ò�ѯSql
        string sql = string.Format("select * from goods where  gno='{0}'", Request.QueryString["id"]);

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_gno.Text = sdr["gno"].ToString();
            txt_gname.Text = sdr["gname"].ToString();
            txt_gtype.Text = sdr["gtype"].ToString();
        }
    }

    // ����
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //����   

        string strSql=String.Format(@"update goods set 
                                    gno = '{0}',gname = '{1}',gtype = '{2}'
                                    where gno='{3}'",
        txt_gno.Text,txt_gname.Text,txt_gtype.Text,Request.QueryString["id"]);

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "����ɹ���", "Manage.aspx");
    }

}
