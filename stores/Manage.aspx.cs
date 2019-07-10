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

public partial class stores_Manage : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

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

        if (txt_gno.Text != "")
        {
            where += " and gno like '%" + txt_gno.Text + "%' ";
        }

        if (txt_dno.Text != "")
        {
            where += " and dno like '%" + txt_dno.Text + "%' ";
        }

        int recordcount;
        int pagesize = this.AspNetPager1.PageSize;
        int pageindex = this.AspNetPager1.CurrentPageIndex;

        //根据条件得到库存信息，并绑定
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "stores a left join goods b on a.gno=b.gno ", " a.*,gname,gtype ", "sid", where, "sid desc", out recordcount);
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

        //删除 
        SqlHelper.ExecuteNonQuery(" delete from stores where sid=" + id);

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
