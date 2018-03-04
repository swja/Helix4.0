<%@ Page Title="Editar Tipo de Insutria" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-industria.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_industria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Tipo de Industria" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
    <br />
     <div class="row">
        <asp:Label ID="Label4" runat="server" Text="Industria a editar" CssClass="col-lg-3 col-md-3"></asp:Label>
            <asp:TextBox ID="txt_Industria" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
    </div>
    <br />
    <div class="row">
        <asp:Button ID="bt_editar" runat="server" Text="Editar Tipo de industria" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Button2_Click" OnClientClick="javascript:return volver();" />
    </div>
                <script type="text/javascript">
<!--
function volver() {
    window.location.href = "../Industrias.aspx";
    return false;
}
//-->
</script>
</asp:Content>
