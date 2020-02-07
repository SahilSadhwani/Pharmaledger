App1 = {
  web3Provider: null,
  contracts: {},
  account: '0x0',


init: function() {
    alert("hey");
    return App1.initWeb3();
  },

initWeb3: function() {
    alert("initweb3");
    // TODO: refactor conditional
    if (typeof web3 !== 'undefined') {
        alert("if");
      // If a web3 instance is already provided by Meta Mask.
      App1.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
//        Web3.providers web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
      // Specify default instance if no web3 instance provided
      App1.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        alert("dd");
      web3 = new Web3(App1.web3Provider);
        alert("done");
    }
    alert("comp");
    return App1.initContract();
  },
    
  redirect: function(){
    window.location.href = "http://localhost:3000/manufacturer/dashboard.html";  
  },



  initContract: function() {
      alert("ss");
    $.getJSON("ApproveOrder.json", function(approveorder) {
      // Instantiate a new truffle contract from the artifact
      App1.contracts.ApproveOrder = TruffleContract(approveorder);
      // Connect provider to interact with contract
      App1.contracts.ApproveOrder.setProvider(App1.web3Provider);

//      App1.listenForEvents();    
//
      alert("init contract");
      return App1.render();
//    });
  },







render: function() {
//    var electionInstance;
//    var loader = $("#loader");
//    var content = $("#content");
//
//    loader.show();
    //content.hide();
    
    
    
//    var sa = $("#warehouse");
//    sa.click(function(){
//       $("#warehouse").css("color","green"); 
//    });
    // Load account data
    // web3.eth.getAccounts().then(function (result){
    //   //return result[0]
    //   App1.account=result[0]
    //   $("#accountAddress").html("Your Account: " + result[0]);
    //   });
    

      //web3.eth.getA
   
    
    try{
         web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        //var account = web3.eth.accounts[1];
        App1.account = account;
//          alert(account);
        //web3.eth.getAccounts(accounts => console.log(accounts[0])).
        $("#accountAddress").html("Your Account: " + account);
      }
    }).catch(function(error) {
      console.warn(error);
        alert("in catch"); 
    });
    }finally{
        alert("in finally");
        return App1.addO();   
    }
    
    
    
  },
    
    addO: function(){
        var url=$(location).attr("href");
    var urlarray=url.split("?");
    var splitmeagain=urlarray[1];
    var semifinalsplit=splitmeagain.split("&");
    var finalsplit=semifinalsplit[1].split("=");
    var number=finalsplit[1];
    var orderid=semifinalsplit[0].split("=");
    orderid=orderid[1];
    var quantity=semifinalsplit[1].split("=");
    quantity=quantity[1];
        alert("in addO");
    if(orderid>0 && quantity>0){
        alert(">"+orderid);
        
        App1.contracts.ApproveOrder.deployed().then(function(instance){
            return instance.addOrder(orderid, 1, 4, quantity, "sasbsdfaj362neksj3bsbsafg", {from: App1.account, gas:300000}); }).then(function(result){
                
            }).catch(function(err){
               console.log(err+"sassasasasasa"); 
            });
    
    }
    },


 


};

$(document).ready(function(){
    alert("load");
});
    
//$(function() {
//     alert("load");
////  $(window).load(function() {
//    App1.init();
////  });
//});
