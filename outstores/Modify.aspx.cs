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

public partial class outstores_Modify : System.Web.UI.Page
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
        DataSet dsgno = SqlHelper.ExecuteforDataSet("select gno,gname from goods");
        ddlgno.DataSource = dsgno;
        ddlgno.DataTextField = "gname";
        ddlgno.DataValueField = "gno";
        ddlgno.DataBind();

        DataSet dsdno = SqlHelper.ExecuteforDataSet("select dno,dno from depot");
        ddldno.DataSource = dsdno;
        ddldno.DataTextField = "dno";
        ddldno.DataValueField = "dno";
        ddldno.DataBind();


        //���ò�ѯSql
        string sql = string.Format("select * from outstores where  oid='{0}'", Request.QueryString["id"]);

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_oid.Text = sdr["oid"].ToString();
            ddlgno.SelectedValue=sdr["gno"].ToString();
            ddldno.SelectedValue=sdr["dno"].ToString();
            txt_quantity.Text = sdr["quantity"].ToString();
            txt_oper.Text = sdr["oper"].ToString();
            txt_odate.Text = sdr["odate"].ToString();
        }
    }

    // ����
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //����   

        string strSql=String.Format(@"update outstores set 
                                    oid = '{0}',gno = '{1}',dno = '{2}',quantity = {3},oper = '{4}',odate = '{5}'
                                    where oid='{6}'",
        txt_oid.Text,ddlgno.SelectedValue,ddldno.SelectedValue,txt_quantity.Text,txt_oper.Text,txt_odate.Text,Request.QueryString["id"]);

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "����ɹ���", "Manage.aspx");
    }

}
