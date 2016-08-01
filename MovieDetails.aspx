<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieDetails.aspx.cs" Inherits="MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>


        function getData(title) {
            $.ajax({
                url: "http://omdbapi.com/?t=" + title,
                dataType: "json",
                success: function (data) {
                    $("#movieName").text(data["Title"]);
                    $("#moviePoster").attr("src", data["Poster"]);
                    $("#movieDesc").text(data["Plot"]);
                    $("#movieYear").text(data["Year"]);
                    $("#movieRuntime").text(data["Runtime"]);
                    $("#movieGenre").text(data["Genre"]);
                    $("#movieLanguage").text(data["Language"]);
                    $("#movieCountry").text(data["Country"]);
                    $("#movieImdbR").text(data["imdbRating"]);
                    $("#movieMetascoreR").text(data["Metascore"]);
                    $("#movieDirector").text(data["Director"]);
                    $("#movieWriter").text(data["Writer"]);
                    $("#movieActors").text(data["Actors"]);
                }
            });
        }

        function getMovie() {
            var movieT = $("#<%=movieTitle.ClientID%>").text();
            getData(movieT);
        }


        $(document).ready(function () {
            getMovie();
        });



    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">

        <div class="col-xs-4">

            <img id="moviePoster" />

        </div>
        <div class="col-xs-8">

            <h1 id="movieName" class="movieTitle"></h1>
            <hr />

            <h3 id="movieDesc" class="moviePlot"></h3>

            <ul style="list-style-type: circle;">
                <li>Year: <span class="label label-primary" id="movieYear"></span></li>
                <li>Runtime: <span class="label label-primary" id="movieRuntime"></span></li>
                <li>Genre: <span class="label label-primary" id="movieGenre"></span></li>
                <li>Languare: <span class="label label-primary" id="movieLanguage"></span></li>
                <li>Country: <span class="label label-primary" id="movieCountry"></span></li>
                <li>Ratings:
                    <ul style="list-style-type: square;">
                        <li>IMDBRating: <span class="label label-success" id="movieImdbR"></span></li>
                        <li>Metascore: <span class="label label-success" id="movieMetascoreR"></span></li>
                    </ul>
                </li>
            </ul>

            <hr />

            <p class="moviePosition">- Director: <span class="movieStaff" id="movieDirector"></span></p>
            <p class="moviePosition">- Writer: <span class="movieStaff" id="movieWriter"></span></p>
            <p class="moviePosition">- Actors: <span class="movieStaff" id="movieActors"></span></p>

        </div>

    </div>




    <div class="row">


        <div class="col-xs-12">
            <asp:GridView ID="movieScreenings" runat="server">
            </asp:GridView>
        </div>


    </div>



    <div class="row">

        <div class="col-xs-12">

            <asp:Label ID="movieTitle" runat="server" Text="" CssClass="hddn"></asp:Label>

        </div>

    </div>


</asp:Content>

