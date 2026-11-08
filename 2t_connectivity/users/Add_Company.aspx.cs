using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace _2t_connectivity.users
{
    public partial class Add_Company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;
        //string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\2t_connectivity\2t_connectivity\App_Data\emp_info_db.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from emp_tbl where Email='" + Session["admin"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                nm = ds.Tables[0].Rows[0]["Name"].ToString();
                Label1.Text = "Welcome " + nm;




            }
            else
            {
                Response.Redirect("WebForm2.aspx");
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void imgupload()
        {
            fnm = "~/Comp_Images/" + fimg.FileName;
            fimg.SaveAs(Server.MapPath(fnm));
        }

        void clear() { 
            txtnm.Text = "";
            txtonm.Text = "";
            txteml.Text = "";
            txtadd.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            cmd = new SqlCommand("insert into Add_Company_tbl(Comp_Name,Comp_Owner_Name,Comp_Email,Comp_address,Comp_Cover_img) values('" + txtnm.Text + "','" + txtonm.Text + "','" + txteml.Text + "','" + txtadd.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}