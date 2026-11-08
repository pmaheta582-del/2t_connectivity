using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace _2t_connectivity
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int i;
        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\2t_connectivity\2t_connectivity\App_Data\emp_info_db.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open(); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(TextBox1.Text)) && !(string.IsNullOrEmpty(TextBox2.Text))) { 
                cmd = new SqlCommand("select count(*) from emp_tbl where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'", con); 
                i = Convert.ToInt32(cmd.ExecuteScalar()); 
                if (i > 0) { 
                    Session["admin"] = TextBox1.Text; 
                    Response.Redirect("WebForm3.aspx"); 
                } 
                else { 
                    Response.Write("Invalid Email or Password"); 
                } 
            }
        }
    }
}