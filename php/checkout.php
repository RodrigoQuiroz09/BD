<?php
    // ADQUIRIR SESIÓN
    session_start();

    // ENLACE A LA BASE DE DATOS
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    $query_filtro = "SELECT DISTINCT * FROM carro_compra NATURAL JOIN inventario WHERE (correo_electronico = '".$_SESSION["correo"]."');";    
    $filtro = mysqli_query($enlace, $query_filtro);

        while($producto = mysqli_fetch_assoc($filtro)) {  ?>

            <tr>
                <td><?php echo $producto['Nombre_Producto'] ?> <strong class="mx-2">x</strong> <?php echo $producto['Cantidad'] ?></td>
                <td>$<?php echo $producto['Precio'] ?></td>
            </tr>

    <?php } ?>   

            <tr>
                <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                <td class="text-black font-weight-bold"><strong id="total">$0.00 MXN</strong></td>
            </tr>

    <script>
        $(document).ready(function(){
          $.ajax({
            url:"../php/update-cart.php",
            method:"POST",
            data: {op: "getTotal"},
            success:function(data){
              $('#total').html(data);
            }
          })
        })
    </script>