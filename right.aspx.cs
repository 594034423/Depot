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

public partial class right : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminPower"].ToString() == "管理员")
        {
            Response.Redirect("employee/Manage.aspx");
        }
        else if (Session["adminPower"].ToString() == "采购员")
        {
            Response.Redirect("instore/Manage.aspx");
        }
        else if (Session["adminPower"].ToString() == "销售员")
        {
            Response.Redirect("outstores/Manage.aspx");
        }
        else if (Session["adminPower"].ToString() == "仓库管理员")
        {
            Response.Redirect("trunstores/Manage.aspx");
        }
    }
}
