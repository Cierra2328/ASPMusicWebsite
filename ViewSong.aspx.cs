using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web.Configuration;


namespace Music_Database
{

    public partial class ViewSong : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
                string song_id = Request.QueryString["songId"];
                Convert.ToInt32(song_id);
                artists.SelectCommand = "SELECT artist_id, stage_name FROM artists";
                album_listing.SelectCommand = "SELECT album_id, album_name FROM albums";
                song.SelectCommand = "SELECT song_name, albums.album_name, writer_name, song_id, albums.album_id, stage_name,length_in_seconds, comments, highest_billboard_ranking, date_of_billboard_ranking, artists.artist_id FROM songs JOIN albums on songs.album_id = albums.album_id JOIN artists ON songs.artist_id = artists.artist_id WHERE song_id=" + song_id;
        }
        

        protected void deleteEnd(object sender, DetailsViewDeletedEventArgs e)
        {

            Response.Redirect("all_songs.aspx");
        }


    }
}