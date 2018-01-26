<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Helix2._0.View.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:SqlDataSource ID="Rol" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.rol.* FROM helix.rol"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.usuario.nombre AS Nombre, helix.usuario.apellido, helix.usuario.usuario, helix.usuario.password, helix.usuario.mail, helix.usuario.telefono, helix.usuario.cargo, helix.rol.rol FROM helix.rol INNER JOIN helix.usuario ON helix.rol.ID = helix.usuario.rol_ID"></asp:SqlDataSource>
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label17" runat="server" Text="Listado de Usuarios" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 

    <!-- Panel para actualizar informacion de los usuarios, el cual se mostrara y ocultara el gridview-->
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
         <!-- Panel para actualizar informacion de los usuarios-->
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
</asp:Content>
