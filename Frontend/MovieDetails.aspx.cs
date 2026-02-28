using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Frontend
{
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic
        }

        // THIS IS THE METHOD THAT WAS MISSING
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Sync the FormView to the row selected in the GridView
            FormView1.PageIndex = GridView1.SelectedIndex;
            FormView1.DataBind();
        }
    }
}