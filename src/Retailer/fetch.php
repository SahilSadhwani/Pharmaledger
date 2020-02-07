<?php

require_once('../db.php');
$orderid=$_POST['orderId'];
$query="select hashdata,product_quantity from retailer_order where retailer_order_id=$orderid";
$res=mysqli_query($connection,$query);
$row=mysqli_fetch_assoc($res);
echo json_encode($row);
?>