<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Helix2._0.View.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Clientes" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro Clientes </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" OnClick="Button1_Click" />     
      </div>
      <asp:GridView ID="gvClientes" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#,NOMBRES,APELLIDOS,Dirección,Telefono,Email,ID_CIUDAD,ID_TIPOINDUSTRIA" DataSourceID="Cliente" OnSelectedIndexChanged="gvClientes_SelectedIndexChanged" Paging="True" CssClass="table table-responsive" AllowSorting="True" HorizontalAlign="Center">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Nombre del Cliente" HeaderText="Nombre del Cliente" SortExpression="Nombre del Cliente" ReadOnly="True" />
              <asp:BoundField DataField="NOMBRES" HeaderText="NOMBRES" SortExpression="NOMBRES" Visible="False" />
              <asp:BoundField DataField="APELLIDOS" HeaderText="APELLIDOS" SortExpression="APELLIDOS" Visible="False" />
              <asp:BoundField DataField="Dirección" HeaderText="Dirección" SortExpression="Dirección" />
              <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
              <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:BoundField DataField="Tipo de Industria" HeaderText="Tipo de Industria" SortExpression="Tipo de Industria" />
              <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
              <asp:BoundField DataField="ID_CIUDAD" HeaderText="ID_CIUDAD" SortExpression="ID_CIUDAD" Visible="False" />
              <asp:BoundField DataField="ID_TIPOINDUSTRIA" HeaderText="ID_TIPOINDUSTRIA" SortExpression="ID_TIPOINDUSTRIA" Visible="False" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
          <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
      <asp:SqlDataSource ID="Cliente" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_CLIENTE AS '#',
	CONCAT(base.NOMBRES,' ',base.APELLIDOS) AS 'Nombre del Cliente',
	base.NOMBRES,
	base.APELLIDOS,
	base.DIRECCION AS 'Dirección',
	base.TELEFONO AS 'Telefono',
	base.EMAIL AS 'Email',
	Industria.TIPO_INDUSTRIA AS 'Tipo de Industria',
	Ciudad.CIUDAD AS 'Ciudad',
	base.ID_CIUDAD,
	base.ID_TIPOINDUSTRIA
FROM
	HELIX_CLIENTE AS base
INNER JOIN HELIX_CIUDAD AS Ciudad ON base.ID_CIUDAD = Ciudad.ID_CIUDAD
INNER JOIN HELIX_TIPO_INDUSTRIA AS Industria ON base.ID_TIPOINDUSTRIA = Industria.ID_TIPOINDUSTRIA
          ORDER BY base.APELLIDOS ASC"></asp:SqlDataSource>
      <br />
    </asp:Content>
