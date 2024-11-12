using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_Database
{
    public partial class add_artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Cancel_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("all_artists.aspx");
        }
        protected void redirect(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("all_artists.aspx");
        }
       
    }
}