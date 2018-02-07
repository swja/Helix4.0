<%@ Page Title="Editar Tipo de Insutria" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-industria.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_industria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Tipo de Industria" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Tipo de industria" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Editar Tipo de industria" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
