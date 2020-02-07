App = {
  web3Provider: null,
  contracts: {},
  account: '0x0',


init: function() {
    return App.initWeb3();
  },

initWeb3: function() {
    // TODO: refactor conditional
    if (typeof web3 !== 'undefined') {
      // If a web3 instance is already provided by Meta Mask.
      App.web3Provider = web3.currentProvider;
//        alert("hi");
      web3 = new Web3(web3.currentProvider);
    } else {
        
      // Specify default instance if no web3 instance provided
      App.web3Provider = new Web3.providers.HttpProvider('HTTP://127.0.0.1:7545');
      web3 = new Web3(App.web3Provider);
//        alert("here");
    }
    return App.initContract();
  },
    
  redirect: function(){
    window.location.href = "http://localhost:3000/manufacturer/dashboard.html";      
  },
    


  initContract: function() {
//      alert("ss");
    $.getJSON("ApproveOrder.json", function(approveorder) {
        
      // Instantiate a new truffle contract from the artifact
      App.contracts.ApproveOrder = TruffleContract(approveorder);
      // Connect provider to interact with contract
      App.contracts.ApproveOrder.setProvider(App.web3Provider);
        
      App.listenForEvents();    
//
      return App.render();
    });
  },
    
    listenForEvents: function() {
//        alert("los");
    App.contracts.ApproveOrder.deployed().then(function(instance) {
      // Restart Chrome if you are unable to receive this event
      // This is a known issue with Metamask
      // https://github.com/MetaMask/metamask-extension/issues/2393
//      instance.votedEvent({}, {
//        fromBlock: 0,
//        toBlock: 'latest'
//      }).watch(function(error, event) {
//        console.log("event triggered", event)
//        // Reload when a new vote is recorded
//        App.render();
//      });
    });
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
    //   App.account=result[0]
    //   $("#accountAddress").html("Your Account: " + result[0]);
    //   });
    

      //web3.eth.getA
   
    
    try{
//        alert("try");
         web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        //var account = web3.eth.accounts[1];
        App.account = account;
          alert(account);
        //web3.eth.getAccounts(accounts => console.log(accounts[0])).
        $("#accountAddress").html("Your Account: " + account);
      }
    }).catch(function(error) {
      console.warn(error);
    });
    }finally{
        return App.addO();   
    }
    
    
    
  },
    
    addO: function(){
        alert("Deploying....");
        var url=$(location).attr("href");
        url = url.toString();
//        alert(url);
    var urlarray=url.split("?");
    var splitmeagain=urlarray[1];
//        alert(splitmeagain);
    var semifinalsplit=splitmeagain.split("&");
    var finalsplit=semifinalsplit[1].split("=");
    var number=finalsplit[1];
    var orderid=semifinalsplit[0].split("=");
    orderid=orderid[1];
    var quantity=semifinalsplit[1].split("=");
    quantity=quantity[1];
//        alert("orderid="+orderid+"quantity="+quantity);
        
        var hasharr = "";
       $.ajax({ 
               type: "POST", 
               url: "http://localhost/BE-main/src/fetch.php", 
                crossDomain: true,
               data: { orderId : orderid}, 
               success: function(ans) {
                        hashes=JSON.parse(ans);
                        // JSON.stringify(hashes);
                        //console.log(hashes['hashdata']);
                        hasharr=(hashes['hashdata']).toString();
//                        total=hashes['product_quantity'];
                      console.log(hasharr); 
                     } 
                });
//        alert(hasharr);
        console.log(hasharr); 
//        var tp=hasharr.split(",");
//        var tpstring = tp[0]+","+tp[1];
//        alert(tp[0]);
//        console.log(tp[0]);
//        var myArray = sessionStorage.getItem('myArray');
//        alert("array "+myArray);
        
//        var myArray  = JSON.parse(localStorage.getItem('myArray'));
//        alert(myArray);
        
    if(orderid>0 && quantity>0){
//        alert(">");
        
         App.contracts.ApproveOrder.deployed().then(function(instance){
            return instance.addOrder(orderid, 1, 4, quantity, "2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92", {from: App.account, gas:300000}); }).then(function(result){
//                alert("sshshshshs");
            }).catch(function(err){
               console.log(err); 
             alert("in catcj");
                
            });
        window.location.href = "http://localhost:3000/manufacturer/dashboard.html"; 
    }
    },
//2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39

 


};

$(function() {
//    Web3 = require('web3');
  $(window).load(function() {
    App.init();
  });
});
