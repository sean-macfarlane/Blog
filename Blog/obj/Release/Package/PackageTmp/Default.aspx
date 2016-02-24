<%@ Page Title="Music Blog" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <asp:GridView runat="server"  ShowHeader="False" id="posts" CssClass="table table-bordered" AutoGenerateColumns="false">
              <Columns>            
                <asp:TemplateField>
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
    </div>
</asp:Content>
