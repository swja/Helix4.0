<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Helix2._0.View.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:SqlDataSource ID="Rol" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.rol.* FROM helix.rol"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT helix.usuario.nombre AS Nombre, helix.usuario.apellido, helix.usuario.usuario, helix.usuario.password, helix.usuario.mail, helix.usuario.telefono, helix.usuario.cargo, helix.rol.rol FROM helix.rol INNER JOIN helix.usuario ON helix.rol.ID = helix.usuario.rol_ID"></asp:SqlDataSource>
   <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label17" runat="server" Text="Listado de Usuarios" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 


      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro Usuarios </h5>
               <asp:TextBox ID="TextBox2" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button3" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" />
           
      </div>
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
