<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">
    <div class="login">
        <div>
    <h1>Login</h1>
    <table>
    <tr class="row">
        <td>
            Email Address:
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                ControlToValidate="txtEmail" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
        </td>
    </tr>
        <tr class="row">
        <td>
            Password:
        </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPassword"
                runat="server" />
        </td>
    </tr>
        <tr class="row">
        <td>
        </td>
        <td>
            <asp:Button Text="Login" CssClass="btn" runat="server" OnClick="ValidateUser" />
            <a href="Register.aspx">Or Register NOW!</a>
        </td>
        <td>
            
        </td>
    </tr>
        </table>
            <br />
            (Admin: sean.g.macfarlane@gmail.com password: pass)
            </div>
        </div>
    </div>
</asp:Content>
