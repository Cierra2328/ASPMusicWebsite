<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSong.aspx.cs" Inherits="Music_Database.ViewSong" %>

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
            var songName = document.getElementById("song_text").value.trim();
            var length = document.getElementById("length_text").value.trim();
            var writer = document.getElementById("writer_text").value.trim();

            // Check if the values are not blank
            if (songName === "") {
                alert("Please enter an song name.");
                return false;
            }
            if (length === "") {
                alert("Please enter the length in seconds.");
                return false;
            }
            if (writer === "") {
                alert("Please enter a songwriter.");
                return false;
            }

            return true;
        }

    </script>


    
</head>
<body>
    <form id="song_details" runat="server">   
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
        
    &nbsp;<div class= "space-header"></div>Song Details</h1>

        <div>
         <asp:DetailsView ID="song_details_view" runat="server" AutoGenerateRows="False" CssClass="body-add" DataSourceID="song" DataKeyNames="song_id" OnItemDeleted="deleteEnd">            
             <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Song Name:" InsertVisible="False" SortExpression="song_name">
                <EditItemTemplate>
                    <asp:TextBox ID="song_text" CssClass="textbox" ClientIDMode="Static" runat="server" Text='<%# Bind("song_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="song_name" runat="server" Text='<%# Bind("song_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        <asp:TemplateField HeaderText="Artist Name:" SortExpression="stage_name">
            <EditItemTemplate>
            <asp:DropDownList ID="artist_list" runat="server" DataSourceID="artists" DataTextField="stage_name" DataValueField="artist_id" CssClass="drop-down" SelectedValue='<%# Bind("artist_id") %>'>
            </asp:DropDownList>
        </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="artistLbl" runat="server" Text='<%# Bind("stage_name") %>'></asp:Label>
            </ItemTemplate>

        </asp:TemplateField>
             <asp:TemplateField HeaderText="Album Name:" SortExpression="album_name">
             <EditItemTemplate>
                 <asp:DropDownList ID="album_list2" runat="server" DataSourceID="album_listing" DataTextField="album_name" DataValueField="album_id" CssClass="drop-down" SelectedValue='<%# Bind("album_id") %>'>
                 </asp:DropDownList>
             </EditItemTemplate>
             <ItemTemplate>
                 <asp:Label ID="album_names" runat="server" Text='<%# Bind("album_name") %>'></asp:Label>
             </ItemTemplate>

         </asp:TemplateField>
            <asp:TemplateField HeaderText="Length in Seconds:" SortExpression="length_in_seconds">
                <EditItemTemplate>
                    <asp:TextBox ID="length_text" CssClass="textbox" ClientIDMode="Static" runat="server" type="number" Text='<%# Bind("length_in_seconds") %>'></asp:TextBox>
                </EditItemTemplate>               
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("length_in_seconds") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Highest Billboard Ranking:" SortExpression="highest_billboard_ranking">
                <EditItemTemplate>
                    <asp:TextBox ID="billboard_text" CssClass="textbox" runat="server" type="number" Text='<%# Bind("highest_billboard_ranking") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="billboard" runat="server" Text='<%# Bind("highest_billboard_ranking") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Billboard Ranking Date:" SortExpression="date_of_billboard_ranking">
                <EditItemTemplate>
                    <asp:TextBox ID="bill_date_text" CssClass="textbox" runat="server" Text='<%# Bind("date_of_billboard_ranking") %>'></asp:TextBox>
                </EditItemTemplate>              
                <ItemTemplate>
                    <asp:Label ID="billboard_ranking" runat="server" Text='<%# Bind("date_of_billboard_ranking") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Songwriter(s):" SortExpression="writer_name">
                <EditItemTemplate>
                    <asp:TextBox ID="writer_text" CssClass="textbox" ClientIDMode="Static" runat="server" Text='<%# Bind("writer_name") %>'></asp:TextBox>
                </EditItemTemplate>               
                <ItemTemplate>
                    <asp:Label ID="writer" runat="server" Text='<%# Bind("writer_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Comments" SortExpression="comments">
                <EditItemTemplate>
                    <asp:TextBox ID="comments_text" CssClass="textbox" runat="server" Text='<%# Bind("comments") %>' Height="5em" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>                
                <ItemTemplate>
                    <asp:Label ID="comments" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Song ID:" SortExpression="song_id" InsertVisible="False">
            <EditItemTemplate>
                <asp:Label ID="song_id_label" runat="server" Text='<%# Bind("song_id") %>' Visible="false"></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="song_id" runat="server" Text='<%# Bind("song_id") %>' Visible="true"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField>
                 <ItemTemplate>
                    <asp:LinkButton  ID="EditBtn" CssClass="button" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                         </ItemTemplate>
                <EditItemTemplate> <asp:LinkButton ID="UpdateBtn" CssClass="button" runat="server" CausesValidation="false"
                    CommandName="Update" Text="Update Song" OnClientClick="return validateForm();"> </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="button" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this song?');"></asp:LinkButton>
                   </ItemTemplate>
                    <EditItemTemplate> 
                        <asp:LinkButton ID="CancelBtn" CssClass="button" runat="server" CausesValidation="false"
                        CommandName="Cancel" Text="Cancel"> </asp:LinkButton>
                      </EditItemTemplate>
                
            </asp:TemplateField>
<%--            <asp:CommandField ControlStyle-CssClass="button" ShowEditButton="true" ShowDeleteButton="true" />--%>

                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="song" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                SelectCommand="SELECt * FROM songs"
                UpdateCommand="UPDATE songs SET song_name=@song_name, artist_id=@artist_id, album_id=@album_id, length_in_seconds=@length_in_seconds, 
                                comments=@comments, highest_billboard_ranking=@highest_billboard_ranking, date_of_billboard_ranking=@date_of_billboard_ranking, 
                                writer_name=@writer_name WHERE song_id=@song_id"
                DeleteCommand="DELETE FROM songs WHERE song_id=@song_id">
                <DeleteParameters>
        <asp:Parameter Name="song_id" Type="Int32" />
    </DeleteParameters>
    </asp:SqlDataSource>
          <asp:SqlDataSource ID="artists" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
></asp:SqlDataSource>
         <asp:SqlDataSource ID="album_listing" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
></asp:SqlDataSource>



        </div>
    </form>
    </main>
            <footer>
    <p class='footer'>Cierra Mardis 2023</p>
</footer>
</body>
</html>
