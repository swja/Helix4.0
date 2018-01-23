<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Helix2._0._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        tabs</p>
    <p>
 
        <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">Tickets</a></li>
  <li><a data-toggle="tab" href="#menu1">Usuarios</a></li>
  <li><a data-toggle="tab" href="#menu2">Flujos</a></li>
  <li><a data-toggle="tab" href="#menu3">Reportes</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <h3>Tickets</h3>
      <h5 class="col-md-2 col-sm-1"> Texto de busqueda</h5>
      <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-4 col-sm-5"></asp:TextBox>
       <h5 class="col-md-2 col-sm-1"> Filtro de flujos</h5>
      <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Rol" DataTextField="rol" DataValueField="ID" CssClass="col-md-4 col-sm-5">
        </asp:DropDownList>
      <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ID,rol_ID" Width="100%" class="col-sm-12 col-md-8">
            <Columns>
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
        <asp:SqlDataSource ID="Rol" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.rol.* FROM helix.rol"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID, nombre, apellido, usuario, password, mail, telefono, cargo, rol_ID FROM helix.usuario"></asp:SqlDataSource>
  </div>
  <div id="menu1" class="tab-pane fade">
    <h3>Usuarios</h3>
    <p>Some content in menu 1.</p>
  </div>
  <div id="menu2" class="tab-pane fade">
    <h3>Flujos</h3>
    <p>Some content in menu 2.</p>
  </div>
    <div id="menu3" class="tab-pane fade">
    <h3>Reportes</h3>
    <p>Algo de contenido</p>
        <img alt="" src="../Images/image_thumb825.png" />
  </div>
</div>
</asp:Content>
