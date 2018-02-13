<%@ Page Title="Agregar Ciudad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-ciudad.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_ciudad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Ciudad" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Ciudad" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_ciudad" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_agregar" runat="server" Text="Agregar Ciudad" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_agregar_Click"/>
        <asp:Button ID="bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Bt_cancelar_Click" />
    </div>
</asp:Content>
