<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="AddBlogPost.aspx.cs" Inherits="Assignment1.Admin.AddBlogPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h1>Add Blog Post</h1>
    <table>
    <tr>
        <td>
            Title:
        </td>
        <td>
            <asp:TextBox ID="txtTitle" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                ControlToValidate="txtTitle" runat="server" />
         </td>
    </tr>
    <tr>
        <td>
            Author:
        </td>
        <td>
            <asp:TextBox ID="txtAuthor" runat="server"/>
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAuthor"
                runat="server" />
        </td>
    </tr>
          <tr>
        <td>
            Short Description:
        </td>
        <td>
            <asp:TextBox ID="txtDescription" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDescription"
                runat="server" />
        </td>
    </tr>
        <tr>
          <td>
            Raw HTML:
        </td>
        <td>
            <asp:TextBox ID="txtHTML" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtHTML"
                runat="server" />
        </td>
    </tr>
        <tr>
        <td>
            Is Available?
        </td>
        <td>
            <asp:CheckBox ID="checkBox" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button Text="Create Post" CssClass="btn" runat="server" OnClick="CreatePost" />
        </td>
        <td>
        </td>
    </tr>
</table>
    </div>
</asp:Content>
