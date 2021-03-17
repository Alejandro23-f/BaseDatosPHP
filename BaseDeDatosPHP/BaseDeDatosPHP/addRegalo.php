<?php

$regaloid = $_POST['regaloid'];
$ninoid = $_POST['ninoid'];
$reyid = $_POST['reyid'];


$connect = mysqli_connect("localhost", "root", "", "reyes");
$query = "INSERT INTO ninos_regalos_rey (rey_id, regalo_id, nino_id) VALUES ('" . $reyid . "', '" . $regaloid . "', '" . $ninoid . "')";
$result = mysqli_query($connect, $query);

if($result){
    echo "Registro correctamente añadido.";
} else {
    echo "Su registro no ha podido añadirse.";
}


?>