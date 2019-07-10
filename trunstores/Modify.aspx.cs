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

public partial class trunstores_Modify : System.Web.UI.Page
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
        DataSet dsdno1 = SqlHelper.ExecuteforDataSet("select dno,dname from depart");
        ddldno1.DataSource = dsdno1;
        ddldno1.DataTextField = "dname";
        ddldno1.DataValueField = "dno";
        ddldno1.DataBind();

        DataSet dsgno = SqlHelper.ExecuteforDataSet("select gno,gname from goods");
        ddlgno.DataSource = dsgno;
        ddlgno.DataTextField = "gname";
        ddlgno.DataValueField = "gno";
        ddlgno.DataBind();


        //设置查询Sql
        string sql = string.Format("select * from trunstores where  tno='{0}'", Request.QueryString["id"]);

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_tno.Text = sdr["tno"].ToString();
            ddldno1.SelectedValue=sdr["dno1"].ToString();
            txt_dno2.Text = sdr["dno2"].ToString();
            ddlgno.SelectedValue=sdr["gno"].ToString();
            txt_quantity.Text = sdr["quantity"].ToString();
            txt_oper.Text = sdr["oper"].ToString();
            txt_odate.Text = sdr["odate"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //更新   

        string strSql=String.Format(@"update trunstores set 
                                    tno = '{0}',dno1 = '{1}',dno2 = '{2}',gno = '{3}',quantity = {4},oper = '{5}',odate = '{6}'
                                    where tno='{7}'",
        txt_tno.Text,ddldno1.SelectedValue,txt_dno2.Text,ddlgno.SelectedValue,txt_quantity.Text,txt_oper.Text,txt_odate.Text,Request.QueryString["id"]);

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Manage.aspx");
    }

}
