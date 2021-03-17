<?php

$connect = mysqli_connect("localhost", "root", "", "reyes");
$query = "SELECT * FROM ninos ORDER BY nombre ASC";
$result = mysqli_query($connect, $query);

echo
    "<form action='loadNino.php' method='POST' name='myForm' id='myForm'>" .
     "<select name='ninoid'>" ;
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {


   echo "<option value='{$row['id']}'>{$row['nombre']} </option> ";

}
echo "<input type='submit' value='Mostrar regalos'>";
echo "</select>
      </form>";
?>