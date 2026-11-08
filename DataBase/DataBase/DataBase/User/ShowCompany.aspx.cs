using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration; // for connection string
using System.Data; // for dataset
using System.Data.SqlClient; // for connecting to sql server

namespace DataBase.User
{
    public partial class ShowCompany : System.Web.UI.Page
    {
        SqlConnection con; // for connection
        SqlDataAdapter da; // for container
        DataSet ds; // for select

        string s = ConfigurationManager.ConnectionStrings["ya"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void Getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            Getcon();
            da = new SqlDataAdapter("select * from Add_Company_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}