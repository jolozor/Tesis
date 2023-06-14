<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Tesis.Pages.LogIn" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="images/Logo.png">
    
    <title>LogIn
    </title>

    <style>
        * {
            background: none;
        }

        footer {
            background-color: #dee2e6;
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 40px;
            color: #000000;
            left: 0px;
            z-index: 1000;
        }

        .login {
            padding: 8em 0 0;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="login 100px">
            <div class="mx-auto" style="width: 500px; margin-bottom: 0px;">
                <h1 class="text-center mb-4">SERTINF</h1>

                <h3 class="mb-4">LogIn</h3>

                 <!-- Empresa -->
                 <div class="form-control form-control-sm">
                     <asp:ScriptManager ID="ScriptManager1" runat="server">

                     </asp:ScriptManager>
                     <ajaxToolkit:ComboBox BorderStyle="None" cssClass="form-floating" ID="ComboBox1" runat="server" placeholder="Empresa" ></ajaxToolkit:ComboBox>
                      
                 </div>

                <br />

                <!-- Email input -->
                <div class="form-floating mb-3">
                    <!--  <input type="text" class="form-control" id="txtLoginusuario" name="txtLoginusuario" placeholder="Usuario"> -->
                    <asp:TextBox type="text" class="form-control form-control-sm" ID="TextBox1" runat="server" placeholder="Usuario"></asp:TextBox>
                    <label for="txtLoginusuario">Usuario</label>
                </div>

                <!-- Password input -->
                <div class="form-floating mb-3">
                    <!--<input type="password" class="form-control" id="txtLoginpassword" name="txtLoginpassword" placeholder="Contraseña"> -->
                    <asp:TextBox type="password" class="form-control form-control-sm" ID="TextBox2" runat="server" placeholder="Contraseña"></asp:TextBox>
                    <label for="txtLoginpassword">Contraseña</label>
                </div>



                <!-- Submit button -->
                <div class="btn">
                    <asp:Button class="btn btn-primary btn-block mb-4" ID="Button1" runat="server" OnClick="Button1_Click" Text="Acceder" />

                </div>
                <br />
                <asp:Label ID="Label1" runat="server" Text="" class="label warning"></asp:Label>

            </div>
        </div>

        <footer>
            <center>
                <div class="footer">
                    <p>&copy; 2022 SERTINF. All Rights Reserved | Design by gn by <a href="Home.apsx" target="_blank">SERTINF</a> </p>
                </div>
            </center>
        </footer>


    </form>

</body>
</html>
