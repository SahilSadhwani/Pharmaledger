<?php
require_once("../../db.php");

if(isset($_GET["manufacturer_id"])){
    $uid = $_GET["manufacturer_id"];
    
    $query = "INSERT INTO wholesaler_manufacturer(manufacturer_id, wholesaler_id, connection_status) VALUES(1,4,0)";
    $result = mysqli_query($connection, $query);
    echo $query;
    header("Location: http://localhost:3000/wholesaler/wholesaler-dashboard.html");
    exit;
}
?>