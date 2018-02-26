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
      <asp:GridView ID="gvClientes" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#,Nombres,Dirección,Telefono,Email,Tipo de Industria,Ciudad" DataSourceID="Cliente" OnSelectedIndexChanged="gvClientes_SelectedIndexChanged" CssClass="table table-responsive">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Nombres" HeaderText="Nombres" ReadOnly="True" SortExpression="Nombres" />
              <asp:BoundField DataField="Dirección" HeaderText="Dirección" SortExpression="Dirección" />
              <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
              <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:BoundField DataField="Tipo de Industria" HeaderText="Tipo de Industria" SortExpression="Tipo de Industria" />
              <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
     </asp:GridView>
      <asp:SqlDataSource ID="Cliente" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_CLIENTE as '#',NOMBRES AS 'Nombres', DIRECCION AS 'Dirección', TELEFONO AS 'Telefono', EMAIL AS 'Email', HELIX_TIPO_INDUSTRIA.TIPO_INDUSTRIA AS 'Tipo de Industria', HELIX_CIUDAD.CIUDAD AS 'Ciudad' FROM HELIX_CLIENTE
INNER JOIN HELIX_CIUDAD ON HELIX_CLIENTE.ID_CIUDAD = HELIX_CIUDAD.ID_CIUDAD
INNER JOIN HELIX_TIPO_INDUSTRIA ON HELIX_CLIENTE.ID_TIPOINDUSTRIA = HELIX_TIPO_INDUSTRIA.ID_TIPOINDUSTRIA"></asp:SqlDataSource>
      <br />
    </asp:Content>
