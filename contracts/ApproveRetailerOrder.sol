pragma solidity 0.5.8;

contract ApproveRetailerOrder{

    struct Retailerorderdetails{
        uint order_id;
        uint manufacturer_id;
        uint wholesaler_id;
        uint retailer_id;
        uint count;
        string hash;
    }
    
    mapping (uint => Retailerorderdetails) public retailorder;
    uint public orders;
  
    function addOrder(uint order_id, uint manufacturer_id, uint wholesaler_id, uint retailer_id, uint count, string memory hash) public {
        orders++;
        retailorder[orders] = Retailerorderdetails(order_id, manufacturer_id, wholesaler_id, retailer_id, count, hash);
    }
    
    
    
    
} 