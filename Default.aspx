<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 33%;
            height: 100px;
            margin: auto;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3><span class="label label-primary">Featured Movies</span></h3>
    <hr />

    <div class="container-fluid">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

                <div class="item active">
                    <img src="resources/images/default-movie.png" alt="Chania" />
                    <div class="carousel-caption">
                        <h3>Movie 1</h3>
                        <p>Description...</p>
                    </div>
                </div>

                <div class="item">
                    <img src="resources/images/default-movie.png" alt="Chania" />
                    <div class="carousel-caption">
                        <h3>Movie 2</h3>
                        <p>Description...</p>
                    </div>
                </div>

                <div class="item">
                    <img src="resources/images/default-movie.png" alt="Flower" />
                    <div class="carousel-caption">
                        <h3>Movie 3</h3>
                        <p>Description...</p>
                    </div>
                </div>

                <div class="item">
                    <img src="resources/images/default-movie.png" alt="Flower" />
                    <div class="carousel-caption">
                        <h3>Movie 4</h3>
                        <p>Description...</p>
                    </div>
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <br />


    <h3><span class="label label-primary">Movies currently running</span></h3>
    <hr />

    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="movieList" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" GridLines="None" Width="100%" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="movie_id" HeaderText="Movie ID">
                        <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="movie_name" HeaderText="Movie Title"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
        </div>
    </div>

    <br />

    <h3><span class="label label-success">Popular Movies</span></h3>
    <hr />
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" ID="imageOne" alt="Movie picture" />
                <div class="caption">
                    <h3>Movie Title</h3>
                    <p>Movie description...</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Reserve</a>
                        <a href="#" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" ID="imageTwo" alt="Movie picture" />
                <div class="caption">
                    <h3>Movie Title</h3>
                    <p>Movie description...</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Reserve</a>
                        <a href="#" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" ID="imageThree" alt="Movie picture" />
                <div class="caption">
                    <h3>Movie Title</h3>
                    <p>Movie description...</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Reserve</a>
                        <a href="#" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" ID="imageFour" alt="Movie picture" />
                <div class="caption">
                    <h3>Movie Title</h3>
                    <p>Movie description...</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Reserve</a>
                        <a href="#" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" ID="imageFive" alt="Movie picture" />
                <div class="caption">
                    <h3>Movie Title</h3>
                    <p>Movie description...</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Reserve</a>
                        <a href="#" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" ID="imageSix" alt="Movie picture" />
                <div class="caption">
                    <h3>Movie Title</h3>
                    <p>Movie description...</p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Reserve</a>
                        <a href="#" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

