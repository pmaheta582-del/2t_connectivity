using System;
using System.Collections.Generic;
using System.Configuration; // for connection string
using System.Data; // for dataset
using System.Data.SqlClient; // for connecting to sql server
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataBase.User
{
    public partial class AddProducts : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;

        string s = ConfigurationManager.ConnectionStrings["ya"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (fuProductImage.HasFile)
            {
                string dir = Server.MapPath("~/Product_Images/");
                if (!System.IO.Directory.Exists(dir))
                {
                    System.IO.Directory.CreateDirectory(dir);
                }
                fnm = "~/Product_Images/" + fuProductImage.FileName;
                fuProductImage.SaveAs(Server.MapPath(fnm));
            }
        }

        void fillcombo()
        {
            getcon();
            da = new SqlDataAdapter("select * from Add_Company_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            
            drpcid.Items.Clear();
            drpcid.Items.Add(new ListItem("-- Select Company --", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string cname = ds.Tables[0].Rows[i]["Comp_Name"].ToString();
                string cid = ds.Tables[0].Rows[i]["Comp_Id"].ToString();
                drpcid.Items.Add(new ListItem(cname, cid));
            }
        }
        void clear()
        {
            drpcid.SelectedIndex = 0;
            pnm.Text = "";
            pmdl.Text = "";
            pdecs.Text = "";
            twgt.Text = "";
            pconfi.Text = "";
            pprice.Text = "";
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            cmd = new SqlCommand("insert into Add_Products_tbl(Prod_Comp_id, Prod_Name, Prod_Price, Prod_Model, Prod_Desc, Prod_Weight, Prod_Config, Prod_Img) values('" + drpcid.SelectedValue + "','" + pnm.Text + "','" + pprice.Text + "','" + pmdl.Text + "','" + pdecs.Text + "','" + twgt.Text + "','" + pconfi.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }

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
                if (!IsPostBack)
                {
                    fillcombo();
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}