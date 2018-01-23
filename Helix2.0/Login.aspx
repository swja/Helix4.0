<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Helix2._0.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HELIX</title>
    <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS -->
        <link href="Content/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="Content/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="Content/assets/css/form-elements.css" rel="stylesheet" type="text/css" />
        <link href="Content/assets/css/style.css" rel="stylesheet" type="text/css" />

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="Content/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="Content/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="Content/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="Content/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="Content/assets/ico/apple-touch-icon-57-precomposed.png">

</head>
<body>
     <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>HELIX</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Bienvenido</h3>
                            		<p>Ingrese su usuario y contraseña:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" runat="server" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Nombre de Usuario</label>
                                        <asp:TextBox ID="txt_user" runat="server" name="form-username" placeholder="Usuario..." class="form-username form-control" TextMode="SingleLine" ></asp:TextBox>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Contraseña</label>
                                        <asp:TextBox ID="txt_pass" runat="server" name="form-password" placeholder="Contraseña..." class="form-password form-control" TextMode="Password"></asp:TextBox>
			                        </div>
                                    <asp:button ID="button" runat="server" Text="Ingresar!" class="btn1" Width="100%" OnClick="button_Click" />
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="Content/assets/js/jquery-1.11.1.min.js"></script>
        <script src="Content/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="Content/assets/js/jquery.backstretch.min.js"></script>
        <script src="Content/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="Content/assets/js/placeholder.js"></script>
        <![endif]-->
</body>
</html>