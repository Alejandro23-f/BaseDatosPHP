<?php

$id = $_POST['ninoid'];

$connect = mysqli_connect("localhost", "root", "", "reyes");
$query = "SELECT * FROM regalos WHERE id IN(SELECT regalo_id FROM ninos_regalos_rey WHERE nino_id = '" . $id . "')";
$result = mysqli_query($connect, $query);

echo "<table>
                <tr>
                    <th>Nombre</th>
                    <th>Precio</th>

                </tr>";
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

    echo
    "<tr>" .
    "<td>{$row['nombre']} </td> ".
    "<td>{$row['precio']} </td> ".
    "</tr>";
}

echo "</table>";

$query = "SELECT * FROM regalos";
$query2 = "SELECT * FROM rey";
$result = mysqli_query($connect, $query);
$result2 = mysqli_query($connect, $query2);

echo
"<form action='addRegalo.php' method='POST' name='myForm' id='myForm'>" .
"<select name='regaloid'>" ;
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {


    echo "<option value='{$row['id']}'>{$row['nombre']} </option> ";

}

echo "</select>";

echo "<input type='hidden' name='ninoid' value='" . $id . "'></input>";

echo "<select name='reyid'>" ;
while($row = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {


    echo "<option value='{$row['id']}'>{$row['nombre']} </option> ";

}
echo "<input type='submit' value='Anadir regalos'>";
echo "</form>";

?>