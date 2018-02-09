<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="Helix2._0._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
      <br />
      <div class="row" style="text-align:  center;">
      <asp:Label ID="tickets" runat="server" Text="Listado de Tickets" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
      <br />
      <div class="row">
      <h5 class="col-md-2 col-sm-2"> Texto de busqueda</h5>
      <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3" OnTextChanged="busqueda" AutoPostBack="True"></asp:TextBox>
       <h5 class="col-md-2 col-sm-2"> Filtro de flujos</h5>
     <asp:DropDownList runat="server"></asp:DropDownList>
          </div>
      <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID,rol_ID" Width="100%" OnSelectedIndexChanged="paso_Parametros">
          <Columns>
              <asp:CommandField ShowSelectButton="True" />
              <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
              <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
              <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
              <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
              <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
              <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
              <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
              <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
              <asp:BoundField DataField="rol_ID" HeaderText="rol_ID" ReadOnly="True" SortExpression="rol_ID" />
          </Columns>
      </asp:GridView>
         
      <br />
       
        <asp:GridView ID="GridView5" runat="server">
      </asp:GridView>
          </div>
  
</asp:Content>
