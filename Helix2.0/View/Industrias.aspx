<%@ Page Title="Tipos de industrias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Industrias.aspx.cs" Inherits="Helix2._0.View.Industrias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado Tipos de industrias" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro de tipo de industrias </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" />     
      </div>
      <asp:GridView ID="GridView1" runat="server" Width="100%">
     </asp:GridView>
      <br />
</asp:Content>
