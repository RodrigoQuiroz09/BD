<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // REVISAR INVENTARIO DISPONIBLE
    $inventory_check = "SELECT DISTINCT * FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_SESSION["correo"]."');";
    $check = mysqli_query($enlace, $inventory_check) or die(mysqli_error($enlace));
    while($producto = mysqli_fetch_assoc($check)) {
        if ($producto['Piezas_Disponibles'] < $producto['Cantidad']) {
            header("location: ../html/error.html");
            exit(); 
        }
    }

    $update_inventory = "UPDATE (carro_compra NATURAL JOIN inventario) SET Piezas_Disponibles = (Piezas_Disponibles - Cantidad)  WHERE (correo_electronico = '".$_SESSION["correo"]."');";
    mysqli_query($enlace, $update_inventory); 
        
    // INGRESAR UNA TRANSACCIÓN
    date_default_timezone_set('America/Mexico_City');
    $date = date('Y-m-d H:i:s');

    $update_precio = "SELECT SUM(Precio * Cantidad) AS total FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_SESSION["correo"]."');";
    $precio_total = mysqli_query($enlace, $update_precio); 
    $total = mysqli_fetch_assoc($precio_total);

    $forma_pago = trim($_POST['tarjeta']);

    $sql2 = "INSERT INTO transaccion (Correo_Cliente, Fecha_Hora, Forma_Pago, Monto_total) VALUES ('".$_SESSION["correo"]."', '$date', '$forma_pago', '".$total['total']."'); "; 
    mysqli_query($enlace, $sql2) or die(mysqli_error($enlace));

    // ACTUALIZAR DATOS DEL USUARIO
    $sql = "UPDATE usuario SET Direccion = ?, Codigo_postal = ? , Telefono = ?  WHERE (correo_electronico = '".$_SESSION["correo"]."')"; 
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
    
    // AGREGAR ELEMENTOS A TABLA PRODUCTOS (TICKET)
    $update_ticket = "INSERT INTO productos (SELECT Clave_Producto, No_Transaccion, Cantidad FROM transaccion INNER JOIN carro_compra ON (correo_electronico = Correo_Cliente) WHERE (correo_electronico = '".$_SESSION["correo"]."' AND Fecha_Hora = '$date'));";
    mysqli_query($enlace, $update_ticket) or die(mysqli_error($enlace)); 
    
    // ELIMINAR ELEMENTOS DEL CARRITO DE COMPRA
    $update_query = "DELETE FROM carro_compra WHERE (correo_electronico = '".$_SESSION["correo"]."');";
    mysqli_query($enlace, $update_query); 
        
    mysqli_close($enlace);
?>