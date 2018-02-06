<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-usuario.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Usuario" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
        <div class="row">
            <asp:Label ID="Label3" runat="server" Text="Apellido" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
    </div>
    <br />
        <div class="row">
            <asp:Label ID="Label4" runat="server" Text="Email" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
        <div class="row">
            <asp:Label ID="Label5" runat="server" Text="Telefono" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <div class="row">
            <asp:Label ID="Label6" runat="server" Text="Cargo empresarial" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
        <div class="row">
            <asp:Label ID="Label7" runat="server" Text="Rol de usuario" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="col-lg-3 col-md-3">
            </asp:DropDownList>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Editar Usuario" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
