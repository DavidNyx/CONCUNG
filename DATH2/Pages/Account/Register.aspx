<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ConCung.Pages.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Số điện thoại:</p>
    <p>
        <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
    </p>
    <p>
        Mật khẩu:</p>
    <p>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        Nhập lại mật khẩu:</p>
    <p>
        <asp:TextBox ID="txtRePass" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Đăng ký" Width="150px" />
    </p>
    <p>
        <asp:Literal ID="litStatusMessage" runat="server"></asp:Literal>
    </p>
</asp:Content>
