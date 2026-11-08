using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataBase.User
{
    public partial class ShowProducts : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["ya"].ConnectionString;
        int uid = 1;

        void Getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                int.TryParse(Session["uid"].ToString(), out uid);
            }

            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        void BindProducts()
        {
            Getcon();
            string query = "SELECT p.*, c.Comp_Name FROM Add_Products_tbl p INNER JOIN Add_Company_tbl c ON p.Prod_Comp_id = c.Comp_Id";
            
            if (Request.QueryString["cid"] != null && Request.QueryString["cid"].ToString() != "")
            {
                string cid = Request.QueryString["cid"].ToString();
                query += " WHERE p.Prod_Comp_id = " + cid;

                SqlCommand cmd = new SqlCommand("SELECT Comp_Name FROM Add_Company_tbl WHERE Comp_Id = " + cid, con);
                object cname = cmd.ExecuteScalar();
                if (cname != null)
                {
                    lblTitle.Text = cname.ToString() + " Mobile Phones & Products";
                }
                else
                {
                    lblTitle.Text = "Mobile Phones & Products";
                }
            }
            else
            {
                lblTitle.Text = "All Mobile Products & Photos";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataListProducts.DataSource = ds;
                DataListProducts.DataBind();
                DataListProducts.Visible = true;
                lblNoData.Visible = false;
            }
            else
            {
                DataListProducts.Visible = false;
                lblNoData.Visible = true;
            }
        }

        protected void DataListProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_vdtl" || e.CommandName == "ViewDetail")
            {
                int pid = Convert.ToInt32(e.CommandArgument);
                ViewState["pid"] = pid;
                Response.Redirect("view details.aspx?pid=" + ViewState["pid"]);
            }
            else
            {
                int prodid = Convert.ToInt32(e.CommandArgument);
                ViewState["prodid"] = prodid;
                Getcon();
                int quantity = 1;
                cmd = new SqlCommand("insert into cart_tbl" + "(cart_user_id, cart_prod_id, quantity, AddedDate)" + " values('" + uid + "', '" + ViewState["prodid"] + "', '" + quantity + "', GetDate())", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("addtocart.aspx");
            }
        }
    }
}
