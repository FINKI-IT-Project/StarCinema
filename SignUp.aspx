<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row" align="center">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#555555" BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ContinueDestinationPageUrl="~/Default.aspx" ForeColor="White">
            <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
            <CreateUserButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#FFFFFF" />
            <TextBoxStyle ForeColor="Black" />
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" />
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
            <HeaderStyle BackColor="#284E98" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Size="0.9em" />
            <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
            <SideBarButtonStyle Font-Names="Verdana" ForeColor="#FFFFFF" BackColor="#507CD1" />
            <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
            <StepStyle Font-Size="0.8em" />
        </asp:CreateUserWizard>
    </div>
</asp:Content>

