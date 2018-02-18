﻿<%@ Page Title="Editar Estado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-estado.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_estado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Estado" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
     <div class="row">
           <asp:Label ID="Label4" runat="server" Text="Flujo al que pertenece" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:Label ID="lb_flujo" runat="server" Text="Flujo" CssClass="col-lg-2 col-md-2"></asp:Label>
         <asp:DropDownList ID="Dl_flujo" runat="server" DataSourceID="Flujo" DataTextField="NOMBRE_FLUJO" DataValueField="ID_FLUJO" CssClass="col-lg-2 col-md-2"></asp:DropDownList>
           <asp:SqlDataSource ID="Flujo" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT [ID_FLUJO], [NOMBRE_FLUJO] FROM [HELIX_FLUJO]"></asp:SqlDataSource>
        </div>
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre del estado" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_nombre" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
     <div class="row">
           <asp:Label ID="Label5" runat="server" Text="Descripción del estado" CssClass="col-lg-2 col-md-2"></asp:Label>
        </div>
    <br />
    <br />
    <asp:TextBox ID="txt_descripcion" runat="server" Height="159px" TextMode="MultiLine" Width="75%" CssClass="col-lg-12 col-md-12"></asp:TextBox>
   <br />
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_editar" runat="server" Text="Editar Estado" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="bt_cancelar_Click" />
    </div>
</asp:Content>
