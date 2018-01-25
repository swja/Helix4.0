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
      <br />
      <div class="row" style="text-align:  center;">
      <asp:Label ID="tickets" runat="server" Text="Listado de Tickets" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
      <br />
      <div class="row">
      <h5 class="col-md-2 col-sm-2"> Texto de busqueda</h5>
      <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3"></asp:TextBox>
       <h5 class="col-md-2 col-sm-2"> Filtro de flujos</h5>
      <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Rol" DataTextField="rol" DataValueField="ID" CssClass="col-md-3 col-sm-3">
        </asp:DropDownList>
          </div>
      <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID,rol_ID" DataSourceID="SqlDataSource1" Width="100%" OnSelectedIndexChanged="paso_Parametros">
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
        <asp:SqlDataSource ID="Rol" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.rol.* FROM helix.rol"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID, nombre, apellido, usuario, password, mail, telefono, cargo, rol_ID FROM helix.usuario"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.usuario.nombre AS Nombre, helix.usuario.apellido, helix.usuario.usuario, helix.usuario.password, helix.usuario.mail, helix.usuario.telefono, helix.usuario.cargo, helix.rol.rol FROM helix.rol INNER JOIN helix.usuario ON helix.rol.ID = helix.usuario.rol_ID"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSourceFlujos" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID, nombre_Flujo FROM helix.flujo"></asp:SqlDataSource>
  </div>
  <div id="menu1" class="tab-pane fade">
     <div class="row" style="text-align:  center;">
      <asp:Label ID="Label17" runat="server" Text="Listado de Tickets" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
          <asp:Panel ID="Panel1" runat="server" Visible="False" Width="100%" CssClass="col-md-12 col-sm-12">
        <h3 class="col-md-12 col-sm-12 col-xs-12 text-center">Editar Usuario</h3>
        <br />
        <table class="table">
    <tbody>
      <tr class="alert-info">
        <td><asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label></td>
        <td><asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label3" runat="server" Text="Apellido: "></asp:Label></td>
          <td><asp:TextBox ID="txt_apellido" runat="server"></asp:TextBox></td>
      </tr>
      <tr class="alert-info">
        <td><asp:Label ID="Label4" runat="server" Text="Usuario: "></asp:Label></td>
        <td><asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label5" runat="server" Text="Contraseña: "></asp:Label></td>
          <td><asp:TextBox ID="txt_pass" runat="server"></asp:TextBox></td>
      </tr>
      <tr class="alert-info">
        <td><asp:Label ID="Label6" runat="server" Text="Email: "></asp:Label></td>
        <td><asp:TextBox ID="txt_mail" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label7" runat="server" Text="Telefono: "></asp:Label></td>
          <td><asp:TextBox ID="txt_fono" runat="server"></asp:TextBox></td>
      </tr>
         <tr class="alert-info">
<td><asp:Label ID="Label8" runat="server" Text="Cargo: "></asp:Label></td>
        <td><asp:TextBox ID="txt_cargo" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label9" runat="server" Text="Rol: "></asp:Label></td>
         <td><asp:DropDownList ID="DropDownList3" runat="server" Height="19px" DataSourceID="Rol" DataTextField="rol" DataValueField="ID">
            </asp:DropDownList></td>
      </tr>
    </tbody>
  </table>
        <br />
    </asp:Panel>
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2">Filtro Usuarios</h5>
           <asp:TextBox ID="TextBox2" runat="server" CssClass="col-md-3 col-sm-3"></asp:TextBox>
      </div>
        <asp:Panel ID="Panel2" runat="server" Visible="False" Width="100%" CssClass="col-md-12 col-sm-12">
        <h3 class="col-md-12 col-sm-12 col-xs-12 text-center">Editar Usuario</h3>
        <br />
        <table class="table">
    <tbody>
      <tr class="alert-info">
        <td><asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label></td>
        <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label10" runat="server" Text="Apellido: "></asp:Label></td>
          <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
      </tr>
      <tr class="alert-info">
        <td><asp:Label ID="Label11" runat="server" Text="Usuario: "></asp:Label></td>
        <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label12" runat="server" Text="Contraseña: "></asp:Label></td>
          <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
      </tr>
      <tr class="alert-info">
        <td><asp:Label ID="Label13" runat="server" Text="Email: "></asp:Label></td>
        <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label14" runat="server" Text="Telefono: "></asp:Label></td>
          <td><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
      </tr>
         <tr class="alert-info">
<td><asp:Label ID="Label15" runat="server" Text="Cargo: "></asp:Label></td>
        <td><asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
        <td><asp:Label ID="Label16" runat="server" Text="Rol: "></asp:Label></td>
         <td><asp:DropDownList ID="DropDownList1" runat="server" Height="19px" DataSourceID="Rol" DataTextField="rol" DataValueField="ID">
            </asp:DropDownList></td>
      </tr>
    </tbody>
  </table>
        <br />
    </asp:Panel>
      <br />
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUsuarios" Width="100%">
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
                <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
                 <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="" Text="Editar" />
                  </ItemTemplate>
              </asp:TemplateField>
            </Columns>
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
      </asp:GridView>
  </div>
  <div id="menu2" class="tab-pane fade">
        <h3 class="col-md-12 col-sm-12 col-xs-12 text-center">Listado de Flujos</h3>
     <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2">Filtro Flujos</h5>
           <asp:TextBox ID="TextBox3" runat="server" CssClass="col-md-3 col-sm-3"></asp:TextBox>
      </div>
      <div align="center">
         <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceFlujos" Width="100%">
              <Columns>
                  <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                  <asp:BoundField DataField="nombre_Flujo" HeaderText="nombre_Flujo" SortExpression="nombre_Flujo" />
                  <asp:TemplateField ShowHeader="False">
                      <ItemTemplate>
                          <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="" Text="Seleccionar" />
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
        </div>
  </div>
    <div id="menu3" class="tab-pane fade">
        <h3 class="col-md-12 col-sm-12 col-xs-12 text-center">Reporte General</h3>
            <div align="center">
                <iframe width="100%" height="700" src="https://app.powerbi.com/view?r=eyJrIjoiYjllNmJjNDctNDE5NS00YjdlLWEwMzgtZTcyYjg5YjA4NjY3IiwidCI6Ijc1MGE4ZThiLWNlZDItNGU3Ni1iMmY3LTRhZTlhNTZkNjU1NyIsImMiOjR9" frameborder="1" allowFullScreen="true"></iframe>
            </div>
        </div>
</div>
</asp:Content>
