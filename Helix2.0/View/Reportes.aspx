<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Helix2._0.View.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /> 
    <div class="row" style="text-align:  center;">
      <asp:Label ID="Label1" runat="server" Text="Reportes" CssClass="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-center" Font-Size="X-Large"></asp:Label>
          </div> 
    <br />
    <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">Reporte de Tickets por Usuario</a></li>
  <li><a data-toggle="tab" href="#menu1">Reporte de Comentarios por Usuario</a></li>
  <li><a data-toggle="tab" href="#menu2">Reporte de Formas de Pago por Ticket</a></li>
  <li><a data-toggle="tab" href="#menu3">Reporte de Tickets por Cliente</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
<iframe width="100%" height="700" src="https://app.powerbi.com/view?r=eyJrIjoiYzA3NzM5ZmUtYjUwYy00Mzk3LWE3YzAtNWQyMWVjNmFjMmU4IiwidCI6Ijc1MGE4ZThiLWNlZDItNGU3Ni1iMmY3LTRhZTlhNTZkNjU1NyIsImMiOjR9" frameborder="0"></iframe>
  </div>
  <div id="menu1" class="tab-pane fade">
    <h3>Menu 1</h3>
    <p>Some content in menu 1.</p>
  </div>
  <div id="menu2" class="tab-pane fade">
    <h3>Menu 2</h3>
    <p>Some content in menu 2.</p>
  </div>
      <div id="menu3" class="tab-pane fade">
    <h3>Menu 2</h3>
    <p>Some content in menu 2.</p>
  </div>
</div>
</asp:Content>
