using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_Database
{
    public partial class all_artists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        
        protected void AddArtist_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("add_artist.aspx");
        }

        protected void ViewArtist_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ViewArtist")
            {
                int artist_id;
                if (int.TryParse(e.CommandArgument.ToString(), out artist_id))
                {
                    Response.Redirect("view_artist.aspx?artist_id=" + artist_id);
                }
            }
        }
    }
}