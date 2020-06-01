<?php
    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    $update_query = "UPDATE carro_compra SET Cantidad = '".$_POST["quantity"]."' WHERE  (Clave_Producto = '".$_POST["product"]."')";
    mysqli_query($enlace, $update_query); 
?>