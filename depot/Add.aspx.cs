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

public partial class depot_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {   
        //��֤�Ƿ��Ѿ�����
        if (SqlHelper.GetCount("select count(*) from depot where dno='" + txt_dno.Text + "' ") > 0)
        {
            MessageBox.Show(this, "�òֿ����Ѵ��ڣ����������룡");
            return;
        }
 
        
       //�������sql
       string strSql=String.Format(@"insert into depot(dno,dquantity,lquantity)
                                values ('{0}',{1},{2})",
                                txt_dno.Text,int.Parse (txt_dquantity.Text),txt_dquantity.Text);
        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "����ɹ���", "Add.aspx");

    }
}
