function submitFunction(supplierName) {
    document.getElementById("hiddenvalue").setAttribute("value", supplierName);
    document.getElementById("chat").submit();
}

function initializeVendorChat($sender, $receiver) {
// CREATE A REFERENCE TO FIREBASE
    var messagesRef = new Firebase('https://vsms.firebaseio.com/');

// REGISTER DOM ELEMENTS
    var messageField = $('#messageInput');
    var messageList = $('#messages');

// LISTEN FOR KEYPRESS EVENT 
    messageField.keypress(function(e) {
        if (e.keyCode == 13) {
            //FIELD VALUES
            var message = messageField.val();

            //SAVE DATA TO FIREBASE AND EMPTY FIELD
            messagesRef.push({sender: $sender, receiver: $receiver, text: message});
            messageField.val('');

            //Type"Clear" to remove the message
            if (message == "-clear") {
                messagesRef.remove();
            }
        }
    });

// Add a callback that is triggered for each chat message created.
    messagesRef.limitToLast(10).on('child_added', function(snapshot) {
        //GET DATA
        var data = snapshot.val();
        var sender = data.sender || "anonymous";
        var receiver = data.receiver;
        var message = data.text;
        var key = data.key;
        var ordercondition = data.ordercondition;
        var orderid = data.orderid;
        var senderElement = $("<strong class='chat-name'></strong>");
        senderElement.text(sender);
        //ADD MESSAGE only if sender and receiver are relevant
        if (sender === $sender && receiver === $receiver || sender === $receiver && receiver === $sender) {
            
            messageList.append("<li>"+senderElement+message+"</li>")
            if (key != null) {
                messageList.append("Order key: " + key)
            }
            
        }

        //SCROLL TO BOTTOM OF MESSAGE LIST
        messageList[0].scrollTop = messageList[0].scrollHeight;
    });
}

function initializeSupplierChat($sender, $receiver) {
    // CREATE A REFERENCE TO FIREBASE
    var messagesRef = new Firebase('https://vsms.firebaseio.com/');
    // REGISTER DOM ELEMENTS
    var messageField = $('#messageInput');
    var messageList = $('#messages');

    // LISTEN FOR KEYPRESS EVENT
    messageField.keypress(function(e) {
        if (e.keyCode == 13) {
            //FIELD VALUES
            var message = messageField.val();

            //if it is an order, the message will start with "-". List down all the possible order
            try {
                if (message.charAt(0) == "-") {
                    //split the message
                    var messageSplit = message.split(" ");

                    //Type"Clear" to remove the message
                    if (messageSplit[0] == "-clear") {
                        messagesRef.remove();
                        window.location.reload();
                    } else if (messageSplit[0] == "-reply") {
                        //e.g: ("-reply S3452321H yes") to respond yes to order S3462321H
                        //get key to get a certain order command in firebase
                        var key = messageSplit[1]
                        //get reply to update this key in firebase
                        var reply = messageSplit[2]

                        //if the messagesplit is larger than 3 and the key and reply if null
                        if (messageSplit.length > 3 || key == null || reply == null) {
                            throw new Exception("");
                        }
                        //if reply is yes then change the order condition of the database to yes
                        //if reply is no then reject the order condition
                        //if reply is other then give exception
                        if (reply == "yes") {
                            messagesRef.child(key).child("ordercondition").set("Approved");
                            message = "The " + key + " order has been accepted";
                        } else if (reply == "no") {
                            messagesRef.child(key).child("ordercondition").set("Rejected");
                            message = "The " + key + " order has been rejected";
                        } else {
                            throw new Exception("command is invalid");
                        }
                        //SAVE DATA TO FIREBASE AND EMPTY FIELD
                        messagesRef.push({sender: $sender, receiver: $receiver, text: message});
                        messageField.val('');
                    }
                    else {
                        throw new Exception("command is invalid");
                    }

                }
                else {
                    //SAVE DATA TO FIREBASE AND EMPTY FIELD
                    messagesRef.push({sender: $sender, receiver: $receiver, text: message});
                    messageField.val('');
                }
            } catch (err) {
                //SAVE DATA TO FIREBASE AND EMPTY FIELD
                messagesRef.push({sender: $sender, receiver: $receiver, text: "Sorry your command is invalid"});
                messageField.val('');
            }
        }

    }
    );

    // Add a callback that is triggered for each chat message created.
    messagesRef.limitToLast(10).on('child_added', function(snapshot) {
        //GET DATA
        var data = snapshot.val();
        var sender = data.sender || "anonymous";
        var receiver = data.receiver;
        var message = data.text;
        var key = data.key;
        var ordercondition = data.ordercondition;
        var orderid = data.orderid;
        //CREATE ELEMENTS MESSAGE & SANITIZE TEXT
        //var messageElement = $("<li>");
        //messageElement.text(message).prepend(senderElement);      
        //var receiverElement = $("<i class='chat-name'></i>");

        var senderElement = $("<strong class='chat-name'></strong>");
        senderElement.text(sender);
        //ADD MESSAGE only if sender and receiver are relevant
        if (sender === $sender && receiver === $receiver|| sender === $receiver && receiver === $sender) {
             messageList.append("<li>"+senderElement+message+"</li>")
//            if (key != null) {
//                messageList.append("Order key: " + key)
//            }
//            messageList.append("<li>")
        }

        //SCROLL TO BOTTOM OF MESSAGE LIST
        messageList[0].scrollTop = messageList[0].scrollHeight;
    });
}