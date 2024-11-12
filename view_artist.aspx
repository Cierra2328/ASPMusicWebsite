<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_artist.aspx.cs" Inherits="Music_Database.view_artist" %>

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
             var birthName = document.getElementById("birth_name").value.trim();
             var birthdate = document.getElementById("date_of_birth").value.trim();
             var funFact = document.getElementById("fun_fact_text").value.trim();

             // Check if the values are not blank
             if (birthName === "") {
                 alert("Please enter a birth name.");
                 return false;
             }
             if (birthdate === "") {
                 alert("Please enter a birth date.");
                 return false;
             }
             if (funFact === "") {
                 alert("Please enter a fun fact.");
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
    </nav>
    </div>
<div class = "space">
    <p style = "color: transparent;"> bro</p>
</div>
        <main>
            <form id="artist_details" runat="server" >   

<div class="body">
<h1 class="details-header">
        
    &nbsp;<div class= "space-header"></div>Artist Details</h1>
    

        <div>
         <asp:DetailsView ID="artist_details_view" runat="server" AutoGenerateRows="False" CssClass="body-add" DataSourceID="artist" DataKeyNames="artist_id" OnItemDeleted="deleteEnd">            
             <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Stage Name:" InsertVisible="False" >
                <EditItemTemplate>
                    <asp:TextBox ID="artist_text" CssClass="textbox" runat="server" Text='<%# Bind("stage_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="stage_name" runat="server" Text='<%# Bind("stage_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        <asp:TemplateField HeaderText="Birth Name:" >
            <EditItemTemplate>
                <asp:TextBox ID="birth_name" CssClass="textbox" ClientIDMode="Static" runat="server" Text='<%# Bind("birth_name") %>'></asp:TextBox>
        </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="artist_name" runat="server" Text='<%# Bind("birth_name") %>'></asp:Label>
            </ItemTemplate>

        </asp:TemplateField>
             <asp:TemplateField HeaderText="Date of Birth:">
             <EditItemTemplate>
                 <asp:TextBox ID="date_of_birth" CssClass="textbox" ClientIDMode="Static" runat="server" type="date" Text='<%# Bind("date_of_birth", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
             </EditItemTemplate>
             <ItemTemplate>
                 <asp:Label ID="birth_date" runat="server" Text='<%# Bind("date_of_birth", "{0:yyyy-MM-dd}") %>'></asp:Label>
             </ItemTemplate>

         </asp:TemplateField>
            <asp:TemplateField HeaderText="Hometown:">
                <EditItemTemplate>
                    <asp:TextBox ID="hometown_text" CssClass="textbox" runat="server" Text='<%# Bind("hometown") %>'></asp:TextBox>
                </EditItemTemplate>               
                <ItemTemplate>
                    <asp:Label ID="hometown" runat="server" Text='<%# Bind("hometown") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Date of Death:">
                <EditItemTemplate>
                    <asp:TextBox ID="date_of_death" CssClass="textbox" runat="server" type="date" Text='<%# Bind("date_of_death", "{0:yyyy-MM-dd}") %>' ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="date_of_death" runat="server" Text='<%# Bind("date_of_death", "{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Fun Fact:">
                <EditItemTemplate>
                    <asp:TextBox ID="fun_fact_text" CssClass="textbox" ClientIDMode="Static" runat="server" Text='<%# Bind("fun_fact") %>' Height="5em" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>              
                <ItemTemplate>
                    <asp:Label ID="fun_fact" runat="server" Text='<%# Bind("fun_fact") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

       

            

            <asp:TemplateField HeaderText="Artist ID:" SortExpression="song_id" InsertVisible="False">
            <EditItemTemplate>
                <asp:Label ID="artist_id_label" runat="server" Text='<%# Bind("artist_id") %>' Visible="false"></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="artist_id" runat="server" Text='<%# Bind("artist_id") %>' Visible="true"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField>
                 <ItemTemplate>
                    <asp:LinkButton  ID="EditBtn" CssClass="button" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                         </ItemTemplate>
                <EditItemTemplate> <asp:LinkButton ID="UpdateBtn" CssClass="button" runat="server" CausesValidation="false"
                    OnClientClick="return validateForm();" CommandName="Update" Text="Update Artist"> </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="button" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this artist? This will delete all songs and albums associated with this artist.');"></asp:LinkButton>
                   </ItemTemplate>
                    <EditItemTemplate> 
                        <asp:LinkButton ID="CancelBtn" CssClass="button" runat="server" CausesValidation="false"
                        CommandName="Cancel" Text="Cancel"> </asp:LinkButton>
                      </EditItemTemplate>
                
            </asp:TemplateField>

                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="artist" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                UpdateCommand="UPDATE artists SET stage_name=@stage_name, birth_name=@birth_name, date_of_birth=@date_of_birth, hometown=@hometown, date_of_death=@date_of_death, fun_fact=@fun_fact WHERE artist_id=@artist_id"
                DeleteCommand="DELETE FROM songs WHERE songs.artist_id=@artist_id 
                               DELETE FROM albums WHERE albums.artist_id=@artist_id
                               DELETE FROM artists WHERE artist_id=@artist_id">
                <DeleteParameters>
        <asp:Parameter Name="artist_id" Type="Int32" />
    </DeleteParameters>
    </asp:SqlDataSource>




        </div>
    
            <div class = "space">
    <p style = "color: transparent;"> bro</p>
</div>
<div class="body">
<h1 class="details-header">
        
    &nbsp;<div class= "space-header"></div>Songs From Artist</h1>
    

    
    <asp:GridView CssStyle="width=95%" ID="song_list" DataSourceID="songs" runat="server" AutoGenerateColumns="False" AllowSorting="True" CssClass="tabs" DataKeyNames="song_id, artist_id" AutoPostBack="true" Width="95%">
 <Columns>
     <asp:TemplateField HeaderText="Song" SortExpression="song_name">
         
         <ItemTemplate>
             <asp:Label ID="songLbl" runat="server" Text='<%# Bind("song_name") %>'></asp:Label>
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

