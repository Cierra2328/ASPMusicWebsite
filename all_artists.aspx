<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all_artists.aspx.cs" Inherits="Music_Database.all_artists" %>

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
        
    &nbsp;<div class= "space-header"></div>All Artists<asp:ImageButton ID="add_artist_btn" CssClass="add-button" title="Add Artist" runat="server" ImageUrl="plus-circle-fill.svg" OnClick="AddArtist_Click" />

 </h1>
    <div>
       
    <asp:GridView CssStyle="width=95%" ID="artists" DataSourceID="music" runat="server" AutoGenerateColumns="False" AllowSorting="True" CssClass="tabs" DataKeyNames="artist_id" AutoPostBack="true" Width="95%">
     <Columns>
         <asp:TemplateField HeaderText="Stage Name" SortExpression="stage_name">
             
             <ItemTemplate>
                 <asp:Label ID="stage_name" runat="server" Text='<%# Bind("stage_name") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Birth Name" SortExpression="birth_name">
    
    <ItemTemplate>
        <asp:Label ID="birth_name" runat="server" Text='<%# Bind("birth_name") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
         
         <asp:TemplateField HeaderText="Age" SortExpression="age">
    
    <ItemTemplate>
        <asp:Label ID="age" runat="server" Text='<%# Bind("age") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
         <asp:TemplateField HeaderText="Number of Songs" SortExpression="number_of_songs">
    
    <ItemTemplate>
        <asp:Label ID="number_of_songs" runat="server" Text='<%# Bind("number_of_songs") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
         <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10px">
        <ItemTemplate>
            <asp:Button runat="server" CssClass="view-song-button" Text="View Artist" CommandName="ViewArtist" CommandArgument='<%# Eval("artist_id") %>' OnCommand="ViewArtist_Command"/>
        </ItemTemplate>
    </asp:TemplateField>


                    </Columns>
                </asp:GridView>
                 <asp:SqlDataSource ID="music" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                SelectCommand="SELECT
                                    ABS(FLOOR(DATEDIFF(YEAR, date_of_birth, GETDATE()))) AS age,
                                    stage_name,
                                    birth_name,
                                    COUNT(songs.song_id) AS number_of_songs,
                                    artists.artist_id
                                FROM
                                    artists
                                LEFT JOIN
                                    songs ON artists.artist_id = songs.artist_id
                                GROUP BY
                                    stage_name, birth_name, artists.artist_id, date_of_birth">

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
