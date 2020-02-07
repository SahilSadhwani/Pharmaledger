<?php

 require_once('../db.php');
$myArray = $_POST['hasharray'];
$quantitydemanded = $_POST['quantity'];
// echo $myArray;
$hashes="";
$hashes=$hashes.$myArray[0];
for($i=1;$i<sizeof($myArray);$i++)
{
	$hashes=$hashes.",".$myArray[$i];
}

$orderId=$_POST['orderId'];
$query="update retailer_order set hashdata='{$hashes}',status=1 where retailer_order_id={$orderId}";
$result=mysqli_query($connection,$query);

$query1="select * from retailer_order where retailer_order_id={$orderId}";
$result1=mysqli_query($connection,$query1);
$row=mysqli_fetch_assoc($result1);
$query2="select * from wholesaler_products where product_id={$row['product_id']}";
$result2=mysqli_query($connection,$query2);
$row1=mysqli_fetch_assoc($result2);
$newquantity=$row1['quantity']-$quantitydemanded;
$query2="update wholesaler_products set quantity=$newquantity where product_id={$row['product_id']}";
$result2=mysqli_query($connection,$query2);

echo json_encode($query." anddd ".$query2);
// if(mysqli_affected_rows($connection)!=1)
// {
// 	echo "error";
// 	die();
// }
?>