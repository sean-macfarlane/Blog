<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Assignment1.EditUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <h1>Edit Account</h1>
    <table>
    <tr>
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
        <tr>
        <td>
            Confirm Email Address:
        </td>
        <td>
            <asp:TextBox ID="txtConfirmEmail" runat="server" />
        </td>
        <td>
             <asp:CompareValidator ErrorMessage="Emails do not match." ForeColor="Red" ControlToCompare="txtEmail"
                ControlToValidate="txtConfirmEmail" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtConfirmEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
        </td>
    </tr>
    <tr>
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
    <tr>
        <td>
            Confirm Password:
        </td>
        <td>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" runat="server" />
        </td>
    </tr>
        <tr>
        <td>
            First Name:
        </td>
        <td>
            <asp:TextBox ID="txtFirst" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFirst"
                runat="server" />
        </td>
    </tr>
          <tr>
        <td>
            Last Name:
        </td>
        <td>
            <asp:TextBox ID="txtLast" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtLast"
                runat="server" />
        </td>
    </tr>
          <tr>
        <td>
            Date of Birth:
        </td>
        <td>
            <asp:TextBox runat="server" TextMode="Date" ID="txtBirth" CssClass="form-control" placeholder="1990-01-01"></asp:TextBox>          
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBirth" ErrorMessage="*" />
               
        </td>
    </tr>
        <tr>
        <td>
            Phone Number:
        </td>
        <td>
            <asp:TextBox ID="txtPhone" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPhone"
                runat="server" />
        </td>
    </tr>
          <tr>
        <td>
            Country:
        </td>
        <td>
            <asp:TextBox ID="txtCountry" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCountry"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button Text="Save Changes" runat="server" CssClass="btn" OnClick="UpdateUser" />
        </td>
        <td>
        </td>
    </tr>
</table>
    </div>
</asp:Content>
