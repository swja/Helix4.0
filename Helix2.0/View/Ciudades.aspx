<%@ Page Title="Ciudades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ciudades.aspx.cs" Inherits="Helix2._0.View.Ciudades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Ciudades" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro ciudades </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" OnClick="Button1_Click" />     
      </div>
      <asp:GridView ID="GridCiudades" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="col-lg-12 col-md-12" style="text-align:center;" DataKeyNames="#, Ciudad" DataSourceID="Ciudad" OnSelectedIndexChanged="gvCiudad_SelectedindexChanged" OnRowCommand="gvCiudad_RowCommands">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="bt_seleccion" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" CommandArgument="<%#((GridViewRow)Container).RowIndex %>"/>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
     </asp:GridView>
      <asp:SqlDataSource ID="Ciudad" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="select ID_Ciudad as #, Ciudad from Helix_Ciudad"></asp:SqlDataSource>
      <br />
</asp:Content>
