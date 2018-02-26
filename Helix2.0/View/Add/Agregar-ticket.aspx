<%@ Page Title="Agregar Ticket" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar-ticket.aspx.cs" Inherits="Helix2._0.View.Add.Agregar_ticket" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
     <div class="row" style="text-align:  center;">
        <asp:Label ID="Label1" runat="server" Text="Agregar Ticket" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
         <br />
         <br />
      </div> 
    <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Nombre del ticket</asp:Label>
        <asp:TextBox CssClass="col-lg-10 col-md-10" runat="server" style="width:61%; height:10%;" ID="txt_Nombre_Ticket" TextMode="MultiLine"></asp:TextBox>
    </div>     
    <br />
        <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Responsable</asp:Label>
        <asp:DropDownList runat="server" CssClass="col-lg-4 col-md-4" ID="dl_Responsable" DataSourceID="Usuario" DataTextField="Column1" DataValueField="ID_USUARIO"></asp:DropDownList>
            <asp:SqlDataSource ID="Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_USUARIO, CONCAT(NOMBRE, ' ', APELLIDO) FROM HELIX_USUARIO"></asp:SqlDataSource>
        <asp:Label CssClass="col-lg-1 col-md-1" runat="server">Flujo</asp:Label>
        <asp:DropDownList runat="server" CssClass="col-lg-4 col-md-4" ID="dl_Flujo" DataSourceID="Flujo" DataTextField="NOMBRE_FLUJO" DataValueField="ID_FLUJO" AutoPostBack="True" OnSelectedIndexChanged="Carga_etapas"></asp:DropDownList>
            <asp:SqlDataSource ID="Flujo" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT NOMBRE_FLUJO, ID_FLUJO FROM HELIX_FLUJO"></asp:SqlDataSource>
    </div>   
    <br />
     <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Cliente</asp:Label>
        <asp:DropDownList runat="server" CssClass="col-lg-4 col-md-4" ID="dl_Cliente" DataSourceID="Cliente" DataTextField="NOMBRES" DataValueField="ID_CLIENTE"></asp:DropDownList>
         <asp:SqlDataSource ID="Cliente" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_CLIENTE, NOMBRES FROM HELIX_CLIENTE"></asp:SqlDataSource>
        <asp:Label CssClass="col-lg-1 col-md-1" runat="server">Estado</asp:Label>
        <asp:DropDownList runat="server" CssClass="col-lg-4 col-md-4" ID="dl_Estado"></asp:DropDownList>
    </div>   
    <br />
     <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Descripción</asp:Label>
         <br />
    </div>   
    <div class="row" style="padding-left:10%">
        <asp:TextBox ID="txt_Descripcion" runat="server" Height="159px" TextMode="MultiLine" Width="75%" CssClass="col-lg-12 col-md-12"></asp:TextBox>
    </div>
    <br />
    <div class="row">
        <asp:Label ID="Label4" runat="server" Text="Modo de pago" CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:DropDownList ID="dl_Pago" runat="server" DataSourceID="Pago" DataTextField="FORMA_PAGO" DataValueField="ID_FORMAPAGO" CssClass="col-lg-3 col-md-3"></asp:DropDownList>
        <asp:SqlDataSource ID="Pago" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FORMAPAGO, FORMA_PAGO FROM HELIX_FORMA_PAGO"></asp:SqlDataSource>
    </div>
    <br />
    <div class="row">
     <asp:Label ID="Label2" runat="server" Text="Fecha de entrega" CssClass="col-lg-2 col-md-2"></asp:Label>
     <asp:Label ID="Label3" runat="server" Text="Fecha de cobro" CssClass="col-lg-2 col-md-2" style="left:50%"></asp:Label>
     </div>
    <div class="row">
     <eo:DatePicker ID="fecha_Entrega" runat="server" CssClass="col-lg-1 col-md-1" style="left:4%;" ClientIDMode="AutoID" ControlSkinID="None" DayCellHeight="15" DayCellWidth="31" DayHeaderFormat="Short" DisabledDates="" OtherMonthDayVisible="True" SelectedDates="" TitleFormat="MMMM, yyyy" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2018-02-01">
         <CalendarStyle CssText="background-color:white;border-bottom-color:Silver;border-bottom-style:solid;border-bottom-width:1px;border-left-color:Silver;border-left-style:solid;border-left-width:1px;border-right-color:Silver;border-right-style:solid;border-right-width:1px;border-top-color:Silver;border-top-style:solid;border-top-width:1px;color:#2C0B1E;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" />
         <TitleStyle CssText="font-family:Verdana;font-size:8.75pt;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" />
         <TitleArrowStyle CssText="cursor: hand" />
         <MonthStyle CssText="cursor:hand;margin-bottom:0px;margin-left:4px;margin-right:4px;margin-top:0px;" />
         <DayHeaderStyle CssText="font-family:Verdana;font-size:8pt;border-bottom: #f5f5f5 1px solid" />
         <DayStyle CssText="font-family:Verdana;font-size:8pt;" />
         <DayHoverStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040402');color:#1c7cdc;" />
         <TodayStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040401');color:#1176db;" />
         <SelectedDayStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040403');color:Brown;" />
         <DisabledDayStyle CssText="font-family:Verdana;font-size:8pt;color: gray" />
         <FooterTemplate>
             <table border="0" cellpadding="0" cellspacing="5" style="font-size: 11px; font-family: Verdana">
                 <tr>
                     <td width="30"></td>
                     <td valign="middle">
                         <img src="{img:00040401}"></img></td>
                     <td valign="middle">Today: {var:today:MM/dd/yyyy}</td>
                 </tr>
             </table>
         </FooterTemplate>
     </eo:DatePicker>
        <eo:DatePicker ID="fecha_Pago" runat="server" CssClass="col-lg-1 col-md-1" style="left:57%" ClientIDMode="AutoID" ControlSkinID="None" DayCellHeight="15" DayCellWidth="31" DayHeaderFormat="Short" DisabledDates="" OtherMonthDayVisible="True" SelectedDates="" TitleFormat="MMMM, yyyy" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2018-02-01">
         <CalendarStyle CssText="background-color:white;border-bottom-color:Silver;border-bottom-style:solid;border-bottom-width:1px;border-left-color:Silver;border-left-style:solid;border-left-width:1px;border-right-color:Silver;border-right-style:solid;border-right-width:1px;border-top-color:Silver;border-top-style:solid;border-top-width:1px;color:#2C0B1E;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" />
         <TitleStyle CssText="font-family:Verdana;font-size:8.75pt;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" />
         <TitleArrowStyle CssText="cursor: hand" />
         <MonthStyle CssText="cursor:hand;margin-bottom:0px;margin-left:4px;margin-right:4px;margin-top:0px;" />
         <DayHeaderStyle CssText="font-family:Verdana;font-size:8pt;border-bottom: #f5f5f5 1px solid" />
         <DayStyle CssText="font-family:Verdana;font-size:8pt;" />
         <DayHoverStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040402');color:#1c7cdc;" />
         <TodayStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040401');color:#1176db;" />
         <SelectedDayStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040403');color:Brown;" />
         <DisabledDayStyle CssText="font-family:Verdana;font-size:8pt;color: gray" />
         <FooterTemplate>
             <table border="0" cellpadding="0" cellspacing="5" style="font-size: 11px; font-family: Verdana">
                 <tr>
                     <td width="30"></td>
                     <td valign="middle">
                         <img src="{img:00040401}"></img></td>
                     <td valign="middle">Today: {var:today:MM/dd/yyyy}</td>
                 </tr>
             </table>
         </FooterTemplate>
     </eo:DatePicker>
    </div>
    <br />
    <br />
    <div class="row">
        <asp:Button ID="Bt_agregar" runat="server" Text="Agregar Ticket" CssClass="col-lg-2 col-md-2" style="left:20%" OnClick="Bt_agregar_Click"/>
        <asp:Button ID="Bt_Cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-2 col-md-2" style="left:36%" />
    </div>
</asp:Content>
