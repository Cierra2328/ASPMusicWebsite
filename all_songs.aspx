<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all_songs.aspx.cs" Inherits="Music_Database.all_songs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
 <title>Personal Music Collection</title>
    <link rel="stylesheet" href="main.css"/>
    <link rel="icon" runat="server" href="music.png" type="image/png"/>
    <link rel="shortcut icon" runat="server" href="music.png" type="image/png"/>
</head>
<body>
    <form id="form1" runat="server">   
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
<h1 class="table_header">
        
    &nbsp;<div class= "space-header"></div>All Songs<asp:ImageButton ID="add_song_btn" CssClass="add-button" title="Add Song" runat="server" ImageUrl="plus-circle-fill.svg" OnClick="AddSong_Click" />

 </h1>
    <div>
       
    <asp:GridView CssStyle="width=95%" ID="songs" DataSourceID="music" runat="server" AutoGenerateColumns="False" AllowSorting="True" CssClass="tabs" DataKeyNames="song_id,album_id" AutoPostBack="true" Width="95%">
     <Columns>
         <asp:TemplateField HeaderText="Song" SortExpression="song_name">
             
             <ItemTemplate>
                 <asp:Label ID="songLbl" runat="server" Text='<%# Bind("song_name") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>
         
         <asp:TemplateField HeaderText="Album" SortExpression="album_name">
             
             <ItemTemplate>
                 <asp:Label ID="album_names" runat="server" Text='<%# Bind("album_name") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Songwriter" SortExpression="writer_name">
            
             <ItemTemplate>
                 <asp:Label ID="writerLbl" runat="server" Text='<%# Bind("writer_name") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10px">
        <ItemTemplate>
            <asp:Button runat="server" CssClass="view-song-button" Text="View Song" CommandName="ViewSong" CommandArgument='<%# Eval("song_id") %>' OnCommand="ViewSong_Command"/>
        </ItemTemplate>
    </asp:TemplateField>


                    </Columns>
                </asp:GridView>
                 <asp:SqlDataSource ID="music" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
     SelectCommand="SELECT song_name, albums.album_name, writer_name, song_id, albums.album_id, stage_name,length_in_seconds, comments, highest_billboard_ranking, date_of_billboard_ranking, artists.artist_id FROM songs JOIN albums on songs.album_id = albums.album_id JOIN artists ON songs.artist_id = artists.artist_id">
</asp:SqlDataSource>
        <asp:SqlDataSource ID="artistDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
    SelectCommand="SELECT artist_id, stage_name FROM artists">
</asp:SqlDataSource>
                <asp:SqlDataSource ID="album_listing" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
    SelectCommand="SELECT album_name, album_id FROM albums">
</asp:SqlDataSource>

        </div>

</div>
</main>
        <footer>
    <p class='footer'>Cierra Mardis 2023</p>
</footer>
    </form>
</body>
</html>
