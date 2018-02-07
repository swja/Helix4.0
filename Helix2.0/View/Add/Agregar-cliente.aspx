<%@ Page Title="Agregar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-cliente.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Cliente" CssClass="col-lg-10 col-md-10 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
    <br />
    <div class="row">
        <asp:Label ID="Label2" runat="server" Text="Nombre" CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-2"></asp:TextBox>

         <asp:Label ID="Label3" runat="server" Text="Apellido" CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="col-lg-3 col-md-2"></asp:TextBox>

    </div>
    <br />
      <div class="row">
        <asp:Label ID="Label4" runat="server" Text="Nombre de la empresa"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="col-lg-3 col-md-2"></asp:TextBox>

         <asp:Label ID="Label5" runat="server" Text="Dirección"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="col-lg-3 col-md-2"></asp:TextBox>
    </div>
    <br />
      <div class="row">
        <asp:Label ID="Label6" runat="server" Text="Telefono"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" CssClass="col-lg-3 col-md-2"></asp:TextBox>

         <asp:Label ID="Label7" runat="server" Text="Email"  CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" CssClass="col-lg-3 col-md-2"></asp:TextBox>
    </div>
    <br />
      <div class="row">
        <asp:Label ID="Label8" runat="server" Text="Ciudad"  CssClass="col-lg-2 col-md-2"></asp:Label>
          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="col-lg-3 col-md-2"></asp:DropDownList>
         <asp:Label ID="Label9" runat="server" Text="Tipo de industria"  CssClass="col-lg-2 col-md-2"></asp:Label>
          <asp:DropDownList ID="DropDownList2" runat="server" CssClass="col-lg-3 col-md-2"></asp:DropDownList>
    </div>
    <br />
      <div class="row">
          <asp:Label ID="Label10" runat="server" Text="Forma de pago" CssClass="col-lg-2 col-md-2"></asp:Label>
          <asp:DropDownList ID="DropDownList3" runat="server" CssClass="col-lg-3 col-md-2"></asp:DropDownList>
    </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Agregar Cliente" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
