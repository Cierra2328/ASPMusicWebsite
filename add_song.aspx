<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_song.aspx.cs" Inherits="Music_Database.add_song" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Personal Music Collection</title>
    <link rel="stylesheet" href="main.css"/>
    <link rel="icon" runat="server" href="music.png" type="image/png"/>
    <link rel="shortcut icon" runat="server" href="music.png" type="image/png"/>

    <script type="text/javascript">
        function validateForm() {
        var songName = document.getElementById('<%= song_details_view.FindControl("song_name").ClientID %>').value;
        var lengthText = document.getElementById('<%= song_details_view.FindControl("length_in_seconds").ClientID %>').value;
        var writerText = document.getElementById('<%= song_details_view.FindControl("writer_name").ClientID %>').value;

            if (songName.trim() === "") {
                alert("Please enter a song name.");
                return false;
            }
            if (lengthText.trim() === "") {
                alert("Please enter song length in seconds.");
                return false;
            }
            if (writerText.trim() === "") {
                alert("Please enter a songwriter.");
                return false;
            }

            return true; 
        }
    </script>
   
</head>
<body>
    <form id="add_song" runat="server">   
<nav>
    <div class = "nav_bar" style = "width: 100%;">
<a href="home.aspx">
        <img id="logo" src="music.png" alt="Logo" style = "height:100px; width: 100px; float: left;"/>
    </a>
    <a class="active" href="home.aspx">Home</a>
    <a href="all_songs.aspx">Songs</a>
    <a href="all_artists.aspx">Artists</a>
    <a href="all_albums.aspx">Albums</a>
    </nav>
    </div>
<div class = "space">
    <p style = "color: transparent;"> bro</p>
</div>
        <main>
<div class="body">
<h1 class="details-header">
        
    &nbsp;<div class= "space-header"></div>Add Song</h1>
         <asp:DetailsView ID="song_details_view" runat="server" DefaultMode="Insert" AutoGenerateRows="False" CssClass="body-add" DataSourceID="song" DataKeyNames="song_id" OnItemInserted="redirect">            
                <FieldHeaderStyle Font-Bold="True" />
<Fields>
    <asp:TemplateField HeaderText="Song Name:" InsertVisible="true">
        
        <InsertItemTemplate>
            <asp:Textbox ID="song_name" runat="server" CssClass="textbox" Text='<%# Bind("song_name") %>'></asp:Textbox>
        </InsertItemTemplate>
    </asp:TemplateField>

<asp:TemplateField HeaderText="Artist Name:">
    <InsertItemTemplate>
    <asp:DropDownList ID="artist_id" runat="server" DataSourceID="artists" DataTextField="stage_name" DataValueField="artist_id" CssClass="drop-down" SelectedValue='<%# Bind("artist_id") %>'>
    </asp:DropDownList>
</InsertItemTemplate>
    

</asp:TemplateField>
     <asp:TemplateField HeaderText="Album Name:">
     <InsertItemTemplate>
         <asp:DropDownList ID="album_id" runat="server" DataSourceID="album_listing" DataTextField="album_name" DataValueField="album_id" CssClass="drop-down" SelectedValue='<%# Bind("album_id") %>'>
         </asp:DropDownList>
     </InsertItemTemplate>
     

 </asp:TemplateField>
    <asp:TemplateField HeaderText="Length in Seconds:">
        <EditItemTemplate>
            <asp:TextBox ID="length_in_seconds" CssClass="textbox" runat="server" Text='<%# Bind("length_in_seconds") %>'></asp:TextBox>
        </EditItemTemplate>                      
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Highest Billboard Ranking:" >

    <InsertItemTemplate>
        <asp:TextBox ID="highest_billboard_ranking" runat="server" CssClass="textbox" Text='<%# Bind("highest_billboard_ranking") %>'></asp:TextBox>
    </InsertItemTemplate>
       
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Billboard Ranking Date:">
        <InsertItemTemplate>
            <asp:TextBox ID="date_of_billboard_ranking" CssClass="textbox" runat="server" Text='<%# Bind("date_of_billboard_ranking") %>' ></asp:TextBox>
        </InsertItemTemplate>              
        
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Songwriter(s):">
        <InsertItemTemplate>
            <asp:TextBox ID="writer_name" CssClass="textbox" runat="server" Text='<%# Bind("writer_name") %>'></asp:TextBox>
        </InsertItemTemplate>               
        
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Comments">
        <InsertItemTemplate>
            <asp:TextBox ID="comments" CssClass="textbox" runat="server" Height="5em" TextMode="MultiLine" Text='<%# Bind("comments") %>'></asp:TextBox>
        </InsertItemTemplate>                
       
    </asp:TemplateField>
    <asp:TemplateField>
     <ItemTemplate>
        <asp:LinkButton  ID="InsertBtn" CssClass="button" runat="server" CausesValidation="False" 
            CommandName="Insert" Text="Add Song" OnClientClick="return validateForm();"></asp:LinkButton>
             </ItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField>
  <ItemTemplate>
     <asp:LinkButton  ID="CancelBtn" CssClass="button" runat="server" CausesValidation="False" 
         CommandName="Cancel" Text="Cancel" OnCommand="Cancel_Command"></asp:LinkButton>
          </ItemTemplate>
 </asp:TemplateField>
    </Fields>

         
    
                    
      </asp:DetailsView>
    <asp:SqlDataSource ID="song" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
     InsertCommand="INSERT INTO songs VALUES(@song_name, @artist_id, @album_id, @length_in_seconds, @comments, @highest_billboard_ranking, @date_of_billboard_ranking, @writer_name)">  
</asp:SqlDataSource>
    <asp:SqlDataSource ID="album_listing" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
    SelectCommand="SELECT album_name, album_id FROM albums">
</asp:SqlDataSource>
            <asp:SqlDataSource ID="artists" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
    SelectCommand="SELECT artist_id, stage_name FROM artists">
</asp:SqlDataSource>

        <div>
        </div>
    </main>
    </form>
            <footer>
    <p class='footer'>Cierra Mardis 2023</p>
</footer>
</body>
</html>
