using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class trunstores_Manage : System.Web.UI.Page
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
        ddldno1.Items.Insert(0, new ListItem("---全部---", ""));

        DataSet dsdno2 = SqlHelper.ExecuteforDataSet("select dno from depot");
        ddldno2.DataSource = dsdno1;
        ddldno2.DataTextField = "dno";
        ddldno2.DataValueField = "dno";
        ddldno2.DataBind();
        ddldno2.Items.Insert(0, new ListItem("---全部---", ""));

        DataSet dsgno = SqlHelper.ExecuteforDataSet("select gno,gname from goods");
        ddlgno.DataSource = dsgno;
        ddlgno.DataTextField = "gname";
        ddlgno.DataValueField = "gno";
        ddlgno.DataBind();
        ddlgno.Items.Insert(0, new ListItem("---全部---", ""));


            BindData();
        }
    }

    /// <summary>
    /// 绑定
    /// </summary>
    private void BindData()
    {
        DataPage dp = new DataPage();
        string where = "  1=1  ";

        if (txt_tno.Text != "")
        {
            where += " and tno like '%" + txt_tno.Text + "%' ";
        }

        if (ddldno1.SelectedValue!= "")
        {
            where += " and dno1='" + ddldno1.SelectedValue + "' ";
        }

        if (ddldno2.SelectedValue != "")
        {
            where += " and dno2='" + ddldno2.SelectedValue + "' ";
        }

        if (ddlgno.SelectedValue!= "")
        {
            where += " and a.gno='" + ddlgno.SelectedValue + "' ";
        }



        int recordcount;
        int pagesize = this.AspNetPager1.PageSize;
        int pageindex = this.AspNetPager1.CurrentPageIndex;
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "trunstores a left join goods b on a.gno=b.gno ", " a.*,b.gname", "tno", where, "tno desc", out recordcount);
        this.Repeater1.DataBind();
        this.AspNetPager1.RecordCount = recordcount;

    }

    /// <summary>
    /// /删除记录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void del_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument;

        //设置查询Sql
        string sql = string.Format("select a.* from trunstores a left join depot b on a.dno1=b.dno where tno='{0}'", id);

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            SqlHelper.ExecuteNonQuery(" update stores set  quantity =quantity+" + sdr["quantity"].ToString() + " where gno = '" + sdr["gno"].ToString() + "' and dno = '" + sdr["dno1"].ToString() + "'");

            //存储空间相减
            SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity+" + sdr["quantity"].ToString() + " where dno='" + sdr["dno1"].ToString() + "'");

            SqlHelper.ExecuteNonQuery(" update stores set  quantity =quantity-" + sdr["quantity"].ToString() + " where gno = '" + sdr["gno"].ToString() + "' and dno = '" + sdr["dno2"].ToString() + "'");

            //存储空间相减
            SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity+" + sdr["quantity"].ToString() + " where dno='" + sdr["dno2"].ToString() + "'");
        }

        //删除 
        SqlHelper.ExecuteNonQuery(" delete from trunstores where tno='" + id+"'");

        //重新绑定
        BindData();

    }

    /// <summary>
    /// 分页
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindData();
    }

    /// <summary>
    /// 搜索
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    

}
