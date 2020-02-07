<?php

require_once('db.php');
$orderid=$_POST['orderId'];
$query="select hashdata from wholesaler_order where wholesaler_order_id=$orderid";
$res=mysqli_query($connection,$query);
$row=mysqli_fetch_assoc($res);
echo json_encode($row);
?>