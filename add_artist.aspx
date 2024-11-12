<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_artist.aspx.cs" Inherits="Music_Database.add_artist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Personal Music Collection</title>
    <link rel="stylesheet" href="main.css"/>
    <link rel="icon" runat="server" href="music.png" type="image/png"/>
    <link rel="shortcut icon" runat="server" href="music.png" type="image/png"/>

    <script type="text/javascript">
        function validateForm() {
        var birthName = document.getElementById('<%= artist_add.FindControl("birth_name").ClientID %>').value;
        var dateOfBirth = document.getElementById('<%= artist_add.FindControl("date_of_birth").ClientID %>').value;
        var funFact = document.getElementById('<%= artist_add.FindControl("fun_fact").ClientID %>').value;

            if (birthName.trim() === "") {
                alert("Please enter a birth name.");
                return false;
            }
            if (dateOfBirth.trim() === "") {
                alert("Please enter a date of birth.");
                return false;
            }
            if (funFact.trim() === "") {
                alert("Please enter a fun fact.");
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
        
    &nbsp;<div class= "space-header"></div>Add Artist</h1>
         <asp:DetailsView ID="artist_add" runat="server" DefaultMode="Insert" AutoGenerateRows="False" CssClass="body-add" DataSourceID="artist" DataKeyNames="artist_id" OnItemInserted="redirect">            
                <FieldHeaderStyle Font-Bold="True" />
<Fields>
    <asp:TemplateField HeaderText="Stage Name:" InsertVisible="true" SortExpression="stage_name">
        
        <InsertItemTemplate>
            <asp:Textbox ID="stage_name" runat="server" CssClass="textbox" Text='<%# Bind("stage_name") %>'></asp:Textbox>
        </InsertItemTemplate>
    </asp:TemplateField>

<asp:TemplateField HeaderText="Birth Name:" SortExpression="birth_name">
    <InsertItemTemplate>
            <asp:Textbox ID="birth_name" runat="server" CssClass="textbox" Text='<%# Bind("birth_name") %>'></asp:Textbox>
</InsertItemTemplate>
    
    </asp:TemplateField>
<asp:TemplateField HeaderText="Date of Birth:" SortExpression="date_of_birth">
    <InsertItemTemplate>
        <asp:TextBox ID="date_of_birth" CssClass="textbox" runat="server" type="date" Text='<%# Bind("date_of_birth") %>' />                      
    </InsertItemTemplate>
</asp:TemplateField>
     <asp:TemplateField HeaderText="Hometown:" SortExpression="hometown">
    <InsertItemTemplate>
            <asp:Textbox ID="hometown" runat="server" CssClass="textbox" Text='<%# Bind("hometown") %>'></asp:Textbox>
</InsertItemTemplate> 
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Date of Death:" SortExpression="date_of_death">
    <InsertItemTemplate>
        <asp:TextBox ID="date_of_death" CssClass="textbox" runat="server" type="date" Text='<%# Bind("date_of_death") %>' />               
    </InsertItemTemplate>
</asp:TemplateField>

    <asp:TemplateField HeaderText="Fun Fact" SortExpression="fun_fact">
        <InsertItemTemplate>
            <asp:TextBox ID="fun_fact" CssClass="textbox" runat="server" Height="5em" TextMode="MultiLine" Text='<%# Bind("fun_fact") %>'></asp:TextBox>
        </InsertItemTemplate>                
       
    </asp:TemplateField>
    <asp:TemplateField>
     <ItemTemplate>
        <asp:LinkButton  ID="InsertBtn" CssClass="button" runat="server" CausesValidation="False" 
            CommandName="Insert" Text="Add Artist" OnClientClick="return validateForm();"></asp:LinkButton>
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
    
            <asp:SqlDataSource ID="artist" runat="server" ConnectionString="<%$ ConnectionStrings:music %>"
                InsertCommand="INSERT INTO artists VALUES(@stage_name, @birth_name, @date_of_birth, @hometown, @date_of_death, @fun_fact)">
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
