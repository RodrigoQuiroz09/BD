<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
   // $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    $enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    if ($_POST["op"] == "add") {
        $update_query = "INSERT INTO carro_compra VALUES ('".$_SESSION["correo"]."', '".$_POST["product"]."', '".$_POST["quantity"]."')";
        mysqli_query($enlace, $update_query); 
    }
    if ($_POST["op"] == "update") {
        $update_query = "UPDATE carro_compra SET Cantidad = '".$_POST["quantity"]."' WHERE  (Clave_Producto = '".$_POST["product"]."')";
        mysqli_query($enlace, $update_query); 
    }
?>