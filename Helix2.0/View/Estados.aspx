<%@ Page Title="Estados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estados.aspx.cs" Inherits="Helix2._0.View.Estados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Estados" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro de estados </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-2 col-sm-3 col-lg-2" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" style="left:40%; width: 11%;" OnClick="Button1_Click" />
      </div>
    <br />
      <br />
     <asp:GridView ID="gvEstados" runat="server" AutoGenerateColumns="False" DataKeyNames="#,Flujo Maestro,Nombre de la Etapa,Descripción,ID_FLUJO" DataSourceID="Estado" OnSelectedIndexChanged="gvEstados_SelectedIndexChanged" Width="100%" CssClass="table table-responsive" AllowPaging="True">
         <Columns>
             <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" Visible="False" />
             <asp:BoundField DataField="Flujo Maestro" HeaderText="Flujo Maestro" SortExpression="Flujo Maestro" />
             <asp:BoundField DataField="Nombre de la Etapa" HeaderText="Nombre de la Etapa" SortExpression="Nombre de la Etapa" />
             <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
             <asp:BoundField DataField="ID_FLUJO" HeaderText="ID_FLUJO" SortExpression="ID_FLUJO" Visible="False" />
             <asp:TemplateField ShowHeader="False">
                 <ItemTemplate>
                     <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                 </ItemTemplate>
             </asp:TemplateField>
         </Columns>
     </asp:GridView>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="#,Flujo Maestro,Nombre de la Etapa,Descripción,ID_FLUJO" DataSourceID="Consulta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" CssClass="table table-responsive" AllowPaging="True" Visible="False">
         <Columns>
             <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
             <asp:BoundField DataField="Flujo Maestro" HeaderText="Flujo Maestro" SortExpression="Flujo Maestro" />
             <asp:BoundField DataField="Nombre de la Etapa" HeaderText="Nombre de la Etapa" SortExpression="Nombre de la Etapa" />
             <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
             <asp:BoundField DataField="ID_FLUJO" HeaderText="ID_FLUJO" SortExpression="ID_FLUJO" Visible="False" />
             <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" />
         </Columns>
     </asp:GridView>
         <asp:SqlDataSource ID="Consulta" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_ETAPAFLUJO AS #, 
	Flujo.NOMBRE_FLUJO AS 'Flujo Maestro',
	base.NOMBRE_ETAPA AS 'Nombre de la Etapa',
	base.DESCRIPCION_ETAPA AS 'Descripción',
	base.ID_FLUJO
FROM
	HELIX_ETAPA_FLUJO as base
INNER JOIN HELIX_FLUJO as Flujo ON Flujo.ID_FLUJO = Base.ID_FLUJO WHERE base.NOMBRE_ETAPA LIKE @nom ORDER BY base.NOMBRE_ETAPA ASC">
             <SelectParameters>
                 <asp:ControlParameter ControlID="Label2" Name="nom" PropertyName="Text" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="Estado" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT
	base.ID_ETAPAFLUJO AS #, 
	Flujo.NOMBRE_FLUJO AS 'Flujo Maestro',
	base.NOMBRE_ETAPA AS 'Nombre de la Etapa',
	base.DESCRIPCION_ETAPA AS 'Descripción',
	base.ID_FLUJO
FROM
	HELIX_ETAPA_FLUJO as base
INNER JOIN HELIX_FLUJO as Flujo ON Flujo.ID_FLUJO = Base.ID_FLUJO ORDER BY base.NOMBRE_ETAPA ASC"></asp:SqlDataSource>
      <br />
</asp:Content>
