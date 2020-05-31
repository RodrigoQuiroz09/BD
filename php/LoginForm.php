<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Login de Usuario</title>
</head>
<body>
<?php
session_start();
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
{
    header("location: LoginForm.php");
    exit;
}

$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

$email = $password = "";
$email_error = $password_error ="";
$_SESSION["correo"] = "";

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    if(empty(trim($_POST["email"])))
    {
        $email_error = "Favor de introducir correo";
    }
    else
    {
        $email = trim($_POST["email"]);
    }

    if(empty(trim($_POST["password"])))
    {
        $password_error = "Favor de introducir password";
    }
    else
    {
        $password = trim($_POST["password"]);
    }

    if(empty($email_error) && empty($password_error))
    {
        $sql = "SELECT correo_electronico, Contra FROM usuario WHERE correo_electronico = ? AND Contra = ?";
        if($stmt = mysqli_prepare($enlace, $sql))
        {
            mysqli_stmt_bind_param($stmt, "ss", $email, $password);
            if(mysqli_stmt_execute($stmt))
            {
                mysqli_stmt_store_result($stmt);
                if(mysqli_stmt_num_rows($stmt)==1)
                {
                    $_SESSION["correo"] = $email;
                    header("location: Bebe_Amarillo.jpg");
                    //FALTA ASIGNAR LAS VARIABLES DE SESION
                }
            }
            else
            {
                $password_error = "No se ha encontrado una cuenta con el correo y password proporcionados. Intentar de nuevo";
                echo "Se ha presentado un error ajeno a nosotros. Favor de intentar el registro nuevamente";
            }
            mysqli_stmt_close($stmt);
        }
    }
    mysqli_close($enlace);
}
?>
<h1>Ingreso a Cuenta</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <p>Ingresa los siguientes datos para iniciar Sesión</p>
    <p> Correo </p>
    <input type="text" required name="email" value="<?php echo $email; ?>">
    <p> Password </p>
    <input type="password" required name="password" value="<?php echo $password; ?>">
    <br> </br>
    <input type="submit" name="Login" value="INICIAR SESIÓN">
    </form>´

</body>
<html>