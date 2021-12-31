<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ConCung.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CONCUNGConnectionString %>" SelectCommand="SELECT * FROM [SANPHAM] ORDER BY [TEN_SP]" ProviderName="<%$ ConnectionStrings:CONCUNGConnectionString.ProviderName %>"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlProducts" runat="server" ></asp:Panel>
    <div style="clear: both"></div>
</asp:Content>
