<%@ Page Title="Tipos de industrias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Industrias.aspx.cs" Inherits="Helix2._0.View.Industrias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado Tipos de industrias" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-3 col-sm-3 col-lg-3">Filtro de tipo de industrias </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:33%" OnClick="Button1_Click" />     
      </div>
      <asp:GridView ID="gvIndustria" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#, Tipo de Industria" DataSourceID="Inudstria" OnSelectedIndexChanged="gvIndustria_SelectedIndexChanged">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Tipo de Industria" HeaderText="Tipo de Industria" SortExpression="Tipo de Industria" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
     </asp:GridView>
      <asp:SqlDataSource ID="Inudstria" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_TIPOINDUSTRIA AS #, TIPO_INDUSTRIA AS 'Tipo de Industria' FROM HELIX_TIPO_INDUSTRIA"></asp:SqlDataSource>
      <br />
</asp:Content>
