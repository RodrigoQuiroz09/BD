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
$_SESSION["is_admin"] ="";

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
        $sql = "SELECT correo_electronico FROM usuario WHERE correo_electronico = ?";
        if($stmt = mysqli_prepare($enlace, $sql))
        {
            mysqli_stmt_bind_param($stmt, "s", $email, );
            if(mysqli_stmt_execute($stmt))
            {
               /*$gethash = "SELECT Contra FROM usuario WHERE correo_electronico = '$email' ";
                
               $con = mysqli_query($enlace, $gethash) or die(mysqli_error($db));
               // $pass = mysqli_fetch_assoc(mysqli_query($enlace, $gethash));

               */
                mysqli_stmt_store_result($stmt);
                $mysqli = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
                //$mysqli = new mysqli("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

                // create a Prepared Statement to query to db
                $smt = $mysqli->prepare("SELECT Contra FROM usuario WHERE correo_electronico = ? ");

                // dynamically bind the supplied "username" value
                $smt->bind_param('s', $email);

                // execute the query
                $smt->execute();

                // get the first result and store the first column in the `$hashed_password` variable
                $smt->bind_result($hashed_password);
                $smt->fetch();

                // close our Prepared Statement and the db connection
                $smt->close();
            

                if(password_verify($password,$hashed_password)){
                if(mysqli_stmt_num_rows($stmt)==1)
                {   

                    $_SESSION["correo"] = $email;
                    $sql2 = "SELECT is_admin FROM usuario WHERE correo_electronico = '".$_SESSION["correo"]."'; ";
                    $is = mysqli_query($enlace, $sql2);
                    $admin = mysqli_fetch_assoc($is);
                    $_SESSION["is_admin"]=$admin['is_admin'];
                    
                    if($admin['is_admin']=="Y"){
                        header("location: ../html/admin_update.html");
                    }
                    else{
 
                        header("location: ../html/shop.html");
                    }

                    //FALTA ASIGNAR LAS VARIABLES DE SESION
                }
        }

                else{
                    header("location: ../html/index.html");
                }
            

            }

            else
            {
                header("location: ../html/index.html");
            }
            mysqli_stmt_close($stmt);
        }
    }
    mysqli_close($enlace);
}
?>
