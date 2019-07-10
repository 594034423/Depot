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
        //验证是否已经存在
        if (SqlHelper.GetCount("select count(*) from goods where gno='" + txt_gno.Text + "' ") > 0)
        {
            MessageBox.Show(this, "该物资编号已存在，请重新输入！");
            return;
        }
 
        
       //设置添加sql
       string strSql=String.Format(@"insert into goods(gno,gname,gtype)
                                values ('{0}','{1}','{2}')",
                                txt_gno.Text,txt_gname.Text,txt_gtype.Text);
        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Add.aspx");

    }
}
