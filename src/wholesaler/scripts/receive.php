<?php

require_once("../../db.php");

if(isset($_GET["orderId"])){
    $wholesaler_order_id = $_GET["orderId"];
    
    $query = "UPDATE wholesaler_order SET status = 3 WHERE wholesaler_order_id = $wholesaler_order_id";
    $result = mysqli_query($connection, $query);
    
    $query = "SELECT product_id, product_quantity FROM wholesaler_order WHERE wholesaler_order_id = $wholesaler_order_id";
    $result = mysqli_query($connection, $query);
    $row = mysqli_fetch_assoc($result);
    $product_id = $row["product_id"];
    $product_quantity = $row["product_quantity"];
    
    $query = "SELECT quantity FROM wholesaler_products WHERE product_id = $product_id AND wholesaler_id = 4";
    $result = mysqli_query($connection, $query);
    $row = mysqli_fetch_assoc($result);
//    echo $query;
    
    if(mysqli_num_rows($result)==1){
        //update
        $quantity = $row["quantity"];
        $new_quantity = $quantity+$product_quantity;
        $query = "UPDATE wholesaler_products SET quantity = $new_quantity WHERE product_id = $product_id AND wholesaler_id = 4";
        $result = mysqli_query($connection, $query);
        
    }else{
        //insert
        $query = "INSERT INTO wholesaler_products(wholesaler_id, product_id, quantity) VALUES(4, $product_id, $product_quantity)";
        $result = mysqli_query($connection, $query);
    }
    
    header("Location: http://localhost/BE-main/src/wholesaler/pending-orders-ofme.php");
    exit;
    
}

?>