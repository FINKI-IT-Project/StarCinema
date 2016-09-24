<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>StarCinema | About Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="leftDiv" style="float: left; width: 50%; text-align: justify; padding-right: 15px;">
    <h1 class="movieTitle">About Us</h1>
        StarCinema is an American leading entertainment company established in 2013 and operates 
one of the most modern and fully digitized motion picture theatre circuits in the world.
Although we've been on the market just over 2 years and operate in just 3 halls we managed to serve 
approximately 7 million satisfied guests. StarCinema is headquartered in Seattle, Washington.
    </div>

    <div id="rightDiv" style="float: right; width: 50%">
        <img src="resources/images/about-us.jpg" style="width: 100%" />
    </div>
</asp:Content>

