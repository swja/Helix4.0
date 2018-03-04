<%@ Page Title="Editar Flujo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-flujo.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_flujo" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Flujo" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Nombre del flujo" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_nombre" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ForeColor="#339933" ControlToValidate="txt_nombre" CssClass="col-lg-6 col-md-6"></asp:RequiredFieldValidator>
        </div>
<br />
    <div class="row">
           <asp:Label ID="Label3" runat="server" Text="Descripción del flujo" CssClass="col-lg-2 col-md-2"></asp:Label>
        </div>
    <br />
    <asp:TextBox ID="txt_descripcion" runat="server" Height="159px" TextMode="MultiLine" Width="75%" CssClass="col-lg-12 col-md-12"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" ForeColor="#339933" ControlToValidate="txt_descripcion" CssClass="col-lg-6 col-md-6"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <div class="row">
        <asp:Label ID="Label4" runat="server" CssClass="col-lg-3 col-md-3" Text="Estados que posee el flujo"></asp:Label>
        <br />
        <asp:GridView ID="gvEtapa" runat="server" CssClass="col-lg-10 col-md-10" AutoGenerateColumns="False" DataKeyNames="#">
            <Columns>
                <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
                <asp:BoundField DataField="Nombre de la Etapa" HeaderText="Nombre de la Etapa" SortExpression="Nombre de la Etapa" />
                <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
            </Columns>
        </asp:GridView>
        <br />

    </div>
    <br />
    <div class="row">
        <asp:Button ID="Bt_editar" runat="server" Text="Editar Flujo" CssClass="col-lg-3 col-md-3" style="left:1%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="Bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Bt_cancelar_Click" OnClientClick="javascript:return volver();" />
    </div>
                <script type="text/javascript">
<!--
function volver() {
    window.location.href = "../Flujos.aspx";
    return false;
}
//-->
</script>
</asp:Content>
