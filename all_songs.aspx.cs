using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Runtime.Remoting.Metadata.W3cXsd2001;

namespace Music_Database
{
    public partial class all_songs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        protected void AddSong_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("add_song.aspx");
        }


    }
}
        

