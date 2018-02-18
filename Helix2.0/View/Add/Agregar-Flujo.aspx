<%@ Page Title="Agregar Flujo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-flujo.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_Flujo" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Flujo" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre del flujo" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_nombre" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <br />
     <div class="row">
           <asp:Label ID="Label3" runat="server" Text="Descripción del flujo" CssClass="col-lg-2 col-md-2"></asp:Label>
        </div>
    <br />
    <br />
    <asp:TextBox ID="txt_descripcion" runat="server" Height="159px" TextMode="MultiLine" Width="75%" CssClass="col-lg-12 col-md-12"></asp:TextBox>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_agregar" runat="server" Text="Agregar Flujo" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_agregar_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Button2_Click" />
    </div>
</asp:Content>
