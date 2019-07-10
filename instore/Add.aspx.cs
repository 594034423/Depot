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

public partial class instore_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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

        txt_ino.Text = DateTime.Now.ToString("yyyyMMddhhmmssfff");
        txt_opname.Text = Session["adminName"].ToString();
        txt_indate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (SqlHelper.GetCount("select count(*) from depot where dno='" + ddldno.SelectedValue + "' and lquantity<"+txt_quantiy.Text) > 0)
        {
            MessageBox.Show(this, "�òֿ�洢�ռ䲻�㣬���������룡");
            return;
        }

        if (SqlHelper.GetCount("select count(*) from stores where dno='" + ddldno.SelectedValue + "' and gno='"+ddlgno.Text+"'") > 0)
        {
            string strSql2 = String.Format(@"update stores set 
                                   quantity =quantity+ {0}
                                    where gno = '{1}' and dno = '{2}' ",
                     txt_quantiy.Text,ddlgno.SelectedValue,ddldno.SelectedValue);

            //�ύ�����ݿ�
            SqlHelper.ExecuteNonQuery(strSql2.ToString());
        }
        else
        {
            //�������sql
            string strSql2 = String.Format(@"insert into stores(gno,dno,quantity)
                                values ('{0}','{1}',{2})",
                                     ddlgno.SelectedValue,ddldno.SelectedValue, txt_quantiy.Text);
            //�ύ�����ݿ�
            SqlHelper.ExecuteNonQuery(strSql2.ToString());
        }

        //�洢�ռ����
        SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity-" + txt_quantiy.Text + " where dno='" + ddldno.SelectedValue + "'");

       //�������sql
       string strSql=String.Format(@"insert into instore(ino,gno,dno,quantiy,opname,indate)
                                values ('{0}','{1}','{2}',{3},'{4}','{5}')",
                                txt_ino.Text,ddlgno.SelectedValue,ddldno.SelectedValue,int.Parse (txt_quantiy.Text),txt_opname.Text,txt_indate.Text);
        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "����ɹ���", "Add.aspx");

    }
}
