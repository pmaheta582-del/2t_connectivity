using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Runtime.Remoting.Metadata.W3cXsd2001;

namespace _2t_connectivity
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string nm;
        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\2t_connectivity\2t_connectivity\App_Data\emp_info_db.mdf;Integrated Security=True";

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null) { 
                getcon();
                da = new SqlDataAdapter("select * from emp_tbl where Email='" + Session["admin"] + "'", con); 
                ds = new DataSet(); 
                da.Fill(ds); 
                nm = ds.Tables[0].Rows[0]["Name"].ToString(); 
                Label1.Text = "Welcome " + nm; 
            } else { 
                Response.Redirect("WebForm2.aspx"); 
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}