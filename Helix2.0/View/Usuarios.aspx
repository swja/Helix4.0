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
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:3%" OnClick="Button1_Click" />
           
      </div>
      <br />
       <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="#,Nombre,Apellido,Cargo,Email,Nombre de Usuario,Contraseña,Rol,Telefono" DataSourceID="Usuario" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="#" HeaderText="#" SortExpression="#" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Nombre de Usuario" HeaderText="Nombre de Usuario" SortExpression="Nombre de Usuario" />
                <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" SortExpression="Contraseña" Visible="False" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                 <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
      </asp:GridView>
    <asp:SqlDataSource ID="Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_USUARIO AS #, NOMBRE AS 'Nombre', APELLIDO AS 'Apellido',CARGO AS 'Cargo' ,MAIL AS 'Email', NOMBRE_USUARIO AS 'Nombre de Usuario', PASSWORD as 'Contraseña', HELIX_ROL.ROL AS 'Rol', TELEFONO AS 'Telefono' FROM HELIX_USUARIO
INNER JOIN HELIX_ROL ON HELIX_USUARIO.ID_ROL = HELIX_ROL.ID_ROL"></asp:SqlDataSource>
</asp:Content>
