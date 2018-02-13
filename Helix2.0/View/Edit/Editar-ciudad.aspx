<%@ Page Title="Editar Ciudad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-ciudad.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_ciudad" %>
<%@ PreviousPageType VirtualPath="~/View/Ciudades.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Ciudad" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre de la Ciudad a editar" CssClass="col-lg-3 col-md-3"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Ciudad" CssClass="col-lg-2 col-md-2"></asp:Label>
            <br />
        </div>
    <div class="row">
        <asp:Label ID="Label4" runat="server" Text="Nuevo nombre de la Ciudad" CssClass="col-lg-3 col-md-3"></asp:Label>
            <asp:TextBox ID="txt_ciudad" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
    </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="bt_editar" runat="server" Text="Editar Ciudad" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="bt_cancelar_Click" />
    </div>
</asp:Content>
