<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    $query_filtro = "SELECT DISTINCT * FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_SESSION["correo"]."');";    
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
                      <button class="btn btn-outline-primary" type="button" onclick="add('-', <?php echo $producto['Clave_Producto'] ?>);">&minus;</button>
                    </div>
                    <input type="text" class="form-control text-center" value="<?php echo $producto['Cantidad'] ?>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" id="quantity-<?php echo $producto['Clave_Producto'] ?>" readonly>
                    <input type="hidden" id="stock-<?php echo $producto['Clave_Producto'] ?>" value="<?php echo $producto['Piezas_Disponibles'] ?>">
                    <script> 
                      if (<?php echo $producto['Piezas_Disponibles'] ?> < <?php echo $producto['Cantidad'] ?>) {
                        document.getElementById("quantity-<?php echo $producto['Clave_Producto'] ?>").value = 0; 

                          $.ajax({
                            url:"../php/update-cart.php",
                            method:"POST",
                            data: {op: "update", product: parseInt(<?php echo $producto['Clave_Producto'] ?>), quantity: 0}
                        })     
                      }
                    </script>
                    <div class="input-group-append">
                      <button class="btn btn-outline-primary" type="button" onclick="add('+', <?php echo $producto['Clave_Producto'] ?>);">&plus;</button>
                    </div>
                  </div>
                  <p>In stock: <?php echo $producto['Piezas_Disponibles'] ?></p>
                </td>
                <td>$<?php echo $producto['Precio'] ?></td>
                <td><a href="" class="btn btn-primary btn-sm" onclick="removeProduct(<?php echo $producto['Clave_Producto'] ?>);">X</a></td>
            </tr>

    <?php } ?>   

    <script>
        function add(op, id) {
            var id_quantity = "quantity-" + id; 
            var id_stock = "stock-" + id; 
            if (op == "+") {
                if (document.getElementById(id_quantity).value < parseInt(document.getElementById(id_stock).value)) {
                    document.getElementById(id_quantity).value++;
                }
            }
            if (op == "-") {
                if (document.getElementById(id_quantity).value > 1) {
                    document.getElementById(id_quantity).value--;
                }
            }

            $.ajax({
                url:"../php/update-cart.php",
                method:"POST",
                data: {op: "update", product: parseInt(id), quantity: document.getElementById(id_quantity).value},
                success:function(data){
                  $('#total_div').html(data);
                }
            })
        }

        $(document).ready(function(){
          $.ajax({
            url:"../php/update-cart.php",
            method:"POST",
            data: {op: "getTotal"},
            success:function(data){
              $('#total_div').html(data);
            }
          })
        })
    </script>