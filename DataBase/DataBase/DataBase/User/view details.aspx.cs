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
    public partial class view_details : System.Web.UI.Page
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
                if (Request.QueryString["pid"] != null && Request.QueryString["pid"].ToString() != "")
                {
                    string pid = Request.QueryString["pid"].ToString();
                    Getcon();
                    da = new SqlDataAdapter("SELECT * FROM Add_Products_tbl WHERE Prod_Id = " + pid, con);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Label1.Text = ds.Tables[0].Rows[0]["Prod_Name"].ToString();
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                    }
                    else
                    {
                        Label1.Text = "Product not found";
                    }
                }
                else
                {
                    Label1.Text = "No product selected";
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
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
