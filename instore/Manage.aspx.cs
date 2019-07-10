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

public partial class instore_Manage : System.Web.UI.Page
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
        ddlgno.Items.Insert(0, new ListItem("---全部---", ""));

        DataSet dsdno = SqlHelper.ExecuteforDataSet("select dno,dno from depot");
        ddldno.DataSource = dsdno;
        ddldno.DataTextField = "dno";
        ddldno.DataValueField = "dno";
        ddldno.DataBind();
        ddldno.Items.Insert(0, new ListItem("---全部---", ""));


            BindData();
        }
    }

    /// <summary>
    /// 绑定
    /// </summary>
    private void BindData()
    {
        DataPage dp = new DataPage();

        //设置查询条件
        string where = "  1=1  ";

        if (txt_ino.Text != "")
        {
            where += " and ino like '%" + txt_ino.Text + "%' ";
        }
        if (ddlgno.SelectedValue!= "")
        {
            where += " and a.gno='" + ddlgno.SelectedValue + "' ";
        }
        if (ddldno.SelectedValue!= "")
        {
            where += " and dno='" + ddldno.SelectedValue + "' ";
        }

        int recordcount;
        int pagesize = this.AspNetPager1.PageSize;
        int pageindex = this.AspNetPager1.CurrentPageIndex;

        //根据条件得到物资入库信息，并绑定
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "instore a left join goods b on a.gno=b.gno", " a.*,b.gname", "ino", where, "ino desc", out recordcount);
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
        string sql = string.Format("select a.*,b.gname from instore a left join goods b on a.gno=b.gno where ino='{0}'", id);

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            SqlHelper.ExecuteNonQuery(" update stores set  quantity =quantity-" + sdr["quantiy"].ToString() + " where gno = '" + sdr["gno"].ToString() + "' and dno = '" + sdr["dno"].ToString() + "'");

            //存储空间相减
            SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity+" + sdr["quantiy"].ToString() + " where dno='" + sdr["dno"].ToString() + "'");
        }

        //删除 
        SqlHelper.ExecuteNonQuery(" delete from instore where ino='" + id+"'");

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
