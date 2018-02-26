<%@ Page Title="Editar Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-usuario.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Editar Usuario" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
               <div class="row">
           <div class="row">
            <asp:Label ID="Label2" runat="server" Text="Nombre" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_nombre" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
             <asp:Label ID="Label3" runat="server" Text="Apellido" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_apellido" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
            <div class="row">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="col-lg-6 col-md-6" style="padding-left: 17%;" ControlToValidate="txt_nombre" ForeColor="#4AAF51" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="col-lg-6 col-md-6" style="padding-left: 6%;" ControlToValidate="txt_apellido" ForeColor="#4AAF51" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
    <br />
        <div class="row">
            <asp:Label ID="Label4" runat="server" Text="Email" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_email" runat="server" CssClass="col-lg-3 col-md-3" TextMode="Email"></asp:TextBox>
             <asp:Label ID="Label5" runat="server" Text="Telefono" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_telefono" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
             <div class="row">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" CssClass="col-lg-6 col-md-6" style="padding-left: 17%;" ControlToValidate="txt_email" ForeColor="#4AAF51" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="col-lg-6 col-md-6" style="padding-left: 6%;" ControlToValidate="txt_telefono" ForeColor="#4AAF51" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
    <br />
    <div class="row">
            <asp:Label ID="Label8" runat="server" Text="Nombre de Usuario" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_usuario" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
            <asp:Label ID="Label9" runat="server" Text="Contraseña" CssClass="col-lg-2 col-md-2"  ></asp:Label>
            <asp:TextBox ID="txt_pass" runat="server" CssClass="col-lg-3 col-md-3" placeholder="Actualizar contraseña..." ToolTip="Modifique este campo solo si desea actualizar su contraseña."></asp:TextBox>
        </div>
             <div class="row">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="col-lg-6 col-md-6" style="padding-left: 17%;" ControlToValidate="txt_usuario" ForeColor="#4AAF51" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
    <br />
    <div class="row">
            <asp:Label ID="Label6" runat="server" Text="Cargo empresarial" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:TextBox ID="txt_cargo" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
            <asp:Label ID="Label7" runat="server" Text="Rol de usuario" CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:Label ID="Label10" runat="server" Text="Rol de usuario" CssClass="col-lg-2 col-md-2"></asp:Label>
            <asp:DropDownList ID="dl_Cargo" runat="server" CssClass="col-lg-3 col-md-3" DataSourceID="Usuario" DataTextField="ROL" DataValueField="ID_ROL" placeholder="Seleccione...">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT [ROL], [ID_ROL] FROM [HELIX_ROL]"></asp:SqlDataSource>
        </div>
             <div class="row">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo requerido" CssClass="col-lg-6 col-md-6" style="padding-left: 17%;" ControlToValidate="txt_cargo" ForeColor="#4AAF51" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
       <br />
    <br />
     <div class="row">
    </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_editar" runat="server" Text="Editar Usuario" CssClass="col-lg-3 col-md-3" style="left:20%" OnClick="Bt_editar_Click"/>
        <asp:Button ID="Bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" OnClick="Bt_cancelar_Click" />
    </div>
     </div>
</asp:Content>
