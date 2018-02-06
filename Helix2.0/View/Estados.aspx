<%@ Page Title="Estados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estados.aspx.cs" Inherits="Helix2._0.View.Estados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Estados" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-3">Filtro de estados </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
            <h5 class="col-md-2 col-sm-2 col-lg-3">Filtro de estados por flujo </h5>
          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:DropDownList>
      </div>
    <br />
    <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" style="left:1%; width: 11%;" />
      <br />
     <asp:GridView ID="GridView1" runat="server">
     </asp:GridView>
      <br />
</asp:Content>
