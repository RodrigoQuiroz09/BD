<?php
    // ENLACE A LA BASE DE DATOS
    error_reporting(E_ALL); //DEBUG
    ini_set('display_errors', 1);  //DEBUG
      
    $enlace = mysqli_connect("127.0.0.1", "andres", "Andres.123", "proyecto_final_tienda");
    //$enlace = mysqli_connect("127.0.0.1:3308", "usuarioConsultas", "14122000Em!", "proyecto_final_tienda");

    // OBTENER ELEMENTOS CON EL QUERY 
    $query_filtro = "select * from INVENTARIO where (Precio BETWEEN '".$_POST["lower_range"]."' AND '".$_POST["upper_range"]."') and 
                    (Categoria_producto like '".$_POST["category"]."%') and (Color like '%".$_POST["color"]."%') and 
                    (Talla like '".substr($_POST["size"], 0, 1)."' OR Talla like '".substr($_POST["size"], 1, 1)."' OR Talla like '".substr($_POST["size"], 2, 1)."');";    
    $filtro = mysqli_query($enlace, $query_filtro);

        while($producto = mysqli_fetch_assoc($filtro)) {  ?>

            <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
            <div class="block-4 text-center border">
                <figure class="block-4-image">
                    <a href="shop-single.html?product=<?php echo $producto['Clave_Producto'] ?>"><img src="../images/<?php echo $producto['Fotografia'] ?>" alt="Image placeholder" class="img-fluid"></a>
                    </figure>
                    <div class="block-4-text p-4">
                    <h3><a href="shop-single.html?product=<?php echo $producto['Clave_Producto'] ?>"><?php echo $producto['Nombre_Producto'] ?></a></h3>
                    <!--p class="mb-0">Finding perfect products</p-->
                    <p class="mb-0"><?php echo "".$producto['Categoria_Producto']." | ".$producto['Color']." <br> Size: ".$producto['Talla'] ?></p> <!-- Lo uso para corroborar -->
                    <p class="text-primary font-weight-bold">$<?php echo $producto['Precio'] ?></p>
                    </div>
                </div>
            </div>

<?php } ?>   