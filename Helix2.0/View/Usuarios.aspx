<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Helix2._0.View.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Usuarios" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro Usuarios </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:3%" OnClick="Bt_agregar_Click" />
           
      </div>
      <br />
       <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="#,Nombre,Apellido,Cargo,Nombre de Usuario,Contraseña,Telefono,ID_ROL,Email" DataSourceID="Usuario" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged" CssClass="table table-responsive" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="#" HeaderText="#" SortExpression="#" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" ReadOnly="True" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" Visible="False" />
                <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Nombre de Usuario" HeaderText="Nombre de Usuario" SortExpression="Nombre de Usuario" />
                <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" SortExpression="Contraseña" Visible="False" />
                 <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:BoundField DataField="ID_ROL" HeaderText="ID_ROL" SortExpression="ID_ROL" Visible="False" />
                <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" />
            </Columns>
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
      </asp:GridView>
    <asp:SqlDataSource ID="Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_USUARIO AS #, 
	CONCAT(base.NOMBRE,' ',base.APELLIDO) AS Usuario,
    base.NOMBRE AS 'Nombre',
	base.APELLIDO AS 'Apellido',
	base.CARGO AS 'Cargo',
	base.MAIL AS 'Email',
	base.NOMBRE_USUARIO AS 'Nombre de Usuario',
	base.PASSWORD AS 'Contraseña',
	Rol.ROL AS 'Rol',
	base.TELEFONO AS 'Telefono',
	base.ID_ROL
FROM
	HELIX_USUARIO AS base
INNER JOIN HELIX_ROL AS Rol ON base.ID_ROL = Rol.ID_ROL"></asp:SqlDataSource>
</asp:Content>
