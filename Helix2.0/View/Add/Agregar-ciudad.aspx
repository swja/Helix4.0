<%@ Page Title="Agregar Ciudad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-ciudad.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_ciudad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Ciudad" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Ciudad" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Agregar Ciudad" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
