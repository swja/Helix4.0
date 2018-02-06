<%@ Page Title="Flujos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Flujos.aspx.cs" Inherits="Helix2._0.View.Flujos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label17" runat="server" Text="Listado de Flujos" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro de flujos </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" />
      </div>
      <br />
     <asp:GridView ID="GridView1" runat="server">
     </asp:GridView>
      <br />

</asp:Content>
