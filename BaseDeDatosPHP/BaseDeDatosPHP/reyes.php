<?php



$connect = mysqli_connect("localhost", "root", "", "reyes");
$query = "SELECT * FROM rey";
$result = mysqli_query($connect, $query);



while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    echo "<table>".
             "<tr>".
                 "<td>{$row['nombre']} </td> ".
             "</tr>";

    $arrayNombres = array();
    $arrayIds = array();
    $arrayBueno = array();
    $query2 = "SELECT * FROM ninos WHERE id IN(SELECT nino_id FROM ninos_regalos_rey WHERE rey_id = '" . $row['id'] . "')";
    $result2 = mysqli_query($connect, $query2);
    while($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {

        array_push($arrayNombres, $row2['nombre']);
        array_push($arrayIds, $row2['id']);
        array_push($arrayBueno, $row2['bueno']);
    }
    $total = 0;
    for($i = 0; $i < count($arrayNombres); $i++){
        $query3 = "SELECT * FROM regalos WHERE id IN(SELECT regalo_id FROM ninos_regalos_rey WHERE nino_id = '" . $arrayIds[$i] . "')";
        $result3 = mysqli_query($connect, $query3);
        while($row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC)) {
            echo
            "<tr>" .
            "<td>" . $arrayNombres[$i] . "</td><td>" . $arrayBueno[$i] . "</td><td>{$row3['nombre']}</td>".
            "</tr>";
            $total += $row3['precio'];
        }
    }
    echo "<tr><td>{$total}</td></tr>";
    echo "</table>";
}



?>