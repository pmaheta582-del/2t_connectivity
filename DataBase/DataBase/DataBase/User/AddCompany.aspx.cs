using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  DataBase.User
{
    public partial class AddCompany : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;
        string s = ConfigurationManager.ConnectionStrings["ya"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from emp_tbl where Email='" + Session["admin"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["Name"].ToString();
                    Label1.Text = "Welcome " + nm;
                }

            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void imgupload()
        {
            if (fimg.HasFile)
            {
                string dir = Server.MapPath("~/Comp_Images/");
                if (!System.IO.Directory.Exists(dir))
                {
                    System.IO.Directory.CreateDirectory(dir);
                }
                fnm = "~/Comp_Images/" + fimg.FileName;
                fimg.SaveAs(Server.MapPath(fnm));
            }
        }



        void clear()
        {
            txtnm.Text = "";
            txtonm.Text = "";
            txteml.Text = "";
            txtadd.Text = "";
        }


        protected void btnAddCompany_Click(object sender, EventArgs e)
        {

            getcon();
            imgupload();
            cmd = new SqlCommand("insert into Add_Company_tbl(Comp_Name,Comp_Owner_Name,Comp_Email,Comp_address,Comp_Cover_img) values('" + txtnm.Text + "','" + txtonm.Text + "','" + txteml.Text + "','" + txtadd.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            clear();



        }
    }
}