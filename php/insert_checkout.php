<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    ////$enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");

    $enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    $sql = "UPDATE usuario SET Direccion = ?, Codigo_postal = ? , Telefono = ?  WHERE (correo_electronico = '".$_SESSION["correo"]."')"; 

        
        
    date_default_timezone_set('America/Mexico_City');
    
    $date = date('Y-m-d H:i:s');

    $update_precio = "SELECT SUM(Precio * Cantidad) AS total FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_SESSION["correo"]."');";
    $precio_total = mysqli_query($enlace, $update_precio) or die(mysqli_error($enlace)); 
    $total = mysqli_fetch_assoc($precio_total);

    $forma_pago = trim($_POST['tarjeta']);

    $sql2 = "INSERT INTO transaccion (Correo_Cliente, Fecha_Hora, Forma_Pago, Monto_total) VALUES ('".$_SESSION["correo"]."', '$date', '$forma_pago', '".$total['total']."'); "; 

    mysqli_query($enlace, $sql2) or die(mysqli_error($enlace));


    $address_c= $address_a= $phone= $post= $forma_pago ="";

    $address_c = trim($_POST['c_address']);
    $address_a =trim( $_POST['a_address']);
    $phone = trim($_POST['c_phone']);
    $post = trim($_POST['c_postal_zip']);

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
        
        $update_query = "DELETE FROM carro_compra WHERE (correo_electronico = '".$_SESSION["correo"]."');";
        mysqli_query($enlace, $update_query); 
        
    
    mysqli_close($enlace);





    ?>