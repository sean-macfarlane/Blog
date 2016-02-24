<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FullBlogPost.aspx.cs" Inherits="Assignment1.FullBlogPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <a href="Default.aspx">< Back</a>
        <br />
        <br />
        <h1>
            <asp:Literal runat="server" ID="Title"></asp:Literal></h1>
        <p>
            <asp:Literal runat="server" ID="Content"></asp:Literal></p>
        <br />
        <p>Posted By:
            <asp:Literal runat="server" ID="Author"></asp:Literal>,
            <asp:Literal runat="server" ID="CreatedDate"></asp:Literal></p>
        <asp:Panel runat="server" ID="AddCommentPanel" Visible="False">
            <h3>Add Comment:</h3>
            <asp:TextBox ID="txtComment" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="txtComment" runat="server" />
            <asp:Button Text="Add Comment" CssClass="btn" runat="server" OnClick="AddComment" />
        </asp:Panel>
        <h3>Comments:</h3>
        <asp:GridView runat="server" ID="comments" ShowHeader="False" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>

                        <p><%# BadWords(Eval("Text")) %></p>
                        <p><%# Eval("User.FirstName") %> <%# Eval("User.LastName") %> (<%# Eval("CreatedDate") %>)</p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <p>There are no comments.</p>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
