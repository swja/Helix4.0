<%@ Page Title="Agregar tipo industria" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-industria.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_industria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Agregar Tipo de industria" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
        <div class="row">
           <asp:Label ID="Label2" runat="server" Text="Tipo de industria" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_Industria" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="bt_AgregarIndustria" runat="server" Text="Agregar Tipo de industria" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_agregarIndustria_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Button2_Click" />
    </div>
</asp:Content>
