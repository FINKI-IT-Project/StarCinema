<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 100%;
            margin: auto;
        }
    </style>

    <script>

        $(document).ready(function () {
            $(".movieSumm").each(function (index) {
                $(this).text($(this).text().substring(0, 71) + "...");
            });
        });

    </script>

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
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" style="background-color: #666">

                <div class="item active">
                    <img src="https://i.ytimg.com/vi/Tvq3y8BhZ2s/maxresdefault.jpg" alt="Chania" />
                    <div class="carousel-caption">
                        <h3><a href="MovieDetails.aspx?id=1">Star Trek Beyond</a></h3>
                        <p>The USS Enterprise crew explores the furthest reaches of uncharted space, where they encounter a new ruthless enemy who puts them and everything the Federation stands for to the test.</p>
                    </div>
                </div>

                <div class="item">
                    <img src="http://images-cdn.moviepilot.com/images/c_scale,h_1080,w_1920/t_mp_quality/dxjmqifk5ub8okxkrnhq/james-gunn-explains-why-deadpool-made-so-much-money-844407.jpg" alt="Chania" />
                    <div class="carousel-caption">
                        <h3><a href="MovieDetails.aspx?id=2">Deadpool</a></h3>
                        <p>A former Special Forces operative turned mercenary is subjected to a rogue experiment that leaves him with accelerated healing powers, adopting the alter ego Deadpool.</p>
                    </div>
                </div>

                <div class="item">
                    <img src="http://www.hdwallpedia.com/web/wallpapers/ridley-scott-the-martian/1280x720.jpg" alt="Flower" />
                    <div class="carousel-caption">
                        <h3><a href="MovieDetails.aspx?id=9">The Martian</a></h3>
                        <p>An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive.</p>
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
                <asp:Image runat="server" ID="image1" Height="444px" alt="Movie picture" ImageUrl="http://ia.media-imdb.com/images/M/MV5BMjM2Nzg4MzkwOF5BMl5BanBnXkFtZTgwNzA0OTE3NjE@._V1_SX300.jpg" />
                <div class="caption">
                    <h3>Spectre</h3>
                    <p class="movieSumm">A cryptic message from Bond's past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.</p>
                    <p>
                        <a href="/MovieDetails.aspx?id=3#ctl00_MainContent_movieScreenings" class="btn btn-success" role="button">Reserve</a>
                        <a href="/MovieDetails.aspx?id=3" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" Height="444px" ID="image2" alt="Movie picture" ImageUrl="http://ia.media-imdb.com/images/M/MV5BMTU1ODg2OTU1MV5BMl5BanBnXkFtZTgwMzA5OTg2ODE@._V1_SX300.jpg" />
                <div class="caption">
                    <h3>Jason Bourne</h3>
                    <p class="movieSumm">The most dangerous former operative of the CIA is drawn out of hiding to uncover hidden truths about his past.</p>
                    <p>
                        <a href="/MovieDetails.aspx?id=4#ctl00_MainContent_movieScreenings" class="btn btn-success" role="button">Reserve</a>
                        <a href="/MovieDetails.aspx?id=4" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" Height="444px" ID="image3" alt="Movie picture" ImageUrl="http://ia.media-imdb.com/images/M/MV5BMzg1MDA0MTU2Nl5BMl5BanBnXkFtZTcwMTMzMjkxNw@@._V1_SX300.jpg" />
                <div class="caption">
                    <h3>Titanic</h3>
                    <p class="movieSumm">A seventeen-year-old aristocrat falls in love with a kind, but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.</p>
                    <p>
                        <a href="/MovieDetails.aspx?id=5#ctl00_MainContent_movieScreenings" class="btn btn-success" role="button">Reserve</a>
                        <a href="/MovieDetails.aspx?id=5" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" Height="444px" ID="image4" alt="Movie picture" ImageUrl="http://ia.media-imdb.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_SX300.jpg" />
                <div class="caption">
                    <h3>The Wolf of Wall Street</h3>
                    <p class="movieSumm">Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.</p>
                    <p>
                        <a href="/MovieDetails.aspx?id=6#ctl00_MainContent_movieScreenings" class="btn btn-success" role="button">Reserve</a>
                        <a href="/MovieDetails.aspx?id=6" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" Height="444px" ID="image5" alt="Movie picture" ImageUrl="http://ia.media-imdb.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg" />
                <div class="caption">
                    <h3>Inception</h3>
                    <p class="movieSumm">A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.</p>
                    <p>
                        <a href="/MovieDetails.aspx?id=7#ctl00_MainContent_movieScreenings" class="btn btn-success" role="button">Reserve</a>
                        <a href="/MovieDetails.aspx?id=7" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <asp:Image runat="server" Height="444px" ID="image6" alt="Movie picture" ImageUrl="http://ia.media-imdb.com/images/M/MV5BNTY2OTI5MjAyOV5BMl5BanBnXkFtZTgwNTkzMjQ0NDE@._V1_SX300.jpg" />
                <div class="caption">
                    <h3>Crimson Peak</h3>
                    <p class="movieSumm">In the aftermath of a family tragedy, an aspiring author is torn between love for her childhood friend and the temptation of a mysterious outsider. Trying to escape the ghosts of her past, she is swept away to a house that breathes, bleeds - and remembers.</p>
                    <p>
                        <a href="/MovieDetails.aspx?id=8#ctl00_MainContent_movieScreenings" class="btn btn-success" role="button">Reserve</a>
                        <a href="/MovieDetails.aspx?id=8" class="btn btn-primary" role="button">View Movie</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

