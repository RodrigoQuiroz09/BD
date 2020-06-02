<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");


    $address_c= $address_a= $phone= $post= $forma_pago ="";

    $sql = "UPDATE usuario SET Direccion = ?, Codigo_postal = ? , Telefono = ?  WHERE (correo_electronico = '".$_SESSION["correo"]."')"; 

    $address_c = trim($_POST['c_address']);
    $address_a =trim( $_POST['a_address']);
    $phone = trim($_POST['c_phone']);
    $post = trim($_POST['c_postal_zip']);
    $forma_pago = trim($_POST['tarjeta']);
    $stmt = "";
    $address=$address_c.". ".$address_a;

    
        if($stmt = mysqli_prepare($enlace, $sql))
        {
            mysqli_stmt_bind_param($stmt, "sss",$address , $post ,$phone);

            if(mysqli_stmt_execute($stmt))
            {  
                header("location: ../html/thankyou.html");
            }

            else
            {
                header("location: ../html/checkout.html");
            }
            mysqli_stmt_close($stmt);
        }
    
    mysqli_close($enlace);

    ?>