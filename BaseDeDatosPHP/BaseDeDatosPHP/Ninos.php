<?php

        $connect = mysqli_connect("localhost", "root", "", "reyes");
        $query = "SELECT * FROM ninos ORDER BY nombre ASC";
        $result = mysqli_query($connect, $query);

        echo "<table>
                <tr>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Fecha de nacimiento</th>
                    <th>Bueno</th>
                </tr>";
        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

            $bool;
            if($row['bueno'] == 0){
                $bool = "No";
             } else {
                $bool = "Si";
            }

            echo
            "<tr>" .
            "<td>{$row['nombre']} </td> ".
            "<td>{$row['apellidos']} </td> ".
            "<td>{$row['fechaDeNacimiento']} </td> ".
            "<td>{$bool} </td> " .
            "</tr>";
        }

?>
