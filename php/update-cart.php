<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    if ($_POST["op"] == "add") {
        $update_query = "INSERT INTO carro_compra VALUES ('".$_SESSION["correo"]."', ".$_POST["product"].", '".$_POST["quantity"]."');";
        mysqli_query($enlace, $update_query); 
    }
    if ($_POST["op"] == "update") {
        $update_query = "UPDATE carro_compra SET Cantidad = '".$_POST["quantity"]."' WHERE  (correo_electronico = '".$_SESSION["correo"]."' AND Clave_Producto = '".$_POST["product"]."');";
        mysqli_query($enlace, $update_query); 
        obtenerTotal($enlace);
    }
    if ($_POST["op"] == "remove") {
        $update_query = "DELETE FROM carro_compra WHERE (correo_electronico = '".$_SESSION["correo"]."' AND Clave_Producto = '".$_POST["product"]."');";
        mysqli_query($enlace, $update_query); 
    }
    if ($_POST["op"] == "getTotal") {
        obtenerTotal($enlace);
    }

    function obtenerTotal($enlace_bd) {
        $update_precio = "SELECT SUM(Precio * Cantidad) AS total FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_SESSION["correo"]."');";
        $precio_total = mysqli_query($enlace_bd, $update_precio); 
        $total = mysqli_fetch_assoc($precio_total);
        echo "$".$total['total']." MXN";
    }
?>