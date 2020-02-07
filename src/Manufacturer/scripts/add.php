<?php

require_once("../../db.php");


if(isset($_POST["add_product"])){
//    echo "ss";
    $product_name = $_POST["product_name"];
    $manufacturer_product_cost = $_POST["manufacturer_product_cost"];
    $wholesaler_product_cost = $_POST["wholesaler_product_cost"];
    $retailer_product_cost = $_POST["retailer_product_cost"];
    $product_power = $_POST["product_power"];
    $best_before_months = $_POST["best_before_months"];
    $product_mg = $_POST["product_mg"];

    
    $query = "INSERT INTO product(product_name, manufacturer_product_cost, wholesaler_product_cost, retailer_product_cost, product_power, best_before_months, product_mg, manufacturer_id) VALUES('$product_name', $manufacturer_product_cost, $wholesaler_product_cost, $retailer_product_cost, $product_power, $best_before_months, $product_mg, 1)";
    $result = mysqli_query($connection, $query);
//    echo $query;
    
    header("Location: http://localhost:3000/manufacturer/dashboard.html");

}

?>