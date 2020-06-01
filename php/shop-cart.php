<?php
    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    $query_filtro = "SELECT DISTINCT * FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_POST["user"]."');";    
    $filtro = mysqli_query($enlace, $query_filtro);

        while($producto = mysqli_fetch_assoc($filtro)) {  ?>

            <tr>
                <td class="product-thumbnail">
                  <img src="../images/<?php echo $producto['Fotografia'] ?>" alt="Image" class="img-fluid">
                </td>
                <td class="product-name">
                  <h2 class="h5 text-black"><?php echo $producto['Nombre_Producto'] ?></h2>
                </td>
                <td><?php echo $producto['Talla'] ?></td>
                <td>
                  <div class="input-group mb-3" style="max-width: 120px;">
                    <div class="input-group-prepend">
                      <button class="btn btn-outline-primary" type="button" onclick="add('-', 'quantity-<?php echo $producto['Clave_Producto'] ?>', 'stock-<?php echo $producto['Clave_Producto'] ?>');">&minus;</button>
                    </div>
                    <input type="text" class="form-control text-center" value="<?php echo $producto['Cantidad'] ?>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" id="quantity-<?php echo $producto['Clave_Producto'] ?>">
                    <input type="hidden" id="stock-<?php echo $producto['Clave_Producto'] ?>" value="<?php echo $producto['Piezas_Disponibles'] ?>">
                    <div class="input-group-append">
                      <button class="btn btn-outline-primary" type="button" onclick="add('+', 'quantity-<?php echo $producto['Clave_Producto'] ?>', 'stock-<?php echo $producto['Clave_Producto'] ?>');">&plus;</button>
                    </div>
                  </div>
                  <p>In stock: <?php echo $producto['Piezas_Disponibles'] ?></p>
                </td>
                <td>$<?php echo $producto['Precio'] ?></td>
                <td><a href="" class="btn btn-primary btn-sm">X</a></td>
            </tr>

<?php } ?>   
    <script>
        function add(op, id_quantity, id_stock) {
            if (op == "+")
                if (document.getElementById(id_quantity).value < document.getElementById(id_stock).value)
                    document.getElementById(id_quantity).value++;
            if (op == "-")
                if (document.getElementById(id_quantity).value > 1)
                    document.getElementById(id_quantity).value--;
        }
    </script>