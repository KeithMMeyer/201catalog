<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GameSource._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html>
<head>
    <title>GameSource</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="import" href="includes/head.html">
</head>
<body>
            <div class="container">
                <h1>GameSource <small>by Oakmont Industries</small></h1>
                <h3>Search</h3>
                <form id="gameSearch">
                    <div class="form-group">
                        <label for="gameSearch">Name</label>
                        <input type="text" class="form-control" id="gameSearch" placeholder="Search for a game ...">
                    </div>
                    <button type="button" class="btn btn-primary">Search</button>
                </form>
            </div>

            <div class="container" id="games">
            </div>

            <script>
                $(document).ready(function () {
                    var d = "<h1>Games</h1>";
                    service("getGames", "{}",
                        function (response) {
                            $.each(response, function (index, value) {
                                d += "<a href=Game?id='" + value.GameID + "' class='list-group-item'><img src=\"" + value.ImgLink + "\"class='img-thumbnail' style='width:6%'>" +
                                    "<h4 class='list-group-item-heading'>" + value.Name + "</h4>" +
                                    "<p class='list-group-item-text'><b>Description:</b><br />" +
                                    value.Description + "<br />&copy" + value.ReleaseDate + " " + value.Publisher + "</p></a>";
                            });
                            $("#games").html(d);
                        }, function (response) {
                            alert("Error...");
                            console.log(response);
                        });
                });

            </script>
            <div class="footer">
                <p><br /><br /><br />&copy2019 Oakmont Industries</p>
                <p align="center">Don't see a game you want? Submit a request <a href="SubmitForm.html">here</a></p>
            </div>
</body>
</html>
</asp:Content>
