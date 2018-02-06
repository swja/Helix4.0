<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-estado.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_estado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Estado" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre del estado" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
        <div class="row">
            <asp:Label ID="Label3" runat="server" Text="Flujo maestro" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:DropDownList ID="DropDownList1" CssClass="col-lg-3 col-md-3" runat="server">
            </asp:DropDownList>
    </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Agregar Estado" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
