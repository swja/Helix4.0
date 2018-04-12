<%@ Page Title="Tipos de industrias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Industrias.aspx.cs" Inherits="Helix2._0.View.Industrias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado Tipos de industrias" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-3 col-sm-3 col-lg-3">Filtro de tipo de industrias </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
               <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:33%" OnClick="Button1_Click" />     
      </div>
      <asp:GridView ID="gvIndustria" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#, Tipo de Industria" DataSourceID="Inudstria" OnSelectedIndexChanged="gvIndustria_SelectedIndexChanged" CssClass="table table-responsive">
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
     <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#,Tipo de Industria" DataSourceID="Consulta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-responsive" Visible="False">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Tipo de Industria" HeaderText="Tipo de Industria" SortExpression="Tipo de Industria" />
              <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" />
          </Columns>
     </asp:GridView>
      <asp:SqlDataSource ID="Consulta" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_TIPOINDUSTRIA AS #, TIPO_INDUSTRIA AS 'Tipo de Industria' FROM HELIX_TIPO_INDUSTRIA 
WHERE TIPO_INDUSTRIA LIKE @nom ORDER BY TIPO_INDUSTRIA ASC">
          <SelectParameters>
              <asp:ControlParameter ControlID="Label2" Name="nom" PropertyName="Text" />
          </SelectParameters>
     </asp:SqlDataSource>
      <asp:SqlDataSource ID="Inudstria" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_TIPOINDUSTRIA AS #, TIPO_INDUSTRIA AS 'Tipo de Industria' FROM HELIX_TIPO_INDUSTRIA"></asp:SqlDataSource>
      <br />
</asp:Content>
