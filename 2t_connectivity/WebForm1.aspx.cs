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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm;
        //string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\2t_connectivity\2t_connectivity\App_Data\emp_info_db.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillGrid();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "images/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(fnm));
        }

        void clear()
        {
            TextBox1.Text = "";
            RadioButtonList1.SelectedIndex = -1;
            TextBox2.Text = "";
            DropDownList1.SelectedIndex = -1;
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Save")
            {
                getcon();
                imgupload();
                cmd = new SqlCommand("insert into emp_tbl(Name , Gender , Email ,Password, City , Address , Mobile , Image) values('" + TextBox1.Text + "','" + RadioButtonList1.SelectedValue + "','" + TextBox2.Text + "','"+TextBox5.Text+"','" + DropDownList1.SelectedValue + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clear();
                fillGrid();
            }
            else
            {
                getcon();
                cmd = new SqlCommand("update emp_tbl set Name='" + TextBox1.Text + "',Gender='" + RadioButtonList1.SelectedValue+ "',Email='" + TextBox2.Text + "',City='" + DropDownList1.SelectedValue + "',Address='" + TextBox3.Text + "',Mobile='" + TextBox4.Text + "',Image='" + fnm + "' where Id='" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
                clear();
                Button1.Text = "Save";
            }
        }


        void fillGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from emp_tbl where Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0][3].ToString();
            TextBox3.Text = ds.Tables[0].Rows[0][5].ToString();
            TextBox4.Text = ds.Tables[0].Rows[0][6].ToString();
            DropDownList1.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            if (ds.Tables[0].Rows[0]["Gender"].ToString() == "Male")
            {
                RadioButtonList1.SelectedValue = "Male";
            }
            else
            {
                RadioButtonList1.SelectedValue = "Female";
            }

        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update";
                filldata();
            }
            else
            {
                getcon();
                cmd = new SqlCommand("delete from emp_tbl where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }
    }
}