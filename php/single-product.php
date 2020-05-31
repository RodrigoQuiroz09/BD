<?php
    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    $query_filtro = "select * from INVENTARIO where (Clave_Producto = '".$_POST["key"]."');";    
    $filtro = mysqli_query($enlace, $query_filtro);

        while($producto = mysqli_fetch_assoc($filtro)) {  ?>

            <div class="container">
                <div class="row">
                <div class="col-md-6">
                    <img src="../images/<?php echo $producto['Fotografia'] ?>" alt="Image" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h2 class="text-black"><?php echo $producto['Nombre_Producto'] ?></h2>
                    <p><?php echo $producto['Descripcion'] ?></p>
                    <p>Category: <?php echo $producto['Categoria_Producto'] ?> &emsp;| &emsp;Color: <?php echo $producto['Color'] ?> &emsp;| &emsp;Size: <?php echo $producto['Talla'] ?></p>
                    <p><strong class="text-primary h4">$<?php echo $producto['Precio'] ?></strong></p>
                    <div>
                    <div class="input-group mb-3" style="max-width: 120px;">
                    <div class="input-group-prepend">
                        <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                    </div>
                    <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                    <div class="input-group-append">
                        <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                    </div>
                    </div>
                    <p>In Stock: <?php echo $producto['Piezas_Disponibles'] ?></p>

                    </div>
                    <p><a href="cart.html" class="buy-now btn btn-sm btn-primary">Add To Cart</a></p>

                </div>
                </div>
            </div>

<?php } ?>   