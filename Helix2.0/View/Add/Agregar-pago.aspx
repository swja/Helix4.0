<%@ Page Title="Agregar formas de pago" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-pago.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Forma de pago" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Forma de pago" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_Pago" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_agregarPago" runat="server" Text="Agregar Forma de pago" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_agregarPago_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Button2_Click" OnClientClick="javascript:return volver();"/>
    </div>
                <script type="text/javascript">
<!--
function volver() {
    window.location.href = "../Pagos.aspx";
    return false;
}
//-->
</script>
</asp:Content>
