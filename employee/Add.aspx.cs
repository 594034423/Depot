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

public partial class employee_Add : System.Web.UI.Page
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
        if (SqlHelper.GetCount("select count(*) from employee where eno='" + txt_eno.Text + "' ") > 0)
        {
            MessageBox.Show(this, "�ù�����Ա����Ѵ��ڣ����������룡");
            return;
        } 
        
       //�������sql
       string strSql=String.Format(@"insert into employee(eno,pass,ename,sex,part,tel,role)
                                values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                                txt_eno.Text,txt_pass.Text,txt_ename.Text,RadioButtonList1.SelectedValue,txt_part.Text,txt_tel.Text,rdlrole.SelectedValue);
        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString());

        MessageBox.ShowAndRedirect(this, "����ɹ���", "Add.aspx");

    }
}
