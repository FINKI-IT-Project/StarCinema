<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">


    <div class="row" align="center">
        <div class="col-xs-12">
            <fieldset>
                <legend>Sign up Form</legend>
                <table>
                    <tr>
                        <td style="text-align: right;">Username:&nbsp;
                        <br />
                            <br />
                        </td>
                        <td style="text-align: left;">
                            <asp:TextBox ID="usernameTextBox" runat="server" CausesValidation="True"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTextBox" ErrorMessage="Username is required!" Font-Bold="True"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">Password:&nbsp;
                        <br />
                            <br />
                        </td>
                        <td style="text-align: left;">
                            <asp:TextBox ID="password1TextBox" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password1TextBox" ErrorMessage="Enter at least 6 characters!" Font-Bold="True" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">Password:&nbsp;
                        <br />
                            <br />
                        </td>
                        <td style="text-align: left;">
                            <asp:TextBox ID="password2TextBox" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
                            <br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password1TextBox" ControlToValidate="password2TextBox" ErrorMessage="Passwords are not the same!" Font-Bold="True"></asp:CompareValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">Email:&nbsp;
                        <br />
                            <br />
                        </td>
                        <td style="text-align: left;">
                            <asp:TextBox ID="emailTextBox" runat="server" CausesValidation="True"></asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Not a valid email address!" Font-Bold="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="signUpButton" runat="server" Text="Sign Up" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </div>


</asp:Content>

