<%@ Page Title="Flujos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Flujos.aspx.cs" Inherits="Helix2._0.View.Flujos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label17" runat="server" Text="Listado de Flujos" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro de flujos </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" OnClick="Button1_Click" />
      </div>
      <br />
     <asp:GridView ID="gvFlujo" runat="server" AutoGenerateColumns="False" DataKeyNames="#,Nombre del Flujo,Descripción" DataSourceID="Flujo" OnSelectedIndexChanged="gvFlujo_SelectedIndexChanged" Width="100%" CssClass="table table-responsive">
         <Columns>
             <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
             <asp:BoundField DataField="Nombre del Flujo" HeaderText="Nombre del Flujo" SortExpression="Nombre del Flujo" />
             <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
             <asp:TemplateField ShowHeader="False">
                 <ItemTemplate>
                     <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                 </ItemTemplate>
             </asp:TemplateField>
         </Columns>
         <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="#,Nombre del Flujo,Descripción" DataSourceID="Consulta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" CssClass="table table-responsive" Visible="False">
         <Columns>
             <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
             <asp:BoundField DataField="Nombre del Flujo" HeaderText="Nombre del Flujo" SortExpression="Nombre del Flujo" />
             <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
             <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" />
         </Columns>
         <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     </asp:GridView>
      <asp:Label ID="Label18" runat="server" Text="Label" Visible="False"></asp:Label>
     <asp:SqlDataSource ID="Consulta" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FLUJO AS #,NOMBRE_FLUJO AS 'Nombre del Flujo', DESCRIPCION_FLUJO AS 'Descripción' FROM HELIX_FLUJO WHERE NOMBRE_FLUJO LIKE @nom ORDER BY NOMBRE_FLUJO ASC">
         <SelectParameters>
             <asp:ControlParameter ControlID="Label18" Name="nom" PropertyName="Text" />
         </SelectParameters>
     </asp:SqlDataSource>
      <asp:SqlDataSource ID="Flujo" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FLUJO AS #,NOMBRE_FLUJO AS &quot;Nombre del Flujo&quot;, DESCRIPCION_FLUJO AS &quot;Descripción&quot; FROM HELIX_FLUJO"></asp:SqlDataSource>
      <br />

</asp:Content>
