using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2t_connectivity.users
{
    public partial class shwo_company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();
                datalist();

                da = new SqlDataAdapter("select * from emp_tbl where Email='" + Session["admin"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["Name"].ToString();
                Label2.Text = "Welcome " + nm;
            }
            else
            {
                Response.Redirect("WebForm2.aspx");
            }
        }

        void getcon()
        {
            string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\emp_info_db.mdf;Integrated Security=True";
            con = new SqlConnection(s);
            con.Open();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void datalist()
        {
            getcon();
            da = new SqlDataAdapter("select * from Add_Company_tbl", con);

            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}