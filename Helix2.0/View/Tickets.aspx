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
     <asp:DropDownList runat="server"  CssClass="col-md-3 col-sm-3"></asp:DropDownList>
          </div>
      <br />
       
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_CLIENTE,ID_USUARIO,ID_TICKET" DataSourceID="Ticket">
            <Columns>
                <asp:BoundField DataField="ID_CLIENTE" HeaderText="ID_CLIENTE" ReadOnly="True" SortExpression="ID_CLIENTE" />
                <asp:BoundField DataField="ID_USUARIO" HeaderText="ID_USUARIO" ReadOnly="True" SortExpression="ID_USUARIO" />
                <asp:BoundField DataField="ID_TICKET" HeaderText="ID_TICKET" InsertVisible="False" ReadOnly="True" SortExpression="ID_TICKET" />
                <asp:BoundField DataField="ID_FLUJO" HeaderText="ID_FLUJO" SortExpression="ID_FLUJO" />
                <asp:BoundField DataField="ID_FORMAPAGO" HeaderText="ID_FORMAPAGO" SortExpression="ID_FORMAPAGO" />
                <asp:BoundField DataField="ID_ETAPAFLUJO" HeaderText="ID_ETAPAFLUJO" SortExpression="ID_ETAPAFLUJO" />
                <asp:BoundField DataField="NOMBRE_TICKET" HeaderText="NOMBRE_TICKET" SortExpression="NOMBRE_TICKET" />
                <asp:BoundField DataField="DESCRIPCION_TICKET" HeaderText="DESCRIPCION_TICKET" SortExpression="DESCRIPCION_TICKET" />
                <asp:BoundField DataField="FECHA_ENTREGA" HeaderText="FECHA_ENTREGA" SortExpression="FECHA_ENTREGA" />
                <asp:BoundField DataField="FECHA_FACTURA" HeaderText="FECHA_FACTURA" SortExpression="FECHA_FACTURA" />
            </Columns>
      </asp:GridView>
  
      <asp:SqlDataSource ID="Ticket" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT HELIX_TICKET.* FROM HELIX_TICKET"></asp:SqlDataSource>
  
</asp:Content>
