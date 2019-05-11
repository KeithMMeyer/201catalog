<%@ Page Title="Game Source" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="GameSource._Default" %>

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
        <br>
        </div>

        <div class="container" id="requests">
        </div>

        <script>
            $(document).ready(function () {
                if ("<%: Context.User.Identity.GetUserName()  %>" != "Admin@42") {
                    window.location.href = ".";
                }

                var d = "<h1>Requests</h1> <div class='list-group'>";
                var count = 0;
                service("getRequests", "{}",
                    function (response) {
                        $.each(response, function (index, value) {
                            count++;
                            d += "<a href=# class='list-group-item w-25'>" +
                                "<h4 class='list-group-item-heading'>" + value.GameName + "</h4>" +
                                "<p class='list-group-item-text'><b>Description:</b><br />" +
                                value.Comment + "<br />&copy" + value.GameYear + " " + value.GamePublisher + 
                                "<br><i> Submitted By " + value.RequesteeEmail + "</i></p>";
                             if ("<%: Context.User.Identity.GetUserName()  %>" == "Admin@42") {
                                d +=
                                    "<input type='button' class='btn btn-primary'" +
                                    "id='" + value.RequestID + "' value='Accept Request'" +
                                    "onClick='acceptRequest(this.id);'>" +
                                    "<input type='button' class='btn btn-danger'" +
                                    "id='" + value.RequestID + "' value='Delete Request'" +
                                    "onClick='deleteRequest(this.id);' style='margin-left:30px;'>"
                            }
                            d += "</a>";
                        });
                        if (count != 0) {
                            d += "<p class='text-center'> <i> No requests have been submitted. Perhaps you should submit one yourself? </i></p>"
                        }
                        d += "</div>"
                        $("#requests").html(d);
                    }, function (response) {
                        alert("Error...");
                        console.log(response);
                    });
            }
            );

            function deleteRequest(id) {
            if ("<%: Context.User.Identity.GetUserName()  %>" == "Admin@42") {
                requestID = parseInt(id);
                if (confirm("You are about to delete a request. Confirm?")) {
                    service("deleteRequest", "{requestID:" + requestID + "}",
                        function (response) {
                            alert("Deleted request at " + requestID);
                            window.location.reload();
                        }, function (response) {
                            alert("Error, failed to delete.");
                        });
                } else {
                    alert("Deletion aborted.");
                }
            }

            }

            function silentDelete(id) {
            if ("<%: Context.User.Identity.GetUserName()  %>" == "Admin@42") {
                requestID = parseInt(id);
                    service("deleteRequest", "{requestID:" + requestID + "}",
                        function (response) {
                            window.location.reload();
                        }, function (response) {
                            alert("Error, failed to delete.");
                        });
            }

            }

            function acceptRequest(id) {
                service("submitGame", "{requesteeEmail:'" + $("#email").val() +
                    "', gameName:'" + $("#title").val() + "', gameYear:" +
                    $("#year").val() + ", gamePublisher:'" + $("#publisher").val() +
                    "', comment:'" + $("#comments").val() + "'}",
                    function (response) {
                        alert("Accepted request at " + requestID);
                        silentDelete(id)
                        window.location.reload();
                    }, function (response) {
                        console.log(response);
                    }
                );
            }

            $("#btnSearch").click(function () {
                var d = "<h1>Games</h1>";
                service("getGameByName", "{gameName:'" + $("#search").val() + "'}",
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
            }



            );
            </script>
        <div class="footer">
            <p>
                <br />
                <br />
                <br />
                &copy2019 Oakmont Industries</p>
            <p align="center">Don't see a game you want? Submit a request <a href="SubmitForm.html">here</a></p>
        </div>
    </body>
    </html>
</asp:Content>
