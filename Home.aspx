<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Music_Database.Home" %>

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
<a href="home.php">
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
<div class = "body">
<h1> Welcome!</h1>
<p>This is a project where I have populated a database with music data. Users may manipulate the data as they see fit. Feel free to look around, add, or delete items!</p>

</div>
</main>
        <footer>
    <p class='footer'>Cierra Mardis 2023</p>
</footer>
    </form>
</body>
</html>
