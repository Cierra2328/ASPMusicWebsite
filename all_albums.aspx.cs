using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_Database
{
    public partial class all_albums : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ViewAlbum_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ViewAlbum")
            {
                int album_id;
                if (int.TryParse(e.CommandArgument.ToString(), out album_id))
                {
                    Response.Redirect("view_album.aspx?album_id=" + album_id);
                }
            }
        }
        protected void AddAlbum_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("add_album.aspx");
        }
    }
}