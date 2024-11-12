<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all_albums.aspx.cs" Inherits="Music_Database.all_albums" %>

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
        
    &nbsp;<div class= "space-header"></div>All Albums<asp:ImageButton ID="add_album_btn" CssClass="add-button" title="Add Album" runat="server" ImageUrl="plus-circle-fill.svg" OnClick="AddAlbum_Click" />

 </h1>
    <div>
       
    <asp:GridView CssStyle="width=95%" ID="artists" DataSourceID="music" runat="server" AutoGenerateColumns="False" AllowSorting="True" CssClass="tabs" DataKeyNames="artist_id" AutoPostBack="true" Width="95%">
     <Columns>
         <asp:TemplateField HeaderText="Album Name" SortExpression="album_name">
             
             <ItemTemplate>
                 <asp:Label ID="album_name" runat="server" Text='<%# Bind("album_name") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Artist" SortExpression="stage_name">
    
    <ItemTemplate>
        <asp:Label ID="stage_name" runat="server" Text='<%# Bind("stage_name") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
         
         <asp:TemplateField HeaderText="Record Label" SortExpression="record_label">
    
    <ItemTemplate>
        <asp:Label ID="age" runat="server" Text='<%# Bind("record_label") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
         <asp:TemplateField HeaderText="Genre" SortExpression="genre">
    
    <ItemTemplate>
        <asp:Label ID="genre" runat="server" Text='<%# Bind("genre") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
                  <asp:TemplateField HeaderText="Release Date" SortExpression="release_date">
    
    <ItemTemplate>
        <asp:Label ID="release_date" runat="server" Text='<%# Bind("release_date", "{0:MM/dd/yyyy}") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
         <asp:TemplateField HeaderText="Notable Fact" SortExpression="notable_fact">
             <ItemTemplate>
        <asp:Label ID="notable_fact" runat="server" Text='<%# Bind("notable_fact") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10px">
        <ItemTemplate>
            <asp:Button runat="server" CssClass="view-song-button" Text="View Album" CommandName="ViewAlbum" CommandArgument='<%# Eval("album_id") %>' OnCommand="ViewAlbum_Command"/>
        </ItemTemplate>
    </asp:TemplateField>


                    </Columns>
                </asp:GridView>
                 <asp:SqlDataSource ID="music" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                SelectCommand="SELECT album_id, album_name, albums.artist_id, record_label, albums.genre_id, release_date, notable_fact, stage_name, genre 
                        FROM albums JOIN artists ON albums.artist_id = artists.artist_id JOIN genres ON albums.genre_id = genres.genre_id">

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

