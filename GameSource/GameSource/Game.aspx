﻿<%@ Page Title="Game Source" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="GameSource._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <link rel="import" href="includes/head.html">
    <title>Super Mario Bros</title>
</head>
<body>
    <div class="container">
        <h1>GameSource <small>by Oakmont Industries</small></h1>
    </div>
    <div class="container" id="game">
    </div>
    <div class="container">
        <h3>Reviews</h3>
    </div><br/>
    <div class="container" id="reviews">
    </div>
    <div class="footer">
        <a href="index.html">&larr; Back to games page</a>
    </div>
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const gameId = urlParams.get('id');

        $(document).ready(function () {
            var d = "<h1>", r = "<ul class='list-group'>";
            service("getGameByID", "{id:" + gameId + "}",
                function (response) {
                    $.each(response, function (index, value) {
                        r += "<h4>Average Rating: " + value.AvgRating + "/10</h4>";
                        d += value.Name + "</h1><pre class='prettyprint lang-html' style='font-family:serif'><img src=\"" +
                            value.ImgLink + "\"height='500' width='370' hspace='20' class='pull-left'>" +
                            "<h3>Description</h3><p>" + value.Description + "</p>" +
                            "<p><br/><b>Released: </b>" + value.ReleaseDate + "</p>" +
                            "<p><br/><b>Rating: </b>" + value.Rating + "</p>" +
                            "<p><br/><b>Genre: </b>" + value.Genre + "</p>" +
                            "<p><br/><b>Price: </b>" + value.Price + "</p>" +
                            "<p><br/><b>Stream page </b><a href='" + value.StreamLink + "' target='-blank'>Here</a></p></pre>";
                    });
                    $("#game").html(d);

                }, function (response) {
                    alert("Error, failed to load");
                });

            service("getReviewsByGame", "{id:" + gameId + "}",
                function (response) {
                    $.each(response, function (index, value) {
                        r += "<li class='list-group-item'><h4 class='list-group-item-heading'>Score: " +
                            value.Rating + "/10</h4><p class='list-group-item-text'>" + value.Description +
                            "<br/><i>By: " + value.UserFName + " " + value.UserLName + "</i></p></li>";
                    });
                    $("#reviews").html(r);

                }, function (response) {
                    alert("Error, failed to load");
                });
        });

    </script>

    <br><br>
    <div class="footer">
        <p>&copy2019 Oakmont Industries</p>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://chancejs.com/chance.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</asp:Content>
