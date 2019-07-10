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

public partial class trunstores_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet dsdno1 = SqlHelper.ExecuteforDataSet("select dno from depot");
        ddldno1.DataSource = dsdno1;
        ddldno1.DataTextField = "dno";
        ddldno1.DataValueField = "dno";
        ddldno1.DataBind();

        DataSet dsdno2 = SqlHelper.ExecuteforDataSet("select dno from depot where dno<>'"+ddldno1.SelectedValue+"' ");
        ddldno2.DataSource = dsdno2;
        ddldno2.DataTextField = "dno";
        ddldno2.DataValueField = "dno";
        ddldno2.DataBind();

        DataSet dsgno = SqlHelper.ExecuteforDataSet("select gno,gname from goods");
        ddlgno.DataSource = dsgno;
        ddlgno.DataTextField = "gname";
        ddlgno.DataValueField = "gno";
        ddlgno.DataBind();

        txt_tno.Text = DateTime.Now.ToString("yyyyMMddhhmmssfff");
        txt_oper.Text = Session["adminName"].ToString();
        txt_odate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (!(SqlHelper.GetCount("select count(*) from stores where dno='" + ddldno1.SelectedValue + "' and gno='" + ddlgno.Text + "'") > 0))
        {
            MessageBox.Show(this, "该调出仓库里不存在该物资，请重新输入！");
            return;
        }

        if (SqlHelper.GetCount("select count(*) from depot where dno='" + ddldno2.SelectedValue + "' and lquantity<" + this.txt_quantity.Text) > 0)
        {
            MessageBox.Show(this, "该调入仓库存储空间不足，请重新输入！");
            return;
        }


        if (SqlHelper.GetCount("select count(*) from stores where dno='" + ddldno1.SelectedValue + "' and gno='" + ddlgno.Text + "' and quantity<" + txt_quantity.Text) > 0)
        {
            MessageBox.Show(this, "出库数量不能大于库存数量，请重新输入！");
            return;
        }

        string strSql2 = String.Format(@"update stores set 
                                   quantity =quantity-{0}
                                    where gno = '{1}' and dno = '{2}' ",
              txt_quantity.Text, ddlgno.SelectedValue, ddldno1.SelectedValue);

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql2.ToString());


        //存储空间相加
        SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity+" + txt_quantity.Text + " where dno='" + ddldno1.SelectedValue + "'");


        if (SqlHelper.GetCount("select count(*) from stores where dno='" + ddldno2.SelectedValue + "' and gno='" + ddlgno.Text + "'") > 0)
        {
            string strSql3 = String.Format(@"update stores set 
                                   quantity =quantity+ {0}
                                    where gno = '{1}' and dno = '{2}' ",
                     txt_quantity.Text, ddlgno.SelectedValue, ddldno2.SelectedValue);

            //提交到数据库
            SqlHelper.ExecuteNonQuery(strSql3.ToString());
        }
        else
        {
            //设置添加sql
            string strSql3 = String.Format(@"insert into stores(gno,dno,quantity)
                                values ('{0}','{1}',{2})",
                                     ddlgno.SelectedValue, ddldno2.SelectedValue, txt_quantity.Text);
            //提交到数据库
            SqlHelper.ExecuteNonQuery(strSql3.ToString());
        }

        //存储空间相减
        SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity-" + txt_quantity.Text + " where dno='" + ddldno2.SelectedValue + "'");

       //设置添加sql
       string strSql=String.Format(@"insert into trunstores(tno,dno1,dno2,gno,quantity,oper,odate)
                                values ('{0}','{1}','{2}','{3}',{4},'{5}','{6}')",
                                txt_tno.Text,ddldno1.SelectedValue,ddldno2.SelectedValue,ddlgno.SelectedValue,int.Parse (txt_quantity.Text),txt_oper.Text,txt_odate.Text);
        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "保存成功！", "Add.aspx");

    }
    protected void ddldno1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsdno2 = SqlHelper.ExecuteforDataSet("select dno from depot where dno<>'" + ddldno1.SelectedValue + "' ");
        ddldno2.DataSource = dsdno2;
        ddldno2.DataTextField = "dno";
        ddldno2.DataValueField = "dno";
        ddldno2.DataBind();
    }
}
