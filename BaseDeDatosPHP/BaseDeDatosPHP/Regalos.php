<?php

$connect = mysqli_connect("localhost", "root", "", "reyes");
$query = "SELECT * FROM regalos";
$result = mysqli_query($connect, $query);

echo "<table>
                <tr>
                    <th>Nombre del juguete</th>
                    <th>Precio</th>
                </tr>";
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
   
    echo
    "<tr>" .
    "<td>{$row['nombre']} </td> ".
    "<td>{$row['precio']} </td> ".
  
    "</tr>";
}


?>