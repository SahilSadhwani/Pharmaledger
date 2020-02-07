<?php
require_once("../../db.php");

if(isset($_GET["wholesaler_id"])){
    $wholesaler_id = $_GET["wholesaler_id"];
    $status = $_GET["status"];
    
    if($status == "accept"){
        $query = "UPDATE wholesaler_manufacturer SET connection_status = 1 WHERE wholesaler_id = $wholesaler_id AND manufacturer_id = 1";
    $result = mysqli_query($connection, $query);
        
    }else{
        $query = "UPDATE wholesaler_manufacturer SET connection_status = 3 WHERE wholesaler_id = $wholesaler_id AND manufacturer_id = 1";
    $result = mysqli_query($connection,$query);
    }
    
    header("Location: http://localhost/BE-main/src/manufacturer/wholesaler-requests.php");
    
    
    
    
}


?>