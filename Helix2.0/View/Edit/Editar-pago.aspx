﻿<%@ Page Title="Editar Formas de Pago" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-pago.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Forma de Pago" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Forma de Pago a editar" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_Pago" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ForeColor="#339933" ControlToValidate="txt_Pago" CssClass="col-lg-6 col-md-6"></asp:RequiredFieldValidator>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_editar" runat="server" Text="Editar Forma de Pago" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Button2_Click" OnClientClick="javascript:return volver();" />
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