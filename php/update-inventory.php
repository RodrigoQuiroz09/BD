<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // ACTUALIZAR LA CANTIDAD DE ELEMENTOS EN EL INVENTARIO
    $update_query = "DELETE FROM carro_compra WHERE (correo_electronico = '".$_SESSION["correo"]."' AND Clave_Producto = '".$_POST["product"]."');";
    mysqli_query($enlace, $update_query); 
?>