<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_album.aspx.cs" Inherits="Music_Database.view_album" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Personal Music Collection</title>
    <link rel="stylesheet" href="main.css"/>
    <link rel="icon" runat="server" href="music.png" type="image/png"/>
    <link rel="shortcut icon" runat="server" href="music.png" type="image/png"/>
    
   <script type="text/javascript">
       function validateForm() {
           // Get values from the TextBox controls
           var albumName = document.getElementById("album").value.trim();
           var recordLabel = document.getElementById("recordLabel").value.trim();
           var releaseDate = document.getElementById("releaseDate").value.trim();

           // Check if the values are not blank
           if (albumName === "") {
               alert("Please enter an album name.");
               return false;
           }
           if (recordLabel === "") {
               alert("Please enter a record label.");
               return false;
           }
           if (releaseDate === "") {
               alert("Please enter a release date.");
               return false;
           }

           return true;
       }

   </script>
</head>
<body>
<nav>
    <div class = "nav_bar" style = "width: 100%;">
<a href="home.aspx">
        <img id="logo" src="music.png" alt="Logo" style = "height:100px; width: 100px; float: left;"/>
    </a>
    <a class="active" href="home.aspx">Home</a>
    <a href="all_songs.aspx">Songs</a>
    <a href="all_artists.aspx">Artists</a>
    <a href="all_albums.aspx">Albums</a>
        </div>
    </nav>
    
<div class = "space">
    <p style = "color: transparent;"> bro</p>
</div>
        <main>
            <form id="artist_details" runat="server" >   

<div class="body">
<h1 class="details-header">
        
    &nbsp;<div class= "space-header"></div>Album Details</h1>
    

        <div>
         <asp:DetailsView ID="album_details_view" runat="server" AutoGenerateRows="False" CssClass="body-add" DataSourceID="albums" DataKeyNames="artist_id, album_id" OnItemDeleted="deleteEnd">            
             <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Album Name:" InsertVisible="False" >
                <EditItemTemplate>
                    <asp:TextBox ID="album" CssClass="textbox" ClientIDMode="Static" runat="server" Text='<%# Bind("album_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="album_name" runat="server" Text='<%# Bind("album_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        <asp:TemplateField HeaderText="Artist:" >
            <EditItemTemplate>
                 <asp:DropDownList ID="artist_list" runat="server" DataSourceID="artists" DataTextField="stage_name" DataValueField="artist_id" CssClass="drop-down" SelectedValue='<%# Bind("artist_id") %>'>
</asp:DropDownList>
        </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="artist_name" runat="server" Text='<%# Bind("stage_name") %>'></asp:Label>
            </ItemTemplate>

        </asp:TemplateField>
             <asp:TemplateField HeaderText="Record Label:">
             <EditItemTemplate>
                 <asp:TextBox ID="recordLabel" CssClass="textbox" ClientIDMode="Static" runat="server" Text='<%# Bind("record_label") %>'></asp:TextBox>
             </EditItemTemplate>
             <ItemTemplate>
                 <asp:Label ID="record_label" runat="server" Text='<%# Bind("record_label") %>'></asp:Label>
             </ItemTemplate>

         </asp:TemplateField>
            <asp:TemplateField HeaderText="Genre:">
                <EditItemTemplate>
                <asp:DropDownList ID="genre_id" runat="server" DataSourceID="genres" DataTextField="genre" DataValueField="genre_id" CssClass="drop-down" SelectedValue='<%# Bind("genre_id") %>'>
                </asp:DropDownList> 

                </EditItemTemplate>               
                <ItemTemplate>
                    <asp:Label ID="genre" runat="server" Text='<%# Bind("genre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Release Date:">
                <EditItemTemplate>
                    <asp:TextBox ID="releaseDate" CssClass="textbox" ClientIDMode="Static" runat="server" type="date" Text='<%# Bind("release_date", "{0:yyyy-MM-dd}") %>' ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="release_date" runat="server" Text='<%# Bind("release_date", "{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Notable Fact:">
                <EditItemTemplate>
                    <asp:TextBox ID="notable_fact_text" CssClass="textbox" runat="server" Text='<%# Bind("notable_fact") %>' Height="5em" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>              
                <ItemTemplate>
                    <asp:Label ID="notable_fact" runat="server" Text='<%# Bind("notable_fact") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Album ID:" SortExpression="song_id" InsertVisible="False">
            <EditItemTemplate>
                <asp:Label ID="album_id_label" runat="server" Text='<%# Bind("album_id") %>' Visible="false"></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="album_id" runat="server" Text='<%# Bind("album_id") %>' Visible="true"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

            <asp:TemplateField>
                 <ItemTemplate>
                    <asp:LinkButton  ID="EditBtn" CssClass="button" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                         </ItemTemplate>
                <EditItemTemplate> <asp:LinkButton ID="UpdateBtn" CssClass="button" runat="server" CausesValidation="false"
                    CommandName="Update" Text="Update Album" OnClientClick="return validateForm();"> </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="button" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this album? This will delete all songs associated with this album.');"></asp:LinkButton>
                   </ItemTemplate>
                    <EditItemTemplate> 
                        <asp:LinkButton ID="CancelBtn" CssClass="button" runat="server" CausesValidation="false"
                        CommandName="Cancel" Text="Cancel"> </asp:LinkButton>
                      </EditItemTemplate>
                
            </asp:TemplateField>

                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="albums" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                UpdateCommand="UPDATE albums SET album_name=@album_name, artist_id=@artist_id, record_label=@record_label, genre_id=@genre_id, release_date=@release_date, notable_fact=@notable_fact WHERE album_id=@album_id"
                DeleteCommand="DELETE FROM songs WHERE songs.album_id=@album_id;
                               DELETE FROM albums WHERE albums.album_id=@album_id">
                
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="artists" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
></asp:SqlDataSource>
                            <asp:SqlDataSource ID="genres" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                    SelectCommand="SELECT * FROM genres">
</asp:SqlDataSource>




        </div>
    
            <div class = "space">
    <p style = "color: transparent;"> bro</p>
</div>
<div class="body">
<h1 class="details-header">
        
    &nbsp;<div class= "space-header"></div>Songs From Album</h1>
    

    
    <asp:GridView CssStyle="width=95%" ID="song_list" DataSourceID="songs" runat="server" AutoGenerateColumns="False" AllowSorting="True" CssClass="tabs" DataKeyNames="song_id" AutoPostBack="true" Width="95%">
 <Columns>
     <asp:TemplateField HeaderText="Song Name" SortExpression="song_name">
         
         <ItemTemplate>
             <asp:Label ID="songLbl" runat="server" Text='<%# Bind("song_name") %>'></asp:Label>
         </ItemTemplate>
     </asp:TemplateField>
     
     <asp:TemplateField HeaderText="Songwriter" SortExpression="writer_name">
    
    <ItemTemplate>
        <asp:Label ID="writer_name" runat="server" Text='<%# Bind("writer_name") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>

     <asp:TemplateField HeaderText="Billboard Ranking" SortExpression="highest_billboard_ranking">
    
    <ItemTemplate>
        <asp:Label ID="highest_billboard_ranking" runat="server" Text='<%# Bind("highest_billboard_ranking") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>

     <asp:TemplateField HeaderText="Length in Seconds" SortExpression="length_in_seconds">
    
    <ItemTemplate>
        <asp:Label ID="length_in_seconds" runat="server" Text='<%# Bind("length_in_seconds") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
     
     <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10px">
    <ItemTemplate>
        <asp:Button runat="server" CssClass="view-song-button" Text="View Song" CommandName="ViewSong" CommandArgument='<%# Eval("song_id") %>' OnCommand="ViewSong_Command"/>
    </ItemTemplate>
</asp:TemplateField>


                </Columns>
            </asp:GridView>
              <asp:SqlDataSource ID="songs" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
></asp:SqlDataSource>
        </form>
        </div>
    </main>
            <footer>
    <p class='footer'>Cierra Mardis 2023</p>
</footer>
</body>
</html>
