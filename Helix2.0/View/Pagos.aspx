<%@ Page Title="Formas de pago" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="Helix2._0.View.Pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Listado de Formas de pago" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    
      <br />
      <div class="row">
           <h5 class="col-md-2 col-sm-2 col-lg-2">Filtro formas de pago </h5>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="col-md-3 col-sm-3 col-lg-2" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" CssClass="col-md-2 col-sm-2 col-lg-6" Text="Nuevo" Width="10%" style="left:40%" OnClick="Button1_Click" />     
      </div>
      <asp:GridView ID="gvPagos" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#,Forma de Pago" DataSourceID="FormasPago" OnSelectedIndexChanged="gvPagos_SelectedIndexChanged" CssClass="table table-responsive">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Forma de Pago" HeaderText="Forma de Pago" SortExpression="Forma de Pago" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
     </asp:GridView>
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="#,Forma de Pago" DataSourceID="Consulta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-responsive" Visible="False">
          <Columns>
              <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
              <asp:BoundField DataField="Forma de Pago" HeaderText="Forma de Pago" SortExpression="Forma de Pago" />
              <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" />
          </Columns>
     </asp:GridView>
      <asp:SqlDataSource ID="Consulta" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FORMAPAGO AS #, FORMA_PAGO AS 'Forma de Pago' FROM HELIX_FORMA_PAGO 
WHERE FORMA_PAGO LIKE @nom order by FORMA_PAGO ASC">
          <SelectParameters>
              <asp:ControlParameter ControlID="Label2" Name="nom" PropertyName="Text" />
          </SelectParameters>
     </asp:SqlDataSource>
      <asp:SqlDataSource ID="FormasPago" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FORMAPAGO AS #, FORMA_PAGO AS 'Forma de Pago' FROM HELIX_FORMA_PAGO order by FORMA_PAGO ASC"></asp:SqlDataSource>
      <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
      <br />
</asp:Content>
