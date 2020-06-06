<?php
$email = $_POST['email'];
$name = $_POST['name'];
$Apellidos = $_POST['Apellidos'];
$password = $_POST['password'];;
$email_error = $name_error = $Apellidos_error = $password_error ="";

$enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
//$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    if(empty(trim($_POST["email"])))
    {
        $email_error = "Introducir un email. No dejar vacio este campo.";
    }
    else
    {
        $sql = "SELECT correo_electronico FROM usuario WHERE correo_electronico = ?";
        $stmt = "";
        if($stmt = mysqli_prepare($enlace, $sql))
        {
            mysqli_stmt_bind_param($stmt, "s", $email_temporal);
            $email_temporal = trim($_POST["email"]);

            if(mysqli_stmt_execute($stmt))
            {
                mysqli_stmt_store_result($stmt);
                if(mysqli_stmt_num_rows($stmt) == 1)
                {
                    $email_error = "Este correo ya fue registrado";
                } 
                else if(stristr($email_temporal, '@') === false && (stristr($email_temporal, ".com") === false || stristr($email_temporal, ".mx") === false )) 
                {
                    $email_error = "Invalid email format";
                    mysqli_stmt_close($stmt);
                }
                else
                {
                    $email = trim($_POST["email"]);
                }
            }
        }
    }
    if(empty(trim($_POST["password"])))
    {
        $password_error = "Introducir un password. No dejar vacio este campo.";     
    } 
    elseif(strlen(trim($_POST["password"])) < 6 || strlen(trim($_POST["password"])) > 30)
    {
        $password_err = "El password debe tener una longitud minima de 6 caracteres y maxima de 30.";
    } 
    else
    {
        $password = trim($_POST["password"]);
    }

    if(empty(trim($_POST["name"])))
    {
        $name_error = "Introducir un nombre. No dejar vacio este campo.";     
    } 
    else
    {
        $name = trim($_POST["name"]);
    }

    if(empty(trim($_POST["Apellidos"])))
    {
        $Apellidos_error = "Introducir apellidos. No dejar vacio este campo.";
    }
    else
    {
        $Apellidos = trim($_POST["Apellidos"]);
    }

    if(empty($password_err) && empty($email_error))
    {
        $admin_no = 'N';
        $sql_query = "INSERT INTO usuario (correo_electronico, Nombre, Apellidos, Contra, is_admin) VALUES (?, ?, ?, ?, ?)";
        $stmt = "";
        
        $hash= password_hash($password, PASSWORD_DEFAULT, [15]);


        if($stmt = mysqli_prepare($enlace, $sql_query))
        {
            mysqli_stmt_bind_param($stmt, "sssss", $email, $name, $Apellidos, $hash, $admin_no);
            if(mysqli_stmt_execute($stmt))
            {
                header("location: ../html/index.html");
            }
            mysqli_stmt_close($stmt);
            mysqli_close($enlace);
        }
    }
    else
    {
        echo "A PAGAR BARRAGÁN";
    }
}

?>