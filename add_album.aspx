<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_album.aspx.cs" Inherits="Music_Database.add_album" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Personal Music Collection</title>
    <link rel="stylesheet" href="main.css"/>
    <link rel="icon" runat="server" href="music.png" type="image/png"/>
    <link rel="shortcut icon" runat="server" href="music.png" type="image/png"/>

    <script type="text/javascript">
        function validateForm() {
        var albumName = document.getElementById('<%= album_add.FindControl("album_name").ClientID %>').value;
        var recordLabel = document.getElementById('<%= album_add.FindControl("record_label").ClientID %>').value;
        var releaseDate = document.getElementById('<%= album_add.FindControl("release_date").ClientID %>').value;

            if (albumName.trim() === "") {
                alert("Please enter an album name.");
                return false;
            }
            if (recordLabel.trim() === "") {
                alert("Please enter a record label.");
                return false;
            }
            if (releaseDate.trim() === "") {
                alert("Please enter a release date.");
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
        
    &nbsp;<div class= "space-header"></div>Add Album</h1>
         <asp:DetailsView ID="album_add" runat="server" DefaultMode="Insert" AutoGenerateRows="False" CssClass="body-add" DataSourceID="albums" DataKeyNames="album_id" OnItemInserted="redirect">            
                <FieldHeaderStyle Font-Bold="True" />
<Fields>
    <asp:TemplateField HeaderText="Album Name:">
    <InsertItemTemplate>
            <asp:Textbox ID="album_name" runat="server" CssClass="textbox" Text='<%# Bind("album_name") %>'></asp:Textbox>
</InsertItemTemplate>
    
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Artist:">
        
        <InsertItemTemplate>
                <asp:DropDownList ID="artist_id" runat="server" DataSourceID="artists" DataTextField="stage_name" DataValueField="artist_id" CssClass="drop-down" SelectedValue='<%# Bind("artist_id") %>'>
                </asp:DropDownList>       
        </InsertItemTemplate>
    </asp:TemplateField>

<asp:TemplateField HeaderText="Record Label:">
    <InsertItemTemplate>
            <asp:Textbox ID="record_label" runat="server" CssClass="textbox" Text='<%# Bind("record_label") %>'></asp:Textbox>
</InsertItemTemplate>
    
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Genre:">
    
    <InsertItemTemplate>
            <asp:DropDownList ID="genre_id" runat="server" DataSourceID="genres" DataTextField="genre" DataValueField="genre_id" CssClass="drop-down" SelectedValue='<%# Bind("genre_id") %>'>
            </asp:DropDownList>       
    </InsertItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Release Date:">
    <InsertItemTemplate>
        <asp:TextBox ID="release_date" CssClass="textbox" runat="server" type="date" Text='<%# Bind("release_date", "{0:MM/dd/yyyy}") %>' />                      
    </InsertItemTemplate>
</asp:TemplateField>


    <asp:TemplateField HeaderText="Notable Fact:">
        <InsertItemTemplate>
            <asp:TextBox ID="notable_fact" CssClass="textbox" runat="server" Height="5em" TextMode="MultiLine" Text='<%# Bind("notable_fact") %>'></asp:TextBox>
        </InsertItemTemplate>                
       
    </asp:TemplateField>
    <asp:TemplateField>
     <ItemTemplate>
        <asp:LinkButton  ID="InsertBtn" CssClass="button" runat="server" CausesValidation="False" 
            CommandName="Insert" Text="Add Album" OnClientClick="return validateForm();"></asp:LinkButton>
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
    
            <asp:SqlDataSource ID="albums" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                InsertCommand="INSERT INTO albums VALUES(@album_name, @artist_id, @record_label, @genre_id, @release_date, @notable_fact)">
</asp:SqlDataSource>
            <asp:SqlDataSource ID="artists" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                SelectCommand="SELECT stage_name, artist_id FROM artists">             
</asp:SqlDataSource>
                <asp:SqlDataSource ID="genres" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                    SelectCommand="SELECT * FROM genres">
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
