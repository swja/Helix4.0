<%@ Page Title="Ciudades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ciudades.aspx.cs" Inherits="Helix2._0.View.Ciudades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Ciudades" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro ciudades </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" OnClick="Button1_Click" />     
      </div>
      <asp:GridView ID="GridCiudades" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="table table-responsive" style="text-align:center;" DataKeyNames="#, Ciudad" DataSourceID="Ciudad" OnSelectedIndexChanged="gvCiudad_SelectedindexChanged">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="bt_seleccion" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"/>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
     </asp:GridView>
       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="table table-responsive" style="text-align:center;" DataKeyNames="#,Ciudad" DataSourceID="Consulta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
              <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" />
          </Columns>
     </asp:GridView>
      <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
     <asp:SqlDataSource ID="Consulta" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="select ID_Ciudad as #, Ciudad from Helix_Ciudad where Ciudad like @nom order by Ciudad ">
         <SelectParameters>
             <asp:ControlParameter ControlID="Label2" Name="nom" PropertyName="Text" />
         </SelectParameters>
     </asp:SqlDataSource>
      <asp:SqlDataSource ID="Ciudad" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="select ID_Ciudad as #, Ciudad from Helix_Ciudad"></asp:SqlDataSource>
      <br />
</asp:Content>
