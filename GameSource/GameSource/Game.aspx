<%@ Page Title="Game Source" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="GameSource._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="import" href="includes/head.html">
        <title>Game</title>
    </head>
    <body>
        <div class="container">
            <h1>GameSource <small>by Oakmont Industries</small></h1>
        </div>
        <div class="container" id="game">
        </div>
        <div class="container">
            <h3>Reviews</h3>
        </div>
        <br />
        <div class="container" id="addReview">
        </div>
        <div class="container" id="reviewButton" style="display:none">
            <button id="btnReview" class="btn btn-primary" onclick="addReview()">
                Review this game
            </button>
            <br />
            <br />
        </div>
        <div class="container" id="reviews">
        </div>
        <div class="footer">
            <a href="default.aspx">&larr; Back to games page</a>
        </div>
        <script>
            const urlParams = new URLSearchParams(window.location.search);
            const gameId = urlParams.get('id');

            $(document).ready(function () {
                if ("<%: Context.User.Identity.GetUserName()  %>" != "") {
                $("#reviewButton").css('display', 'block');
                }

                var d = "<h1>", r = "<ul class='list-group'>";
                service("getGameByID", "{id:" + gameId + "}",
                    function (response) {
                        $.each(response, function (index, value) {
                            r += "<h4>Average Rating: " + value.AvgRating + "/10</h4>";
                            d += value.Name + "</h1><div class='jumbotron jumbotron-fluid'><div class='container container-fluid    '><img src='" +
                                value.ImgLink + "'height='500' width='370' hspace='20' class='pull-left'>" +
                                "<h3>Description</h3><font face='arial'>" + value.Description + "</font>" +
                                "<br/><br/><b>Released: </b> " + value.ReleaseDate +
                                "<br/><br/><b>Rating: </b>" + value.Rating +
                                "<br/><br/><b>Genre: </b>" + value.Genre +
                                "<br/><br/><b>Price: </b>$" + value.Price +
                                "<br/><br/><b>Stream page </font><a href='" + value.StreamLink +
                                "' target='-blank'>Here</a></p><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /></div></div>";
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
                                "<br/><i>By: " + value.UserFName + " " + value.UserLName + "</i></p>";
                            if ("<%: Context.User.Identity.GetUserName()  %>" == "Admin@42") {
                                r +=
                                    "<input type='button' class='btn btn-danger'" +
                                    "id='" + value.ReviewID + "' value='Delete Review'" +
                                    "onClick='deleteReview(this.id);' style='margin-left:30px;'>"
                            }
                            r += "</li>";
                        });
                        $("#reviews").html(r);

                    }, function (response) {
                        alert("Error, failed to load");
                    });
            });

            function addReview() {
                var w = "<div class='container' id='addReview'>" +
                    "<div class='panel panel-default' style='width:750px;'>" +
                    "<div class='panel-heading'>Post a review</div><div class='panel-body'>" +
                    "<form style='margin-left:75px;margin-right:75px;'>" +
                    "<div class='row' id='f2'><div class='form-group col-md-3' id='getRating'><label for='rating'>Rating (out of 10)</label>" +
                    "<input class='form-control' id='rating'></div></div>" +
                    "<div id='f3'><div class='form-group' id='reviewText'>" +
                    "<label for='comments'>Write your review here</label>" +
                    "<textarea class='form-control' id='comments' rows='5'></textarea></div></div>" +
                    "<div class='form-group' id='submitReview'>" +
                    "<input type='button' class='btn btn-primary' id='btnSubmit' value='Submit' onclick='submitReview()'>" +
                    "</div><div id='submitted'></div></form></div></div></div><br /><br />";
                $("#addReview").html(w);
                $("#reviewButton").html("");
            }

            function deleteReview(id) {
                if ("<%: Context.User.Identity.GetUserName()  %>" == "Admin@42") {
                    reviewID = parseInt(id);
                    if (confirm("You are about to delete a review. Confirm?")) {
                        service("deleteGameReview", "{gameID:" + gameId + ", reviewID:" + reviewID + "}",
                            function (response) {
                                alert("Deleted review at " + reviewID);
                                window.location.reload();
                            }, function (response) {
                                alert("Error, failed to delete.");
                            });
                    } else {
                        alert("Deletion aborted.");
                    }
                }

            }

            function submitReview() {
                service("submitGameReview", "{gameID:" + gameId +
                    ", userID:" + 1 + ", rating:" + $("#rating").val() +
                    ", description:'" + $("#comments").val() + "'}",
                    function (response) {
                        $('#submitted').html("<b>Game review submitted!</b>");
                        $("#rating").html("");
                        $("#f1").html("");
                        $("#f2").html("");
                        $("#f3").html("");
                        $("#submitReview").html("");
                    }, function (response) {
                        console.log(response);
                    });
            }
        </script>

        <br>
        <br>
        <div class="footer">
            <p>&copy2019 Oakmont Industries</p>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://chancejs.com/chance.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</asp:Content>
