using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_Database
{
    public partial class view_artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string artist_id = Request.QueryString["artist_id"];
            Convert.ToInt32(artist_id);
            artist.SelectCommand = "SELECT * FROM artists WHERE artist_id= " + artist_id;
            songs.SelectCommand = "SELECT song_name, song_id, artist_id FROM songs WHERE artist_id= " + artist_id;

        }

        protected void deleteEnd(object sender, DetailsViewDeletedEventArgs e)
        {

            Response.Redirect("all_artists.aspx");
        }

        protected void ViewSong_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ViewSong")
            {
                int songId;
                if (int.TryParse(e.CommandArgument.ToString(), out songId))
                {
                    Response.Redirect("ViewSong.aspx?songId=" + songId);
                }
            }
        }
    }


}