<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="Helix2._0._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
      <br />
      <div class="row" style="text-align:  center;">
      <asp:Label ID="tickets" runat="server" Text="Listado de Tickets" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
      <br />
      <div class="row">
      <h5 class="col-md-2 col-lg-2">Nombre del ticket</h5>
      <asp:TextBox ID="txt_Busqueda" runat="server" CssClass="col-md-2 col-lg-2" OnTextChanged="txt_Busqueda_AutoPostBack" AutoPostBack="True"></asp:TextBox>
       <h5 class="col-md-2 col-sm-2"> Filtro de flujos</h5>
     <asp:DropDownList runat="server"  CssClass="col-md-2 col-sm-2" DataSourceID="flujos" DataTextField="NOMBRE_FLUJO" DataValueField="ID_FLUJO" ID="dl_Flujo" AutoPostBack="True" OnSelectedIndexChanged="dl_Flujo_SelectedIndexChanged"></asp:DropDownList>
          <asp:SqlDataSource ID="flujos" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT [ID_FLUJO], [NOMBRE_FLUJO] FROM [HELIX_FLUJO]"></asp:SqlDataSource>
          <asp:Button ID="Bt_nuevo" runat="server" Text="Nuevo ticket"   CssClass="col-md-2 col-sm-2" OnClick="Bt_nuevo_Click" style="left:15%;"/>
          </div>
        <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" DataKeyNames="#,ID_CLIENTE,Nombre Ticket,Descripción,Etapa,Flujo,Cliente,Usuario Asignado,Forma de Pago,Fecha de Entrega,Fecha de Facturación,ID_FLUJO,ID_FORMAPAGO,ID_ETAPAFLUJO,ID_USUARIO" DataSourceID="Ticket" AllowPaging="True" Width="100%" CssClass="table table-responsive" OnSelectedIndexChanged="gvTickets_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="#" HeaderText="#" ReadOnly="True" SortExpression="#" InsertVisible="False" />
                <asp:BoundField DataField="Nombre Ticket" HeaderText="Nombre Ticket" SortExpression="Nombre Ticket" />
                <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                <asp:BoundField DataField="Etapa" HeaderText="Etapa" SortExpression="Etapa" />
                <asp:BoundField DataField="Flujo" HeaderText="Flujo" SortExpression="Flujo" />
                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" ReadOnly="True" />
                <asp:BoundField DataField="Usuario Asignado" HeaderText="Usuario Asignado" SortExpression="Usuario Asignado" ReadOnly="True" />
                <asp:BoundField DataField="Forma de Pago" HeaderText="Forma de Pago" SortExpression="Forma de Pago" />
                <asp:BoundField DataField="Fecha de Entrega" HeaderText="Fecha de Entrega" SortExpression="Fecha de Entrega" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Fecha de Facturación" HeaderText="Fecha de Facturación" SortExpression="Fecha de Facturación" DataFormatString="{0:d}" />
                <asp:BoundField DataField="ID_CLIENTE" HeaderText="ID_CLIENTE" ReadOnly="True" SortExpression="ID_CLIENTE" Visible="False" />
                <asp:BoundField DataField="ID_FLUJO" HeaderText="ID_FLUJO" SortExpression="ID_FLUJO" Visible="False" />
                <asp:BoundField DataField="ID_FORMAPAGO" HeaderText="ID_FORMAPAGO" SortExpression="ID_FORMAPAGO" Visible="False" />
                <asp:BoundField DataField="ID_ETAPAFLUJO" HeaderText="ID_ETAPAFLUJO" SortExpression="ID_ETAPAFLUJO" Visible="False" />
                <asp:BoundField DataField="ID_USUARIO" HeaderText="ID_USUARIO" SortExpression="ID_USUARIO" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="Inicio" Mode="NextPrevious" NextPageText="Siguiente" PreviousPageText="Anterior" />
            <PagerStyle HorizontalAlign="Center" />
      </asp:GridView>
     <asp:GridView ID="gvBusqueda" runat="server" AutoGenerateColumns="False" DataKeyNames="#,ID_CLIENTE,Nombre Ticket,Descripción,Etapa,Flujo,Cliente,Usuario Asignado,Forma de Pago,Fecha de Entrega,Fecha de Facturación,ID_FLUJO,ID_FORMAPAGO,ID_ETAPAFLUJO,ID_USUARIO" DataSourceID="Busqueda" AllowPaging="True" Width="100%" CssClass="table table-responsive" OnSelectedIndexChanged="gvBusqueda_SelectedIndexChanged" Visible="False">
            <Columns>
                <asp:BoundField DataField="#" HeaderText="#" ReadOnly="True" SortExpression="#" InsertVisible="False" />
                <asp:BoundField DataField="Nombre Ticket" HeaderText="Nombre Ticket" SortExpression="Nombre Ticket" />
                <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                <asp:BoundField DataField="Etapa" HeaderText="Etapa" SortExpression="Etapa" />
                <asp:BoundField DataField="Flujo" HeaderText="Flujo" SortExpression="Flujo" />
                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" ReadOnly="True" />
                <asp:BoundField DataField="Usuario Asignado" HeaderText="Usuario Asignado" SortExpression="Usuario Asignado" ReadOnly="True" />
                <asp:BoundField DataField="Forma de Pago" HeaderText="Forma de Pago" SortExpression="Forma de Pago" />
                <asp:BoundField DataField="Fecha de Entrega" HeaderText="Fecha de Entrega" SortExpression="Fecha de Entrega" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Fecha de Facturación" HeaderText="Fecha de Facturación" SortExpression="Fecha de Facturación" DataFormatString="{0:d}" />
                <asp:BoundField DataField="ID_CLIENTE" HeaderText="ID_CLIENTE" ReadOnly="True" SortExpression="ID_CLIENTE" Visible="False" />
                <asp:BoundField DataField="ID_FLUJO" HeaderText="ID_FLUJO" SortExpression="ID_FLUJO" Visible="False" />
                <asp:BoundField DataField="ID_FORMAPAGO" HeaderText="ID_FORMAPAGO" SortExpression="ID_FORMAPAGO" Visible="False" />
                <asp:BoundField DataField="ID_ETAPAFLUJO" HeaderText="ID_ETAPAFLUJO" SortExpression="ID_ETAPAFLUJO" Visible="False" />
                <asp:BoundField DataField="ID_USUARIO" HeaderText="ID_USUARIO" SortExpression="ID_USUARIO" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Select" Text="Seleccionar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="Inicio" Mode="NextPrevious" NextPageText="Siguiente" PreviousPageText="Anterior" />
            <PagerStyle HorizontalAlign="Center" />
      </asp:GridView>
      <asp:SqlDataSource ID="Busqueda" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_TICKET AS #,
	base.NOMBRE_TICKET AS 'Nombre Ticket',
	base.DESCRIPCION_TICKET AS 'Descripción',
	Etapa.NOMBRE_ETAPA AS 'Etapa',Flujo.NOMBRE_FLUJO AS 'Flujo',
	CONCAT (Cliente.NOMBRES, ' ',Cliente.APELLIDOS) AS 'Cliente',
	CONCAT ( Usuario.NOMBRE, ' ', Usuario.APELLIDO ) AS 'Usuario Asignado',
	Pago.FORMA_PAGO AS 'Forma de Pago',
	base.FECHA_ENTREGA AS 'Fecha de Entrega',
	base.FECHA_FACTURA AS 'Fecha de Facturación',
	base.ID_CLIENTE,
	base.ID_FLUJO,
	base.ID_FORMAPAGO,
	base.ID_ETAPAFLUJO,
	base.ID_USUARIO 
FROM
	HELIX_TICKET AS base
	INNER JOIN HELIX_CLIENTE AS Cliente ON base.ID_CLIENTE = Cliente.ID_CLIENTE
	INNER JOIN HELIX_USUARIO AS Usuario ON base.ID_USUARIO = Usuario.ID_USUARIO
	INNER JOIN HELIX_FLUJO AS Flujo ON base.ID_FLUJO = Flujo.ID_FLUJO
	INNER JOIN HELIX_ETAPA_FLUJO AS Etapa ON base.ID_ETAPAFLUJO = Etapa.ID_ETAPAFLUJO
	INNER JOIN HELIX_FORMA_PAGO AS Pago ON base.ID_FORMAPAGO = Pago.ID_FORMAPAGO
                  WHERE NOMBRE_TICKET LIKE  @text
          ORDER BY Cliente.APELLIDOS ASC">
          <SelectParameters>
              <asp:ControlParameter ControlID="consulta" Name="text" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
    <asp:GridView ID="gv_Flujos" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="#,ID_CLIENTE,Nombre Ticket,Descripción,Etapa,Flujo,Cliente,Usuario Asignado,Forma de Pago,Fecha de Entrega,Fecha de Facturación,ID_FLUJO,ID_FORMAPAGO,ID_ETAPAFLUJO,ID_USUARIO" CssClass="table table-responsive" DataSourceID="DropList" Width="100%" OnSelectedIndexChanged="gvFlujo" Visible="False">
        <Columns>
            <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
            <asp:BoundField DataField="Nombre Ticket" HeaderText="Nombre Ticket" SortExpression="Nombre Ticket" />
            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
            <asp:BoundField DataField="Etapa" HeaderText="Etapa" SortExpression="Etapa" />
            <asp:BoundField DataField="Flujo" HeaderText="Flujo" SortExpression="Flujo" />
            <asp:BoundField DataField="Cliente" HeaderText="Cliente" ReadOnly="True" SortExpression="Cliente" />
            <asp:BoundField DataField="Usuario Asignado" HeaderText="Usuario Asignado" ReadOnly="True" SortExpression="Usuario Asignado" />
            <asp:BoundField DataField="Forma de Pago" HeaderText="Forma de Pago" SortExpression="Forma de Pago" />
            <asp:BoundField DataField="Fecha de Entrega" DataFormatString="{0:d}" HeaderText="Fecha de Entrega" SortExpression="Fecha de Entrega" />
            <asp:BoundField DataField="Fecha de Facturación" DataFormatString="{0:d}" HeaderText="Fecha de Facturación" SortExpression="Fecha de Facturación" />
            <asp:BoundField DataField="ID_CLIENTE" HeaderText="ID_CLIENTE" ReadOnly="True" SortExpression="ID_CLIENTE" Visible="False" />
            <asp:BoundField DataField="ID_FLUJO" HeaderText="ID_FLUJO" SortExpression="ID_FLUJO" Visible="False" />
            <asp:BoundField DataField="ID_FORMAPAGO" HeaderText="ID_FORMAPAGO" SortExpression="ID_FORMAPAGO" Visible="False" />
            <asp:BoundField DataField="ID_ETAPAFLUJO" HeaderText="ID_ETAPAFLUJO" SortExpression="ID_ETAPAFLUJO" Visible="False" />
            <asp:BoundField DataField="ID_USUARIO" HeaderText="ID_USUARIO" SortExpression="ID_USUARIO" Visible="False" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="DropList" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_TICKET AS #,
	base.NOMBRE_TICKET AS 'Nombre Ticket',
	base.DESCRIPCION_TICKET AS 'Descripción',
	Etapa.NOMBRE_ETAPA AS 'Etapa',Flujo.NOMBRE_FLUJO AS 'Flujo',
	CONCAT (Cliente.NOMBRES, ' ',Cliente.APELLIDOS) AS 'Cliente',
	CONCAT ( Usuario.NOMBRE, ' ', Usuario.APELLIDO ) AS 'Usuario Asignado',
	Pago.FORMA_PAGO AS 'Forma de Pago',
	base.FECHA_ENTREGA AS 'Fecha de Entrega',
	base.FECHA_FACTURA AS 'Fecha de Facturación',
	base.ID_CLIENTE,
	base.ID_FLUJO,
	base.ID_FORMAPAGO,
	base.ID_ETAPAFLUJO,
	base.ID_USUARIO 
FROM
	HELIX_TICKET AS base
	INNER JOIN HELIX_CLIENTE AS Cliente ON base.ID_CLIENTE = Cliente.ID_CLIENTE
	INNER JOIN HELIX_USUARIO AS Usuario ON base.ID_USUARIO = Usuario.ID_USUARIO
	INNER JOIN HELIX_FLUJO AS Flujo ON base.ID_FLUJO = Flujo.ID_FLUJO
	INNER JOIN HELIX_ETAPA_FLUJO AS Etapa ON base.ID_ETAPAFLUJO = Etapa.ID_ETAPAFLUJO
	INNER JOIN HELIX_FORMA_PAGO AS Pago ON base.ID_FORMAPAGO = Pago.ID_FORMAPAGO
  WHERE base.ID_FLUJO = @flujo
  ORDER BY Cliente.APELLIDOS ASC">
          <SelectParameters>
              <asp:ControlParameter ControlID="dl_Flujo" Name="flujo" PropertyName="SelectedValue" />
          </SelectParameters>
      </asp:SqlDataSource>
    <div class="alert-dismissable">
        <div class="row notificaciones">
            <div class ="mas4 col-lg-4 col-md-4 col-sm-12 text-center">Tiempo para cumplimiento > a 3 dias</div>
            <div class="menos3 col-lg-4 col-md-4 col-sm-12 text-center">Tiempo para cumplimiento <= a 3 dias</div>
            <div class="caducado col-lg-4 col-md-4 col-sm-12 text-center">Tiempo para cumplimiento caducado</div>
        </div>
    </div>
  
      <asp:SqlDataSource ID="Ticket" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_TICKET AS #,
	base.NOMBRE_TICKET AS 'Nombre Ticket',
	base.DESCRIPCION_TICKET AS 'Descripción',
	Etapa.NOMBRE_ETAPA AS 'Etapa',Flujo.NOMBRE_FLUJO AS 'Flujo',
	CONCAT (Cliente.NOMBRES, ' ',Cliente.APELLIDOS) AS 'Cliente',
	CONCAT ( Usuario.NOMBRE, ' ', Usuario.APELLIDO ) AS 'Usuario Asignado',
	Pago.FORMA_PAGO AS 'Forma de Pago',
	base.FECHA_ENTREGA AS 'Fecha de Entrega',
	base.FECHA_FACTURA AS 'Fecha de Facturación',
	base.ID_CLIENTE,
	base.ID_FLUJO,
	base.ID_FORMAPAGO,
	base.ID_ETAPAFLUJO,
	base.ID_USUARIO 
FROM
	HELIX_TICKET AS base
	INNER JOIN HELIX_CLIENTE AS Cliente ON base.ID_CLIENTE = Cliente.ID_CLIENTE
	INNER JOIN HELIX_USUARIO AS Usuario ON base.ID_USUARIO = Usuario.ID_USUARIO
	INNER JOIN HELIX_FLUJO AS Flujo ON base.ID_FLUJO = Flujo.ID_FLUJO
	INNER JOIN HELIX_ETAPA_FLUJO AS Etapa ON base.ID_ETAPAFLUJO = Etapa.ID_ETAPAFLUJO
	INNER JOIN HELIX_FORMA_PAGO AS Pago ON base.ID_FORMAPAGO = Pago.ID_FORMAPAGO
          ORDER BY Cliente.APELLIDOS ASC"></asp:SqlDataSource>
  
      <asp:Label ID="consulta" runat="server" Text="Label" Visible="False"></asp:Label>
  
</asp:Content>
