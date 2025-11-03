<?php
$host = "192.168.56.22";  // IP que se le colocó a la maquina db en el Vagrantfile
$port = "5432";
$dbname = "juegosdb";
$user = "vagrant";
$password = "vagrant";

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

$query = "SELECT * FROM juegos;";
$result = pg_query($conn, $query);


echo "<h1>Top 3 juegos de PS4 y PS5</h1>";
echo "<table border='5' cellpadding='10' cellspacing='1'>
        <tr style='background-color:#8C3737;'>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
        </tr>";

while ($row = pg_fetch_assoc($result)) {
    echo "<tr>
            <td>{$row['id']}</td>
            <td>{$row['nombre']}</td>
            <td>\${$row['precio']}</td>
          </tr>";
}

echo "</table>";

pg_close($conn);
?>

