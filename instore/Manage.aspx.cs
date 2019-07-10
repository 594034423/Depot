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
        ddlgno.Items.Insert(0, new ListItem("---ȫ��---", ""));

        DataSet dsdno = SqlHelper.ExecuteforDataSet("select dno,dno from depot");
        ddldno.DataSource = dsdno;
        ddldno.DataTextField = "dno";
        ddldno.DataValueField = "dno";
        ddldno.DataBind();
        ddldno.Items.Insert(0, new ListItem("---ȫ��---", ""));


            BindData();
        }
    }

    /// <summary>
    /// ��
    /// </summary>
    private void BindData()
    {
        DataPage dp = new DataPage();

        //���ò�ѯ����
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

        //���������õ����������Ϣ������
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "instore a left join goods b on a.gno=b.gno", " a.*,b.gname", "ino", where, "ino desc", out recordcount);
        this.Repeater1.DataBind();
        this.AspNetPager1.RecordCount = recordcount;

    }

    /// <summary>
    /// /ɾ����¼
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void del_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument;

        //���ò�ѯSql
        string sql = string.Format("select a.*,b.gname from instore a left join goods b on a.gno=b.gno where ino='{0}'", id);

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            SqlHelper.ExecuteNonQuery(" update stores set  quantity =quantity-" + sdr["quantiy"].ToString() + " where gno = '" + sdr["gno"].ToString() + "' and dno = '" + sdr["dno"].ToString() + "'");

            //�洢�ռ����
            SqlHelper.ExecuteNonQuery(" update depot set lquantity=lquantity+" + sdr["quantiy"].ToString() + " where dno='" + sdr["dno"].ToString() + "'");
        }

        //ɾ�� 
        SqlHelper.ExecuteNonQuery(" delete from instore where ino='" + id+"'");

        //���°�
        BindData();

    }

    /// <summary>
    /// ��ҳ
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindData();
    }

    /// <summary>
    /// ����
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    

}
