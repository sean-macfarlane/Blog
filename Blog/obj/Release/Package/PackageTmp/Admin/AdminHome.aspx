<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Assignment1.Admin.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h1>Admin Home</h1>
        <h2>Current Blog Posts:</h2>
        <asp:GridView runat="server" id="posts" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
               <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Edit Post</b>
                    </HeaderTemplate>
                   <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemTemplate>
                       <asp:Button ID="editButton" CssClass="btn" runat="server" Text="EDIT" OnClick="edit_OnClick" CommandArgument='<%#Eval("PostId")%>' />
                    </ItemTemplate>
                   </asp:TemplateField>
               <asp:TemplateField>
                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <HeaderTemplate>
                            <b>Delete Post</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <asp:Button ID="deleteButton" CssClass="btn" runat="server" OnClientClick="return confirm('are you sure?');" Text="DELETE" OnClick="delete_OnClick" CommandArgument='<%#Eval("PostId")%>' />
                    </ItemTemplate>
               </asp:TemplateField>  
                 <asp:TemplateField>
                      <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <HeaderTemplate>
                            <b>Available</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <%# Eval("IsAvailable") %>
                    </ItemTemplate>
               </asp:TemplateField>   
                <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Post Details</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <a href="../FullBlogPost.aspx?id=<%#Eval("PostId")%>" style="text-decoration: none;"><h2><%# Eval("Title") %></h2></a>
                       <p><%# Eval("Description") %></p>
                       <p class="pull-right"><%# Eval("CreatedDate") %></p>
                    </ItemTemplate>
               </asp:TemplateField>                             
            </Columns>
            <EmptyDataTemplate>
                <p>There are no posts currently :(</p> 
            </EmptyDataTemplate>
    </asp:GridView>
        <asp:Button Text="Add Blog Post" CssClass="btn" runat="server" OnClick="clickAddBlogPost" />  
    </div>
</asp:Content>
