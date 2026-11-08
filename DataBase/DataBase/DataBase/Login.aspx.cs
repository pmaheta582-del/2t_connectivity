using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;// for connecting to sql server
using System.Data; // for dataset
using System.Configuration;// for connection string

namespace DataBase
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con; // for connection
        SqlDataAdapter da;// for container
        DataSet ds;//for select
        SqlCommand cmd;// inmsert , update , delete

        string nm;
        int i;

        string s = ConfigurationManager
            .ConnectionStrings["ya"]
            .ConnectionString;
        string a = "path";
        protected void Page_Load(object sender, EventArgs e)
        {
            Getcon();
            
        }

        void Getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        


        
        

          


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!(String.IsNullOrEmpty(TextBox1.Text)) && !(string.IsNullOrEmpty(TextBox2.Text)))
            {
                Getcon();
                da = new SqlDataAdapter("select * from emp_tbl where (Email='" + TextBox1.Text + "' or Name='" + TextBox1.Text + "') and Password='" + TextBox2.Text + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["uid"] = ds.Tables[0].Rows[0]["Id"].ToString();
                    Session["admin"] = ds.Tables[0].Rows[0]["Email"].ToString();
                    Response.Redirect("User/AddCompany.aspx");
                }
                else
                {
                    Label6.Text = "Invalid Username & Password";
                    Label6.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Label6.Text = "Please enter Username and Password";
                Label6.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}