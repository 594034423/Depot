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
    /// 用户登陆
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnLogin_Click(object sender, EventArgs e)
    {
       string err = "";

        //判断输入
        if (username.Value == "")
        {
            err += "用户名不能为空!";
        }

        if (password.Value == "")
        {
            err += "密码不能为空!";
        }

        //验证输入，如果不合法就弹出相应提示，并返回
        if (err != "")
        {
            MessageBox.Show(this, err);
            return;
        }

        SqlDataReader sdr = null;

        //根据不用的身份，得到对应的用户信息
        if(DropDownList1.SelectedValue=="管理员")
        {
            sdr = SqlHelper.ExecuteReader("select * from admin where lname='" + username.Value + "' and pwd='" + password.Value + "'");
        }
        else
        {
            sdr = SqlHelper.ExecuteReader("select * from employee where eno='" + username.Value + "' and pass='" + password.Value + "'");
        }

        //判断用户是否存在
        if (sdr.Read())
        {
            //把用户信息存入到Session
            if (DropDownList1.SelectedValue == "管理员")
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

            //跳转到后台
            Response.Redirect("index.aspx");
        }
        else
        {
            MessageBox.Show(this, "用户名或密码错误，请重试!");
            return;
        }
    }
}
