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
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// �û���½
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnLogin_Click(object sender, EventArgs e)
    {
       string err = "";

        //�ж�����
        if (username.Value == "")
        {
            err += "�û�������Ϊ��!";
        }

        if (password.Value == "")
        {
            err += "���벻��Ϊ��!";
        }

        //��֤���룬������Ϸ��͵�����Ӧ��ʾ��������
        if (err != "")
        {
            MessageBox.Show(this, err);
            return;
        }

        SqlDataReader sdr = null;

        //���ݲ��õ���ݣ��õ���Ӧ���û���Ϣ
        if(DropDownList1.SelectedValue=="����Ա")
        {
            sdr = SqlHelper.ExecuteReader("select * from admin where lname='" + username.Value + "' and pwd='" + password.Value + "'");
        }
        else
        {
            sdr = SqlHelper.ExecuteReader("select * from employee where eno='" + username.Value + "' and pass='" + password.Value + "'");
        }

        //�ж��û��Ƿ����
        if (sdr.Read())
        {
            //���û���Ϣ���뵽Session
            if (DropDownList1.SelectedValue == "����Ա")
            {
                Session["adminId"] = sdr["aid"].ToString();
                Session["adminName"] = sdr["lname"].ToString();
                Session["adminPower"] = DropDownList1.SelectedValue;
            }
            else
            {
                Session["adminId"] = sdr["eno"].ToString();
                Session["adminName"] = sdr["ename"].ToString();
                Session["adminPower"] = sdr["role"].ToString();
            }

            //��ת����̨
            Response.Redirect("index.aspx");
        }
        else
        {
            MessageBox.Show(this, "�û������������������!");
            return;
        }
    }
}
