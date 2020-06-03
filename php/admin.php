<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    if ($_POST["op"] == "load-o") {
        $query_inventario = "SELECT * FROM transaccion NATURAL JOIN productos;";    
        $filtro = mysqli_query($enlace, $query_inventario) or die(mysqli_error($enlace));

            while($producto = mysqli_fetch_assoc($filtro)) {  ?>

                <tr>
                    <td>
                        <p>Ticket: <?php echo $producto['No_Transaccion'] ?><br><?php echo $producto['Fecha_Hora'] ?></p>
                    </td>
                    <td>
                        <p><?php echo $producto['Correo_Cliente'] ?></p>
                    </td>
                    <td>
                        <p><?php echo $producto['Clave_Producto'] ?><br>Amount: <?php echo $producto['Cantidad'] ?></p>
                    </td>
                </tr>

        <?php } 
    }
    if ($_POST["op"] == "load-i") {
        $query_inventario = "SELECT * FROM inventario;";    
        $filtro = mysqli_query($enlace, $query_inventario) or die(mysqli_error($enlace));

            while($producto = mysqli_fetch_assoc($filtro)) {  ?>

                <tr>
                    <td>
                        <p><?php echo $producto['Clave_Producto'] ?><br>In Stock: <?php echo $producto['Piezas_Disponibles'] ?></p>
                    </td>
                    <td>
                        <div class="input-group mb-3" style="max-width: 120px;">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-primary js-btn-minus" type="button" onclick="update_product('-', <?php echo $producto['Clave_Producto'] ?>);">&minus;</button>
                        </div>
                        <input type="text" class="form-control text-center" value="<?php echo $producto['Piezas_Disponibles'] ?>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" id="quantity-<?php echo $producto['Clave_Producto'] ?>">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary js-btn-plus" type="button" onclick="update_product('+', <?php echo $producto['Clave_Producto'] ?>);">&plus;</button>
                        </div>
                        </div>
                    </td>
                    <td>
                        <p><a href="" class="btn btn-primary btn-sm" onclick="remove_product(<?php echo $producto['Clave_Producto'] ?>)">X</a></p>
                    </td>
                </tr>

        <?php } 
    }
    if ($_POST["op"] == "update") {
        $update_inventario = "UPDATE inventario SET Piezas_Disponibles = '".$_POST["quantity"]."' WHERE  (Clave_Producto = '".$_POST["product"]."');";    
        mysqli_query($enlace, $update_inventario) or die(mysqli_error($enlace));
    }
    if ($_POST["op"] == "remove") {
        $update_inventario = "DELETE FROM inventario WHERE (Clave_Producto = '".$_POST["product"]."');";    
        mysqli_query($enlace, $update_inventario) or die(mysqli_error($enlace));
    }
    if ($_POST["op"] == "add") {
        $update_inventario = "INSERT INTO inventario VALUES ('".$_POST["clave"]."', '".$_POST["nombre"]."', '".$_POST["categoria"]."', '".$_POST["descripcion"]."', '".$_POST["color"]."', '".$_POST["talla"]."', '".$_POST["precio"]."', '".$_POST["imagen"]."', '".$_POST["piezas"]."');";    
        mysqli_query($enlace, $update_inventario) or die(mysqli_error($enlace));
    }
?>   