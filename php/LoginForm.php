<?php
session_start();
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
{
    header("location: ../html/shop.html");
    exit;
}

$enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
//$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

$email = $_POST['email'];
$password = $_POST['password'];
$email_error = $password_error ="";
$_SESSION["correo"] = "";
$_SESSION["nombre"] = "";   

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
                    header("location: ../html/shop.html");
                    //FALTA ASIGNAR LAS VARIABLES DE SESION
                }
                else{
                    header("location: ../html/shop.html");
                }
            }

            else
            {
                header("location: ../html/shop.html");
            }
            mysqli_stmt_close($stmt);
        }
    }
    mysqli_close($enlace);
}
?>