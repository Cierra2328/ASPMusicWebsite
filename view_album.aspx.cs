using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_Database
{
    public partial class view_album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string album_id = Request.QueryString["album_id"];
            Convert.ToInt32(album_id);
            albums.SelectCommand = "SELECT album_name, artists.artist_id, record_label, albums.genre_id, release_date, notable_fact, stage_name, genre, albums.album_id FROM albums JOIN artists ON albums.artist_id = artists.artist_id JOIN genres ON albums.genre_id = genres.genre_id WHERE albums.album_id= " + album_id;
            artists.SelectCommand = "SELECT artist_id, stage_name FROM artists";
            songs.SelectCommand = "SELECT song_id, song_name, writer_name, length_in_seconds, highest_billboard_ranking, songs.album_id FROM songs JOIN albums ON songs.album_id = albums.album_id WHERE songs.album_id= " + album_id;
        }

    
        protected void deleteEnd(object sender, DetailsViewDeletedEventArgs e)
        {

            Response.Redirect("all_albums.aspx");
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

        protected void update()
        {
           
        }
    }
}