<?php

session_start();

$_SESSION["correo"] = " ";
$_SESSION["is_admin"]=" ";
header("location: ../html/index.html");

//session_destroy();

?>