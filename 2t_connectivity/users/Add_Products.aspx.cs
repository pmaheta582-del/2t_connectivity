using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2t_connectivity.users
{
    public partial class Add_Products : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\2t_connectivity\2t_connectivity\App_Data\emp_info_db.mdf;Integrated Security=True";

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "~/Product_Images/" + fimg.FileName;
            fimg.SaveAs(Server.MapPath(fnm));
        }

        void fillcombo()
        {
            getcon();

            da = new SqlDataAdapter("select * from Add_Company_tbl", con);

            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpcid.Items.Add(
                    new ListItem(
                        ds.Tables[0].Rows[i]["Comp_Name"].ToString(),
                        ds.Tables[0].Rows[i]["Comp_Id"].ToString()
                    )
                );
            }

            con.Close();
        }

        void clear()
        {
            drpcid.SelectedIndex = 0;
            pnm.Text = "";
            pmdl.Text = "";
            pdecs.Text = "";
            twgt.Text = "";
            pconfi.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();

            imgupload();

            cmd = new SqlCommand(
                "insert into Add_Products_tbl(Prod_Comp_id, Prod_Name, Prod_Model, Prod_Desc, Prod_Weight, Prod_Config, Prod_Img) values('" +
                drpcid.SelectedValue + "','" +
                pnm.Text + "','" +
                pmdl.Text + "','" +
                pdecs.Text + "','" +
                twgt.Text + "','" +
                pconfi.Text + "','" +
                fnm + "')",
                con
            );

            cmd.ExecuteNonQuery();

            con.Close();

            clear();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("shwo_company.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();

                da = new SqlDataAdapter(
                    "select * from emp_tbl where Email='" + Session["admin"].ToString() + "'",
                    con
                );

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["Name"].ToString();
                    Label1.Text = "Welcome " + nm;
                }

                con.Close();

                if (!IsPostBack)
                {
                    fillcombo();
                }
            }
            else
            {
                Response.Redirect("WebForm2.aspx");
            }
        }
    }
}