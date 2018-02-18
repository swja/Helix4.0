<%@ Page Title="Agregar Estado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-estado.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_estado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Estado" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
     <div class="row">
            <asp:Label ID="Label3" runat="server" Text="Flujo maestro" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:DropDownList ID="Dl_flujos" runat="server" CssClass="col-lg-2 col-md-2" DataSourceID="Flujos" DataTextField="DESCRIPCION_FLUJO" DataValueField="ID_FLUJO"></asp:DropDownList>
            <asp:SqlDataSource ID="Flujos" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FLUJO, DESCRIPCION_FLUJO FROM HELIX_FLUJO"></asp:SqlDataSource>
    </div>
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre del estado" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_estado" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
     <br />
        <div class="row">
           <asp:Label ID="Label4" runat="server" Text="Descripción del estado" CssClass="col-lg-2 col-md-2"></asp:Label>
            <br />
           <asp:TextBox ID="txt_descripcion" runat="server" Height="159px" TextMode="MultiLine" Width="75%" CssClass="col-lg-12 col-md-12"></asp:TextBox>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_agregar" runat="server" Text="Agregar Estado" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_agregar_Click"/>
        <asp:Button ID="Bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Bt_cancelar_Click" />
    </div>
</asp:Content>
