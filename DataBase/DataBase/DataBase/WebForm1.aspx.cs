using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// add new namespace for db 
using System.Data.SqlClient;// for connecting to sql server
using System.Data; // for dataset
using System.Configuration;// for connection string

namespace DataBase
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con; // for connection
        SqlDataAdapter da;// for container
        DataSet ds;//for select
        SqlCommand cmd;// inmsert , update , delete

        string fnm;

        string s = ConfigurationManager.ConnectionStrings["ya"].ConnectionString;
        string a = "path";
        protected void Page_Load(object sender, EventArgs e)
        {
            Getcon();
            fillgrid();
        }

        void Getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void imgupload()
        {
            if (FileUpload1.HasFile)
            {
                string dir = Server.MapPath("~/images/");
                if (!System.IO.Directory.Exists(dir))
                {
                    System.IO.Directory.CreateDirectory(dir);
                }
                fnm = "~/images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(fnm));
            }
            else if (ViewState["oldimg"] != null)
            {
                fnm = ViewState["oldimg"].ToString();
            }
        }
        void clear()
        {
            txtnm.Text = "";
            rdbgen.SelectedIndex = -1;
            txtemil.Text = "";
            txtpass.Text = "";
            DropDownList1.SelectedIndex = -1;
            txtadd.Text = "";
            txtmob.Text = "";
            ViewState["oldimg"] = null;
        }
        void fillgrid()
        {
            Getcon();
            da = new SqlDataAdapter("select * from emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        void filldata() // paring
        {
            Getcon();
            da = new SqlDataAdapter("select * from emp_tbl where ID = '" + ViewState["Id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            // paring

            txtnm.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txtemil.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtpass.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            
            string city = ds.Tables[0].Rows[0]["City"].ToString();
            if (DropDownList1.Items.FindByText(city) != null)
            {
                DropDownList1.ClearSelection();
                DropDownList1.Items.FindByText(city).Selected = true;
            }

            txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            txtmob.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
            if (ds.Tables[0].Rows[0]["Gender"].ToString() == "Male")
            {
                rdbgen.SelectedValue = "Male";
            }
            else
            {
                rdbgen.SelectedValue = "Female";
            }
            ViewState["oldimg"] = ds.Tables[0].Rows[0]["Image"].ToString();
        }
       

        

        protected void btnsub_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Submit")
            {
                imgupload();
                Getcon();
                cmd = new SqlCommand("insert into emp_tbl(Name,Gender,Email,City,Address,Mobile,Image,Password)values('" + txtnm.Text + "','" + rdbgen.SelectedItem.Text + "','" + txtemil.Text + "','" + DropDownList1.SelectedItem.Text + "','" + txtadd.Text + "','" + txtmob.Text + "','" + fnm + "','" + txtpass.Text + "')", con);
                cmd.ExecuteNonQuery();
                clear();
                fillgrid();
                // insert
            }
            else
            {
                // Update 
                imgupload();
                Getcon();
                cmd = new SqlCommand("update emp_tbl set Name='" + txtnm.Text + "',Gender='" + rdbgen.SelectedItem.Text + "',Email='" + txtemil.Text + "',City='" + DropDownList1.SelectedItem.Text + "',Address='" + txtadd.Text + "',Mobile='" + txtmob.Text + "',Image='" + fnm + "',Password='" + txtpass.Text + "' where Id=" + ViewState["Id"], con);
                cmd.ExecuteNonQuery();
                fillgrid();
                clear();

                Button1.Text = "Submit";

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["Id"] = id;
                Button1.Text = "Update";
                filldata();

            }
            else
            {
                Getcon();
                cmd = new SqlCommand("delete from emp_tbl where Id=" + e.CommandArgument, con);
                cmd.ExecuteNonQuery();
                fillgrid();

                //delete code 
            }
        }
    }
}


