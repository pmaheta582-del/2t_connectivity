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
    public partial class addtocart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["ya"].ConnectionString;
        int uid = 1;

        void getcon()
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
                fillcartgrid();
            }
        }

        void fillcartgrid()
        {
            getcon();
            da = new SqlDataAdapter("select p.prod_name, p.prod_price, " + "p.prod_img, c.quantity, c.quantity as Cart_Quantity, c.cart_id, c.cart_prod_id from Add_Products_tbl p" + " Inner Join cart_tbl c" + " ON p.prod_Id = c.cart_prod_Id " + "where cart_user_id='" + uid + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal total = 0;
            foreach (DataRow drow in ds.Tables[0].Rows)
            {
                decimal price = Convert.ToDecimal(drow["prod_price"]);
                int quantity = Convert.ToInt32(drow["quantity"]);
                total += price * quantity;
            }
            Label5.Text = "Total: ₹" + total;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillcartgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int prdid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            DropDownList ddlqty = (DropDownList)row.FindControl("DropDownList1");
            int qty = int.Parse(ddlqty.SelectedValue);

            getcon();

            cmd = new SqlCommand("update cart_tbl set " + "quantity = '" + qty + "' where cart_prod_id = '" + prdid + "' AND cart_user_id = '" + uid + "'", con);
            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1; // reset to default view
            fillcartgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillcartgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int prdid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            getcon();
            cmd = new SqlCommand("delete from cart_tbl where cart_prod_id = '" + prdid + "' AND cart_user_id = '" + uid + "'", con);
            cmd.ExecuteNonQuery();
            fillcartgrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del" || e.CommandName == "cmd_remove" || e.CommandName == "Remove")
            {
                int prdid = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("delete from cart_tbl where cart_prod_id = '" + prdid + "' AND cart_user_id = '" + uid + "'", con);
                cmd.ExecuteNonQuery();
                fillcartgrid();
            }
        }
    }
}