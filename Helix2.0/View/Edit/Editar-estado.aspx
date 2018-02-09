<%@ Page Title="Editar Estado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-estado.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_estado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Estado" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre del estado" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <div class="row">
           <asp:Label ID="Label4" runat="server" Text="Flujo al que pertenece" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
        <div class="row">
            <asp:Label ID="Label3" runat="server" Text="Cambiar de Flujo a" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:DropDownList ID="DropDownList1" CssClass="col-lg-3 col-md-3" runat="server">
            </asp:DropDownList>
    </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Editar Estado" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
