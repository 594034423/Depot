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

public partial class goods_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //�ж��������������Ƿ�һ�£������һ�£��򵯳���ʾ��Ϣ��������
        if (TextBox1.Text == TextBox2.Text)
        {
            SqlDataReader sdr = null;
            if (Session["adminPower"].ToString() == "����Ա")
            {
                sdr = SqlHelper.ExecuteReader("select * from admin where aid=" + Session["adminId"].ToString() + " and pwd='" + txt_pwd.Text + "'");
            }
            else
            {
                sdr = SqlHelper.ExecuteReader("select * from employee where eno='" + Session["adminId"].ToString() + "' and pass='" + txt_pwd.Text + "'");
            }
            if (sdr.Read())
            {
                if (Session["adminPower"].ToString() == "����Ա")
                {

                    SqlHelper.ExecuteNonQuery("update admin set pwd='" + TextBox1.Text + "' where aid=" + Session["adminId"].ToString());
                }
                else
                {
                    SqlHelper.ExecuteNonQuery("update employee set pass='" + TextBox1.Text + "' where eno='" + Session["adminId"].ToString() + "'");
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�޸ĳɹ���');</script>");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('ԭ���벻��ȷ��');</script>");
            }
            sdr.Close();

        }
        else
        {
            MessageBox.Show(this, "�����������벻һ��!");
        }

    }
}
