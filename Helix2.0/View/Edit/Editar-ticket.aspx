<%@ Page Title="Editar ticket" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar-ticket.aspx.cs" Inherits="Helix2._0.View.Edit.Editar_ticket" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
     <div class="row" style="text-align:  center;">
        <asp:Label ID="Label1" runat="server" Text="Editar Ticket" CssClass="col-md-12 col-sm-12 col-xs-12 text-center" Font-Size="X-Large"></asp:Label>
         <br />
         <br />
      </div> 
    <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Nombre del ticket</asp:Label>
        <asp:TextBox CssClass="col-lg-10 col-md-10" runat="server" style="width:67%; height:40px;" ID="txt_Nombre" TextMode="MultiLine"></asp:TextBox>
    </div>     
    <br />
        <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Responsable</asp:Label>
        <asp:TextBox runat="server" CssClass="col-lg-3 col-md-3" ID="txt_Responsable"></asp:TextBox>
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Flujo</asp:Label>
        <asp:DropDownList runat="server" CssClass="col-lg-3 col-md-3" ID="dl_Flujo" DataSourceID="Flujo" DataTextField="NOMBRE_FLUJO" DataValueField="ID_FLUJO" AutoPostBack="True" OnSelectedIndexChanged="cargar_Etapas"></asp:DropDownList>
            <asp:SqlDataSource ID="Flujo" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FLUJO, NOMBRE_FLUJO FROM HELIX_FLUJO"></asp:SqlDataSource>
    </div>   
    <br />
     <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Cliente</asp:Label>
        <asp:TextBox runat="server" CssClass="col-lg-3 col-md-3" ID="txt_Cliente"></asp:TextBox>
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Estado</asp:Label>
        <asp:DropDownList runat="server" CssClass="col-lg-3 col-md-3" ID="dl_Etapa"></asp:DropDownList>
    </div>   
    <br />
     <div class="row">
        <asp:Label CssClass="col-lg-2 col-md-2" runat="server">Descripción</asp:Label>
         <asp:Label CssClass="col-lg-2 col-md-2" runat="server" style="left:26%">Comentarios</asp:Label>
         <br />
    </div>   
    <div class="row" style="padding-left:1%">
        <asp:TextBox ID="txt_Descripcion" runat="server" Height="200px" TextMode="MultiLine" Width="40%" CssClass="col-lg-6 col-md-6"></asp:TextBox>
        <div style="border: 1px solid #FFF;">
            <asp:TextBox ID="txt_Comentario" runat="server" Height="50px" TextMode="MultiLine" Width="40%" style="left:5%" CssClass="col-lg-6 col-md-6"></asp:TextBox>
            <br />
             <asp:Button ID="Bt_agregar_comentario" runat="server" Text="Agregar comentario" CssClass="col-lg-2 col-md-2" style="left:-12%; top:5%" OnClick="Bt_agregar_comentario_Click"/>
            <div style="padding-left:45%">
                  <div id="comentario"class="table-responsive">
                <asp:GridView ID="gvComentario" runat="server" AutoGenerateColumns="False" DataKeyNames="#" DataSourceID="Comentario" class="table" Width="16px">
                    <Columns>
                        <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
                        <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                        <asp:BoundField DataField="Fecha" DataFormatString="{0:d}" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
                    </Columns>
                </asp:GridView>
                      </div>
                <asp:SqlDataSource ID="Comentario" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_COMENTARIO AS #, COMENTARIO AS 'Comentario', FECHA_COMENTARIO AS 'Fecha', CONCAT(HELIX_USUARIO.NOMBRE, ' ', HELIX_USUARIO.APELLIDO) AS 'Usuario' FROM HELIX_COMENTARIO INNER JOIN HELIX_USUARIO ON HELIX_COMENTARIO.ID_USUARIO = HELIX_USUARIO.ID_USUARIO WHERE ID_TICKET = @TICKET">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label5" Name="TICKET" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

                </div>
            </div>
    </div>
    <br />
    <div class="row">
        <asp:Label ID="Label4" runat="server" Text="Forma de pago" CssClass="col-lg-2 col-md-2"></asp:Label>
        <asp:DropDownList ID="dl_Pago" runat="server" CssClass="col-lg-3 col-md-3" DataSourceID="Pago" DataTextField="FORMA_PAGO" DataValueField="ID_FORMAPAGO"></asp:DropDownList>
        <asp:SqlDataSource ID="Pago" runat="server" ConnectionString="<%$ ConnectionStrings:HelixConnectionString %>" SelectCommand="SELECT ID_FORMAPAGO, FORMA_PAGO FROM HELIX_FORMA_PAGO"></asp:SqlDataSource>
    </div>
    <br />
    <div class="row">
     <asp:Label ID="Label2" runat="server" Text="Fecha de entrega" CssClass="col-lg-2 col-md-2"></asp:Label>
     <asp:Label ID="Label3" runat="server" Text="Fecha de cobro" CssClass="col-lg-2 col-md-2" style="left:8%"></asp:Label>
     </div>
    <div class="row">
        <eo:DatePicker ID="fecha_Entrega" runat="server" CssClass="col-lg-1 col-md-1" style="left:4%" ClientIDMode="AutoID" ControlSkinID="None" DayCellHeight="15" DayCellWidth="31" DayHeaderFormat="Short" DisabledDates="" OtherMonthDayVisible="True" SelectedDates="" TitleFormat="MMMM, yyyy" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2018-02-01">
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
        <eo:DatePicker ID="fecha_Factura" runat="server" CssClass="col-lg-1 col-md-1" style="left:15%" ClientIDMode="AutoID" ControlSkinID="None" DayCellHeight="15" DayCellWidth="31" DayHeaderFormat="Short" DisabledDates="" OtherMonthDayVisible="True" SelectedDates="" TitleFormat="MMMM, yyyy" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2018-02-01">
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
    <br />
    <div class="row">
        <asp:Button ID="Bt_editar" runat="server" Text="Editar Ticket" CssClass="col-lg-2 col-md-2" style="left:4%" OnClick="Bt_editar_Click1"/>
        <asp:Button ID="Bt_cancelar" runat="server" Text="Cancelar"  CssClass="col-lg-2 col-md-2" style="left:9%" OnClientClick="javascript:return volver();" />
        <asp:Label ID="Label5" runat="server" Text="Label" Visible="false"></asp:Label>
    </div>
        <script type="text/javascript">
<!--
function volver() {
    window.location.href = "../Tickets.aspx";
    return false;
}
//-->
</script>
</asp:Content>