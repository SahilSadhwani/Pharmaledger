<?php

require_once("../../db.php");


if(isset($_POST["add_product"])){
    $manufacturer_id = $_POST["manufacturer_id"];
    $product_id = $_POST["product_id"];
    $quantity = $_POST["quantity"];
    
//    echo $manufacturer_id;
//    echo $product_id;
//    echo $quantity; 

    
    $query = "SELECT manufacturer_product_cost FROM product WHERE product_id = $product_id";
    $result = mysqli_query($connection, $query);
    

    $row = mysqli_fetch_assoc($result);
    $cost =  $row["manufacturer_product_cost"];
    $total_cost = $cost*$quantity;
    
    $query = "INSERT INTO wholesaler_order(wholesaler_id, manufacturer_id, product_id, product_quantity, total_cost, status) VALUES(4, $manufacturer_id, $product_id, $quantity, $total_cost, 0)";
    $result = mysqli_query($connection, $query);
    
    header("Location: http://localhost:3000/wholesaler/wholesaler-dashboard.html");

}

?>