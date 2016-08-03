<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieDetails.aspx.cs" Inherits="MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title></title>

    <script>

        var time = ["(15:00)", "(18:00)", "(21:00)"];

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

                    document.title = "StarCinema | " + $("#movieName").text().trim();
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

            <img id="moviePoster" width="100%" />

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

            <p class="moviePosition">&raquo Director: <span class="movieStaff" id="movieDirector"></span></p>
            <p class="moviePosition">&raquo Writer(s): <span class="movieStaff" id="movieWriter"></span></p>
            <p class="moviePosition">&raquo Actors: <span class="movieStaff" id="movieActors"></span></p>

        </div>

    </div>


    <h1 class="movieScreenings">Movie Screenings</h1>

    <hr />


    <div class="row">
        <div class="col-xs-9 col-xs-offset-3" style="margin-bottom: 20px">
            <asp:Label ID="messageSuccess" runat="server" CssClass="alert alert-success"></asp:Label>
        </div>
    </div>



    <div class="row">


        <div class="col-xs-12">


            <asp:GridView ID="movieScreenings" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="80%" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="screen_id" HeaderText="Screen ID" ReadOnly="True" HeaderStyle-CssClass="textIndent" ItemStyle-CssClass="cellPadding">
                        <HeaderStyle CssClass="textIndent"></HeaderStyle>

                        <ItemStyle Font-Bold="True" CssClass="textIndent" />
                    </asp:BoundField>
                    <asp:BoundField DataField="day" HeaderText="Day" ReadOnly="True" HeaderStyle-CssClass="textIndent" ItemStyle-CssClass="cellPadding">
                        <HeaderStyle CssClass="textIndent"></HeaderStyle>

                        <ItemStyle Font-Bold="True" CssClass="textIndent" />
                    </asp:BoundField>
                    <asp:BoundField DataField="term" HeaderText="Term" ReadOnly="True" ItemStyle-CssClass="termTime cellPadding">
                        <ItemStyle CssClass="termTime cellPadding"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="hall" HeaderText="Hall" ReadOnly="True" ItemStyle-CssClass="hallName cellPadding">
                        <ItemStyle CssClass="hallName cellPadding"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Row" ItemStyle-CssClass="cellPadding">

                        <ItemTemplate>
                            <asp:DropDownList ID="seatRow" runat="server" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="seatRow_SelectedIndexChanged" AppendDataBoundItems="true">
                                <asp:ListItem>-- Select row --</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>

                        <ItemStyle CssClass="cellPadding"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number" ItemStyle-CssClass="cellPadding">

                        <ItemTemplate>
                            <asp:DropDownList ID="seatNumber" runat="server" CssClass="form-control" Enabled="false">
                                <asp:ListItem>No row selected.</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>

                        <ItemStyle CssClass="cellPadding"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reserve Movie" HeaderStyle-CssClass="textIndent" ItemStyle-CssClass="textIndent">
                        <ItemTemplate>
                            <asp:Button OnClick="reserveMovie_Click" ID="reserveMovie" runat="server" Text="Reserve" CssClass="btn btn-sm btn-success" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>

            <br />

            <asp:Label ID="lbl1" runat="server"></asp:Label>
        </div>


    </div>



    <div class="row">

        <div class="col-xs-12">

            <asp:Label ID="movieTitle" runat="server" Text="" CssClass="hddn"></asp:Label>

        </div>

    </div>


</asp:Content>

