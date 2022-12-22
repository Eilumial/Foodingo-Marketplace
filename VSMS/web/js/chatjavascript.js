function submitFunction(supplierName) {
    document.getElementById("hiddenvalue").setAttribute("value", supplierName);
    document.getElementById("chat").submit();
}
//NOT DONE
//subject is the supplier,vendor name whereas role is "vendor" or "supplier"
function initializeChatList($sender, $role) {
    // CREATE A REFERENCE TO FIREBASE
    var messagesRef = new Firebase('https://foodingomarketplace.firebaseio.com');

// REGISTER DOM ELEMENTS
    var chatList = $('#chatlist');
    //To keep track of duplicates
    var receivers = [];

    // Add a callback that is triggered for each chat message created.
    messagesRef.on('child_added', function(snapshot) {
        //GET DATA
        var data = snapshot.val();
        var sender = data.sender;
        var receiver = data.receiver;
        var timestamp = data.timestamp;
        //ADD MESSAGE only if sender and receiver are relevant
        if ((sender === $sender || receiver === $sender) && receivers.indexOf(receiver) === -1) {
            if ($role === "vendor") {
                console.log("comes here vendor");
//                Put here for Vendor chatlist
                chatList.append("<li class =\"list-group-item\" name= \"" + receiver + "\" onclick=\"submitFunction('" + receiver + "')\"><h3>" + receiver + "</h3></li>");

            } else if ($role === "supplier") {
//                Put here for supplier chat list
                chatList.append("<li class =\"list-group-item\" name= \"" + receiver + "\" onclick=\"submitFunction('" + receiver + "')\"><h3>" + receiver + "</h3></li>");
            }

            receivers.push(receiver);
            console.log("array is " + receivers);
        }
    });
}


function initializeVendorChat($sender, $receiver) {
// CREATE A REFERENCE TO FIREBASE
    var messagesRef = new Firebase('https://foodingomarketplace.firebaseio.com');

// REGISTER DOM ELEMENTS
    var messageField = $('#messageInput');
    var messageList = $('#messages');

// LISTEN FOR KEYPRESS EVENT 
    messageField.keypress(function(e) {
        if (e.keyCode == 13) {
            //FIELD VALUES
            var message = messageField.val();

            //SAVE DATA TO FIREBASE AND EMPTY FIELD
            messagesRef.push({sender: $sender, receiver: $receiver, text: message, timestamp: timeConverter(Math.round(new Date().getTime() / 1000))});
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
        var timestamp = data.timestamp;
        var key = data.key;
        var ordercondition = data.ordercondition;
        var orderid = data.orderid;
        //ADD MESSAGE only if sender and receiver are relevant
        if (sender === $sender && receiver === $receiver) {
            messageList.append("<li style=\"font-size:17px\">" + "<strong>" + sender + "</strong>(" + timestamp + "): <br>" + message + "</li>")
        } else if (sender === $receiver && receiver === $sender) {
            messageList.append("<li style=\"margin-left:auto;font-size:17px\">" + "<i>" + sender + "</i>(" + timestamp + "): <br>" + message + "</li>")
        }


        //SCROLL TO BOTTOM OF MESSAGE LIST
        messageList[0].scrollTop = messageList[0].scrollHeight;
    });
}

function initializeSupplierChat($sender, $receiver) {
    // CREATE A REFERENCE TO FIREBASE
    var messagesRef = new Firebase('https://foodingomarketplace.firebaseio.com');
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
//                        messagesRef.remove();
//                        window.location.reload();
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
                        messagesRef.push({sender: $sender, receiver: $receiver, text: message, timestamp: timeConverter(Math.round(new Date().getTime() / 1000))});
                        messageField.val('');
                    }
                    else {
                        throw new Exception("command is invalid");
                    }

                }
                else {
                    //SAVE DATA TO FIREBASE AND EMPTY FIELD
                    messagesRef.push({sender: $sender, receiver: $receiver, text: message, timestamp: timeConverter(Math.round(new Date().getTime() / 1000))});
                    messageField.val('');
                }
            } catch (err) {
                //SAVE DATA TO FIREBASE AND EMPTY FIELD
                messagesRef.push({sender: $sender, receiver: $receiver, text: "Sorry your command is invalid", timestamp: timeConverter(Math.round(new Date().getTime() / 1000))});
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

        //ADD MESSAGE only if sender and receiver are relevant
        if (sender === $sender && receiver === $receiver) {
            messageList.append("<li style=\"font-size:17px\">" + "<strong>" + sender + "</strong>(" + timestamp + "): <br>" + message + "</li>")
        } else if (sender === $receiver && receiver === $sender) {
            messageList.append("<li style=\"margin-left:auto;font-size:17px\">" + "<i>" + sender + "</i>(" + timestamp + "): <br>" + message + "</li>")
        }


        //SCROLL TO BOTTOM OF MESSAGE LIST
        messageList[0].scrollTop = messageList[0].scrollHeight;
    });
}

function timeConverter(UNIX_timestamp) {
    var a = new Date(UNIX_timestamp * 1000);
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec;
    return time;
}
function pushMessage($sender, $receiver,message) {
    // CREATE A REFERENCE TO FIREBASE
    var messagesRef = new Firebase('https://foodingomarketplace.firebaseio.com');
    messagesRef.push({sender: $sender, receiver: $receiver, text: message, timestamp: timeConverter(Math.round(new Date().getTime() / 1000))});
    
}