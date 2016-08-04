<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row" align="center">
        <asp:Login ID="Login1" runat="server" BackColor="#555555" BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" CreateUserText="Sign Up" CreateUserUrl="~/SignUp.aspx" DestinationPageUrl="~/Default.aspx" BorderPadding="4" ForeColor="White">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" ForeColor="Black" />
            
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#FFFFFF" Font-Size="0.9em" />
        </asp:Login>
    </div>
</asp:Content>

