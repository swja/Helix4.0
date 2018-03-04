﻿<%@ Page Title="Editar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-cliente.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Cliente" CssClass="col-lg-10 col-md-10 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
    <br />
    <div class="row">
        <asp:Label ID="Label2" runat="server" Text="Nombres" CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="txt_nombres" runat="server" CssClass="col-lg-3 col-md-4"></asp:TextBox>
    </div>
    <br />
    <div class="row">
         <asp:Label ID="Label5" runat="server" Text="Dirección"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="txt_direccion" runat="server" CssClass="col-lg-3 col-md-4"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Email"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="txt_email" runat="server" CssClass="col-lg-3 col-md-3" TextMode="Email" style="left:0;"></asp:TextBox>
    </div>
    <br />
      <div class="row">
        <asp:Label ID="Label6" runat="server" Text="Telefono"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="txt_telefono" runat="server" CssClass="col-lg-3 col-md-4" TextMode="Phone"></asp:TextBox>
    </div>
    <br />
      <div class="row">
        <asp:Label ID="Label8" runat="server" Text="Ciudad"  CssClass="col-lg-2 col-md-2"></asp:Label>
          <asp:DropDownList ID="dl_Ciudad" runat="server" CssClass="col-lg-3 col-md-3" DataSourceID="dropCiudad" DataTextField="CIUDAD" DataValueField="ID_CIUDAD"></asp:DropDownList>
          <asp:SqlDataSource ID="dropCiudad" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_CIUDAD, CIUDAD FROM HELIX_CIUDAD"></asp:SqlDataSource>
    </div>
    <br />
    <div class="row">
        <asp:Label ID="Label9" runat="server" Text="Tipo de industria"  CssClass="col-lg-2 col-md-2"></asp:Label>
         <asp:DropDownList ID="dl_Industria" runat="server" CssClass="col-lg-3 col-md-3" DataSourceID="dropIndustria" DataTextField="TIPO_INDUSTRIA" DataValueField="ID_TIPOINDUSTRIA"></asp:DropDownList>
        <asp:SqlDataSource ID="dropIndustria" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_TIPOINDUSTRIA, TIPO_INDUSTRIA FROM HELIX_TIPO_INDUSTRIA"></asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_editar" runat="server" Text="Editar Cliente" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="Bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:40%" OnClick="Bt_cancelar_Click" OnClientClick="javascript:return volver();" />
    </div>
            <script type="text/javascript">
<!--
function volver() {
    window.location.href = "../Clientes.aspx";
    return false;
}
//-->
</script>
</asp:Content>
