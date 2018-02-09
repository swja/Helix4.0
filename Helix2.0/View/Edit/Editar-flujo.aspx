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
            <asp:TextBox ID="TextBox1" runat="server" CssClass="col-lg-3 col-md-3"></asp:TextBox>
        </div>
    <br />
        <div class="row">
            <asp:Label ID="Label3" runat="server" Text="Fecha de adición" CssClass="col-lg-2 col-md-2"></asp:Label>
            <eo:DatePicker ID="DatePicker1" runat="server" ClientIDMode="AutoID" CssClass="col-lg-1 col-md-1" ControlSkinID="None" DayCellHeight="15" DayCellWidth="31" DayHeaderFormat="Short" DisabledDates="" OtherMonthDayVisible="True" SelectedDates="" TitleFormat="MMMM, yyyy" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2018-02-01">
                <calendarstyle csstext="background-color:white;border-bottom-color:Silver;border-bottom-style:solid;border-bottom-width:1px;border-left-color:Silver;border-left-style:solid;border-left-width:1px;border-right-color:Silver;border-right-style:solid;border-right-width:1px;border-top-color:Silver;border-top-style:solid;border-top-width:1px;color:#2C0B1E;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" />
                <TitleStyle CssText="font-family:Verdana;font-size:8.75pt;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" />
                <titlearrowstyle csstext="cursor: hand" />
                <monthstyle csstext="cursor:hand;margin-bottom:0px;margin-left:4px;margin-right:4px;margin-top:0px;" />
                <DayHeaderStyle CssText="font-family:Verdana;font-size:8pt;border-bottom: #f5f5f5 1px solid" />
                <DayStyle CssText="font-family:Verdana;font-size:8pt;" />
                <dayhoverstyle csstext="font-family:Verdana;font-size:8pt;background-image:url('00040402');color:#1c7cdc;" />
                <todaystyle csstext="font-family:Verdana;font-size:8pt;background-image:url('00040401');color:#1176db;" />
                <SelectedDayStyle CssText="font-family:Verdana;font-size:8pt;background-image:url('00040403');color:Brown;" />
                <disableddaystyle csstext="font-family:Verdana;font-size:8pt;color: gray" />
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
    <div class="row">
        <asp:Label ID="Label4" runat="server" CssClass="col-lg-3 col-md-3" Text="Estados que posee el flujo"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="col-lg-10 col-md-10">
        </asp:GridView>
        <br />

    </div>
    <br />
    <div class="row">
        <asp:Button ID="Button1" runat="server" Text="Agregar Flujo" CssClass="col-lg-3 col-md-3" style="left:20%"/>
        <asp:Button ID="Button2" runat="server" Text="Cancelar"  CssClass="col-lg-3 col-md-3" style="left:36%" />
    </div>
</asp:Content>
